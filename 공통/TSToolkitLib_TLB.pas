unit TSToolkitLib_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// $Rev: 17244 $
// File generated on 2010-12-06 오전 10:00:55 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Windows\System32\TSToolkit.dll (1)
// LIBID: {D8FD5032-2331-47E0-A69A-4200C1498DC8}
// LCID: 0
// Helpfile: 
// HelpString: TSToolkit 1.0 ���� ���̺귯��
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\system32\stdole2.tlb)
// Errors:
//   Error creating palette bitmap of (TTSToolkit) : No Server registered for this CoClass
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}
interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, OleServer, StdVCL, Variants;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  TSToolkitLibMajorVersion = 1;
  TSToolkitLibMinorVersion = 0;

  LIBID_TSToolkitLib: TGUID = '{D8FD5032-2331-47E0-A69A-4200C1498DC8}';

  DIID__ITSToolkitEvents: TGUID = '{B2735903-82D6-44D8-945B-FD0DF243E4B5}';
  IID_ITSToolkit: TGUID = '{C80144A9-3C37-4316-B413-4FDC2EBDA3F8}';
  CLASS_TSToolkit: TGUID = '{55D9860A-AB9C-44A1-BB74-75AF7F805333}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  _ITSToolkitEvents = dispinterface;
  ITSToolkit = interface;
  ITSToolkitDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  TSToolkit = ITSToolkit;


// *********************************************************************//
// DispIntf:  _ITSToolkitEvents
// Flags:     (4096) Dispatchable
// GUID:      {B2735903-82D6-44D8-945B-FD0DF243E4B5}
// *********************************************************************//
  _ITSToolkitEvents = dispinterface
    ['{B2735903-82D6-44D8-945B-FD0DF243E4B5}']
  end;

