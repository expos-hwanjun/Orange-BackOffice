// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://119.196.174.60/ExtremeMartWebService/Service.asmx?wsdl
// Encoding : utf-8
// Version  : 1.0
// (2010-12-27 ¿ÀÀü 11:17:27 - - $Rev: 25127 $)
// ************************************************************************ //

unit Service;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:int             - "http://www.w3.org/2001/XMLSchema"[]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[]
  // !:base64Binary    - "http://www.w3.org/2001/XMLSchema"[]
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"[]


  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // soapAction: http://tempuri.org/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ServiceSoap12
  // service   : Service
  // port      : ServiceSoap12
  // URL       : http://119.196.174.60/ExtremeMartWebService/Service.asmx
  // ************************************************************************ //
  ServiceSoap = interface(IInvokable)
  ['{89A44D6C-629E-14C5-0478-33BE4DB9ED3E}']
    function  Select_UtilGoodsData(var startRow: Integer; const value: string): string; stdcall;
    function  Save_UtilGoodsData(const data: string): string; stdcall;
    function  Delete_UtilGoodsData(const goodsCode: string): string; stdcall;
    function  Select_UtilGoodsClassName(const goodsClassCode: string): string; stdcall;
    function  Select_UtilGoodsClassData(var startRow: Integer; const value: Integer): string; stdcall;
    function  Save_UtilGoodsClassData(const data: string): string; stdcall;
    function  Delete_UtilGoodsClassData(const goodsClassCode: string): string; stdcall;
    function  Save_UtilCMSCouponData(const applyMonth: string; const data: string): string; stdcall;
    function  SaveSMS(const customerNo: string; const reserveTime: string; const sendMessage: string; const sendPhoneNo: string; const receivePhoneNos: string): string; stdcall;
    procedure ChargeSMS(const customerNo: string; const cardTrack2: string; const chargeAmt: Integer; const installMonth: Integer; const signData: TByteDynArray; const cryptReadNo: Integer; 
                        const cryptDateTime: string; const cryptData: TByteDynArray; const cryptKey: TByteDynArray; out ChargeSMSResult: string; out cardCompanyName: string; 
                        out issueCompanyName: string; out approvalNo: string; out approvalDate: string; out approvalTime: string; out joinNo: string
                        ); stdcall;
    procedure GetSMSCount(const customerNo: string; out GetSMSCountResult: string; out chargeCount: Integer; out useCount: Integer; out remainCount: Integer; out dateFrom: string; 
                          out dateTo: string); stdcall;
    function  GetGoodsInfoList(var firstRow: Integer; const goodsName: string): string; stdcall;
    function  GetGoodsInfo(const goodsCode: string): string; stdcall;
    function  GetGoodsCount: string; stdcall;
    function  GetGoodsClassList(var firstRow: Integer): string; stdcall;
    function  GetCMSCooponList(var firstRow: Integer; const month: string): string; stdcall;
    function  CheckProxy(const custID: string; const userID: string; const userPassword: string): string; stdcall;
    function  AuthLicenseMove(const custID: string; const userID: string; const licenseKey: string; const status: Integer; const posNo: string): string; stdcall;
    procedure ChargeETax(const chargeType: Integer; const customerNo: string; const cardTrack2: string; const chargeAmt: Integer; const installMonth: Integer; const signData: TByteDynArray; 
                         const cryptReadNo: Integer; const cryptDateTime: string; const cryptData: TByteDynArray; const cryptKey: TByteDynArray; out ChargeETaxResult: string; 
                         out cardCompanyName: string; out issueCompanyName: string; out approvalNo: string; out approvalDate: string; out approvalTime: string; 
                         out joinNo: string); stdcall;
    procedure GetETaxChargeCount(const customerNo: string; out GetETaxChargeCountResult: string; out chargeCount: Integer; out useCount: Integer; out remainCount: Integer; out dateFrom: string; 
                                 out dateTo: string); stdcall;
    function  SetETaxCertificate(const businessNo: string; const sign: string; const signPrivate: string; const password: string; const expireDate: string): string; stdcall;
    function  GetETaxDatas(var firstRow: Integer; const businessNo: string; const dateFrom: string; const dateTo: string; const taxType: Integer; const status: Integer
                           ): string; stdcall;
    function  GetETaxDataItems(var firstRow: Integer; const eTaxNo: string): string; stdcall;
    function  SetETaxMultiDatas(const businessNo: string; const subBusinessNo: string; const companyName: string; const ceoName: string; const address: string; const uptae: string; 
                                const jongmok: string; const teamName: string; const damdangName: string; const email: string; const phoneNo: string; 
                                const datas1: string; const datas2: string; const datas3: string; const datas4: string; const datas5: string; 
                                const datas6: string; const datas7: string; const datas8: string; const datas9: string; const datas10: string; 
                                const datas11: string; const datas12: string; const datas13: string; const datas14: string; const datas15: string; 
                                const datas16: string; const datas17: string; const datas18: string; const datas19: string; const datas20: string
                                ): string; stdcall;
    function  SetETaxDatas(const businessNo: string; const subBusinessNo: string; const companyName: string; const ceoName: string; const address: string; const uptae: string; 
                           const jongmok: string; const teamName: string; const damangName: string; const email: string; const phoneNo: string; 
                           const receiverType: Integer; const receiverBusinessNo: string; const receiverSubBusinessNo: string; const receiverCompanyName: string; const receiverCeoName: string; 
                           const receiverAddress: string; const receiverUptae: string; const receiverJongmok: string; const receiverTeamName: string; const receiverDamangName: string; 
                           const receiverEmail: string; const receiverMobileNo: string; const writeDate: string; const datas1: string; const datas2: string; 
                           const datas3: string; const datas4: string; const datas5: string; const datas6: string; const datas7: string; 
                           const datas8: string; const datas9: string; const datas10: string; const datas11: string; const datas12: string; 
                           const datas13: string; const datas14: string; const datas15: string; const datas16: string; const datas17: string; 
                           const datas18: string; const datas19: string; const datas20: string): string; stdcall;
    function  SetETaxData(const businessNo: string; const subBusinessNo: string; const companyName: string; const ceoName: string; const address: string; const uptae: string; 
                          const jongmok: string; const teamName: string; const damangName: string; const email: string; const phoneNo: string; 
                          const send: Boolean; const forward_: Boolean; const documentType: Integer; const payType: Boolean; const volumn: string; 
                          const volumnSeq: string; const receiverType: Integer; const receiverBusinessNo: string; const receiverSubBusinessNo: string; const receiverCompanyName: string; 
                          const receiverCeoName: string; const receiverAddress: string; const receiverUptae: string; const receiverJongmok: string; const receiverTeamName: string; 
                          const receiverDamangName: string; const receiverEmail: string; const receiverMobileNo: string; const writeDate: string; const amount: Integer; 
                          const netAmount: Integer; const vatAmount: Integer; const cashAmount: Integer; const checkAmount: Integer; const noteAmount: Integer; 
                          const creditAmount: Integer; const remark: string; const notice: string; const items1: string; const items2: string; 
                          const items3: string; const items4: string; const items5: string): string; stdcall;
    function  ChangeETaxData(const eTaxSeq: string; const status: Integer; const payType: Boolean; const volumn: string; const volumnSeq: string; const teamName: string; 
                             const damangName: string; const email: string; const phoneNo: string; const receiverCompanyName: string; const receiverCeoName: string; 
                             const receiverAddress: string; const receiverUptae: string; const receiverJongmok: string; const receiverTeamName: string; const receiverDamangName: string; 
                             const receiverEmail: string; const receiverMobileNo: string; const amount: Integer; const netAmount: Integer; const vatAmount: Integer; 
                             const cashAmount: Integer; const checkAmount: Integer; const noteAmount: Integer; const creditAmount: Integer; const remark: string; 
                             const notice: string; const scrapReason: string; const items1: string; const items2: string; const items3: string; 
                             const items4: string; const items5: string): string; stdcall;
    procedure GetUpjangInfo(const upjangCode: string; out GetUpjangInfoResult: string; out companyCode: string; out companyName: string; out upjangName: string; out useYN: Boolean; 
                            out aspGubun: string; out unitedMember: string; out aspMemberCode: string); stdcall;
    function  Upload(const message_: string; const companyCode: string; const upjangCode: string; const data: string; const deleteSQL: string; const insertSQL: string; 
                     const paramsType: string; const deletePKCount: Integer): string; stdcall;
    function  VerifySaleData2(const companyCode: string; const upjangCode: string; const saleDate: string; const data: string): string; stdcall;
    procedure Download(var firstRow: Integer; const companyCode: string; const upjangCode: string; const selectSQL: string; out DownloadResult: string; out data: string
                       ); stdcall;
    function  UpdateMemberDataDownloaded(const companyCode: string; const upjangCode: string): string; stdcall;
  end;

function GetServiceSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ServiceSoap;


implementation
  uses SysUtils;

function GetServiceSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ServiceSoap;
const
  defWSDL = 'http://119.196.174.60/ExtremeMartWebService/Service.asmx?wsdl';
  defURL  = 'http://119.196.174.60/ExtremeMartWebService/Service.asmx';
  defSvc  = 'Service';
  defPrt  = 'ServiceSoap12';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;

  RIO.HTTPWebNode.ConnectTimeout := 2000;

  try
    Result := (RIO as ServiceSoap);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  InvRegistry.RegisterInterface(TypeInfo(ServiceSoap), 'http://tempuri.org/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ServiceSoap), 'http://tempuri.org/%operationName%');
  InvRegistry.RegisterReturnParamNames(TypeInfo(ServiceSoap), 'Select_UtilGoodsDataResult;Save_UtilGoodsDataResult;Delete_UtilGoodsDataResult' +
                                                              ';Select_UtilGoodsClassNameResult;Select_UtilGoodsClassDataResult;Save_UtilGoodsClassDataResult' +
                                                              ';Delete_UtilGoodsClassDataResult;Save_UtilCMSCouponDataResult;SaveSMSResult' +
                                                              ';;;GetGoodsInfoListResult' +
                                                              ';GetGoodsInfoResult;GetGoodsCountResult;GetGoodsClassListResult' +
                                                              ';GetCMSCooponListResult;CheckProxyResult;AuthLicenseMoveResult' +
                                                              ';;;SetETaxCertificateResult' +
                                                              ';GetETaxDatasResult;GetETaxDataItemsResult;SetETaxMultiDatasResult' +
                                                              ';SetETaxDatasResult;SetETaxDataResult;ChangeETaxDataResult' +
                                                              ';;UploadResult;VerifySaleData2Result' +
                                                              ';;UpdateMemberDataDownloadedResult');
  InvRegistry.RegisterInvokeOptions(TypeInfo(ServiceSoap), ioSOAP12);
  InvRegistry.RegisterExternalParamName(TypeInfo(ServiceSoap), 'SetETaxData', 'forward_', 'forward');
  InvRegistry.RegisterExternalParamName(TypeInfo(ServiceSoap), 'Upload', 'message_', 'message');

end.