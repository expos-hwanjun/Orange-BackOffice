unit eTax;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, StrUtils, WinSock, ComObj,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  Service,
  TSToolkitLib_TLB;


// 전자세금계산서 인증서 인증 (아래 저장 함수 사용 시 자동으로 호출하므로 별도로 사용할 일은 없다)
function CertifyETaxCertificate(aBusinessNo, aSubBusinessNo, aCompanyName, aCeoName, aAddress, aUptae, aJongmok, aTeamName, aDamdangName, aEmail, aPhoneNo: string): Boolean;
// 전자세금계산서 충전 수량 조회 (리턴값은 잔여수량)
function GetETaxChargeCount(aCustomerNo: string; var aChargeCount, aUseCount: Integer): Integer;
// 전자세금계산서 조회 (*이 문서 제일 아래 설명 참조*)
function GetETaxDatas(aCustomerNo, aDateFrom, aDateTo: string; aTaxType, aSendType, aStatus: Integer; aBusinessNo, aCompanyName:String): TStringList;
// 전자세금계산서 항목(디테일) 조회 (*이 문서 제일 아래 설명 참조*)
function GetETaxDataItems(aETaxNo: string): TStringList;
// 전자세금계산서 여러 공급받는자에게 여러 건 신규 발행 (*이 문서 제일 아래 설명 참조*)
function SetETaxMultiDatas(aCustomerNo, aBusinessNo, aSubBusinessNo, aCompanyName, aCeoName, aAddress, aUptae, aJongmok, aTeamName, aDamdangName, aEmail, aPhoneNo, aDatas: string; var aBillNo:String; var aPassword: string; aCertify: Boolean = true): Boolean;
// 전자세금계산서 한 공급받는자에게 여러 건 신규 발생 (*이 문서 제일 아래 설명 참조*)
function SetETaxDatas(aCustomerNo, aBusinessNo, aSubBusinessNo, aCompanyName, aCeoName, aAddress, aUptae, aJongmok, aTeamName, aDamdangName, aEmail, aPhoneNo: string;  aReceiverType: Integer; aReceiverBusinessNo, aReceiverSubBusinessNo, aReceiverCompanyName, aReceiverCeoName, aReceiverAddress, aReceiverUptae, aReceiverJongmok, aReceiverTeamName, aReceiverDamangName, aReceiverEmail, aReceiverMobileNo, aWriteDate, aDatas: string; var aBillNo:String): Boolean;
// 전자세금계산서 한 공급받는자에게 한 건 신규 발생 (*이 문서 제일 아래 설명 참조*)
function SetETaxData(aCustomerNo, aBusinessNo, aSubBusinessNo, aCompanyName, aCeoName, aAddress, aUptae, aJongmok, aTeamName, aDamdangName, aEmail, aPhoneNo: string; aSend, aForward_, aPaper:Boolean; aDocumentType: Integer; aPayType: Boolean; aVolumn, aVolumnSeq: string; aReceiverType: Integer; aReceiverBusinessNo, aReceiverSubBusinessNo, aReceiverCompanyName, aReceiverCeoName, aReceiverAddress, aReceiverUptae, aReceiverJongmok, aReceiverTeamName, aReceiverDamangName, aReceiverEmail, aReceiverMobileNo, aWriteDate: string; aAmount, aNetAmount, aVatAmount, aCashAmount, aCheckAmount, aNoteAmount, aCreditAmount: Integer; aRemark, aNotice, aItems: string; var aBillNo:String; aPassword: string = ''; aCertify: Boolean = true): Boolean;
// 전자세금계산서 수정 (*이 문서 제일 아래 설명 참조*)
function ChangeETaxData(aETaxSeq: string; aStatus: Integer; aPayType: Boolean; aVolumn, aVolumnSeq, aTeamName, aDamangName, aEmail, aPhoneNo, aReceiverCompanyName, aReceiverCeoName, aReceiverAddress, aReceiverUptae, aReceiverJongmok, aReceiverTeamName, aReceiverDamangName, aReceiverEmail, aReceiverMobileNo: string; aAmount, aNetAmount, aVatAmount, aCashAmount, aCheckAmount, aNoteAmount, aCreditAmount: Integer; aRemark, aNotice, aScrapReason, aItems: string): Boolean;


// 전자세금계산서 인증 폼
type
  TeTaxForm = class(TForm)
    BusinessNoLabel: TLabel;
    PasswordLabel: TLabel;
    CompanyNameLabel: TLabel;
    CeoNameLabel: TLabel;
    AddressLabel: TLabel;
    JongmokLabel: TLabel;
    UptaeLabel: TLabel;
    TeamNameLabel: TLabel;
    DamdangNameLabel: TLabel;
    EmailLabel: TLabel;
    PhoneNoLabel: TLabel;
    PasswordEdit: TEdit;
    CompanyNameEdit: TEdit;
    CeoNameEdit: TEdit;
    AddressEdit: TEdit;
    UptaeEdit: TEdit;
    JongmokEdit: TEdit;
    DamdangNameEdit: TEdit;
    TeamNameEdit: TEdit;
    EmailEdit: TEdit;
    PhoneNoEdit: TEdit;
    Bevel: TBevel;
    OKButton: TButton;
    CancelButton: TButton;
    BusinessNoEdit: TMaskEdit;
    SubBusinessNoLabel: TLabel;
    SubBusinessNoEdit: TEdit;
    CommentLabel: TLabel;
    Bevel1: TBevel;

    procedure EditEnter(Sender: TObject);
    procedure EditExit(Sender: TObject);
    procedure EditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BusinessNoEditChange(Sender: TObject);
    procedure EmailEditChange(Sender: TObject);
    procedure PhoneNoEditChange(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);

  private
    function  InstallCertificate(aReinstall: Boolean = false): Boolean;
    function  Certify: Boolean;

    function  CheckBusinessNo(const aBusinessNo: string): Boolean;
    function  CheckEmail(const aEmail: string): Boolean;
    function  CheckPhoneNo(const aPhoneNo: string): Boolean;
  end;

// 전자세금계산서 인증서 툴킷이 뜰 때 비밀번호를 자동으로 넣어주는 스레드
type
  TCertifyETaxThread = class(TThread)
  private
    Password: string;
  protected
    procedure Execute; override;
  public
    constructor Create(aPassword: string);
  end;

var
  ProgressForm: TForm;

procedure ShowProgressForm(const aCaption: string; const aComment: string = ''; aOwner: TComponent = nil);
procedure HideProgressForm();


implementation

uses
  Common;

{$R *.dfm}

const
  msgWebServiceError = '익스트림포스 서버와 통신하지 못했습니다.'#13'%s';
  msgDataLengthError = '저장할 자료를 너무 많이 지정했습니다.'#13'나눠서 저장하십시오.';
  msgETax            = '전자세금계산서';
  msgCertificate     = '인증서';

//==============================================================================
// 외부 제공 함수
//------------------------------------------------------------------------------
// 전자세금계산서 인증서 인증
function CertifyETaxCertificate(aBusinessNo, aSubBusinessNo, aCompanyName, aCeoName, aAddress, aUptae, aJongmok, aTeamName, aDamdangName, aEmail, aPhoneNo: string): Boolean;
begin
  Result := false;

  with TeTaxForm.Create(Application) do
    if InstallCertificate then
      try
        BusinessNoEdit.Text    := aBusinessNo;
        SubBusinessNoEdit.Text := aSubBusinessNo;
        CompanyNameEdit.Text   := aCompanyName;
        CeoNameEdit.Text       := aCeoName;
        AddressEdit.Text       := aAddress;
        UptaeEdit.Text         := aUptae;
        JongmokEdit.Text       := aJongmok;
        TeamNameEdit.Text      := aTeamName;
        DamdangNameEdit.Text   := aDamdangName;
        EmailEdit.Text         := aEmail;
        PhoneNoEdit.Text       := aPhoneNo;

        if ShowModal = mrOK then
          Result := Certify;
      finally
        Free;
      end;
end;
//------------------------------------------------------------------------------
// 전자세금계산서 충전 수량
function GetETaxChargeCount(aCustomerNo: string; var aChargeCount, aUseCount: Integer): Integer;
const
  msgCaption = msgETax+' 충전 확인';
var
  vResult: Boolean;
  vResultStr: string;
  vLastChargeDate: string;
  vLastChargeQty, vLastChargeAmt: Integer;
begin
  // 익스트림포스 서버에 인증서 값을 저장한다
  try
{    GetServiceSoap.etaxCount(aCustomerNo,
                             vResult,
                             aChargeCount,
                             aUseCount,
                             Result,
                             vLastChargeDate, vLastChargeQty, vLastChargeAmt,
                             vResultStr);
}
    if not vResult then
      ErrBox(vResultStr);
  except
    on E: Exception do
      ErrBox(Format(msgWebServiceError, [E.Message]));
  end;
end;
//------------------------------------------------------------------------------
// 전자세금계산서 조회
function GetETaxDatas(aCustomerNo, aDateFrom, aDateTo: string; aTaxType, aSendType, aStatus: Integer;  aBusinessNo, aCompanyName:String): TStringList;
const
  msgCaption = msgETax+' 조회';
var
  vFirstRow: Integer;
  vResult: Boolean;
  vResultStr,
  vTempData,
  vData: string;