// *********************************************************************//
// Interface: ITSToolkit
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {C80144A9-3C37-4316-B413-4FDC2EBDA3F8}
// *********************************************************************//
  ITSToolkit = interface(IDispatch)
    ['{C80144A9-3C37-4316-B413-4FDC2EBDA3F8}']
    function Get_OutData: WideString; safecall;
    function Base64EncodeData(const btData: WideString): Smallint; safecall;
    function Base64EncodeFile(const btDataFile: WideString; const btEncodedDataFile: WideString): Smallint; safecall;
    function Base64DecodeData(const btEncodedData: WideString): Smallint; safecall;
    function Base64DecodeFile(const btEncodedDataFile: WideString; const btDataFile: WideString): Smallint; safecall;
    function HashData(nHashAlgorithm: SYSINT; const btHash: WideString): Smallint; safecall;
    function HashFile(nHashAlgorithm: SYSINT; const btDataFile: WideString): Smallint; safecall;
    function SetEncryptionAlgoAndMode(nEncryptionAlgorithm: SYSINT; nEncryptionMode: SYSINT): Smallint; safecall;
    function GetEncryptionAlgorithm: Smallint; safecall;
    function GetEncryptionMode: Smallint; safecall;
    function GetErrorMessage: WideString; safecall;
    function EncryptData(const btData: WideString; const btEncryptionKey: WideString): Smallint; safecall;
    function EncryptFile(const btDataFile: WideString; const btEncryptedDataFile: WideString; 
                         const btEncryptionKey: WideString): Smallint; safecall;
    function DecryptData(const btEncryptedData: WideString; const btEncryptionKey: WideString): Smallint; safecall;
    function DecryptFile(const btEncryptedDataFile: WideString; const btDataFile: WideString; 
                         const btEncryptionKey: WideString): Smallint; safecall;
    function SignData(const btData: WideString): Smallint; safecall;
    function SignFile(const btDataFile: WideString; const btSignedDataFile: WideString): Smallint; safecall;
    function VerifySignedData(const btSignedData: WideString; const btContentData: WideString): Smallint; safecall;
    function VerifySignedFile(const btSignedDataFile: WideString; const btDataFile: WideString; 
                              const btContentFile: WideString): Smallint; safecall;
    function GetSignerCount: Smallint; safecall;
    function GetSignerDN(nSignerIndex: SYSINT): Smallint; safecall;
    function GetSignerCert(nSignerIndex: SYSINT): Smallint; safecall;
    function GetSigningTime(nSignerIndex: SYSINT): Smallint; safecall;
    function SetPeerCertificate(const btCert: WideString): Smallint; safecall;
    function EnvelopData(const btData: WideString): Smallint; safecall;
    function EnvelopFile(const btDataFile: WideString; const btEnvelopedDataFile: WideString): Smallint; safecall;
    function DecryptEnvelopedData(const btEnvelopedData: WideString): Smallint; safecall;
    function DecryptEnvelopedFile(const btEnvelopedDataFile: WideString; 
                                  const btDataFile: WideString): Smallint; safecall;
    function LoginData(const btSessionID: WideString; const btSSN: WideString; 
                       const btUserInfo: WideString): Smallint; safecall;
    function LoginDataProcess(const btLoginData: WideString): Smallint; safecall;
    function GenerateRandomNumber(nRandomNumberLen: SYSINT): Smallint; safecall;
    function GenerateSymmetricKey(const btSeedStr: WideString): Smallint; safecall;
    function GenerateSymmetricDerivedKey(const btPwd: WideString): Smallint; safecall;
    function CertificateValidation(const btCert: WideString): Smallint; safecall;
    function GetCertificatePropertyFromID(const btCert: WideString; nPropertyID: SYSINT): Smallint; safecall;
    function VerifyVID(const btSSN: WideString): Smallint; safecall;
    function GetCertificate(nCertType: SYSINT; nCertOutPutType: SYSINT): Smallint; safecall;
    function SelectCertificate(nBaseStorageType: SYSINT; nSelectType: SYSINT; 
                               const btUserInfo: WideString): Smallint; safecall;
    function GetDataFromLDAP(const btURL: WideString; nDataType: SYSINT): Smallint; safecall;
    function SetConfig(const btSiteName: WideString; const btLDAPInfo: WideString; 
                       const btCTLInfo: WideString; const btInitPolicies: WideString; 
                       nIncludeCertPath: SYSINT; nIncludeSigningTime: SYSINT; nIncludeCRL: SYSINT; 
                       nIncludeContent: SYSINT; nCRLCheckOption: SYSINT; nARLCheckOption: SYSINT): Smallint; safecall;
    function Get_OutDataNum: Integer; safecall;
    function AddSignInSignedFile(const btSignedFile: WideString; const btAddedSignedFile: WideString): Smallint; safecall;
    function ClearMemory: Smallint; safecall;
    function LoadCertificate(nType: SYSINT; const btSignCert: WideString; 
                             const btSignKey: WideString; const btKMCert: WideString; 
                             const btKMKey: WideString; const btPassword: WideString): Smallint; safecall;
    function CloseAPI: Integer; safecall;
    function GetLastErrMsg: WideString; safecall;
    function GetSerialNumberFromCert(const btCert: WideString): Integer; safecall;
    function GetSubjectDNFromCert(const btCert: WideString): WideString; safecall;
    function GetUserKMCert: WideString; safecall;
    function GetUserSignCert: WideString; safecall;
    function GetUserKMKey(const btPassword: WideString): WideString; safecall;
    function GetUserSignKey(const btPassword: WideString): WideString; safecall;
    function ChangeKeyFilePassword(const btSignKeyFilePath: WideString; 
                                   const btKMKeyFilePath: WideString; 
                                   const btOldPassword: WideString; const btNewPassword: WideString): Smallint; safecall;
    function LoadUserKeyCert(const btSignCert: WideString; const btSignKey: WideString; 
                             const btKMCert: WideString; const btKMKey: WideString; 
                             const btPassword: WideString): Integer; safecall;
    function LoadUserKeyCertDlg(nUseKMCert: SYSINT): Integer; safecall;
    function LoadUserKeyCertFile(const btSignCert: WideString; const btSignKey: WideString; 
                                 const btKMCert: WideString; const btKMKey: WideString; 
                                 const btPassword: WideString): Integer; safecall;
    function SetCertPolicy(const btPolicies: WideString): Integer; safecall;
    function UnloadUserKeyCert: Integer; safecall;
    function ValidateCert(const btCert: WideString): Integer; safecall;
    function GenSignature(nDataType: SYSINT; const btData: WideString): Smallint; safecall;
    function VerifySignature(nDataType: SYSINT; const btData: WideString; 
                             const btSignature: WideString; const btCert: WideString): Smallint; safecall;
    function GetPrivateKey(nKeyType: SYSINT; nKeyOutPutType: SYSINT; const btPwd: WideString): Smallint; safecall;
    function GetLoginData(nLoginDataType: SYSINT): Smallint; safecall;
    function GetSymmetricIV: Smallint; safecall;
    function GetSymmetricKey: Smallint; safecall;
    function ClearMemory2(nDataType: SYSINT): Smallint; safecall;
    function GetRandomInKey: Smallint; safecall;
    function SetSymmetricKeyAndIV(const btSymmetricKey: WideString; const btSymmetricIV: WideString): Smallint; safecall;
    function ChangeKeyFilePassword2(const btSignKeyFilePath: WideString; 
                                    const btKMKeyFilePath: WideString; 
                                    const btOldPassword: WideString; const btNewPassword: WideString): Smallint; safecall;
    function VerifyVID2(const btCert: WideString; const btSSN: WideString; 
                        const btRandom: WideString): Smallint; safecall;
    function SetEachConfig(const bstrConfigType: WideString; const bstrConfigValue: WideString): Smallint; safecall;
    function setCACertsURL(const btURL: WideString): Smallint; safecall;
    function CertificateValidationByOCSP(certtype: Smallint; const cert: WideString; 
                                         version: Smallint; hashalgo: Smallint; isSign: Integer): Smallint; safecall;
    function TSAService(const serviceType: WideString; const url: WideString; datatype: Smallint; 
                        const data: WideString; hashalgo: Smallint): Smallint; safecall;
    function DVCSService(const serviceType: WideString; const url: WideString; datatype: Smallint; 
                         const data: WideString; hashalgo: Smallint): Smallint; safecall;
    function AddSignInSignedData(const btSignedData: WideString): Smallint; safecall;
    function GetVersion: WideString; safecall;
    function MakeOctetList(const bstrData: WideString; nDataType: SYSINT; 
                           const bstrOctetList: WideString): Smallint; safecall;
    function GetSelectedCertInfo(nInfoType: SYSINT): Smallint; safecall;
    function SetStorageConfig(nStorageType: SYSINT; nIsDisable: SYSINT): Smallint; safecall;
    function GetDataFromFile(nFileType: SYSINT; nOutPutType: SYSINT; const bstrFilePath: WideString): Smallint; safecall;
    property OutData: WideString read Get_OutData;
    property OutDataNum: Integer read Get_OutDataNum;
  end;

