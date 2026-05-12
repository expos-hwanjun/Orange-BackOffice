// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://www.expos.co.kr/WebService/Service.asmx?wsdl
// Encoding : utf-8
// Version  : 1.0
// (2015-09-14 ¿ÀÈÄ 6:00:23 - - $Rev: 45757 $)
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
  // !:base64Binary    - "http://www.w3.org/2001/XMLSchema"[]
  // !:double          - "http://www.w3.org/2001/XMLSchema"[]
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"[]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[]
  // !:int             - "http://www.w3.org/2001/XMLSchema"[]


  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // soapAction: http://tempuri.org/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : encoded
  // binding   : ServiceSoap12
  // service   : Service
  // port      : ServiceSoap12
  // URL       : http://www.expos.co.kr/WebService/Service.asmx
  // ************************************************************************ //
  ServiceSoap = interface(IInvokable)
  ['{89A44D6C-629E-14C5-0478-33BE4DB9ED3E}']
    procedure couponSearch(const custID: string; const couponNo: string; const memberNo: string; const saleAmt: Integer; const useDate: string; const useTime: string; 
                           out couponSearchResult: Boolean; out output: string; out dcType: string; out dcAmt: Integer; out dcLimit: string; 
                           out menuCode: string; out remainQty: Integer; out memberCheckYN: string); stdcall;
    procedure couponSave(const custID: string; const couponNo: string; const memberNo: string; const mobileNo: string; const saleAmt: Integer; const couponDCAmt: Integer; 
                         const saleDate: string; const posNo: string; const receiptNo: string; const sawonNo: string; const useDate: string; 
                         const useTime: string; out couponSaveResult: Boolean; out output: string); stdcall;
    procedure licenseCustomerInfo(const custID: string; out licenseCustomerInfoResult: Boolean; out output: string); stdcall;
    procedure licenseCustomerInfoChange(const custID: string; const data: string; out licenseCustomerInfoChangeResult: Boolean; out output: string); stdcall;
    procedure licenseCustomerInfoChange2(const custID: string; const oldCustID: string; const data: string; out licenseCustomerInfoChange2Result: Boolean; out output: string); stdcall;
    procedure licenseProxyCheck(const custID: string; const userID: string; const userPassword: string; out licenseProxyCheckResult: Boolean; out output: string); stdcall;
    procedure licenseTempAuth(const custID: string; const userID: string; const licenseKey: string; const use: Boolean; const posNo: string; out licenseTempAuthResult: Boolean; 
                              out output: string); stdcall;
    procedure licenseWOS(const custID: string; const userID: string; const serialNo: string; const use: Boolean; const posNo: string; out licenseWOSResult: Boolean; 
                         out output: string); stdcall;
    procedure licenseKiccMac(const custID: string; const posNo: string; const macAddress: string; const posNoList: string; out licenseKiccMacResult: Boolean; out output: string
                             ); stdcall;
    procedure martGoods(const dbType: Integer; const custID: string; const goodsCode: string; out martGoodsResult: Boolean; out output: string); stdcall;
    procedure martCMSCouponList(var firstRow: Integer; const custID: string; const month: string; out martCMSCouponListResult: Boolean; out data: string; out output: string
                                ); stdcall;
    procedure martCMSCouponSave(const custID: string; const month: string; const datas: string; out martCMSCouponSaveResult: Boolean; out output: string); stdcall;
    function  martErrorLogSave(const custID: string; const errorMessage: string; const stackTrace: string): Boolean; stdcall;
    function  commonRealIP(const custID: string): string; stdcall;
    procedure smsCharge(const custID: string; const userID: string; const chargeDate: string; const chargeQty: Integer; const chargeAmt: Integer; const chargeType: string; 
                        const remark: string; out smsChargeResult: Boolean; out output: string); stdcall;
    procedure smsChargeCard(const custID: string; const userID: string; const chargeDate: string; const chargeAmt: Integer; const cardApproval: Boolean; const cardTrack2: string; 
                            const installMonth: Integer; const signData: TByteDynArray; const securityReadNo: Integer; const securityDateTime: string; const securityData: string; 
                            const securityKey: string; var cardCompanyName: string; var issueCompanyName: string; var approvalNo: string; var approvalDate: string; 
                            var approvalTime: string; var joinNo: string; out smsChargeCardResult: Boolean; out output: string); stdcall;
    procedure smsChargeChange(const custID: string; const userID: string; const chargeDate: string; const chargeSeq: Integer; const isDelete: Boolean; const chargeQty: Integer; 
                              const chargeAmt: Integer; const remark: string; const workRemark: string; out smsChargeChangeResult: Boolean; out output: string
                              ); stdcall;
    procedure smsChargeList(var firstRow: Integer; const custID: string; const dateFrom: string; const dateTo: string; out smsChargeListResult: Boolean; out data: string; 
                            out output: string); stdcall;
    procedure smsCount(const custID: string; out smsCountResult: Boolean; out totalChargeQty: Integer; out smsUseQty: Integer; out lmsUseQty: Integer; out totalUseQty: Double; 
                       out remainQty: Double; out lastChargeDate: string; out lastChargeQty: Integer; out lastChargeAmt: Integer; out lastUseDate: string; 
                       out lastUseQty: Double; out output: string); stdcall;
    procedure smsCount2(const custID: string; out smsCount2Result: Boolean; out chargeAmt: Integer; out remainAmt: Integer; out smsUseQty: Integer; out lmsUseQty: Integer; 
                        out mmsUseQty: Integer; out leafletUseQty: Integer; out remainSmsQty: Integer; out smsPrice: Double; out lmsPrice: Double; 
                        out mmsPrice: Double; out leafletPrice: Double; out lastChargeDate: string; out lastChargeQty: Integer; out lastChargeAmt: Integer; 
                        out lastUseDate: string; out lastUseQty: Integer; out lastUseAmt: Integer; out output: string); stdcall;
    procedure smsCustomer(const custID: string; const storeName: string; const storePhoneNo: string; const smsPrice: Double; const lmsPrice: Double; const mmsPrice: Double; 
                          const leafletPrice: Double; const proxySmsPrice: Double; const leafletURL: string; const status: string; out smsCustomerResult: Boolean; 
                          out output: string); stdcall;
    procedure smsSend(const custID: string; const isSMS: Boolean; const sendSeq: string; const reserveDateTime: string; const sendPhoneNo: string; const receivePhoneNos: string; 
                      const sendMessage: string; const sendDatas: string; const dupCheckHour: Integer; out smsSendResult: Boolean; out output: string
                      ); stdcall;
    procedure smsSend2(const custID: string; const isSMS: Boolean; const isFinish: Boolean; const sendSeq: string; const reserveDateTime: string; const sendPhoneNo: string; 
                       const receivePhoneNos: string; const sendMessage: string; const sendDatas: string; const dupCheckHour: Integer; const msgDupCheck: Boolean; 
                       out smsSend2Result: Boolean; out output: string); stdcall;
    procedure smsSend3(const custID: string; const isSMS: Boolean; const isFinish: Boolean; const sendSeq: string; const reserveDateTime: string; const sendPhoneNo: string; 
                       const receivePhoneNos: string; const sendLmsSubject: string; const sendMessage: string; const sendDatas: string; const dupCheckHour: Integer; 
                       const msgDupCheck: Boolean; const leafletSmsUrl: string; const localIP: string; const mmsImage: TByteDynArray; out smsSend3Result: Boolean; 
                       out output: string); stdcall;
    procedure smsSendCancel(const custID: string; const isSMS: Boolean; const reserveDateTime: string; const sendPhoneNo: string; const receivePhoneNo: string; out smsSendCancelResult: Boolean; 
                            out output: string); stdcall;
    procedure smsSendGroupCancel(const custID: string; const sendDate: string; const sendSeq: string; out smsSendGroupCancelResult: Boolean; out output: string); stdcall;
    procedure smsSendList(var firstRow: Integer; const custID: string; const dateFrom: string; const dateTo: string; out smsSendListResult: Boolean; out data: string; 
                          out output: string); stdcall;
    procedure smsSendDetailList(var firstRow: Integer; const custID: string; const sendDate: string; const sendSeq: string; out smsSendDetailListResult: Boolean; out data: string; 
                                out output: string); stdcall;
    procedure smsSendPhoneList(var firstRow: Integer; const custID: string; const sendDate: string; out smsSendPhoneListResult: Boolean; out data: string; out output: string
                               ); stdcall;
    procedure smsSpamList(var firstRow: Integer; const custID: string; const dateFrom: string; const dateTo: string; out smsSpamListResult: Boolean; out data: string; 
                          out output: string); stdcall;
    procedure trCompanyInfo(const dbType: Integer; const custID: string; const trVersion: string; out trCompanyInfoResult: Boolean; out output: string); stdcall;
    procedure trDownload(var firstRow: Integer; const dbType: Integer; const companyCode: string; const custID: string; const selectSQL: string; out trDownloadResult: Boolean; 
                         out data: string; out paramsType: string; out output: string); stdcall;
    procedure trDown(var firstRow: Integer; const dbType: Integer; const companyCode: string; const custID: string; const selectSQL: string; const selectParam: string; 
                     const selectParamType: string; out trDownResult: Boolean; out data: string; out paramsType: string; out output: string
                     ); stdcall;
    procedure trDownDataSet(var firstRow: Integer; const dbType: Integer; const companyCode: string; const custID: string; const selectSQL: string; out trDownDataSetResult: Boolean; 
                            out data: string; out output: string); stdcall;
    procedure trDownAnsi(var firstRow: Integer; const dbType: Integer; const companyCode: string; const custID: string; const selectSQL: string; const selectParam: string; 
                         const selectParamType: string; out trDownAnsiResult: Boolean; out data: string; out paramsType: string; out output: string
                         ); stdcall;
    procedure trUpload(const title: string; const dbType: Integer; const companyCode: string; const custID: string; const data: string; const deleteSQL: string; 
                       const updateSQL: string; const insertSQL: string; const paramsType: string; const deletePKCount: Integer; out trUploadResult: Boolean; 
                       out output: string); stdcall;
    procedure trUploadAnsi(const title: string; const dbType: Integer; const companyCode: string; const custID: string; const data: string; const deleteSQL: string; 
                           const updateSQL: string; const insertSQL: string; const paramsType: string; const deletePKCount: Integer; out trUploadAnsiResult: Boolean; 
                           out output: string); stdcall;
    procedure trUpdate(const dbType: Integer; const companyCode: string; const custID: string; const updateSQL: string; const updateParams: string; const updateParamsType: string; 
                       out trUpdateResult: Boolean; out output: string); stdcall;
    procedure trUpdateAnsi(const dbType: Integer; const companyCode: string; const custID: string; const updateSQL: string; const updateParams: string; const updateParamsType: string; 
                           out trUpdateAnsiResult: Boolean; out output: string); stdcall;
    procedure trSaleVerify(const dbType: Integer; const companyCode: string; const custID: string; const dateFrom: string; const dateTo: string; const verifySQL: string; 
                           const dataSQL: string; out trSaleVerifyResult: Boolean; out data: string; out output: string); stdcall;
    procedure trMemberPointList(var firstRow: Integer; const dbType: Integer; const companyCode: string; const custID: string; const searchText: string; const searchType: string; 
                                out trMemberPointListResult: Boolean; out data: string; out paramsType: string; out output: string); stdcall;
    procedure trOrderSave(const dbType: Integer; const companyCode: string; const custID: string; const orderDate: string; const data: string; out trOrderSaveResult: Boolean; 
                          out output: string); stdcall;
    procedure trTableColumnInfo(const dbType: Integer; const tableList: string; out trTableColumnInfoResult: Boolean; out output: string); stdcall;
  end;

function GetServiceSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ServiceSoap;


implementation
  uses SysUtils;

function GetServiceSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ServiceSoap;
const
  defWSDL = 'http://www.expos.co.kr/WebService2/Service.asmx?wsdl';
  defURL  = 'http://www.expos.co.kr/WebService2/Service.asmx';
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

  RIO.HTTPWebNode.UserName        := 'ftpuser';
  RIO.HTTPWebNode.Password        := 'anypass';

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
  { ServiceSoap }
  InvRegistry.RegisterInterface(TypeInfo(ServiceSoap), 'http://tempuri.org/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ServiceSoap), 'http://tempuri.org/%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(ServiceSoap), ioSOAP12);

end.