begin
  Result := TStringList.Create;
  vData  := EmptyStr;

  ShowProgressForm(msgCaption);
  try
    vFirstRow := 0;
    while true do
    begin
      // 자료를 7500글자 이하로 나눠서 내려받는다
      try
{        GetServiceSoap.etaxList(vFirstRow,
                                aCustomerNo,
                                aDateFrom,
                                aDateTo,
                                aTaxType,
                                aSendType,
                                aStatus,
                                aBusinessNo,
                                aCompanyName,
                                vResult,
                                vTempData,
                                vResultStr);
}
      except
        on E: Exception do
        begin
          ErrBox(Format(msgWebServiceError, [E.Message]));
          Exit;
        end;
      end;

      // 에러 시 그냥 끝낸다
      if not vResult then
      begin
        ErrBox(vResultStr);
        Exit;
      end
      // 7500 글자씩 받은 자료를 합쳐서 하나로 만든다
      else
        vData := vData + vTempData;

      // 더 이상 받을 데이터가 없으면 루프를 빠져나간다
      if vFirstRow = -1 then
      begin
        // 입력받는 문자열을 레코드(|) 단위로 나눠서 리턴한다
        Split(vData, splitRecord, Result);
        Break;
      end;
    end;
  finally
    HideProgressForm;
  end;
end;
//------------------------------------------------------------------------------
// 전자세금계산서 항목(디테일) 조회
function GetETaxDataItems(aETaxNo: string): TStringList;
const
  msgCaption = msgETax+' 항목 조회';
var
  vFirstRow: Integer;
  vResult: Boolean;
  vResultStr,
  vTempData,
  vData: string;
begin
  Result := TStringList.Create;
  vData  := EmptyStr;

  ShowProgressForm(msgCaption);
  try
    vFirstRow := 0;
    while true do
    begin
      // 자료를 7500글자 이하로 나눠서 내려받는다
      try
//        GetServiceSoap.etaxDetailList(vFirstRow, CustomerNo, aETaxNo, vResult, vTempData, vResultStr);
      except
        on E: Exception do
        begin
          ErrBox(Format(msgWebServiceError, [E.Message]));
          Exit;
        end;
      end;
      // 에러 시 그냥 끝낸다
      if not vResult then
      begin
        ErrBox(vResultStr);
        Exit;
      end
      // 7500 글자씩 받은 자료를 합쳐서 하나로 만든다
      else
        vData := vData + vTempData;

      // 더 이상 받을 데이터가 없으면 루프를 빠져나간다
      if vFirstRow = -1 then
      begin
        // 입력받는 문자열을 레코드(|) 단위로 나눠서 리턴한다
        Split(vData, splitRecord, Result);
        Break;
      end;
    end;
  finally
    HideProgressForm;
  end;
end;
//------------------------------------------------------------------------------
// 전자세금계산서 여러 공급받는자에게 여러 건 신규 발행
function SetETaxMultiDatas(aCustomerNo, aBusinessNo, aSubBusinessNo, aCompanyName, aCeoName, aAddress, aUptae, aJongmok, aTeamName, aDamdangName, aEmail, aPhoneNo, aDatas: string; var aBillNo:String; var aPassword:String; aCertify: Boolean = true): Boolean;
const
  msgCaption = msgETax+' 작성';
var
  vResult: Boolean;
  vResultStr: string;
  vTemp  : AnsiString;
  vDatas : array[0..19] of string;
  vIndex : Integer;
begin
  Result := false;

  // 인증서 폼을 보여주고 인증을 받는다
  with TeTaxForm.Create(Application) do
    if InstallCertificate then
      try
        BusinessNoEdit.Text    := aBusinessNo;
        SubBusinessNoEdit.Text := aSubBusinessNo;
        CompanyNameEdit.Text   := aCompanyName;
        CeoNameEdit.Text       := aCeoName;
        AddressEdit.Text       := aAddress;
        UptaeEdit.Text         := aUptae;
        JongmokEdit.Text       := aJongmok;
        TeamNameEdit.Text      := aTeamName;
        DamdangNameEdit.Text   := aDamdangName;
        EmailEdit.Text         := aEmail;
        PhoneNoEdit.Text       := aPhoneNo;
        // 인증
        if aCertify and (ShowModal = mrOK) then
          Result := Certify
        else if not aCertify then
          Result := true
        else
          Result := false;

        if not Result then
          Exit;


        // 인증을 정상적으로 받았을 때
        ShowProgressForm(msgCaption);
        try
          // 전자세금계산서 작성 자료를 전송한다
          try
            // 자료가 8000글자가 넘을지 모르므로 8000글자씩 나눈다
            vTemp := AnsiString(aDatas);
            for vIndex := Low(vDatas) to High(vDatas) do
              vDatas[vIndex] := EmptyStr;
            for vIndex := Low(vDatas) to High(vDatas) do
              if (Length(vTemp) > 8000) and (ByteType(vTemp, 8000) = mbLeadByte) then
              begin
                vDatas[vIndex] := string(Copy(vTemp, 1, 7999));
                vTemp          := Copy(vTemp, 8000, Length(vTemp));
              end
              else if Length(vTemp) > 0 then
              begin
                vDatas[vIndex] := string(Copy(vTemp, 1, 8000));
                vTemp          := Copy(vTemp, 8001, Length(vTemp));
              end
              else
                break;
            // 자료가 16만 글자가 넘어가면 에러
            if Length(vTemp) > 0 then
            begin
              MessageBox(Application.Handle, PChar(msgDataLengthError), PChar(msgCaption), MB_OK+MB_ICONERROR);
              Exit;
            end;

            // 전자세금계산서 작성
{            GetServiceSoap.etaxMultiDatasSave(aCustomerNo,
                                              BusinessNoEdit.Text,
                                              SubBusinessNoEdit.Text,
                                              CompanyNameEdit.Text,
                                              CeoNameEdit.Text,
                                              AddressEdit.Text,
                                              UptaeEdit.Text,
                                              JongmokEdit.Text,
                                              TeamNameEdit.Text,
                                              DamdangNameEdit.Text,
                                              EmailEdit.Text,
                                              GetOnlyNumber(PhoneNoEdit.Text),
                                              vDatas[0], vDatas[1], vDatas[2], vDatas[3], vDatas[4], vDatas[5], vDatas[6], vDatas[7], vDatas[8], vDatas[9], vDatas[10], vDatas[11], vDatas[12], vDatas[13], vDatas[14], vDatas[15], vDatas[16], vDatas[17], vDatas[18], vDatas[19],
                                              vResult,
                                              aBillNo,
                                              vResultStr);
}
            if not vResult then
            begin
              Result := false;
              ErrBox(vResultStr);
            end
            else
              Result := true;
          except
            on E: Exception do
              ErrBox(Format(msgWebServiceError, [E.Message]));
          end;
        finally
          HideProgressForm;
        end;
      finally
        Free;
      end;
end;
//------------------------------------------------------------------------------
// 전자세금계산서 한 공급받는자에게 여러 건 신규 발생
function SetETaxDatas(aCustomerNo, aBusinessNo, aSubBusinessNo, aCompanyName, aCeoName, aAddress, aUptae, aJongmok, aTeamName, aDamdangName, aEmail, aPhoneNo: string; aReceiverType: Integer; aReceiverBusinessNo, aReceiverSubBusinessNo, aReceiverCompanyName, aReceiverCeoName, aReceiverAddress, aReceiverUptae, aReceiverJongmok, aReceiverTeamName, aReceiverDamangName, aReceiverEmail, aReceiverMobileNo, aWriteDate, aDatas: string; var aBillNo:String): Boolean;
const
  msgCaption = msgETax+' 작성';
var
  vResult: Boolean;
  vResultStr: string;
  vTemp  : AnsiString;
  vDatas : array[0..19] of string;
  vIndex : Integer;
begin
  Result := false;

  // 인증서 폼을 보여주고 인증을 받는다
  with TeTaxForm.Create(Application) do
    if InstallCertificate then
      try
        BusinessNoEdit.Text    := aBusinessNo;
        SubBusinessNoEdit.Text := aSubBusinessNo;
        CompanyNameEdit.Text   := aCompanyName;
        CeoNameEdit.Text       := aCeoName;
        AddressEdit.Text       := aAddress;
        UptaeEdit.Text         := aUptae;
        JongmokEdit.Text       := aJongmok;
        TeamNameEdit.Text      := aTeamName;
        DamdangNameEdit.Text   := aDamdangName;
        EmailEdit.Text         := aEmail;
        PhoneNoEdit.Text       := aPhoneNo;
        // 인증
        if ShowModal = mrOK then
          Result := Certify;
        if not Result then
          Exit;


        // 인증을 정상적으로 받았을 때
        ShowProgressForm(msgCaption);
        try
          // 전자세금계산서 작성 자료를 전송한다
          try
            // 자료가 8000글자가 넘을지 모르므로 8000글자씩 나눈다
            vTemp := AnsiString(aDatas);
            for vIndex := Low(vDatas) to High(vDatas) do
              vDatas[vIndex] := EmptyStr;
            for vIndex := Low(vDatas) to High(vDatas) do
              if (Length(vTemp) > 8000) and (ByteType(vTemp, 8000) = mbLeadByte) then
              begin
                vDatas[vIndex] := string(Copy(vTemp, 1, 7999));
                vTemp          := Copy(vTemp, 8000, Length(vTemp));
              end
              else if Length(vTemp) > 0 then
              begin
                vDatas[vIndex] := string(Copy(vTemp, 1, 8000));
                vTemp          := Copy(vTemp, 8001, Length(vTemp));
              end
              else
                break;
            // 자료가 16만 글자가 넘어가면 에러
            if Length(vTemp) > 0 then
            begin
              MessageBox(Application.Handle, PChar(msgDataLengthError), PChar(msgCaption), MB_OK+MB_ICONERROR);
              Exit;
            end;

            // 전자세금계산서 작성
{            GetServiceSoap.etaxDatasSave(aCustomerNo,
                                         BusinessNoEdit.Text,
                                         SubBusinessNoEdit.Text,
                                         CompanyNameEdit.Text,
                                         CeoNameEdit.Text,
                                         AddressEdit.Text,
                                         UptaeEdit.Text,
                                         JongmokEdit.Text,
                                         TeamNameEdit.Text,
                                         DamdangNameEdit.Text,
                                         EmailEdit.Text,
                                         GetOnlyNumber(PhoneNoEdit.Text),
                                         aReceiverType,
                                         aReceiverBusinessNo,
                                         aReceiverSubBusinessNo,
                                         aReceiverCompanyName,
                                         aReceiverCeoName,
                                         aReceiverAddress,
                                         aReceiverUptae,
                                         aReceiverJongmok,
                                         aReceiverTeamName,
                                         aReceiverDamangName,
                                         aReceiverEmail,
                                         aReceiverMobileNo,
                                         aWriteDate,
                                         vDatas[0], vDatas[1], vDatas[2], vDatas[3], vDatas[4], vDatas[5], vDatas[6], vDatas[7], vDatas[8], vDatas[9], vDatas[10], vDatas[11], vDatas[12], vDatas[13], vDatas[14], vDatas[15], vDatas[16], vDatas[17], vDatas[18], vDatas[19],
                                         vResult,
                                         aBillNo,
                                         vResultStr);
}
            if not vResult then
            begin
              Result := false;
              ErrBox(vResultStr);
            end
            else
              Result := true;
          except
            on E: Exception do
              ErrBox(Format(msgWebServiceError, [E.Message]));
          end;
        finally
          HideProgressForm;
        end;
      finally
        Free;
      end;