// *********************************************************************//
// DispIntf:  ITSToolkitDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {C80144A9-3C37-4316-B413-4FDC2EBDA3F8}
// *********************************************************************//
  ITSToolkitDisp = dispinterface
    ['{C80144A9-3C37-4316-B413-4FDC2EBDA3F8}']
    property OutData: WideString readonly dispid 1;
    function Base64EncodeData(const btData: WideString): Smallint; dispid 2;
    function Base64EncodeFile(const btDataFile: WideString; const btEncodedDataFile: WideString): Smallint; dispid 3;
    function Base64DecodeData(const btEncodedData: WideString): Smallint; dispid 4;
    function Base64DecodeFile(const btEncodedDataFile: WideString; const btDataFile: WideString): Smallint; dispid 5;
    function HashData(nHashAlgorithm: SYSINT; const btHash: WideString): Smallint; dispid 6;
    function HashFile(nHashAlgorithm: SYSINT; const btDataFile: WideString): Smallint; dispid 7;
    function SetEncryptionAlgoAndMode(nEncryptionAlgorithm: SYSINT; nEncryptionMode: SYSINT): Smallint; dispid 8;
    function GetEncryptionAlgorithm: Smallint; dispid 9;
    function GetEncryptionMode: Smallint; dispid 10;
    function GetErrorMessage: WideString; dispid 11;
    function EncryptData(const btData: WideString; const btEncryptionKey: WideString): Smallint; dispid 12;
    function EncryptFile(const btDataFile: WideString; const btEncryptedDataFile: WideString; 
                         const btEncryptionKey: WideString): Smallint; dispid 13;
    function DecryptData(const btEncryptedData: WideString; const btEncryptionKey: WideString): Smallint; dispid 14;
    function DecryptFile(const btEncryptedDataFile: WideString; const btDataFile: WideString; 
                         const btEncryptionKey: WideString): Smallint; dispid 15;
    function SignData(const btData: WideString): Smallint; dispid 16;
    function SignFile(const btDataFile: WideString; const btSignedDataFile: WideString): Smallint; dispid 17;
    function VerifySignedData(const btSignedData: WideString; const btContentData: WideString): Smallint; dispid 18;
    function VerifySignedFile(const btSignedDataFile: WideString; const btDataFile: WideString; 
                              const btContentFile: WideString): Smallint; dispid 19;
    function GetSignerCount: Smallint; dispid 20;
    function GetSignerDN(nSignerIndex: SYSINT): Smallint; dispid 21;
    function GetSignerCert(nSignerIndex: SYSINT): Smallint; dispid 22;
    function GetSigningTime(nSignerIndex: SYSINT): Smallint; dispid 23;
    function SetPeerCertificate(const btCert: WideString): Smallint; dispid 24;
    function EnvelopData(const btData: WideString): Smallint; dispid 25;
    function EnvelopFile(const btDataFile: WideString; const btEnvelopedDataFile: WideString): Smallint; dispid 26;
    function DecryptEnvelopedData(const btEnvelopedData: WideString): Smallint; dispid 27;
    function DecryptEnvelopedFile(const btEnvelopedDataFile: WideString; 
                                  const btDataFile: WideString): Smallint; dispid 28;
    function LoginData(const btSessionID: WideString; const btSSN: WideString; 
                       const btUserInfo: WideString): Smallint; dispid 29;
    function LoginDataProcess(const btLoginData: WideString): Smallint; dispid 30;
    function GenerateRandomNumber(nRandomNumberLen: SYSINT): Smallint; dispid 31;
    function GenerateSymmetricKey(const btSeedStr: WideString): Smallint; dispid 32;
    function GenerateSymmetricDerivedKey(const btPwd: WideString): Smallint; dispid 33;
    function CertificateValidation(const btCert: WideString): Smallint; dispid 34;
    function GetCertificatePropertyFromID(const btCert: WideString; nPropertyID: SYSINT): Smallint; dispid 35;
    function VerifyVID(const btSSN: WideString): Smallint; dispid 36;
    function GetCertificate(nCertType: SYSINT; nCertOutPutType: SYSINT): Smallint; dispid 37;
    function SelectCertificate(nBaseStorageType: SYSINT; nSelectType: SYSINT; 
                               const btUserInfo: WideString): Smallint; dispid 38;
    function GetDataFromLDAP(const btURL: WideString; nDataType: SYSINT): Smallint; dispid 39;
    function SetConfig(const btSiteName: WideString; const btLDAPInfo: WideString; 
                       const btCTLInfo: WideString; const btInitPolicies: WideString; 
                       nIncludeCertPath: SYSINT; nIncludeSigningTime: SYSINT; nIncludeCRL: SYSINT; 
                       nIncludeContent: SYSINT; nCRLCheckOption: SYSINT; nARLCheckOption: SYSINT): Smallint; dispid 40;
    property OutDataNum: Integer readonly dispid 41;
    function AddSignInSignedFile(const btSignedFile: WideString; const btAddedSignedFile: WideString): Smallint; dispid 42;
    function ClearMemory: Smallint; dispid 43;
    function LoadCertificate(nType: SYSINT; const btSignCert: WideString; 
                             const btSignKey: WideString; const btKMCert: WideString; 
                             const btKMKey: WideString; const btPassword: WideString): Smallint; dispid 44;
    function CloseAPI: Integer; dispid 45;
    function GetLastErrMsg: WideString; dispid 46;
    function GetSerialNumberFromCert(const btCert: WideString): Integer; dispid 47;
    function GetSubjectDNFromCert(const btCert: WideString): WideString; dispid 48;
    function GetUserKMCert: WideString; dispid 49;
    function GetUserSignCert: WideString; dispid 50;
    function GetUserKMKey(const btPassword: WideString): WideString; dispid 51;
    function GetUserSignKey(const btPassword: WideString): WideString; dispid 52;
    function ChangeKeyFilePassword(const btSignKeyFilePath: WideString; 
                                   const btKMKeyFilePath: WideString; 
                                   const btOldPassword: WideString; const btNewPassword: WideString): Smallint; dispid 53;
    function LoadUserKeyCert(const btSignCert: WideString; const btSignKey: WideString; 
                             const btKMCert: WideString; const btKMKey: WideString; 
                             const btPassword: WideString): Integer; dispid 54;
    function LoadUserKeyCertDlg(nUseKMCert: SYSINT): Integer; dispid 55;
    function LoadUserKeyCertFile(const btSignCert: WideString; const btSignKey: WideString; 
                                 const btKMCert: WideString; const btKMKey: WideString; 
                                 const btPassword: WideString): Integer; dispid 56;
    function SetCertPolicy(const btPolicies: WideString): Integer; dispid 57;
    function UnloadUserKeyCert: Integer; dispid 58;
    function ValidateCert(const btCert: WideString): Integer; dispid 59;
    function GenSignature(nDataType: SYSINT; const btData: WideString): Smallint; dispid 60;
    function VerifySignature(nDataType: SYSINT; const btData: WideString; 
                             const btSignature: WideString; const btCert: WideString): Smallint; dispid 61;
    function GetPrivateKey(nKeyType: SYSINT; nKeyOutPutType: SYSINT; const btPwd: WideString): Smallint; dispid 62;
    function GetLoginData(nLoginDataType: SYSINT): Smallint; dispid 63;
    function GetSymmetricIV: Smallint; dispid 64;
    function GetSymmetricKey: Smallint; dispid 65;
    function ClearMemory2(nDataType: SYSINT): Smallint; dispid 66;
    function GetRandomInKey: Smallint; dispid 67;
    function SetSymmetricKeyAndIV(const btSymmetricKey: WideString; const btSymmetricIV: WideString): Smallint; dispid 68;
    function ChangeKeyFilePassword2(const btSignKeyFilePath: WideString; 
                                    const btKMKeyFilePath: WideString; 
                                    const btOldPassword: WideString; const btNewPassword: WideString): Smallint; dispid 69;
    function VerifyVID2(const btCert: WideString; const btSSN: WideString; 
                        const btRandom: WideString): Smallint; dispid 70;
    function SetEachConfig(const bstrConfigType: WideString; const bstrConfigValue: WideString): Smallint; dispid 71;
    function setCACertsURL(const btURL: WideString): Smallint; dispid 72;
    function CertificateValidationByOCSP(certtype: Smallint; const cert: WideString; 
                                         version: Smallint; hashalgo: Smallint; isSign: Integer): Smallint; dispid 73;
    function TSAService(const serviceType: WideString; const url: WideString; datatype: Smallint; 
                        const data: WideString; hashalgo: Smallint): Smallint; dispid 74;
    function DVCSService(const serviceType: WideString; const url: WideString; datatype: Smallint; 
                         const data: WideString; hashalgo: Smallint): Smallint; dispid 75;
    function AddSignInSignedData(const btSignedData: WideString): Smallint; dispid 76;
    function GetVersion: WideString; dispid 77;
    function MakeOctetList(const bstrData: WideString; nDataType: SYSINT; 
                           const bstrOctetList: WideString): Smallint; dispid 78;
    function GetSelectedCertInfo(nInfoType: SYSINT): Smallint; dispid 79;
    function SetStorageConfig(nStorageType: SYSINT; nIsDisable: SYSINT): Smallint; dispid 80;
    function GetDataFromFile(nFileType: SYSINT; nOutPutType: SYSINT; const bstrFilePath: WideString): Smallint; dispid 81;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TTSToolkit
// Help String      : TSToolkit Class
// Default Interface: ITSToolkit
// Def. Intf. DISP? : No
// Event   Interface: _ITSToolkitEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TTSToolkit = class(TOleControl)
  private
    FIntf: ITSToolkit;
    function  GetControlInterface: ITSToolkit;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    function Base64EncodeData(const btData: WideString): Smallint;
    function Base64EncodeFile(const btDataFile: WideString; const btEncodedDataFile: WideString): Smallint;
    function Base64DecodeData(const btEncodedData: WideString): Smallint;
    function Base64DecodeFile(const btEncodedDataFile: WideString; const btDataFile: WideString): Smallint;
    function HashData(nHashAlgorithm: SYSINT; const btHash: WideString): Smallint;
    function HashFile(nHashAlgorithm: SYSINT; const btDataFile: WideString): Smallint;
    function SetEncryptionAlgoAndMode(nEncryptionAlgorithm: SYSINT; nEncryptionMode: SYSINT): Smallint;
    function GetEncryptionAlgorithm: Smallint;
    function GetEncryptionMode: Smallint;
    function GetErrorMessage: WideString;
    function EncryptData(const btData: WideString; const btEncryptionKey: WideString): Smallint;
    function EncryptFile(const btDataFile: WideString; const btEncryptedDataFile: WideString; 
                         const btEncryptionKey: WideString): Smallint;
    function DecryptData(const btEncryptedData: WideString; const btEncryptionKey: WideString): Smallint;
    function DecryptFile(const btEncryptedDataFile: WideString; const btDataFile: WideString; 
                         const btEncryptionKey: WideString): Smallint;
    function SignData(const btData: WideString): Smallint;
    function SignFile(const btDataFile: WideString; const btSignedDataFile: WideString): Smallint;
    function VerifySignedData(const btSignedData: WideString; const btContentData: WideString): Smallint;
    function VerifySignedFile(const btSignedDataFile: WideString; const btDataFile: WideString; 
                              const btContentFile: WideString): Smallint;
    function GetSignerCount: Smallint;
    function GetSignerDN(nSignerIndex: SYSINT): Smallint;
    function GetSignerCert(nSignerIndex: SYSINT): Smallint;
    function GetSigningTime(nSignerIndex: SYSINT): Smallint;
    function SetPeerCertificate(const btCert: WideString): Smallint;
    function EnvelopData(const btData: WideString): Smallint;
    function EnvelopFile(const btDataFile: WideString; const btEnvelopedDataFile: WideString): Smallint;
    function DecryptEnvelopedData(const btEnvelopedData: WideString): Smallint;
    function DecryptEnvelopedFile(const btEnvelopedDataFile: WideString; 
                                  const btDataFile: WideString): Smallint;
    function LoginData(const btSessionID: WideString; const btSSN: WideString; 
                       const btUserInfo: WideString): Smallint;
    function LoginDataProcess(const btLoginData: WideString): Smallint;
    function GenerateRandomNumber(nRandomNumberLen: SYSINT): Smallint;
    function GenerateSymmetricKey(const btSeedStr: WideString): Smallint;
    function GenerateSymmetricDerivedKey(const btPwd: WideString): Smallint;
    function CertificateValidation(const btCert: WideString): Smallint;
    function GetCertificatePropertyFromID(const btCert: WideString; nPropertyID: SYSINT): Smallint;
    function VerifyVID(const btSSN: WideString): Smallint;
    function GetCertificate(nCertType: SYSINT; nCertOutPutType: SYSINT): Smallint;
    function SelectCertificate(nBaseStorageType: SYSINT; nSelectType: SYSINT; 
                               const btUserInfo: WideString): Smallint;
    function GetDataFromLDAP(const btURL: WideString; nDataType: SYSINT): Smallint;
    function SetConfig(const btSiteName: WideString; const btLDAPInfo: WideString; 
                       const btCTLInfo: WideString; const btInitPolicies: WideString; 
                       nIncludeCertPath: SYSINT; nIncludeSigningTime: SYSINT; nIncludeCRL: SYSINT; 
                       nIncludeContent: SYSINT; nCRLCheckOption: SYSINT; nARLCheckOption: SYSINT): Smallint;
    function AddSignInSignedFile(const btSignedFile: WideString; const btAddedSignedFile: WideString): Smallint;
    function ClearMemory: Smallint;
    function LoadCertificate(nType: SYSINT; const btSignCert: WideString; 
                             const btSignKey: WideString; const btKMCert: WideString; 
                             const btKMKey: WideString; const btPassword: WideString): Smallint;
    function CloseAPI: Integer;
    function GetLastErrMsg: WideString;
    function GetSerialNumberFromCert(const btCert: WideString): Integer;
    function GetSubjectDNFromCert(const btCert: WideString): WideString;
    function GetUserKMCert: WideString;
    function GetUserSignCert: WideString;
    function GetUserKMKey(const btPassword: WideString): WideString;
    function GetUserSignKey(const btPassword: WideString): WideString;
    function ChangeKeyFilePassword(const btSignKeyFilePath: WideString; 
                                   const btKMKeyFilePath: WideString; 
                                   const btOldPassword: WideString; const btNewPassword: WideString): Smallint;
    function LoadUserKeyCert(const btSignCert: WideString; const btSignKey: WideString; 
                             const btKMCert: WideString; const btKMKey: WideString; 
                             const btPassword: WideString): Integer;
    function LoadUserKeyCertDlg(nUseKMCert: SYSINT): Integer;
    function LoadUserKeyCertFile(const btSignCert: WideString; const btSignKey: WideString; 
                                 const btKMCert: WideString; const btKMKey: WideString; 
                                 const btPassword: WideString): Integer;
    function SetCertPolicy(const btPolicies: WideString): Integer;
    function UnloadUserKeyCert: Integer;
    function ValidateCert(const btCert: WideString): Integer;
    function GenSignature(nDataType: SYSINT; const btData: WideString): Smallint;
    function VerifySignature(nDataType: SYSINT; const btData: WideString; 
                             const btSignature: WideString; const btCert: WideString): Smallint;
    function GetPrivateKey(nKeyType: SYSINT; nKeyOutPutType: SYSINT; const btPwd: WideString): Smallint;
    function GetLoginData(nLoginDataType: SYSINT): Smallint;
    function GetSymmetricIV: Smallint;
    function GetSymmetricKey: Smallint;
    function ClearMemory2(nDataType: SYSINT): Smallint;
    function GetRandomInKey: Smallint;
    function SetSymmetricKeyAndIV(const btSymmetricKey: WideString; const btSymmetricIV: WideString): Smallint;
    function ChangeKeyFilePassword2(const btSignKeyFilePath: WideString; 
                                    const btKMKeyFilePath: WideString; 
                                    const btOldPassword: WideString; const btNewPassword: WideString): Smallint;
    function VerifyVID2(const btCert: WideString; const btSSN: WideString; 
                        const btRandom: WideString): Smallint;
    function SetEachConfig(const bstrConfigType: WideString; const bstrConfigValue: WideString): Smallint;
    function setCACertsURL(const btURL: WideString): Smallint;
    function CertificateValidationByOCSP(certtype: Smallint; const cert: WideString; 
                                         version: Smallint; hashalgo: Smallint; isSign: Integer): Smallint;
    function TSAService(const serviceType: WideString; const url: WideString; datatype: Smallint; 
                        const data: WideString; hashalgo: Smallint): Smallint;
    function DVCSService(const serviceType: WideString; const url: WideString; datatype: Smallint; 
                         const data: WideString; hashalgo: Smallint): Smallint;
    function AddSignInSignedData(const btSignedData: WideString): Smallint;
    function GetVersion: WideString;
    function MakeOctetList(const bstrData: WideString; nDataType: SYSINT; 
                           const bstrOctetList: WideString): Smallint;
    function GetSelectedCertInfo(nInfoType: SYSINT): Smallint;
    function SetStorageConfig(nStorageType: SYSINT; nIsDisable: SYSINT): Smallint;
    function GetDataFromFile(nFileType: SYSINT; nOutPutType: SYSINT; const bstrFilePath: WideString): Smallint;
    property  ControlInterface: ITSToolkit read GetControlInterface;
    property  DefaultInterface: ITSToolkit read GetControlInterface;
    property OutData: WideString index 1 read GetWideStringProp;
    property OutDataNum: Integer index 41 read GetIntegerProp;
  published
    property Anchors;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