end;
//------------------------------------------------------------------------------
// 전자세금계산서 한 공급받는자에게 한 건 신규 발생
function SetETaxData(aCustomerNo, aBusinessNo, aSubBusinessNo, aCompanyName, aCeoName, aAddress, aUptae, aJongmok, aTeamName, aDamdangName, aEmail, aPhoneNo: string; aSend, aForward_, aPaper:Boolean; aDocumentType: Integer; aPayType: Boolean; aVolumn, aVolumnSeq: string; aReceiverType: Integer; aReceiverBusinessNo, aReceiverSubBusinessNo, aReceiverCompanyName, aReceiverCeoName, aReceiverAddress, aReceiverUptae, aReceiverJongmok, aReceiverTeamName, aReceiverDamangName, aReceiverEmail, aReceiverMobileNo, aWriteDate: string; aAmount, aNetAmount, aVatAmount, aCashAmount, aCheckAmount, aNoteAmount, aCreditAmount: Integer; aRemark, aNotice, aItems:String; var aBillNo:String; aPassword: string; aCertify: Boolean): Boolean;
const
  msgCaption = msgETax+' 작성';
var
  vResult: Boolean;
  vResultStr: string;
  vTemp  : AnsiString;
  vItems : array[0..4] of string;
  vIndex : Integer;
begin
  Result := false;

  // 인증서 폼을 보여주고 인증을 받는다
  with TeTaxForm.Create(Application) do
    if InstallCertificate then
      try
        BusinessNoEdit.Text    := aBusinessNo;
        SubBusinessNoEdit.Text := aSubBusinessNo;
        CompanyNameEdit.Text   := aCompanyName;
        CeoNameEdit.Text       := aCeoName;
        AddressEdit.Text       := aAddress;
        UptaeEdit.Text         := aUptae;
        JongmokEdit.Text       := aJongmok;
        TeamNameEdit.Text      := aTeamName;
        DamdangNameEdit.Text   := aDamdangName;
        EmailEdit.Text         := aEmail;
        PhoneNoEdit.Text       := aPhoneNo;
        PasswordEdit.Text      := aPassword;
        // 인증
        if aCertify then
          Result := Certify
        else
          Result := true;//Certify;
        if not Result then
          Exit;

        // 인증을 정상적으로 받았을 때
        ShowProgressForm(msgCaption);
        try
          // 전자세금계산서 작성 자료를 전송한다
          try
            // 자료가 8000글자가 넘을지 모르므로 8000글자씩 나눈다
            vTemp := AnsiString(aItems);
            for vIndex := Low(vItems) to High(vItems) do
              vItems[vIndex] := EmptyStr;
            for vIndex := Low(vItems) to High(vItems) do
              if (Length(vTemp) > 8000) and (ByteType(vTemp, 8000) = mbLeadByte) then
              begin
                vItems[vIndex] := string(Copy(vTemp, 1, 7999));
                vTemp          := Copy(vTemp, 8000, Length(vTemp));
              end
              else if Length(vTemp) > 0 then
              begin
                vItems[vIndex] := string(Copy(vTemp, 1, 8000));
                vTemp          := Copy(vTemp, 8001, Length(vTemp));
              end
              else
                break;
            // 자료가 16만 글자가 넘어가면 에러
            if Length(vTemp) > 0 then
            begin
              MessageBox(Application.Handle, PChar(msgDataLengthError), PChar(msgCaption), MB_OK+MB_ICONERROR);
              Exit;
            end;

            // 전자세금계산서 작성
{            GetServiceSoap.etaxDataSave(aCustomerNo,
                                        BusinessNoEdit.Text,
                                        SubBusinessNoEdit.Text,
                                        CompanyNameEdit.Text,
                                        CeoNameEdit.Text,
                                        AddressEdit.Text,
                                        UptaeEdit.Text,
                                        JongmokEdit.Text,
                                        TeamNameEdit.Text,
                                        DamdangNameEdit.Text,
                                        EmailEdit.Text,
                                        GetOnlyNumber(PhoneNoEdit.Text),
                                        aSend,
                                        aForward_,
                                        aPaper,
                                        aDocumentType,
                                        aPayType,
                                        aVolumn,
                                        aVolumnSeq,
                                        aReceiverType,
                                        aReceiverBusinessNo,
                                        aReceiverSubBusinessNo,
                                        aReceiverCompanyName,
                                        aReceiverCeoName,
                                        aReceiverAddress,
                                        aReceiverUptae,
                                        aReceiverJongmok,
                                        aReceiverTeamName,
                                        aReceiverDamangName,
                                        aReceiverEmail,
                                        aReceiverMobileNo,
                                        aWriteDate,
                                        aAmount,
                                        aNetAmount,
                                        aVatAmount,
                                        aCashAmount,
                                        aCheckAmount,
                                        aNoteAmount,
                                        aCreditAmount,
                                        aRemark,
                                        aNotice,
                                        vItems[0], vItems[1], vItems[2], vItems[3], vItems[4],
                                        aBillNo,
                                        vResult,
                                        vResultStr);
}
            if not vResult then
            begin
              Result := false;
              ErrBox(vResultStr);
            end
            else
              Result := true;
          except
            on E: Exception do
              ErrBox(Format(msgWebServiceError, [E.Message]));
          end;
        finally
          HideProgressForm;
        end;
      finally
        Free;
      end;
end;
//------------------------------------------------------------------------------
// 전자세금계산서 수정
function ChangeETaxData(aETaxSeq: string; aStatus: Integer; aPayType: Boolean; aVolumn, aVolumnSeq, aTeamName, aDamangName, aEmail, aPhoneNo, aReceiverCompanyName, aReceiverCeoName, aReceiverAddress, aReceiverUptae, aReceiverJongmok, aReceiverTeamName, aReceiverDamangName, aReceiverEmail, aReceiverMobileNo: string; aAmount, aNetAmount, aVatAmount, aCashAmount, aCheckAmount, aNoteAmount, aCreditAmount: Integer; aRemark, aNotice, aScrapReason, aItems: string): Boolean;
const
  msgCaption = msgETax+' 수정';
var
  vResult: Boolean;
  vResultStr: string;
  vTemp  : AnsiString;
  vItems : array[0..4] of string;
  vIndex : Integer;
begin
  Result := false;

  ShowProgressForm(msgCaption);
  try
    // 전자세금계산서 수정 자료를 전송한다
    try
      // 항목이 8000글자가 넘을지 모르므로 8000글자씩 나눈다
      vTemp := AnsiString(aItems);
      for vIndex := Low(vItems) to High(vItems) do
        vItems[vIndex] := EmptyStr;
      for vIndex := Low(vItems) to High(vItems) do
        if (Length(vTemp) > 8000) and (ByteType(vTemp, 8000) = mbLeadByte) then
        begin
          vItems[vIndex] := string(Copy(vTemp, 1, 7999));
          vTemp          := Copy(vTemp, 8000, Length(vTemp));
        end
        else if Length(vTemp) > 0 then
        begin
          vItems[vIndex] := string(Copy(vTemp, 1, 8000));
          vTemp          := Copy(vTemp, 8001, Length(vTemp));
        end
        else
          break;
      // 항목이 너무 많으면 에러
      if Length(vTemp) > 0 then
      begin
        MessageBox(Application.Handle, PChar(msgDataLengthError), PChar(msgCaption), MB_OK+MB_ICONERROR);
        Exit;
      end;

      // 전자세금계산서 수정
{      GetServiceSoap.etaxDataChange(CustomerNo,
                                    aETaxSeq,
                                    aStatus,
                                    aPayType,
                                    aVolumn,
                                    aVolumnSeq,
                                    aTeamName,
                                    aDamangName,
                                    aEmail,
                                    aPhoneNo,
                                    aReceiverCompanyName,
                                    aReceiverCeoName,
                                    aReceiverAddress,
                                    aReceiverUptae,
                                    aReceiverJongmok,
                                    aReceiverTeamName,
                                    aReceiverDamangName,
                                    aReceiverEmail,
                                    aReceiverMobileNo,
                                    aAmount,
                                    aNetAmount,
                                    aVatAmount,
                                    aCashAmount,
                                    aCheckAmount,
                                    aNoteAmount,
                                    aCreditAmount,
                                    aRemark,
                                    aNotice,
                                    aScrapReason,
                                    vItems[0], vItems[1], vItems[2], vItems[3], vItems[4],
                                    vResult,
                                    vResultStr);
}
      if not vResult then
        ErrBox(vResultStr)
      else
        Result := true;
    except
      on E: Exception do
        ErrBox(Format(msgWebServiceError, [E.Message]));
    end;
  finally
    HideProgressForm;
  end;