procedure TTSToolkit.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{55D9860A-AB9C-44A1-BB74-75AF7F805333}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TTSToolkit.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as ITSToolkit;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TTSToolkit.GetControlInterface: ITSToolkit;
begin
  CreateControl;
  Result := FIntf;
end;

function TTSToolkit.Base64EncodeData(const btData: WideString): Smallint;
begin
  Result := DefaultInterface.Base64EncodeData(btData);
end;

function TTSToolkit.Base64EncodeFile(const btDataFile: WideString; 
                                     const btEncodedDataFile: WideString): Smallint;
begin
  Result := DefaultInterface.Base64EncodeFile(btDataFile, btEncodedDataFile);
end;

function TTSToolkit.Base64DecodeData(const btEncodedData: WideString): Smallint;
begin
  Result := DefaultInterface.Base64DecodeData(btEncodedData);
end;

function TTSToolkit.Base64DecodeFile(const btEncodedDataFile: WideString; 
                                     const btDataFile: WideString): Smallint;
begin
  Result := DefaultInterface.Base64DecodeFile(btEncodedDataFile, btDataFile);
end;

function TTSToolkit.HashData(nHashAlgorithm: SYSINT; const btHash: WideString): Smallint;
begin
  Result := DefaultInterface.HashData(nHashAlgorithm, btHash);
end;

function TTSToolkit.HashFile(nHashAlgorithm: SYSINT; const btDataFile: WideString): Smallint;
begin
  Result := DefaultInterface.HashFile(nHashAlgorithm, btDataFile);
end;

function TTSToolkit.SetEncryptionAlgoAndMode(nEncryptionAlgorithm: SYSINT; nEncryptionMode: SYSINT): Smallint;
begin
  Result := DefaultInterface.SetEncryptionAlgoAndMode(nEncryptionAlgorithm, nEncryptionMode);
end;

function TTSToolkit.GetEncryptionAlgorithm: Smallint;
begin
  Result := DefaultInterface.GetEncryptionAlgorithm;
end;

function TTSToolkit.GetEncryptionMode: Smallint;
begin
  Result := DefaultInterface.GetEncryptionMode;
end;

function TTSToolkit.GetErrorMessage: WideString;
begin
  Result := DefaultInterface.GetErrorMessage;
end;

function TTSToolkit.EncryptData(const btData: WideString; const btEncryptionKey: WideString): Smallint;
begin
  Result := DefaultInterface.EncryptData(btData, btEncryptionKey);
end;

function TTSToolkit.EncryptFile(const btDataFile: WideString; 
                                const btEncryptedDataFile: WideString; 
                                const btEncryptionKey: WideString): Smallint;
begin
  Result := DefaultInterface.EncryptFile(btDataFile, btEncryptedDataFile, btEncryptionKey);
end;

function TTSToolkit.DecryptData(const btEncryptedData: WideString; const btEncryptionKey: WideString): Smallint;
begin
  Result := DefaultInterface.DecryptData(btEncryptedData, btEncryptionKey);
end;

function TTSToolkit.DecryptFile(const btEncryptedDataFile: WideString; 
                                const btDataFile: WideString; const btEncryptionKey: WideString): Smallint;
begin
  Result := DefaultInterface.DecryptFile(btEncryptedDataFile, btDataFile, btEncryptionKey);
end;

function TTSToolkit.SignData(const btData: WideString): Smallint;
begin
  Result := DefaultInterface.SignData(btData);
end;

function TTSToolkit.SignFile(const btDataFile: WideString; const btSignedDataFile: WideString): Smallint;
begin
  Result := DefaultInterface.SignFile(btDataFile, btSignedDataFile);
end;

function TTSToolkit.VerifySignedData(const btSignedData: WideString; const btContentData: WideString): Smallint;
begin
  Result := DefaultInterface.VerifySignedData(btSignedData, btContentData);
end;

function TTSToolkit.VerifySignedFile(const btSignedDataFile: WideString; 
                                     const btDataFile: WideString; const btContentFile: WideString): Smallint;
begin
  Result := DefaultInterface.VerifySignedFile(btSignedDataFile, btDataFile, btContentFile);
end;

function TTSToolkit.GetSignerCount: Smallint;
begin
  Result := DefaultInterface.GetSignerCount;
end;

function TTSToolkit.GetSignerDN(nSignerIndex: SYSINT): Smallint;
begin
  Result := DefaultInterface.GetSignerDN(nSignerIndex);
end;

function TTSToolkit.GetSignerCert(nSignerIndex: SYSINT): Smallint;
begin
  Result := DefaultInterface.GetSignerCert(nSignerIndex);
end;

function TTSToolkit.GetSigningTime(nSignerIndex: SYSINT): Smallint;
begin
  Result := DefaultInterface.GetSigningTime(nSignerIndex);
end;

function TTSToolkit.SetPeerCertificate(const btCert: WideString): Smallint;
begin
  Result := DefaultInterface.SetPeerCertificate(btCert);
end;

function TTSToolkit.EnvelopData(const btData: WideString): Smallint;
begin
  Result := DefaultInterface.EnvelopData(btData);
end;

function TTSToolkit.EnvelopFile(const btDataFile: WideString; const btEnvelopedDataFile: WideString): Smallint;
begin
  Result := DefaultInterface.EnvelopFile(btDataFile, btEnvelopedDataFile);
end;

function TTSToolkit.DecryptEnvelopedData(const btEnvelopedData: WideString): Smallint;
begin
  Result := DefaultInterface.DecryptEnvelopedData(btEnvelopedData);
end;

function TTSToolkit.DecryptEnvelopedFile(const btEnvelopedDataFile: WideString; 
                                         const btDataFile: WideString): Smallint;
begin
  Result := DefaultInterface.DecryptEnvelopedFile(btEnvelopedDataFile, btDataFile);
end;

function TTSToolkit.LoginData(const btSessionID: WideString; const btSSN: WideString; 
                              const btUserInfo: WideString): Smallint;
begin
  Result := DefaultInterface.LoginData(btSessionID, btSSN, btUserInfo);
end;