end;
//------------------------------------------------------------------------------
// 웹서비스 URL 알아내기
function GetWebServiceURL: string;
var
  vHostEnt: pHostEnt;
  vWSAData: TWSAData;
begin
  Result := EmptyStr;

  // 익스트림포스 서버 IP를 알아낸다
  WSAStartup(MakeWord(2, 2), vWSAData);
  try
    vHostEnt := GetHostByName(PAnsiChar('extremepos.co.kr'));
    if Assigned(vHostEnt) then
      Result := IntToStr(Ord(vHostEnt.h_addr_list^[0])) + '.' + IntToStr(Ord(vHostEnt.h_addr_list^[1])) + '.' + IntToStr(Ord(vHostEnt.h_addr_list^[2])) + '.' + IntToStr(Ord(vHostEnt.h_addr_list^[3]))
    else
      raise Exception.Create('익스트림포스 서버를 찾을 수 없습니다.');
  finally
    WSACleanup;
  end;

  // 웹서비스 URL로 수정한다
  if Result <> EmptyStr then
    Result := 'http://'+Result+'/ExtremeMartWebService/Service.asmx';
end;
//------------------------------------------------------------------------------
// 문자열 나누기
function Split(const aStr: string; aSplitChar: Char): TStringList;
var
  vTemp: string;
  vPos: Integer;
begin
  Result := TStringList.Create;
  vTemp  := aStr;
  repeat
    vPos := Pos(aSplitChar, vTemp);
    if vPos > 0 then
    begin
      Result.Add(Copy(vTemp, 1, vPos-1));
      vTemp := Copy(vTemp, vPos+1, Length(vTemp));
    end
    else
      Result.Add(vTemp);
  until vPos = 0;
end;
//------------------------------------------------------------------------------
// 작업 중 폼 보여주기
procedure ShowProgressForm(const aCaption, aComment: string; aOwner: TComponent);
var
  vLabel: TLabel;
begin
  if not Assigned(ProgressForm) then
  begin
    Screen.Cursor             := crHourGlass;
    if aOwner = nil then
      ProgressForm            := TForm.Create(Application)
    else
      ProgressForm            := TForm.Create(aOwner);
    ProgressForm.BorderIcons  := [];
    ProgressForm.BorderStyle  := bsDialog;
    ProgressForm.ClientHeight := 120;
    ProgressForm.ClientWidth  := 400;
    ProgressForm.Position     := poOwnerFormCenter;
    ProgressForm.Caption      := aCaption;
    vLabel                    := TLabel.Create(ProgressForm);
    vLabel.Parent             := ProgressForm;
    vLabel.Left               := 50;
    vLabel.Top                := 35;
    vLabel.Font.Name          := '맑은 고딕';
    vLabel.Font.Size          := 9;
    if aComment = EmptyStr then
      vLabel.Caption          := aCaption + ' 중입니다.'#13#13'잠시 기다리십시오...'
    else
      vLabel.Caption          := aComment;
    ProgressForm.Show;
    vLabel.Refresh;
  end;
end;
//------------------------------------------------------------------------------
// 작업 중 폼 닫기
procedure HideProgressForm();
begin
  if Assigned(ProgressForm) then
    FreeAndNil(ProgressForm);
  Screen.Cursor := crDefault;
end;


//==============================================================================
// 전자세금계산서 인증 폼
//------------------------------------------------------------------------------
// 전자세금계산서 인증 폼 입력창에 들어갈 때
procedure TeTaxForm.EditEnter(Sender: TObject);
begin
  if Sender is TEdit then
    TEdit(Sender).Color     := $0080FFFF
  else if Sender is TMaskEdit then
    TMaskEdit(Sender).Color := $0080FFFF;
end;
//------------------------------------------------------------------------------
// 전자세금계산서 인증 폼 입력창에서 나갈 때
procedure TeTaxForm.EditExit(Sender: TObject);
  // 한글 카피
  function CopyStr(const aStr: string; aIndex, aCount: Integer): string;
  var
    vStr   : AnsiString;
    vResult: AnsiString;
  begin
    vStr := AnsiString(aStr);
    vResult := Copy(vStr, aIndex, aCount+1);
    if (Length(vResult) >= aCount) and (ByteType(vResult, aCount) = mbLeadByte) then
      Result := string(Copy(vResult, 1, aCount-1)+' ')
    else
      Result := string(Copy(vResult, 1, aCount));
  end;
begin
  if Sender is TEdit then
  begin
    TEdit(Sender).Color  := clWindow;
    if Sender = PhoneNoEdit then
      TEdit(Sender).Text := GetPhoneNo(TEdit(Sender).Text);
    if TEdit(Sender).MaxLength > 0 then
      TEdit(Sender).Text := CopyStr(TEdit(Sender).Text, 1, TEdit(Sender).MaxLength);
  end
  else if Sender is TMaskEdit then
  begin
    TMaskEdit(Sender).Color := clWindow;
  end;
end;
//------------------------------------------------------------------------------
// 사업자 번호를 바꿀 때
procedure TeTaxForm.BusinessNoEditChange(Sender: TObject);
begin
  if CheckBusinessNo(BusinessNoEdit.Text) then
    BusinessNoEdit.Font.Color := clWindowText
  else
    BusinessNoEdit.Font.Color := clRed;
end;
//------------------------------------------------------------------------------
// E-mail을 바꿀 때
procedure TeTaxForm.EmailEditChange(Sender: TObject);
begin
  if CheckEmail(EmailEdit.Text) then
    EmailEdit.Font.Color := clWindowText
  else
    EmailEdit.Font.Color := clRed;
end;
//------------------------------------------------------------------------------
// 전화번호를 바꿀 때
procedure TeTaxForm.PhoneNoEditChange(Sender: TObject);
begin
  if CheckPhoneNo(PhoneNoEdit.Text) then
    PhoneNoEdit.Font.Color := clWindowText
  else
    PhoneNoEdit.Font.Color := clRed;
end;
//------------------------------------------------------------------------------
// 전자세금계산서 인증 폼 입력창에서 키보드를 누를 때
procedure TeTaxForm.EditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_Escape: CancelButton.Click;
    VK_Up    : SelectNext(TWinControl(Sender), false, true);
    VK_Down  : SelectNext(TWinControl(Sender), true, true);
    VK_Return: if Sender = PasswordEdit then
               begin
                 OKButton.SetFocus;
                 OKButton.Click;
               end
               else
                 SelectNext(TWinControl(Sender), true, true);
    VK_F5    : begin
                 OKButton.SetFocus;
                 OKButton.Click;
               end;
  end;
end;
//------------------------------------------------------------------------------
// 전자세금계산서 인증 폼 확인 버튼을 누를 때
procedure TeTaxForm.OKButtonClick(Sender: TObject);
const
  msgMustInput = '%s을(를) 정확히 입력하십시오.';
begin
  if (GetOnlyNumber(BusinessNoEdit.Text) <> BusinessNoEdit.Text) or (Length(BusinessNoEdit.Text) <> 10) then
  begin
    MessageBox(Handle, PChar(Format(msgMustInput, [BusinessNoLabel.Caption])), PChar(Caption), MB_OK+MB_ICONERROR);
    BusinessNoEdit.SetFocus;
    BusinessNoEdit.SelectAll;
  end
  else if Trim(PasswordEdit.Text) = EmptyStr then
  begin
    MessageBox(Handle, PChar(Format(msgMustInput, [PasswordLabel.Caption])), PChar(Caption), MB_OK+MB_ICONERROR);
    PasswordEdit.SetFocus;
    PasswordEdit.SelectAll;
  end
  else if Trim(CompanyNameEdit.Text) = EmptyStr then
  begin
    MessageBox(Handle, PChar(Format(msgMustInput, [CompanyNameLabel.Caption])), PChar(Caption), MB_OK+MB_ICONERROR);
    CompanyNameEdit.SetFocus;
    CompanyNameEdit.SelectAll;
  end
  else if Trim(CeoNameEdit.Text) = EmptyStr then
  begin
    MessageBox(Handle, PChar(Format(msgMustInput, [CeoNameLabel.Caption])), PChar(Caption), MB_OK+MB_ICONERROR);
    CeoNameEdit.SetFocus;
    CeoNameEdit.SelectAll;
  end
  else if Trim(AddressEdit.Text) = EmptyStr then
  begin
    MessageBox(Handle, PChar(Format(msgMustInput, [AddressLabel.Caption])), PChar(Caption), MB_OK+MB_ICONERROR);
    AddressEdit.SetFocus;
    AddressEdit.SelectAll;
  end
  else if Trim(UptaeEdit.Text) = EmptyStr then
  begin
    MessageBox(Handle, PChar(Format(msgMustInput, [UptaeLabel.Caption])), PChar(Caption), MB_OK+MB_ICONERROR);
    UptaeEdit.SetFocus;
    UptaeEdit.SelectAll;
  end
  else if Trim(JongmokEdit.Text) = EmptyStr then
  begin
    MessageBox(Handle, PChar(Format(msgMustInput, [JongmokLabel.Caption])), PChar(Caption), MB_OK+MB_ICONERROR);
    JongmokEdit.SetFocus;
    JongmokEdit.SelectAll;
  end
  else if (Trim(EmailEdit.Text) = EmptyStr) or (not CheckEmail(EmailEdit.Text)) then
  begin
    MessageBox(Handle, PChar(Format(msgMustInput, [EmailLabel.Caption])), PChar(Caption), MB_OK+MB_ICONERROR);
    EmailEdit.SetFocus;
    EmailEdit.SelectAll;
  end
  else if not CheckPhoneNo(PhoneNoEdit.Text) then
  begin
    MessageBox(Handle, PChar(Format(msgMustInput, [PhoneNoLabel.Caption])), PChar(Caption), MB_OK+MB_ICONERROR);
    PhoneNoEdit.SetFocus;
    PhoneNoEdit.SelectAll;
  end
  else
    ModalResult := mrOK;