function TTSToolkit.LoginDataProcess(const btLoginData: WideString): Smallint;
begin
  Result := DefaultInterface.LoginDataProcess(btLoginData);
end;

function TTSToolkit.GenerateRandomNumber(nRandomNumberLen: SYSINT): Smallint;
begin
  Result := DefaultInterface.GenerateRandomNumber(nRandomNumberLen);
end;

function TTSToolkit.GenerateSymmetricKey(const btSeedStr: WideString): Smallint;
begin
  Result := DefaultInterface.GenerateSymmetricKey(btSeedStr);
end;

function TTSToolkit.GenerateSymmetricDerivedKey(const btPwd: WideString): Smallint;
begin
  Result := DefaultInterface.GenerateSymmetricDerivedKey(btPwd);
end;

function TTSToolkit.CertificateValidation(const btCert: WideString): Smallint;
begin
  Result := DefaultInterface.CertificateValidation(btCert);
end;

function TTSToolkit.GetCertificatePropertyFromID(const btCert: WideString; nPropertyID: SYSINT): Smallint;
begin
  Result := DefaultInterface.GetCertificatePropertyFromID(btCert, nPropertyID);
end;

function TTSToolkit.VerifyVID(const btSSN: WideString): Smallint;
begin
  Result := DefaultInterface.VerifyVID(btSSN);
end;

function TTSToolkit.GetCertificate(nCertType: SYSINT; nCertOutPutType: SYSINT): Smallint;
begin
  Result := DefaultInterface.GetCertificate(nCertType, nCertOutPutType);
end;

function TTSToolkit.SelectCertificate(nBaseStorageType: SYSINT; nSelectType: SYSINT; 
                                      const btUserInfo: WideString): Smallint;
begin
  Result := DefaultInterface.SelectCertificate(nBaseStorageType, nSelectType, btUserInfo);
end;

function TTSToolkit.GetDataFromLDAP(const btURL: WideString; nDataType: SYSINT): Smallint;
begin
  Result := DefaultInterface.GetDataFromLDAP(btURL, nDataType);
end;

function TTSToolkit.SetConfig(const btSiteName: WideString; const btLDAPInfo: WideString; 
                              const btCTLInfo: WideString; const btInitPolicies: WideString; 
                              nIncludeCertPath: SYSINT; nIncludeSigningTime: SYSINT; 
                              nIncludeCRL: SYSINT; nIncludeContent: SYSINT; 
                              nCRLCheckOption: SYSINT; nARLCheckOption: SYSINT): Smallint;
begin
  Result := DefaultInterface.SetConfig(btSiteName, btLDAPInfo, btCTLInfo, btInitPolicies, 
                                       nIncludeCertPath, nIncludeSigningTime, nIncludeCRL, 
                                       nIncludeContent, nCRLCheckOption, nARLCheckOption);
end;

function TTSToolkit.AddSignInSignedFile(const btSignedFile: WideString; 
                                        const btAddedSignedFile: WideString): Smallint;
begin
  Result := DefaultInterface.AddSignInSignedFile(btSignedFile, btAddedSignedFile);
end;

function TTSToolkit.ClearMemory: Smallint;
begin
  Result := DefaultInterface.ClearMemory;
end;

function TTSToolkit.LoadCertificate(nType: SYSINT; const btSignCert: WideString; 
                                    const btSignKey: WideString; const btKMCert: WideString; 
                                    const btKMKey: WideString; const btPassword: WideString): Smallint;
begin
  Result := DefaultInterface.LoadCertificate(nType, btSignCert, btSignKey, btKMCert, btKMKey, 
                                             btPassword);
end;

function TTSToolkit.CloseAPI: Integer;
begin
  Result := DefaultInterface.CloseAPI;
end;

function TTSToolkit.GetLastErrMsg: WideString;
begin
  Result := DefaultInterface.GetLastErrMsg;
end;

function TTSToolkit.GetSerialNumberFromCert(const btCert: WideString): Integer;
begin
  Result := DefaultInterface.GetSerialNumberFromCert(btCert);
end;

function TTSToolkit.GetSubjectDNFromCert(const btCert: WideString): WideString;
begin
  Result := DefaultInterface.GetSubjectDNFromCert(btCert);
end;

function TTSToolkit.GetUserKMCert: WideString;
begin
  Result := DefaultInterface.GetUserKMCert;
end;

function TTSToolkit.GetUserSignCert: WideString;
begin
  Result := DefaultInterface.GetUserSignCert;
end;

function TTSToolkit.GetUserKMKey(const btPassword: WideString): WideString;
begin
  Result := DefaultInterface.GetUserKMKey(btPassword);
end;

function TTSToolkit.GetUserSignKey(const btPassword: WideString): WideString;
begin
  Result := DefaultInterface.GetUserSignKey(btPassword);
end;

function TTSToolkit.ChangeKeyFilePassword(const btSignKeyFilePath: WideString; 
                                          const btKMKeyFilePath: WideString; 
                                          const btOldPassword: WideString; 
                                          const btNewPassword: WideString): Smallint;
begin
  Result := DefaultInterface.ChangeKeyFilePassword(btSignKeyFilePath, btKMKeyFilePath, 
                                                   btOldPassword, btNewPassword);
end;

function TTSToolkit.LoadUserKeyCert(const btSignCert: WideString; const btSignKey: WideString; 
                                    const btKMCert: WideString; const btKMKey: WideString; 
                                    const btPassword: WideString): Integer;
begin
  Result := DefaultInterface.LoadUserKeyCert(btSignCert, btSignKey, btKMCert, btKMKey, btPassword);
end;

function TTSToolkit.LoadUserKeyCertDlg(nUseKMCert: SYSINT): Integer;
begin
  Result := DefaultInterface.LoadUserKeyCertDlg(nUseKMCert);
end;

function TTSToolkit.LoadUserKeyCertFile(const btSignCert: WideString; const btSignKey: WideString; 
                                        const btKMCert: WideString; const btKMKey: WideString; 
                                        const btPassword: WideString): Integer;