end;
//------------------------------------------------------------------------------
// 전자세금계산서 인증 폼 취소 버튼을 누를 때
procedure TeTaxForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;
//------------------------------------------------------------------------------
// 전자세금계산서 인증모듈 설치 (이미 설치되어 있거나 설치가 성공적이었다면 true를 리턴함)
function TeTaxForm.InstallCertificate(aReinstall: Boolean): Boolean;
  // DLL 파일 등록(regsvr32 파일) ----------------------------------------------
  procedure RegDll(aFileName: string);
  begin
    if FileExists(aFileName) then
      RegisterComServer(aFileName);
  end;
  // DLL 파일 등록해제(regsvr32 /u 파일) ---------------------------------------
  procedure UnregDll(aFileName: string);
  type
    TUnregProc = function: HResult; stdcall;
  var
    vModule   : THandle;
    vUnregProc: TUnregProc;
  begin
    vModule := LoadLibrary(PChar(aFileName));
    if vModule <> 0 then
    begin
      @vUnregProc := GetProcAddress(vModule, 'DllUnregisterServer');
      vUnregProc;
      FreeLibrary(vModule);
    end;
  end;
const
  msgCaption = '전자인증모듈';
  fileCert   : array[0..12] of string = ('TSToolkit.dll',
                                         'TSToolkitCom.dll',
                                         'TSXMLToolkit.dll',
                                         'TSXMLToolkitCom.dll',
                                         'TSXMLToolkit.inf',
                                         'TSToolkitLib.dll',
                                         'cryptutil.dll',
                                         'nsldap32v50.dll',
                                         'etaxtoolkit.dll',
                                         'libcurl.dll',
                                         'libxml2.dll',
                                         'libxmlsec.dll',
                                         'libxmlsec-ktnet.dll');
var
  vPath         : array[0..MAX_PATH] of Char;
  vSystemFolder : string;
  vCertInstalled: Boolean;
  vIndex        : Integer;
  vMemoryStream : TMemoryStream;
begin
  Result := false;

  // 시스템 폴더를 알아낸다
  GetSystemDirectory(vPath, MAX_PATH);
  vSystemFolder   := vPath;
  if vSystemFolder[Length(vSystemFolder)] <> '\' then
    vSystemFolder := vSystemFolder + '\';

  // 이미 설치되어 있는지 확인한다
  vCertInstalled := true;
  for vIndex := Low(fileCert) to High(fileCert) do
    if not FileExists(vSystemFolder + fileCert[vIndex]) then
    begin
      vCertInstalled := false;
      break;
    end;

  // 이미 설치되어 있는데 다시 설치하지 말라면 그냥 종료한다
  if vCertInstalled and not aReinstall then
  begin
    Result := true;
    Exit;
  end;

  // 기존에 설치되어 있는 파일들을 지운다
  for vIndex := Low(fileCert) to High(fileCert) do
    if FileExists(vSystemFolder + fileCert[vIndex]) then
      try
        if vIndex < 4 then
          UnregDll(vSystemFolder + fileCert[vIndex]);
        DeleteFile(vSystemFolder + fileCert[vIndex]);
      except
      end;

  // 진행 중 폼을 띄운다
  ShowProgressForm(msgCaption+' 설치', Format('%s을 설치하고 있습니다.'#13#13'설치가 완료될 때까지 기다리십시오(10초~3분).', [msgCaption]), Owner);
  try
    // HTTP 에서 파일 받기
    with TIdHTTP.Create(self) do
      try
        try
          for vIndex := Low(fileCert) to High(fileCert) do
          begin
            vMemoryStream := TMemoryStream.Create;
            try
              Get(Format('http://extremepos.co.kr/FTP/Update/Common/eTax/%s', [fileCert[vIndex]]), vMemoryStream);
              vMemoryStream.SaveToFile(vSystemFolder + fileCert[vIndex]);
            finally
              vMemoryStream.Free;
            end;
          end;
        except
          on E: Exception do
          begin
            MessageBox(self.Handle, PChar(Format('%s을 다운로드하지 못했습니다.'#13'%s', [msgCaption, E.Message])), PChar(msgCaption), MB_OK+MB_ICONERROR);
            Exit;
          end;
        end;
      finally
        Free;
      end;

    // 설치
    try
      for vIndex := 0 to 3 do
        RegDll(vSystemFolder + fileCert[vIndex]);
    except
      on E: Exception do
      begin
        MessageBox(self.Handle, PChar(Format('%s을 설치하지 못했습니다.'#13'%s', [msgCaption, E.Message])), PChar(msgCaption), MB_OK+MB_ICONERROR);
        Exit;
      end;
    end;

    Result := true;
    MessageBox(self.Handle, PChar(Format('%s을 정상적으로 설치했습니다.', [msgCaption])), PChar(msgCaption), MB_OK+MB_ICONINFORMATION);
  finally
    // 진행 중 창 닫기
    HideProgressForm;
  end;
end;
//------------------------------------------------------------------------------
// 전자세금계산서 인증 폼 인증
function TeTaxForm.Certify: Boolean;
const
  msgCaption      = msgCertificate+' 확인';
  // 인증기관
  CertCompanyList = 'KISA:dirsys.rootca.or.kr:389|KICA:ldap.signgate.com:389|SignKorea:dir.signkorea.com:389|Yessign:ds.yessign.or.kr:389|CrossCert:dir.crosscert.com:389|TradeSign:ldap.tradesign.net:389|NCASign:ds.nca.or.kr:389|';
  // 인증서 정책
  CertPolicyList  = '1 2 410 200012 1 1 3:범용기업|1 2 410 200004 5 1 1 7:범용기업|1 2 410 200005 1 1 5:범용기업|1 2 410 200004 5 2 1 1:범용기업|1 2 410 200004 5 4 1 2:범용기업|1 2 410 200004 5 3 1 1:범용기관|1 2 410 200004 5 3 1 2:범용기업|1 2 410 200012 1 1 411:speedbill|1 2 410 200005 1 1 6 8:금융결제원|';
var
  vReturn: SmallInt;
  vSign, vSignPrivate, vExpireDate: string;
  vResult: Boolean;
  vResultStr: string;
  vCertifyETaxThread: TCertifyETaxThread;
begin
  Result := false;

  if Length(BusinessNoEdit.Text) <> 10 then
  begin
    MessageBox(self.Handle, PChar('사업자번호가 잘못되었습니다.'), PChar(msgCaption), MB_OK+MB_ICONERROR);
    Exit;
  end
  else if Trim(PasswordEdit.Text) = EmptyStr then
  begin
    MessageBox(self.Handle, PChar(Format('%s 암호를 입력하십시오.', [msgCertificate])), PChar(msgCaption), MB_OK+MB_ICONERROR);
    Exit;
  end;

  try
    with TTSToolkit.Create(self) do
      try
        try
          // 인증서 환경설정을 한다
          vReturn := SetConfig('',               // Site이름 (미사용 시 공백문자, test를 쓴건 왜?)
                               CertCompanyList,  // 허용된 인증기관 목록
                               '',               // 인증서 검증에 사용되는 CTL 정보(공백문자)
                               CertPolicyList,   // 허용된 인증서 정책 리스트(범용만)
                               0,                // 서명데이타 생성 시 인증기관 인증서 포함여부(0:서명자 인증서만, 1:서명자 및 인증기관 인증서 포함)
                               1,                // 서명데이타 생성 시 서명시간 포함여부(1:포함, 0:미포함)
                               0,                // 서명데이타 생성 시 CRL 포함 여부(0:미포함, 1:포함)
                               1,                // 서명데이타 생성 시 원문 데이터 포함 여부(1:포함, 0:미포함)
                               1,                // 인증서 검증 시 CRL 검증 여부(1:현재시간기준으로 유효한 CRL 사용, 0:CRL 체크 안함, 2:현재 시간기준으로 유효한 CRL을 못 구하면 이전 CRL 사용)
                               0);               // 인증서 검증 시 ARL 검증 여부(0:ARL 체크 안함, 1:현재시간기준으로 유효한 ARL 사용, 2:현재 시간기준으로 유효한 CRL 못 구하면 이전 ARL 사용)
          if vReturn > 0 then
          begin
            MessageBox(self.Handle, PChar(Format('%s 환경설정을 하지 못했습니다.'#13'%s', [msgCertificate, GetErrorMessage])), PChar(msgCaption), MB_OK+MB_ICONERROR);
            Exit;
          end;

          // 암호화/복호화 시 사용되는 대칭키 알고리즘을 설정한다
          vReturn := SetEncryptionAlgoAndMode(3,   // 대칭키 알고리즘(SYMMETRIC_ID_SEED)
                                              2);  // 대칭키 모드(SYMMETRIC_MODE_CBC)
          if vReturn > 0 then
          begin
            MessageBox(self.Handle, PChar(Format(' 대칭키 알고리즘을 설정하지 못했습니다.'#13'%s', [msgCertificate, GetErrorMessage])), PChar(msgCaption), MB_OK+MB_ICONERROR);
            Exit;
          end;

          // 인증서 선택 및 암호 입력 받기
          vCertifyETaxThread := TCertifyETaxThread.Create(PasswordEdit.Text);  // 인증서에 비밀번호를 입력하는 스레드
          vReturn := SelectCertificate(0,    // 인증서 기본 저장매체(하드디스크)
                                       0,    // 인증서 읽는 방식(사용자 선택 화면 표시)
                                       '');  // 사용자UI와 같이 읽어들일 사용자 인증서의 DN 또는 사용자UI 없이 읽을 인증서 암호
          vCertifyETaxThread.Terminate;
          if vReturn > 0 then
          begin
            MessageBox(self.Handle, PChar(Format('%s를 선택하지 못했습니다.'#13'%s', [msgCertificate, GetErrorMessage])), PChar(msgCaption), MB_OK+MB_ICONERROR);
            Exit;
          end;

          // 서명용 인증서를 확인한다(PEM 형식)
          vReturn := GetCertificate(1,   // 인증서 용도(CERT_TYPE_SIGN)
                                    0);  // 인증서 형식(DATA_TYPE_PEM)
          if vReturn > 0 then
          begin
            MessageBox(self.Handle, PChar(Format('%s를 확인하지 못했습니다.'#13'%s', [msgCertificate, GetErrorMessage])), PChar(msgCaption), MB_OK+MB_ICONERROR);
            Exit;
          end;
          vSign := OutData;
          vSign := StringReplace(StringReplace(vSign, '-----BEGIN CERTIFICATE-----', '', []), '-----END CERTIFICATE-----', '', []);

          // 서명용 개인키를 확인한다(PEM 형식)
          vReturn := GetPrivateKey(1,    // 인증서 용도(CERT_TYPE_SIGN)
                                   0,    // 인증서 형식(DATA_TYPE_PEM)
                                   '');  // 새 암호
          if vReturn > 0 then
          begin
            MessageBox(self.Handle, PChar(Format('개인키를 확인하지 못했습니다.'#13+'%s', [GetErrorMessage])), PChar(msgCaption), MB_OK+MB_ICONERROR);
            Exit;
          end;
          vSignPrivate := OutData;
          vSignPrivate := StringReplace(StringReplace(vSignPrivate, '-----BEGIN ENCRYPTED PRIVATE KEY-----', '', []), '-----END ENCRYPTED PRIVATE KEY-----', '', []);

          // VID를 검증한다
          vReturn := VerifyVID(BusinessNoEdit.Text);
          if vReturn > 0 then
          begin
            MessageBox(self.Handle, PChar(Format('인증 ID를 검증하지 못했습니다.'#13'%s', [GetErrorMessage])), PChar(msgCaption), MB_OK+MB_ICONERROR);
            Exit;
          end;
          // 신원 확인값을 체크한다
          if OutData <> 'true' then
          begin
            MessageBox(self.Handle, PChar(Format('사업자번호와 %s가 일치하지 않습니다.'#13'%s', [msgCertificate, GetErrorMessage])), PChar(msgCaption), MB_OK+MB_ICONERROR);
            Exit;
          end;

          // 인증서 유효기간을 확인한다
          GetCertificatePropertyFromID(vSign,  // 서명용 인증서
                                       8);     // 유효기간(CERT_ATTR_VALID_TO)
          vExpireDate := StringReplace(Copy(OutData, 1, 10), '-', '', [rfReplaceAll]);

          // 진행 중 폼을 띄운다
          ShowProgressForm(Caption, Format('%s %s 인증을 하고 있습니다.'#13#13'잠시 기다리십시오(1초~1분).', [msgETax, msgCertificate]), self);
          try
            // 익스트림포스 서버에 인증서 값을 저장한다
            try
{              GetServiceSoap.etaxCertificateSave(CustomerNo,
                                                 BusinessNoEdit.Text,
                                                 vSign,
                                                 vSignPrivate,
                                                 PasswordEdit.Text,
                                                 vExpireDate,
                                                 vResult,
                                                 vResultStr);
}
              if vResult then
                Result := true
              else
                ErrBox(vResultStr);
            except
              on E: Exception do
                ErrBox(Format(msgWebServiceError, [E.Message]));
            end;
          finally
            // 진행 중 창 닫기
            HideProgressForm;
          end;
        except
          on E: Exception do
            MessageBox(self.Handle, PChar(Format('%s을 하지 못했습니다.'#13'%s', [msgCaption, E.Message])), PChar(msgCaption), MB_OK+MB_ICONERROR);
        end;
      finally
        Free;
      end;
  except
    MessageBox(self.Handle, PChar('전자인증모듈이 설치되지 않았습니다.'), PChar(msgCaption), MB_OK+MB_ICONERROR);
  end;
end;

//------------------------------------------------------------------------------
// 전자세금계산서 인증 폼 사업자번호가 맞는지 확인
function TeTaxForm.CheckBusinessNo(const aBusinessNo: string): Boolean;
var
  vStr: string;
  vIndex, vLastDigit: Integer;
begin
  Result := false;

  vStr := GetOnlyNumber(aBusinessNo);
  if Length(vStr) <> 10 then
    Exit;

  vLastDigit := StrToInt(vStr[Length(vStr)]);
  vIndex     := StrToInt(vStr[9]) * 5;
  vIndex     := (vIndex div 10) + (vIndex mod 10);
  vIndex     := vIndex +
                StrToInt(vStr[1]) + StrToInt(vStr[4]) + StrToInt(vStr[7]) +
               (StrToInt(vStr[2]) + StrToInt(vStr[5]) + StrToInt(vStr[8])) * 3 +
               (StrToInt(vStr[3]) + StrToInt(vStr[6])) * 7;
  if (vIndex mod 10) <> 0 then
    vIndex   := 10 - (vIndex mod 10)
  else
    vIndex   := 0;
  Result     := vIndex = vLastDigit;
end;
//------------------------------------------------------------------------------
// 전자세금계산서 인증 폼 E-mail이 맞는지 확인
function TeTaxForm.CheckEmail(const aEmail: string): Boolean;
var
  vAt, vDot, vIndex: Integer;
begin
  Result := true;
  vAt    := 0;
  vDot   := 0;
  vIndex := 1;

  // E-mail에 적합한 문자들만 사용했는지 확인한다
  while Result and (vIndex <= Length(aEmail)) do
  begin
    if aEmail[vIndex] = '@' then
      Inc(vAt)
    else if aEmail[vIndex] = '.' then
      Inc(vDot)
    else if not CharInSet(aEmail[vIndex], ['0'..'9', 'a'..'z', 'A'..'Z', '_', '~']) then
      Result := false;
    Inc(vIndex);
  end;

  // @나 . 개수가 맞는지 확인한다
  if Result and ((vAt <> 1) or (vDot = 0)) then
    Result := false;

  if Result then
  begin
    // @ 위치가 첫 글자나 마지막 글자가 아니어야 하고
    // . 위치가 @ 앞이나 마지막 글자가 아니어야 한다
    vAt    := Pos('@', aEmail);
    vDot   := Pos('.', aEmail);
    Result := (vAt > 1) and (vAt <> Length(aEmail)) and
              (vDot > vAt+1) and (vDot <> Length(aEmail)) and
              (aEmail[Length(aEmail)] <> '.');
  end;
end;
//------------------------------------------------------------------------------
// 전자세금계산서 인증 폼 전화번호가 맞는지 확인
function TeTaxForm.CheckPhoneNo(const aPhoneNo: string): Boolean;
var
  vTemp: string;
begin
  vTemp := GetOnlyNumber(aPhoneNo);
  case Length(vTemp) of
     8 : Result := (Copy(aPhoneNo, 1, 2) = '15') or (Copy(aPhoneNo, 1, 2) = '16');
     9 : Result := (Copy(aPhoneNo, 1, 2) = '02');
    10 : begin
         vTemp  := Copy(aPhoneNo, 1, 3);
         Result := (Copy(aPhoneNo, 1, 2) = '02') or
                   (vTemp = '031') or (vTemp = '032') or (vTemp = '033') or
                   (vTemp = '041') or (vTemp = '042') or (vTemp = '043') or
                   (vTemp = '051') or (vTemp = '052') or (vTemp = '053') or (vTemp = '054') or (vTemp = '055') or
                   (vTemp = '061') or (vTemp = '062') or (vTemp = '063') or (vTemp = '064') or
                   (vTemp = '010') or (vTemp = '011') or (vTemp = '016') or (vTemp = '017') or (vTemp = '018') or (vTemp = '019');
         end;
    11 : begin
         vTemp  := Copy(aPhoneNo, 1, 3);
         Result := (vTemp = '010') or (vTemp = '011') or (vTemp = '016') or (vTemp = '017') or (vTemp = '018') or (vTemp = '019') or
                   (vTemp = '060') or (vTemp = '070') or (vTemp = '080');
         end;
    else Result := false;
  end;
end;


//==============================================================================
// 전자세금계산서 인증서 선택 스레드
//------------------------------------------------------------------------------
// 전자세금계산서 인증서 선택 스레드 생성자
constructor TCertifyETaxThread.Create(aPassword: string);
begin
  Password := aPassword;
  FreeOnTerminate := true;
  inherited Create(false);
end;
//------------------------------------------------------------------------------
// 전자세금계산서 인증서 선택 스레드 실행
procedure TCertifyETaxThread.Execute;
var
  vHandle: Cardinal;
begin
  while true do
  begin
    // 인증서 선택 폼을 찾는다
    vHandle := FindWindow(nil, '인증서 선택');
    if vHandle > 0 then
    begin
      Sleep(2000);
      // 인증서 선택 폼 안에 있는 비밀번호 입력창을 찾는다
      vHandle := FindWindowEx(vHandle, 0, 'Edit', nil);
      if vHandle > 0 then
      begin
        // 비밀번호를 기존 입력받은 값으로 넣는다
        SendMessage(vHandle, WM_SETTEXT, 0, Integer(PChar(Password)));
        // 비밀번호 입력창을 읽기 전용으로 만들어서 새로운 비밀번호를 입력하지 못하게 막는다
        SendMessage(vHandle, EM_SETREADONLY, 1, 0);
      end;
      Break;
    end;
  end;
end;


//==============================================================================
// 함수 설명
//------------------------------------------------------------------------------
// 전자세금계산서 조회
// function GetETaxDatas(aCustomerNo, aDateFrom, aDateTo: string; aTaxType: Integer; aStatus: Integer; aBusinessNo, aCompanyName:String ): TStringList;
//   aCustomerNo            : 고객번호
//   aDateFrom              : 세금계산서 발급날짜 From(yyyymmdd) (발급날짜는 최대 6개월 범위 내로 입력)
//   aDateTo                : 세금계산서 발급날짜 To(yyyymmdd)   (발급날짜는 최대 6개월 범위 내로 입력)
//   aTaxType               : 세금계산서 구분(1:세금계산서, 2:계산서(면세), 3:세금계산서+계산서)
/// <param name="receiverBusinessNo">공급받는자 사업자번호(매입세금계산서일 때는 공급자 사업자번호. 넣지 않으면 모두 조회, -없이 모든 사업자번호를 다 넣어야 함)</param>
/// <param name="receiverCompanyName">공급받는자 상호(매입세금계산서일 때는 공급자 상호. 넣지 않으면 모두 조회, 상호 일부만 넣어도 됨)</param>
//   aStatus                : 조회 조건
//                            $0001 : 단순저장(국세청에 전송하지 않고 서버에 저장만 하는 자료)
//                            $0002 : (스피드빌로) 아직 전송하지 않은 자료
//                            $0004 : (공급받는자에게 메일을 발송한 후) 승인대기 중 자료
//                            $0010 : 발급완료(공급받는자가 승인 완료한 자료)
//                            $0020 : 승인거부(공급받는자가 승인 거부한 자료)
//                            $0040 : 폐기 자료
//                            $0100 : (스피드빌로) 전송 실패한 자료(전송 실패 사유는 아래 결과값 참조
//                            $1000 : 국세청 전송완료
//                            $2000 : 국세청 승인거부(승인 거부 사유는 아래 결과값 참조)
//                            각 값을 조합하여 여러 조건을 조회할 수 있음(승인대기, 발급완료, 승인거부 자료를 조회하려면 $0004 + $0010 + $0020 값 지정)
//   결과                   : 세금계산서 정보가 아래 순서로 리턴됨(각 칼럼은 Tab(#9)으로 구분됨)
//                            00.문서번호 (yyyymmdd+일련번호(7))
//                            01.세금계산서구분 (세금계산서, 계산서, 영세)
//                            02.전송상태 (0:단순저장(전송안함), 1:전송요청, 2:전송완료, 8:메일재전송, 9:전송실패)
//                            03.문서상태 (DS10:승인대기, DS15:승인거부, DS30:승인완료, DS40:폐기)
//                            04.국세청 전송여부 (1:전송완료, 다른값:미전송)
//                            05.결과(알기쉽게)
//                            06.영수 구분 (01:영수, 02:청구)
//                            07.권
//                            08.호
//                            09.공급자 사업자번호
//                            10.공급자 종사업자번호
//                            11.공급자 상호
//                            12.공급자 대표자이름
//                            13.공급자 주소
//                            14.공급자 종목
//                            15.공급자 업태
//                            16.공급자 부서
//                            17.공급자 담당자이름
//                            18.공급자 이메일
//                            19.공급자 휴대폰번호
//                            20.공급받는자 사업자번호
//                            21.공급받는자 종사업자번호
//                            22.공급받는자 상호
//                            23.공급받는자 대표자이름
//                            24.공급받는자 주소
//                            25.공급받는자 종목
//                            26.공급받는자 업태
//                            27.공급받는자 부서
//                            28.공급받는자 담당자이름
//                            29.공급받는자 이메일
//                            30.공급받는자 휴대폰번호
//                            31.세금계산서 발행일자
//                            32.비고 (수정세금계산서 발행 시 이곳에 원세금계산서의 문서번호를 넣어야 함)
//                            33.합계금액
//                            34.공급가액
//                            35.세액
//                            36.현금
//                            37.수표
//                            38.어음
//                            39.외상(미수)
//                            40.사유 (공급받는자 승인 거부 시 공급받는자가 입력한 사유, 공급자 폐기 시 폐기 사유(옵션))
//                            41.국세청 승인번호
//                            42.문서구분 (매출, 매입, 위수탁)</para>
//                            43.종이세금계산서 구분 (0:전자세금계산서, 1:종이세금계산서)

//------------------------------------------------------------------------------
// 전자세금계산서 항목(디테일) 조회
// function GetETaxDataItems(aETaxNo: string): TStringList;
//   aETaxNo                : 계산서 일련번호(yyyymmdd+순번(7)), GetETaxDatas() 함수로 받은 결과값에서 일련번호 부분을 넘겨 한 전표씩 조회
//   결과                   : 세금계산서 항목(디테일) 정보가 아래 순서로 리턴됨(각 칼럼은 Tab(#9)으로 구분됨)
//                            00.순번
//                            01.월
//                            02.일
//                            03.품목
//                            04.규격
//                            05.수량
//                            06.단위
//                            07.단가
//                            08.공급가액
//                            09.세액
//                            10.비고
//------------------------------------------------------------------------------
// 전자세금계산서 여러 공급받는자에게 여러 건 신규 발행
// function SetETaxMultiDatas(aBusinessNo, aSubBusinessNo, aCompanyName, aCeoName, aAddress, aUptae, aJongmok, aTeamName, aDamdangName, aEmail, aPhoneNo, aDatas: string): Boolean;
//   aBusinessNo            : 공급자 사업자번호(-없이)
//   aSubBusinessNo         : 공급자 종사업자번호(4)
//   aCompanyName           : 공급자 상호(100)
//   aCeoName               : 공급자 대표자이름(50)
//   aAddress               : 공급자 주소(200)
//   aUptae                 : 공급자 업태(40)
//   aJongmok               : 공급자 종목(40)
//   aTeamName              : 공급자 부서이름(50)
//   aDamangName            : 공급자 담당자이름(50)
//   aEmail                 : 공급자 이메일(50)
//   aMobileNo              : 공급자 휴대폰번호(20)
//   aDatas                 : 세금계산서 자료(각 칼럼은 Tab(#9), 각 레코드(디테일 각 레코드간 구분)는 |, 각 테이블(마스터와 디테일간 구분)은 #3, 각 데이터셋(마스터+디테일 셋과 다음 마스터+디테일 셋 구분)은 #4로 구분함)
//                            마스터 00.공급받는자 구분(1:사업자, 2:개인(주민번호), 3:외국인(여권번호))
//                                   01.공급받는자 사업자번호(-없이)
//                                   02.공급받는자 종사업자번호(4)
//                                   03.공급받는자 상호(100)
//                                   04.공급받는자 대표자이름(50)
//                                   05.공급받는자 주소(200)
//                                   06.공급받는자 업태(40)
//                                   07.공급받는자 종목(40)
//                                   08.공급받는자 부서이름(50)
//                                   09.공급받는자 담당자이름(50)
//                                   10.공급받는자 이메일(50)
//                                   11.공급받는자 휴대폰번호(20)
//                                   12.세금계산서 발행일자(8)
//                       　        　13.국세청 전송(0:미전송, 1:전송) +</para>
//                         　 　   　14.발행방향(S:매출(정방향), B:매입(역방향)) + </para>
//                                   15.종이세금계산서(0:전자세금계산서, 1:종이세금계산서)
//                                   16.문서종류(1:세금계산서, 2:계산서, 3:영세)
//                                   17.영수구분(1:영수, 2:청구)
//                                   18.권(20)
//                                   19.호(20)
//                                   20.세금계산서 총 합계금액
//                                   21.세금계산서 총 공급가액
//                                   22.세금계산서 총 세액
//                                   23.현금 결제금액
//                                   24.수표 결제금액
//                                   25.어음 결제금액
//                                   26.외상(미수) 금액
//                                   27.비고(250)
//                                   28.공급받는자공지사항(250), 국세청에는 전송되지 않고 공급받는자 이메일에만 표시됨
//                            디테일 00.월
//                                   01.일
//                                   02.품목(60)
//                                   03.규격(60)
//                                   04.수량
//                                   05.단위(60)
//                                   06.단가
//                                   07.공급가액
//                                   08.세액
//                                   09.비고(200)
//   결과                   : 성공 true, 실패 false
//------------------------------------------------------------------------------
// 전자세금계산서 한 공급받는자에게 여러 건 신규 발생
// function SetETaxDatas(aBusinessNo, aSubBusinessNo, aCompanyName, aCeoName, aAddress, aUptae, aJongmok, aTeamName, aDamdangName, aEmail, aPhoneNo: string; aReceiverType: Integer; aReceiverBusinessNo, aReceiverSubBusinessNo, aReceiverCompanyName, aReceiverCeoName, aReceiverAddress, aReceiverUptae, aReceiverJongmok, aReceiverTeamName, aReceiverDamangName, aReceiverEmail, aReceiverMobileNo, aWriteDate, aDatas: string): Boolean;
//   aBusinessNo            : 공급자 사업자번호(-없이)
//   aSubBusinessNo         : 공급자 종사업자번호(4)
//   aCompanyName           : 공급자 상호(100)
//   aCeoName               : 공급자 대표자이름(50)
//   aAddress               : 공급자 주소(200)
//   aUptae                 : 공급자 업태(40)
//   aJongmok               : 공급자 종목(40)
//   aTeamName              : 공급자 부서이름(50)
//   aDamangName            : 공급자 담당자이름(50)
//   aEmail                 : 공급자 이메일(50)
//   aMobileNo              : 공급자 휴대폰번호(20)
//   aReceiverType          : 공급받는자 구분(1:사업자, 2:개인(주민번호), 3:외국인(여권번호))
//   aReceiverBusinessNo    : 공급받는자 사업자번호(-없이)
//   aReceiverSubBusinessNo : 공급받는자 종사업자번호(4)
//   aReceiverCompanyName   : 공급받는자 상호(100)
//   aReceiverCeoName       : 공급받는자 대표자이름(50)
//   aReceiverAddress       : 공급받는자 주소(200)
//   aReceiverUptae         : 공급받는자 업태(40)
//   aReceiverJongmok       : 공급받는자 종목(40)
//   aReceiverTeamName      : 공급받는자 부서이름(50)
//   aReceiverDamangName    : 공급받는자 담당자이름(50)
//   aReceiverEmail         : 공급받는자 이메일(50)
//   aReceiverMobileNo      : 공급받는자 휴대폰번호(20)
//   aWriteDate             : 세금계산서 발행일자(8)
//   aDatas                 : 세금계산서 자료(각 칼럼은 Tab(#9), 각 레코드(디테일 각 레코드간 구분)는 |, 각 테이블(마스터와 디테일간 구분)은 #3, 각 데이터셋(마스터+디테일 셋과 다음 마스터+디테일 셋 구분)은 #4로 구분함)
//                            마스터 00.국세청 전송(0:미전송, 1:전송) +</para>
//                      　 　      　01.발행방향(S:매출(정방향), B:매입(역방향)) + </para>
//                                   02.종이세금계산서(0:전자세금계산서, 1:종이세금계산서)
//                                   03.문서종류(1:세금계산서, 2:계산서, 3:영세)
//                                   04.영수구분(1:영수, 2:청구)
//                                   05.권(20)
//                                   06.호(20)
//                                   07.세금계산서 총 합계금액
//                                   08.세금계산서 총 공급가액
//                                   09.세금계산서 총 세액
//                                   10.현금 결제금액
//                                   11.수표 결제금액
//                                   12.어음 결제금액
//                                   13.외상(미수) 금액
//                                   14.비고(250)
//                            디테일 00.공급받는자공지사항(250), 국세청에는 전송되지 않고 공급받는자 이메일에만 표시됨
//                                   01.월
//                                   02.일
//                                   03.품목(60)
//                                   04.규격(60)
//                                   05.수량
//                                   06.단위(60)
//                                   07.단가
//                                   08.공급가액
//                                   09.세액
//                            비고(200)
//   결과                   : 성공 true, 실패 false
//------------------------------------------------------------------------------
// 전자세금계산서 한 공급받는자에게 한 건 신규 발생
// function SetETaxData(aBusinessNo, aSubBusinessNo, aCompanyName, aCeoName, aAddress, aUptae, aJongmok, aTeamName, aDamdangName, aEmail, aPhoneNo: string; aDocumentType: Integer; aPayType: Boolean; aVolumn, aVolumnSeq: string; aReceiverType: Integer; aReceiverBusinessNo, aReceiverSubBusinessNo, aReceiverCompanyName, aReceiverCeoName, aReceiverAddress, aReceiverUptae, aReceiverJongmok, aReceiverTeamName, aReceiverDamangName, aReceiverEmail, aReceiverMobileNo, aWriteDate: string; aAmount, aNetAmount, aVatAmount, aCashAmount, aCheckAmount, aNoteAmount, aCreditAmount: Integer; aRemark, aNotice, aItems: string): Boolean;
//   aBusinessNo            : 공급자 사업자번호(-없이)
//   aSubBusinessNo         : 공급자 종사업자번호(4)
//   aCompanyName           : 공급자 상호(100)
//   aCeoName               : 공급자 대표자이름(50)
//   aAddress               : 공급자 주소(200)
//   aUptae                 : 공급자 업태(40)
//   aJongmok               : 공급자 종목(40)
//   aTeamName              : 공급자 부서이름(50)
//   aDamangName            : 공급자 담당자이름(50)
//   aEmail                 : 공급자 이메일(50)
//   aMobileNo              : 공급자 휴대폰번호(20)
//   aDocumentType          : 문서종류(1:세금계산서, 2:계산서, 3:영세)
//   aPayType               : 영수 구분(true:영수, false:청구)
//   aVolumn                : 권(20)
//   aVolumnSeq             : 호(20)
//   aReceiverType          : 공급받는자 구분(1:사업자, 2:개인(주민번호), 3:외국인(여권번호))
//   aReceiverBusinessNo    : 공급받는자 사업자번호(-없이)
//   aReceiverSubBusinessNo : 공급받는자 종사업자번호(4)
//   aReceiverCompanyName   : 공급받는자 상호(100)
//   aReceiverCeoName       : 공급받는자 대표자이름(50)
//   aReceiverAddress       : 공급받는자 주소(200)
//   aReceiverUptae         : 공급받는자 업태(40)
//   aReceiverJongmok       : 공급받는자 종목(40)
//   aReceiverTeamName      : 공급받는자 부서이름(50)
//   aReceiverDamangName    : 공급받는자 담당자이름(50)
//   aReceiverEmail         : 공급받는자 이메일(50)
//   aReceiverMobileNo      : 공급받는자 휴대폰번호(20)
//   aWriteDate             : 세금계산서 발행일자(8)
//   aAmount                : 세금계산서 총 합계금액
//   aNetAmount             : 세금계산서 총 공급가액
//   aVatAmount             : 세금계산서 총 세액
//   aCashAmount            : 현금 결제금액
//   aCheckAmount           : 수표 결제금액
//   aNoteAmount            : 어음 결제금액
//   aCreditAmount          : 외상(미수) 금액
//   aRemark                : 비고(250)
//   aNotice                : 공급받는자 공지사항(250), 국세청에는 전송되지 않고 공급받는자 이메일에만 표시됨
//   aItems                 : 항목(각 칼럼은 Tab(#9), 각 레코드는 |로 구분함)
//                            00.월
//                            01.일
//                            02.품목(60)
//                            03.규격(60)
//                            04.수량
//                            05.단위(60)
//                            06.단가
//                            07.공급가액
//                            08.세액
//                            09.비고(200)
//   결과                   : 성공 true, 실패 false
//------------------------------------------------------------------------------
// 전자세금계산서 수정
// function ChangeETaxData(aETaxSeq: string; aStatus: Integer; aPayType: Boolean; aVolumn, aVolumnSeq, aTeamName, aDamangName, aEmail, aPhoneNo, aReceiverCompanyName, aReceiverCeoName, aReceiverAddress, aReceiverUptae, aReceiverJongmok, aReceiverTeamName, aReceiverDamangName, aReceiverEmail, aReceiverMobileNo: string; aAmount, aNetAmount, aVatAmount, aCashAmount, aCheckAmount, aNoteAmount, aCreditAmount: Integer; aRemark, aNotice, aScrapReason, aItems: string): Boolean;
//   * 계산서 일련번호(aETaxSeq), 상태(aStatus), 영수여부(aPayType)을 제외한 나머지 값은 ''(string), -1(Integer)을 넣으면 기존 값을 변경하지 않는다
//   aETaxSeq               : 계산서 일련번호(yyyymmdd+순번(7))
//   aStatus                : 수정 요청 사항
//                            1 : 기존 내용 수정
//                            2 : (기존 내용 수정 없이) 이메일만 재전송
//                            3 : 세금계산서 폐기
//   aPayType               : 영수 여부(true:영수, false:청구)
//   aVolumn                : 권
//   aVolumnSeq             : 호
//   aTeamName              : 공급자 부서이름(50)
//   aDamangName            : 공급자 담당자이름(50)
//   aEmail                 : 공급자 이메일(50)
//   aPhoneNo               : 공급자 휴대폰번호(20)
//   aReceiverCompanyName   : 공급받는자 상호(100)
//   aReceiverCeoName       : 공급받는자 대표자이름(50)
//   aReceiverAddress       : 공급받는자 주소(200)
//   aReceiverUptae         : 공급받는자 업태(40)
//   aReceiverJongmok       : 공급받는자 종목(40)
//   aReceiverTeamName      : 공급받는자 부서이름(50)
//   aReceiverDamangName    : 공급받는자 담당자이름(50)
//   aReceiverEmail         : 공급받는자 이메일(50)
//   aReceiverMobileNo      : 공급받는자 휴대폰번호(20)
//   aAmount                : 세금계산서 총 합계금액
//   aNetAmount             : 세금계산서 총 공급가액
//   aVatAmount             : 세금계산서 총 세액
//   aCashAmount            : 현금 결제금액
//   aCheckAmount           : 수표 결제금액
//   aNoteAmount            : 어음 결제금액
//   aCreditAmount          : 외상(미수) 금액
//   aRemark                : 비고(250)
//   aNotice                : 공급받는자에게 보낼 공지사항(250), 국세청에는 전송되지 않고 공급받는자 이메일에만 표시됨
//   aScrapReason           : 폐기 사유(250), 폐기 시에만 입력
//   aItems                 : 항목(각 칼럼은 Tab(#9), 각 레코드는 |로 구분함), 이 값을 입력하면 기존 항목들을 모두 지우고 이 값을 새로 인서트함, ''으로 지정하면 기존 항목들을 그대로 둠
//                            00.월
//                            01.일
//                            02.품목(60)
//                            03.규격(60)
//                            04.수량
//                            05.단위(60)
//                            06.단가
//                            07.공급가액
//                            08.세액
//                            09.비고(200)
//   결과                   : 성공 true, 실패 false

end.