begin
  Result := DefaultInterface.LoadUserKeyCertFile(btSignCert, btSignKey, btKMCert, btKMKey, 
                                                 btPassword);
end;

function TTSToolkit.SetCertPolicy(const btPolicies: WideString): Integer;
begin
  Result := DefaultInterface.SetCertPolicy(btPolicies);
end;

function TTSToolkit.UnloadUserKeyCert: Integer;
begin
  Result := DefaultInterface.UnloadUserKeyCert;
end;

function TTSToolkit.ValidateCert(const btCert: WideString): Integer;
begin
  Result := DefaultInterface.ValidateCert(btCert);
end;

function TTSToolkit.GenSignature(nDataType: SYSINT; const btData: WideString): Smallint;
begin
  Result := DefaultInterface.GenSignature(nDataType, btData);
end;

function TTSToolkit.VerifySignature(nDataType: SYSINT; const btData: WideString; 
                                    const btSignature: WideString; const btCert: WideString): Smallint;
begin
  Result := DefaultInterface.VerifySignature(nDataType, btData, btSignature, btCert);
end;

function TTSToolkit.GetPrivateKey(nKeyType: SYSINT; nKeyOutPutType: SYSINT; const btPwd: WideString): Smallint;
begin
  Result := DefaultInterface.GetPrivateKey(nKeyType, nKeyOutPutType, btPwd);
end;

function TTSToolkit.GetLoginData(nLoginDataType: SYSINT): Smallint;
begin
  Result := DefaultInterface.GetLoginData(nLoginDataType);
end;

function TTSToolkit.GetSymmetricIV: Smallint;
begin
  Result := DefaultInterface.GetSymmetricIV;
end;

function TTSToolkit.GetSymmetricKey: Smallint;
begin
  Result := DefaultInterface.GetSymmetricKey;
end;

function TTSToolkit.ClearMemory2(nDataType: SYSINT): Smallint;
begin
  Result := DefaultInterface.ClearMemory2(nDataType);
end;

function TTSToolkit.GetRandomInKey: Smallint;
begin
  Result := DefaultInterface.GetRandomInKey;
end;

function TTSToolkit.SetSymmetricKeyAndIV(const btSymmetricKey: WideString; 
                                         const btSymmetricIV: WideString): Smallint;
begin
  Result := DefaultInterface.SetSymmetricKeyAndIV(btSymmetricKey, btSymmetricIV);
end;

function TTSToolkit.ChangeKeyFilePassword2(const btSignKeyFilePath: WideString; 
                                           const btKMKeyFilePath: WideString; 
                                           const btOldPassword: WideString; 
                                           const btNewPassword: WideString): Smallint;
begin
  Result := DefaultInterface.ChangeKeyFilePassword2(btSignKeyFilePath, btKMKeyFilePath, 
                                                    btOldPassword, btNewPassword);
end;

function TTSToolkit.VerifyVID2(const btCert: WideString; const btSSN: WideString; 
                               const btRandom: WideString): Smallint;
begin
  Result := DefaultInterface.VerifyVID2(btCert, btSSN, btRandom);
end;

function TTSToolkit.SetEachConfig(const bstrConfigType: WideString; 
                                  const bstrConfigValue: WideString): Smallint;
begin
  Result := DefaultInterface.SetEachConfig(bstrConfigType, bstrConfigValue);
end;

function TTSToolkit.setCACertsURL(const btURL: WideString): Smallint;
begin
  Result := DefaultInterface.setCACertsURL(btURL);
end;

function TTSToolkit.CertificateValidationByOCSP(certtype: Smallint; const cert: WideString; 
                                                version: Smallint; hashalgo: Smallint; 
                                                isSign: Integer): Smallint;
begin
  Result := DefaultInterface.CertificateValidationByOCSP(certtype, cert, version, hashalgo, isSign);
end;

function TTSToolkit.TSAService(const serviceType: WideString; const url: WideString; 
                               datatype: Smallint; const data: WideString; hashalgo: Smallint): Smallint;
begin
  Result := DefaultInterface.TSAService(serviceType, url, datatype, data, hashalgo);
end;

function TTSToolkit.DVCSService(const serviceType: WideString; const url: WideString; 
                                datatype: Smallint; const data: WideString; hashalgo: Smallint): Smallint;
begin
  Result := DefaultInterface.DVCSService(serviceType, url, datatype, data, hashalgo);
end;

function TTSToolkit.AddSignInSignedData(const btSignedData: WideString): Smallint;
begin
  Result := DefaultInterface.AddSignInSignedData(btSignedData);
end;

function TTSToolkit.GetVersion: WideString;
begin
  Result := DefaultInterface.GetVersion;
end;

function TTSToolkit.MakeOctetList(const bstrData: WideString; nDataType: SYSINT; 
                                  const bstrOctetList: WideString): Smallint;
begin
  Result := DefaultInterface.MakeOctetList(bstrData, nDataType, bstrOctetList);
end;

function TTSToolkit.GetSelectedCertInfo(nInfoType: SYSINT): Smallint;
begin
  Result := DefaultInterface.GetSelectedCertInfo(nInfoType);
end;

function TTSToolkit.SetStorageConfig(nStorageType: SYSINT; nIsDisable: SYSINT): Smallint;
begin
  Result := DefaultInterface.SetStorageConfig(nStorageType, nIsDisable);
end;

function TTSToolkit.GetDataFromFile(nFileType: SYSINT; nOutPutType: SYSINT; 
                                    const bstrFilePath: WideString): Smallint;
begin
  Result := DefaultInterface.GetDataFromFile(nFileType, nOutPutType, bstrFilePath);
end;

procedure Register;
begin
  RegisterComponents(dtlOcxPage, [TTSToolkit]);
end;

end.
