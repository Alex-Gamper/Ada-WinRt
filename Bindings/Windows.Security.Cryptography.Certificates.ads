--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.1.0.0                                                     --
--                                                                            --
--    This program is free software: you can redistribute it and / or modify  --
--    it under the terms of the GNU General Public License as published by    --
--    the Free Software Foundation, either version 3 of the License, or       --
--    (at your option) any later version.                                     --
--                                                                            --
--    This program is distributed in the hope that it will be useful,         --
--    but WITHOUT ANY WARRANTY; without even the implied warranty of          --
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           --
--    GNU General Public License for more details.                            --
--                                                                            --
--    You should have received a copy of the GNU General Public License       --
--    along with this program.If not, see < http://www.gnu.org/licenses/>.    --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.Foundation;
with Windows.Foundation.Collections;
limited with Windows.Storage.Streams;
limited with Windows.Networking;
--------------------------------------------------------------------------------
package Windows.Security.Cryptography.Certificates is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type EnrollKeyUsages is (
      None,
      Decryption,
      Signing,
      KeyAgreement,
      All_x
   );
   for EnrollKeyUsages use (
      None => 0,
      Decryption => 1,
      Signing => 2,
      KeyAgreement => 4,
      All_x => 16777215
   );
   for EnrollKeyUsages'Size use 32;
   
   type EnrollKeyUsages_Ptr is access EnrollKeyUsages;
   
   type KeyProtectionLevel is (
      NoConsent,
      ConsentOnly,
      ConsentWithPassword,
      ConsentWithFingerprint
   );
   for KeyProtectionLevel use (
      NoConsent => 0,
      ConsentOnly => 1,
      ConsentWithPassword => 2,
      ConsentWithFingerprint => 3
   );
   for KeyProtectionLevel'Size use 32;
   
   type KeyProtectionLevel_Ptr is access KeyProtectionLevel;
   
   type ExportOption is (
      NotExportable,
      Exportable
   );
   for ExportOption use (
      NotExportable => 0,
      Exportable => 1
   );
   for ExportOption'Size use 32;
   
   type ExportOption_Ptr is access ExportOption;
   
   type KeySize is (
      Invalid,
      Rsa2048,
      Rsa4096
   );
   for KeySize use (
      Invalid => 0,
      Rsa2048 => 2048,
      Rsa4096 => 4096
   );
   for KeySize'Size use 32;
   
   type KeySize_Ptr is access KeySize;
   
   type InstallOptions is (
      None,
      DeleteExpired
   );
   for InstallOptions use (
      None => 0,
      DeleteExpired => 1
   );
   for InstallOptions'Size use 32;
   
   type InstallOptions_Ptr is access InstallOptions;
   
   type CertificateChainPolicy is (
      Base,
      Ssl,
      NTAuthentication,
      MicrosoftRoot
   );
   for CertificateChainPolicy use (
      Base => 0,
      Ssl => 1,
      NTAuthentication => 2,
      MicrosoftRoot => 3
   );
   for CertificateChainPolicy'Size use 32;
   
   type CertificateChainPolicy_Ptr is access CertificateChainPolicy;
   
   type ChainValidationResult is (
      Success,
      Untrusted,
      Revoked,
      Expired,
      IncompleteChain,
      InvalidSignature,
      WrongUsage,
      InvalidName,
      InvalidCertificateAuthorityPolicy,
      BasicConstraintsError,
      UnknownCriticalExtension,
      RevocationInformationMissing,
      RevocationFailure,
      OtherErrors
   );
   for ChainValidationResult use (
      Success => 0,
      Untrusted => 1,
      Revoked => 2,
      Expired => 3,
      IncompleteChain => 4,
      InvalidSignature => 5,
      WrongUsage => 6,
      InvalidName => 7,
      InvalidCertificateAuthorityPolicy => 8,
      BasicConstraintsError => 9,
      UnknownCriticalExtension => 10,
      RevocationInformationMissing => 11,
      RevocationFailure => 12,
      OtherErrors => 13
   );
   for ChainValidationResult'Size use 32;
   
   type ChainValidationResult_Ptr is access ChainValidationResult;
   
   type SignatureValidationResult is (
      Success,
      InvalidParameter,
      BadMessage,
      InvalidSignature,
      OtherErrors
   );
   for SignatureValidationResult use (
      Success => 0,
      InvalidParameter => 1,
      BadMessage => 2,
      InvalidSignature => 3,
      OtherErrors => 4
   );
   for SignatureValidationResult'Size use 32;
   
   type SignatureValidationResult_Ptr is access SignatureValidationResult;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_ICertificateChain_Interface;
   type AsyncOperationCompletedHandler_ICertificateChain is access all AsyncOperationCompletedHandler_ICertificateChain_Interface'Class;
   type AsyncOperationCompletedHandler_ICertificateChain_Ptr is access all AsyncOperationCompletedHandler_ICertificateChain;
   type AsyncOperationCompletedHandler_SignatureValidationResult_Interface;
   type AsyncOperationCompletedHandler_SignatureValidationResult is access all AsyncOperationCompletedHandler_SignatureValidationResult_Interface'Class;
   type AsyncOperationCompletedHandler_SignatureValidationResult_Ptr is access all AsyncOperationCompletedHandler_SignatureValidationResult;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ICertificateExtension_Interface;
   type ICertificateExtension is access all ICertificateExtension_Interface'Class;
   type ICertificateExtension_Ptr is access all ICertificateExtension;
   type ICertificateRequestProperties_Interface;
   type ICertificateRequestProperties is access all ICertificateRequestProperties_Interface'Class;
   type ICertificateRequestProperties_Ptr is access all ICertificateRequestProperties;
   type ICertificateRequestProperties2_Interface;
   type ICertificateRequestProperties2 is access all ICertificateRequestProperties2_Interface'Class;
   type ICertificateRequestProperties2_Ptr is access all ICertificateRequestProperties2;
   type ICertificateRequestProperties3_Interface;
   type ICertificateRequestProperties3 is access all ICertificateRequestProperties3_Interface'Class;
   type ICertificateRequestProperties3_Ptr is access all ICertificateRequestProperties3;
   type ICertificateRequestProperties4_Interface;
   type ICertificateRequestProperties4 is access all ICertificateRequestProperties4_Interface'Class;
   type ICertificateRequestProperties4_Ptr is access all ICertificateRequestProperties4;
   type ICertificateEnrollmentManagerStatics_Interface;
   type ICertificateEnrollmentManagerStatics is access all ICertificateEnrollmentManagerStatics_Interface'Class;
   type ICertificateEnrollmentManagerStatics_Ptr is access all ICertificateEnrollmentManagerStatics;
   type ICertificateEnrollmentManagerStatics2_Interface;
   type ICertificateEnrollmentManagerStatics2 is access all ICertificateEnrollmentManagerStatics2_Interface'Class;
   type ICertificateEnrollmentManagerStatics2_Ptr is access all ICertificateEnrollmentManagerStatics2;
   type ICertificateEnrollmentManagerStatics3_Interface;
   type ICertificateEnrollmentManagerStatics3 is access all ICertificateEnrollmentManagerStatics3_Interface'Class;
   type ICertificateEnrollmentManagerStatics3_Ptr is access all ICertificateEnrollmentManagerStatics3;
   type IKeyAttestationHelperStatics_Interface;
   type IKeyAttestationHelperStatics is access all IKeyAttestationHelperStatics_Interface'Class;
   type IKeyAttestationHelperStatics_Ptr is access all IKeyAttestationHelperStatics;
   type IKeyAttestationHelperStatics2_Interface;
   type IKeyAttestationHelperStatics2 is access all IKeyAttestationHelperStatics2_Interface'Class;
   type IKeyAttestationHelperStatics2_Ptr is access all IKeyAttestationHelperStatics2;
   type ICertificateStoresStatics_Interface;
   type ICertificateStoresStatics is access all ICertificateStoresStatics_Interface'Class;
   type ICertificateStoresStatics_Ptr is access all ICertificateStoresStatics;
   type ICertificateStoresStatics2_Interface;
   type ICertificateStoresStatics2 is access all ICertificateStoresStatics2_Interface'Class;
   type ICertificateStoresStatics2_Ptr is access all ICertificateStoresStatics2;
   type IUserCertificateEnrollmentManager_Interface;
   type IUserCertificateEnrollmentManager is access all IUserCertificateEnrollmentManager_Interface'Class;
   type IUserCertificateEnrollmentManager_Ptr is access all IUserCertificateEnrollmentManager;
   type IUserCertificateEnrollmentManager2_Interface;
   type IUserCertificateEnrollmentManager2 is access all IUserCertificateEnrollmentManager2_Interface'Class;
   type IUserCertificateEnrollmentManager2_Ptr is access all IUserCertificateEnrollmentManager2;
   type ICertificateStore_Interface;
   type ICertificateStore is access all ICertificateStore_Interface'Class;
   type ICertificateStore_Ptr is access all ICertificateStore;
   type ICertificateStore2_Interface;
   type ICertificateStore2 is access all ICertificateStore2_Interface'Class;
   type ICertificateStore2_Ptr is access all ICertificateStore2;
   type IUserCertificateStore_Interface;
   type IUserCertificateStore is access all IUserCertificateStore_Interface'Class;
   type IUserCertificateStore_Ptr is access all IUserCertificateStore;
   type IStandardCertificateStoreNamesStatics_Interface;
   type IStandardCertificateStoreNamesStatics is access all IStandardCertificateStoreNamesStatics_Interface'Class;
   type IStandardCertificateStoreNamesStatics_Ptr is access all IStandardCertificateStoreNamesStatics;
   type IKeyAlgorithmNamesStatics_Interface;
   type IKeyAlgorithmNamesStatics is access all IKeyAlgorithmNamesStatics_Interface'Class;
   type IKeyAlgorithmNamesStatics_Ptr is access all IKeyAlgorithmNamesStatics;
   type IKeyAlgorithmNamesStatics2_Interface;
   type IKeyAlgorithmNamesStatics2 is access all IKeyAlgorithmNamesStatics2_Interface'Class;
   type IKeyAlgorithmNamesStatics2_Ptr is access all IKeyAlgorithmNamesStatics2;
   type IKeyStorageProviderNamesStatics_Interface;
   type IKeyStorageProviderNamesStatics is access all IKeyStorageProviderNamesStatics_Interface'Class;
   type IKeyStorageProviderNamesStatics_Ptr is access all IKeyStorageProviderNamesStatics;
   type IKeyStorageProviderNamesStatics2_Interface;
   type IKeyStorageProviderNamesStatics2 is access all IKeyStorageProviderNamesStatics2_Interface'Class;
   type IKeyStorageProviderNamesStatics2_Ptr is access all IKeyStorageProviderNamesStatics2;
   type IChainBuildingParameters_Interface;
   type IChainBuildingParameters is access all IChainBuildingParameters_Interface'Class;
   type IChainBuildingParameters_Ptr is access all IChainBuildingParameters;
   type IChainValidationParameters_Interface;
   type IChainValidationParameters is access all IChainValidationParameters_Interface'Class;
   type IChainValidationParameters_Ptr is access all IChainValidationParameters;
   type ICertificateQuery_Interface;
   type ICertificateQuery is access all ICertificateQuery_Interface'Class;
   type ICertificateQuery_Ptr is access all ICertificateQuery;
   type ICertificateQuery2_Interface;
   type ICertificateQuery2 is access all ICertificateQuery2_Interface'Class;
   type ICertificateQuery2_Ptr is access all ICertificateQuery2;
   type ICertificateChain_Interface;
   type ICertificateChain is access all ICertificateChain_Interface'Class;
   type ICertificateChain_Ptr is access all ICertificateChain;
   type ICertificate_Interface;
   type ICertificate is access all ICertificate_Interface'Class;
   type ICertificate_Ptr is access all ICertificate;
   type ICertificate2_Interface;
   type ICertificate2 is access all ICertificate2_Interface'Class;
   type ICertificate2_Ptr is access all ICertificate2;
   type ICertificate3_Interface;
   type ICertificate3 is access all ICertificate3_Interface'Class;
   type ICertificate3_Ptr is access all ICertificate3;
   type ICertificateFactory_Interface;
   type ICertificateFactory is access all ICertificateFactory_Interface'Class;
   type ICertificateFactory_Ptr is access all ICertificateFactory;
   type ICmsTimestampInfo_Interface;
   type ICmsTimestampInfo is access all ICmsTimestampInfo_Interface'Class;
   type ICmsTimestampInfo_Ptr is access all ICmsTimestampInfo;
   type ICmsSignerInfo_Interface;
   type ICmsSignerInfo is access all ICmsSignerInfo_Interface'Class;
   type ICmsSignerInfo_Ptr is access all ICmsSignerInfo;
   type ISubjectAlternativeNameInfo_Interface;
   type ISubjectAlternativeNameInfo is access all ISubjectAlternativeNameInfo_Interface'Class;
   type ISubjectAlternativeNameInfo_Ptr is access all ISubjectAlternativeNameInfo;
   type ISubjectAlternativeNameInfo2_Interface;
   type ISubjectAlternativeNameInfo2 is access all ISubjectAlternativeNameInfo2_Interface'Class;
   type ISubjectAlternativeNameInfo2_Ptr is access all ISubjectAlternativeNameInfo2;
   type IPfxImportParameters_Interface;
   type IPfxImportParameters is access all IPfxImportParameters_Interface'Class;
   type IPfxImportParameters_Ptr is access all IPfxImportParameters;
   type ICertificateKeyUsages_Interface;
   type ICertificateKeyUsages is access all ICertificateKeyUsages_Interface'Class;
   type ICertificateKeyUsages_Ptr is access all ICertificateKeyUsages;
   type ICmsAttachedSignature_Interface;
   type ICmsAttachedSignature is access all ICmsAttachedSignature_Interface'Class;
   type ICmsAttachedSignature_Ptr is access all ICmsAttachedSignature;
   type ICmsAttachedSignatureFactory_Interface;
   type ICmsAttachedSignatureFactory is access all ICmsAttachedSignatureFactory_Interface'Class;
   type ICmsAttachedSignatureFactory_Ptr is access all ICmsAttachedSignatureFactory;
   type ICmsAttachedSignatureStatics_Interface;
   type ICmsAttachedSignatureStatics is access all ICmsAttachedSignatureStatics_Interface'Class;
   type ICmsAttachedSignatureStatics_Ptr is access all ICmsAttachedSignatureStatics;
   type ICmsDetachedSignature_Interface;
   type ICmsDetachedSignature is access all ICmsDetachedSignature_Interface'Class;
   type ICmsDetachedSignature_Ptr is access all ICmsDetachedSignature;
   type ICmsDetachedSignatureFactory_Interface;
   type ICmsDetachedSignatureFactory is access all ICmsDetachedSignatureFactory_Interface'Class;
   type ICmsDetachedSignatureFactory_Ptr is access all ICmsDetachedSignatureFactory;
   type ICmsDetachedSignatureStatics_Interface;
   type ICmsDetachedSignatureStatics is access all ICmsDetachedSignatureStatics_Interface'Class;
   type ICmsDetachedSignatureStatics_Ptr is access all ICmsDetachedSignatureStatics;
   type IIterator_ICertificateExtension_Interface;
   type IIterator_ICertificateExtension is access all IIterator_ICertificateExtension_Interface'Class;
   type IIterator_ICertificateExtension_Ptr is access all IIterator_ICertificateExtension;
   type IIterable_ICertificateExtension_Interface;
   type IIterable_ICertificateExtension is access all IIterable_ICertificateExtension_Interface'Class;
   type IIterable_ICertificateExtension_Ptr is access all IIterable_ICertificateExtension;
   type IVectorView_ICertificateExtension_Interface;
   type IVectorView_ICertificateExtension is access all IVectorView_ICertificateExtension_Interface'Class;
   type IVectorView_ICertificateExtension_Ptr is access all IVectorView_ICertificateExtension;
   type IVector_ICertificateExtension_Interface;
   type IVector_ICertificateExtension is access all IVector_ICertificateExtension_Interface'Class;
   type IVector_ICertificateExtension_Ptr is access all IVector_ICertificateExtension;
   type IIterator_ICertificate_Interface;
   type IIterator_ICertificate is access all IIterator_ICertificate_Interface'Class;
   type IIterator_ICertificate_Ptr is access all IIterator_ICertificate;
   type IIterable_ICertificate_Interface;
   type IIterable_ICertificate is access all IIterable_ICertificate_Interface'Class;
   type IIterable_ICertificate_Ptr is access all IIterable_ICertificate;
   type IVectorView_ICertificate_Interface;
   type IVectorView_ICertificate is access all IVectorView_ICertificate_Interface'Class;
   type IVectorView_ICertificate_Ptr is access all IVectorView_ICertificate;
   type IVector_ICertificate_Interface;
   type IVector_ICertificate is access all IVector_ICertificate_Interface'Class;
   type IVector_ICertificate_Ptr is access all IVector_ICertificate;
   type IAsyncOperation_ICertificateChain_Interface;
   type IAsyncOperation_ICertificateChain is access all IAsyncOperation_ICertificateChain_Interface'Class;
   type IAsyncOperation_ICertificateChain_Ptr is access all IAsyncOperation_ICertificateChain;
   type IIterator_ICmsSignerInfo_Interface;
   type IIterator_ICmsSignerInfo is access all IIterator_ICmsSignerInfo_Interface'Class;
   type IIterator_ICmsSignerInfo_Ptr is access all IIterator_ICmsSignerInfo;
   type IIterable_ICmsSignerInfo_Interface;
   type IIterable_ICmsSignerInfo is access all IIterable_ICmsSignerInfo_Interface'Class;
   type IIterable_ICmsSignerInfo_Ptr is access all IIterable_ICmsSignerInfo;
   type IVectorView_ICmsSignerInfo_Interface;
   type IVectorView_ICmsSignerInfo is access all IVectorView_ICmsSignerInfo_Interface'Class;
   type IVectorView_ICmsSignerInfo_Ptr is access all IVectorView_ICmsSignerInfo;
   type IAsyncOperation_SignatureValidationResult_Interface;
   type IAsyncOperation_SignatureValidationResult is access all IAsyncOperation_SignatureValidationResult_Interface'Class;
   type IAsyncOperation_SignatureValidationResult_Ptr is access all IAsyncOperation_SignatureValidationResult;
   type IIterator_ChainValidationResult_Interface;
   type IIterator_ChainValidationResult is access all IIterator_ChainValidationResult_Interface'Class;
   type IIterator_ChainValidationResult_Ptr is access all IIterator_ChainValidationResult;
   type IIterable_ChainValidationResult_Interface;
   type IIterable_ChainValidationResult is access all IIterable_ChainValidationResult_Interface'Class;
   type IIterable_ChainValidationResult_Ptr is access all IIterable_ChainValidationResult;
   type IVectorView_ChainValidationResult_Interface;
   type IVectorView_ChainValidationResult is access all IVectorView_ChainValidationResult_Interface'Class;
   type IVectorView_ChainValidationResult_Ptr is access all IVectorView_ChainValidationResult;
   type IVector_ChainValidationResult_Interface;
   type IVector_ChainValidationResult is access all IVector_ChainValidationResult_Interface'Class;
   type IVector_ChainValidationResult_Ptr is access all IVector_ChainValidationResult;
   
   ------------------------------------------------------------------------
   -- generic packages/types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- generic instantiations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ICertificateExtension : aliased constant Windows.IID := (2228160086, 43494, 17741, (142, 69, 46, 167, 196, 188, 213, 59 ));
   
   type ICertificateExtension_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ObjectId
   (
      This       : access ICertificateExtension_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ObjectId
   (
      This       : access ICertificateExtension_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCritical
   (
      This       : access ICertificateExtension_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsCritical
   (
      This       : access ICertificateExtension_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function EncodeValue
   (
      This       : access ICertificateExtension_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access ICertificateExtension_Interface
      ; RetVal : access UInt8_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   function put_Value
   (
      This       : access ICertificateExtension_Interface
      ; value : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICertificateRequestProperties : aliased constant Windows.IID := (1216251126, 38114, 19918, (136, 51, 26, 112, 10, 55, 162, 154 ));
   
   type ICertificateRequestProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Subject
   (
      This       : access ICertificateRequestProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Subject
   (
      This       : access ICertificateRequestProperties_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyAlgorithmName
   (
      This       : access ICertificateRequestProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_KeyAlgorithmName
   (
      This       : access ICertificateRequestProperties_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_KeySize
   (
      This       : access ICertificateRequestProperties_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_KeySize
   (
      This       : access ICertificateRequestProperties_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_FriendlyName
   (
      This       : access ICertificateRequestProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_FriendlyName
   (
      This       : access ICertificateRequestProperties_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HashAlgorithmName
   (
      This       : access ICertificateRequestProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_HashAlgorithmName
   (
      This       : access ICertificateRequestProperties_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Exportable
   (
      This       : access ICertificateRequestProperties_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.ExportOption
   )
   return Windows.HRESULT is abstract;
   
   function put_Exportable
   (
      This       : access ICertificateRequestProperties_Interface
      ; value : Windows.Security.Cryptography.Certificates.ExportOption
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyUsages
   (
      This       : access ICertificateRequestProperties_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.EnrollKeyUsages
   )
   return Windows.HRESULT is abstract;
   
   function put_KeyUsages
   (
      This       : access ICertificateRequestProperties_Interface
      ; value : Windows.Security.Cryptography.Certificates.EnrollKeyUsages
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyProtectionLevel
   (
      This       : access ICertificateRequestProperties_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.KeyProtectionLevel
   )
   return Windows.HRESULT is abstract;
   
   function put_KeyProtectionLevel
   (
      This       : access ICertificateRequestProperties_Interface
      ; value : Windows.Security.Cryptography.Certificates.KeyProtectionLevel
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyStorageProviderName
   (
      This       : access ICertificateRequestProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_KeyStorageProviderName
   (
      This       : access ICertificateRequestProperties_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICertificateRequestProperties2 : aliased constant Windows.IID := (1033947476, 55103, 20467, (160, 166, 6, 119, 192, 173, 160, 91 ));
   
   type ICertificateRequestProperties2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SmartcardReaderName
   (
      This       : access ICertificateRequestProperties2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_SmartcardReaderName
   (
      This       : access ICertificateRequestProperties2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SigningCertificate
   (
      This       : access ICertificateRequestProperties2_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICertificate
   )
   return Windows.HRESULT is abstract;
   
   function put_SigningCertificate
   (
      This       : access ICertificateRequestProperties2_Interface
      ; value : Windows.Security.Cryptography.Certificates.ICertificate
   )
   return Windows.HRESULT is abstract;
   
   function get_AttestationCredentialCertificate
   (
      This       : access ICertificateRequestProperties2_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICertificate
   )
   return Windows.HRESULT is abstract;
   
   function put_AttestationCredentialCertificate
   (
      This       : access ICertificateRequestProperties2_Interface
      ; value : Windows.Security.Cryptography.Certificates.ICertificate
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICertificateRequestProperties3 : aliased constant Windows.IID := (3867670038, 29517, 18097, (157, 76, 110, 223, 219, 252, 132, 91 ));
   
   type ICertificateRequestProperties3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CurveName
   (
      This       : access ICertificateRequestProperties3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_CurveName
   (
      This       : access ICertificateRequestProperties3_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CurveParameters
   (
      This       : access ICertificateRequestProperties3_Interface
      ; RetVal : access UInt8_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   function put_CurveParameters
   (
      This       : access ICertificateRequestProperties3_Interface
      ; value : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function get_ContainerNamePrefix
   (
      This       : access ICertificateRequestProperties3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ContainerNamePrefix
   (
      This       : access ICertificateRequestProperties3_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ContainerName
   (
      This       : access ICertificateRequestProperties3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ContainerName
   (
      This       : access ICertificateRequestProperties3_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_UseExistingKey
   (
      This       : access ICertificateRequestProperties3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_UseExistingKey
   (
      This       : access ICertificateRequestProperties3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICertificateRequestProperties4 : aliased constant Windows.IID := (1312987858, 7265, 20458, (184, 254, 19, 95, 177, 156, 220, 228 ));
   
   type ICertificateRequestProperties4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SuppressedDefaults
   (
      This       : access ICertificateRequestProperties4_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SubjectAlternativeName
   (
      This       : access ICertificateRequestProperties4_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.ISubjectAlternativeNameInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Extensions
   (
      This       : access ICertificateRequestProperties4_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.IVector_ICertificateExtension -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICertificateEnrollmentManagerStatics : aliased constant Windows.IID := (2286350143, 43398, 18683, (159, 215, 154, 236, 6, 147, 91, 241 ));
   
   type ICertificateEnrollmentManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateRequestAsync
   (
      This       : access ICertificateEnrollmentManagerStatics_Interface
      ; request : Windows.Security.Cryptography.Certificates.ICertificateRequestProperties
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function InstallCertificateAsync
   (
      This       : access ICertificateEnrollmentManagerStatics_Interface
      ; certificate : Windows.String
      ; installOption : Windows.Security.Cryptography.Certificates.InstallOptions
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ImportPfxDataAsync
   (
      This       : access ICertificateEnrollmentManagerStatics_Interface
      ; pfxData : Windows.String
      ; password : Windows.String
      ; exportable : Windows.Security.Cryptography.Certificates.ExportOption
      ; keyProtectionLevel : Windows.Security.Cryptography.Certificates.KeyProtectionLevel
      ; installOption : Windows.Security.Cryptography.Certificates.InstallOptions
      ; friendlyName : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICertificateEnrollmentManagerStatics2 : aliased constant Windows.IID := (3696958515, 25641, 16404, (153, 156, 93, 151, 53, 128, 45, 29 ));
   
   type ICertificateEnrollmentManagerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UserCertificateEnrollmentManager
   (
      This       : access ICertificateEnrollmentManagerStatics2_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.IUserCertificateEnrollmentManager
   )
   return Windows.HRESULT is abstract;
   
   function ImportPfxDataToKspAsync
   (
      This       : access ICertificateEnrollmentManagerStatics2_Interface
      ; pfxData : Windows.String
      ; password : Windows.String
      ; exportable : Windows.Security.Cryptography.Certificates.ExportOption
      ; keyProtectionLevel : Windows.Security.Cryptography.Certificates.KeyProtectionLevel
      ; installOption : Windows.Security.Cryptography.Certificates.InstallOptions
      ; friendlyName : Windows.String
      ; keyStorageProvider : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICertificateEnrollmentManagerStatics3 : aliased constant Windows.IID := (4260135614, 24956, 16986, (183, 45, 57, 139, 38, 172, 114, 100 ));
   
   type ICertificateEnrollmentManagerStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function ImportPfxDataToKspWithParametersAsync
   (
      This       : access ICertificateEnrollmentManagerStatics3_Interface
      ; pfxData : Windows.String
      ; password : Windows.String
      ; pfxImportParameters : Windows.Security.Cryptography.Certificates.IPfxImportParameters
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKeyAttestationHelperStatics : aliased constant Windows.IID := (373875270, 63044, 17190, (136, 190, 58, 241, 2, 211, 14, 12 ));
   
   type IKeyAttestationHelperStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function DecryptTpmAttestationCredentialAsync
   (
      This       : access IKeyAttestationHelperStatics_Interface
      ; credential : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetTpmAttestationCredentialId
   (
      This       : access IKeyAttestationHelperStatics_Interface
      ; credential : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKeyAttestationHelperStatics2 : aliased constant Windows.IID := (2623081260, 42694, 19038, (158, 100, 232, 93, 82, 121, 223, 151 ));
   
   type IKeyAttestationHelperStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function DecryptTpmAttestationCredentialWithContainerNameAsync
   (
      This       : access IKeyAttestationHelperStatics2_Interface
      ; credential : Windows.String
      ; containerName : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICertificateStoresStatics : aliased constant Windows.IID := (4226598713, 50942, 19943, (153, 207, 116, 195, 229, 150, 224, 50 ));
   
   type ICertificateStoresStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FindAllAsync
   (
      This       : access ICertificateStoresStatics_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAllWithQueryAsync
   (
      This       : access ICertificateStoresStatics_Interface
      ; query : Windows.Security.Cryptography.Certificates.ICertificateQuery
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_TrustedRootCertificationAuthorities
   (
      This       : access ICertificateStoresStatics_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICertificateStore
   )
   return Windows.HRESULT is abstract;
   
   function get_IntermediateCertificationAuthorities
   (
      This       : access ICertificateStoresStatics_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICertificateStore
   )
   return Windows.HRESULT is abstract;
   
   function GetStoreByName
   (
      This       : access ICertificateStoresStatics_Interface
      ; storeName : Windows.String
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICertificateStore
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICertificateStoresStatics2 : aliased constant Windows.IID := (4203744121, 41172, 19340, (188, 85, 192, 163, 126, 177, 65, 237 ));
   
   type ICertificateStoresStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetUserStoreByName
   (
      This       : access ICertificateStoresStatics2_Interface
      ; storeName : Windows.String
      ; RetVal : access Windows.Security.Cryptography.Certificates.IUserCertificateStore
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserCertificateEnrollmentManager : aliased constant Windows.IID := (2519807768, 8929, 18457, (178, 11, 171, 70, 166, 236, 160, 110 ));
   
   type IUserCertificateEnrollmentManager_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateRequestAsync
   (
      This       : access IUserCertificateEnrollmentManager_Interface
      ; request : Windows.Security.Cryptography.Certificates.ICertificateRequestProperties
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function InstallCertificateAsync
   (
      This       : access IUserCertificateEnrollmentManager_Interface
      ; certificate : Windows.String
      ; installOption : Windows.Security.Cryptography.Certificates.InstallOptions
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ImportPfxDataAsync
   (
      This       : access IUserCertificateEnrollmentManager_Interface
      ; pfxData : Windows.String
      ; password : Windows.String
      ; exportable : Windows.Security.Cryptography.Certificates.ExportOption
      ; keyProtectionLevel : Windows.Security.Cryptography.Certificates.KeyProtectionLevel
      ; installOption : Windows.Security.Cryptography.Certificates.InstallOptions
      ; friendlyName : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ImportPfxDataToKspAsync
   (
      This       : access IUserCertificateEnrollmentManager_Interface
      ; pfxData : Windows.String
      ; password : Windows.String
      ; exportable : Windows.Security.Cryptography.Certificates.ExportOption
      ; keyProtectionLevel : Windows.Security.Cryptography.Certificates.KeyProtectionLevel
      ; installOption : Windows.Security.Cryptography.Certificates.InstallOptions
      ; friendlyName : Windows.String
      ; keyStorageProvider : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserCertificateEnrollmentManager2 : aliased constant Windows.IID := (229481649, 26078, 18730, (184, 109, 252, 92, 72, 44, 55, 71 ));
   
   type IUserCertificateEnrollmentManager2_Interface is interface and Windows.IInspectable_Interface;
   
   function ImportPfxDataToKspWithParametersAsync
   (
      This       : access IUserCertificateEnrollmentManager2_Interface
      ; pfxData : Windows.String
      ; password : Windows.String
      ; pfxImportParameters : Windows.Security.Cryptography.Certificates.IPfxImportParameters
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICertificateStore : aliased constant Windows.IID := (2965370656, 13390, 17201, (175, 20, 167, 247, 167, 235, 201, 58 ));
   
   type ICertificateStore_Interface is interface and Windows.IInspectable_Interface;
   
   function Add
   (
      This       : access ICertificateStore_Interface
      ; certificate : Windows.Security.Cryptography.Certificates.ICertificate
   )
   return Windows.HRESULT is abstract;
   
   function Delete
   (
      This       : access ICertificateStore_Interface
      ; certificate : Windows.Security.Cryptography.Certificates.ICertificate
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICertificateStore2 : aliased constant Windows.IID := (3353775690, 16765, 19738, (186, 189, 21, 104, 126, 84, 153, 116 ));
   
   type ICertificateStore2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access ICertificateStore2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserCertificateStore : aliased constant Windows.IID := (3388677507, 30879, 19278, (145, 128, 4, 90, 117, 122, 172, 109 ));
   
   type IUserCertificateStore_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestAddAsync
   (
      This       : access IUserCertificateStore_Interface
      ; certificate : Windows.Security.Cryptography.Certificates.ICertificate
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestDeleteAsync
   (
      This       : access IUserCertificateStore_Interface
      ; certificate : Windows.Security.Cryptography.Certificates.ICertificate
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access IUserCertificateStore_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IStandardCertificateStoreNamesStatics : aliased constant Windows.IID := (202722011, 42134, 16888, (143, 229, 158, 150, 243, 110, 251, 248 ));
   
   type IStandardCertificateStoreNamesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Personal
   (
      This       : access IStandardCertificateStoreNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TrustedRootCertificationAuthorities
   (
      This       : access IStandardCertificateStoreNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IntermediateCertificationAuthorities
   (
      This       : access IStandardCertificateStoreNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKeyAlgorithmNamesStatics : aliased constant Windows.IID := (1200645591, 31431, 17793, (140, 59, 208, 112, 39, 20, 4, 72 ));
   
   type IKeyAlgorithmNamesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Rsa
   (
      This       : access IKeyAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Dsa
   (
      This       : access IKeyAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Ecdh256
   (
      This       : access IKeyAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Ecdh384
   (
      This       : access IKeyAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Ecdh521
   (
      This       : access IKeyAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Ecdsa256
   (
      This       : access IKeyAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Ecdsa384
   (
      This       : access IKeyAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Ecdsa521
   (
      This       : access IKeyAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKeyAlgorithmNamesStatics2 : aliased constant Windows.IID := (3382400646, 57853, 19018, (137, 61, 162, 111, 51, 221, 139, 180 ));
   
   type IKeyAlgorithmNamesStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Ecdsa
   (
      This       : access IKeyAlgorithmNamesStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Ecdh
   (
      This       : access IKeyAlgorithmNamesStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKeyStorageProviderNamesStatics : aliased constant Windows.IID := (2937613024, 21801, 17922, (189, 148, 10, 171, 145, 149, 123, 92 ));
   
   type IKeyStorageProviderNamesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SoftwareKeyStorageProvider
   (
      This       : access IKeyStorageProviderNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SmartcardKeyStorageProvider
   (
      This       : access IKeyStorageProviderNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PlatformKeyStorageProvider
   (
      This       : access IKeyStorageProviderNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKeyStorageProviderNamesStatics2 : aliased constant Windows.IID := (640513085, 39982, 16844, (136, 18, 196, 217, 113, 221, 124, 96 ));
   
   type IKeyStorageProviderNamesStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PassportKeyStorageProvider
   (
      This       : access IKeyStorageProviderNamesStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChainBuildingParameters : aliased constant Windows.IID := (1110157602, 31885, 18359, (181, 155, 177, 39, 3, 115, 58, 195 ));
   
   type IChainBuildingParameters_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EnhancedKeyUsages
   (
      This       : access IChainBuildingParameters_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ValidationTimestamp
   (
      This       : access IChainBuildingParameters_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function put_ValidationTimestamp
   (
      This       : access IChainBuildingParameters_Interface
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_RevocationCheckEnabled
   (
      This       : access IChainBuildingParameters_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_RevocationCheckEnabled
   (
      This       : access IChainBuildingParameters_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_NetworkRetrievalEnabled
   (
      This       : access IChainBuildingParameters_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_NetworkRetrievalEnabled
   (
      This       : access IChainBuildingParameters_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AuthorityInformationAccessEnabled
   (
      This       : access IChainBuildingParameters_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AuthorityInformationAccessEnabled
   (
      This       : access IChainBuildingParameters_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentTimeValidationEnabled
   (
      This       : access IChainBuildingParameters_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CurrentTimeValidationEnabled
   (
      This       : access IChainBuildingParameters_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ExclusiveTrustRoots
   (
      This       : access IChainBuildingParameters_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.IVector_ICertificate -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChainValidationParameters : aliased constant Windows.IID := (3295951690, 32432, 19286, (160, 64, 185, 200, 230, 85, 221, 243 ));
   
   type IChainValidationParameters_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CertificateChainPolicy
   (
      This       : access IChainValidationParameters_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.CertificateChainPolicy
   )
   return Windows.HRESULT is abstract;
   
   function put_CertificateChainPolicy
   (
      This       : access IChainValidationParameters_Interface
      ; value : Windows.Security.Cryptography.Certificates.CertificateChainPolicy
   )
   return Windows.HRESULT is abstract;
   
   function get_ServerDnsName
   (
      This       : access IChainValidationParameters_Interface
      ; RetVal : access Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function put_ServerDnsName
   (
      This       : access IChainValidationParameters_Interface
      ; value : Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICertificateQuery : aliased constant Windows.IID := (1527261745, 42792, 18710, (181, 238, 255, 203, 138, 207, 36, 23 ));
   
   type ICertificateQuery_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EnhancedKeyUsages
   (
      This       : access ICertificateQuery_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_IssuerName
   (
      This       : access ICertificateQuery_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_IssuerName
   (
      This       : access ICertificateQuery_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FriendlyName
   (
      This       : access ICertificateQuery_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_FriendlyName
   (
      This       : access ICertificateQuery_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Thumbprint
   (
      This       : access ICertificateQuery_Interface
      ; RetVal : access UInt8_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   function put_Thumbprint
   (
      This       : access ICertificateQuery_Interface
      ; value : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function get_HardwareOnly
   (
      This       : access ICertificateQuery_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_HardwareOnly
   (
      This       : access ICertificateQuery_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICertificateQuery2 : aliased constant Windows.IID := (2472151799, 3033, 20341, (184, 194, 226, 122, 127, 116, 238, 205 ));
   
   type ICertificateQuery2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IncludeDuplicates
   (
      This       : access ICertificateQuery2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IncludeDuplicates
   (
      This       : access ICertificateQuery2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IncludeExpiredCertificates
   (
      This       : access ICertificateQuery2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IncludeExpiredCertificates
   (
      This       : access ICertificateQuery2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_StoreName
   (
      This       : access ICertificateQuery2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_StoreName
   (
      This       : access ICertificateQuery2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICertificateChain : aliased constant Windows.IID := (549409669, 13969, 17665, (166, 44, 253, 151, 39, 139, 49, 238 ));
   
   type ICertificateChain_Interface is interface and Windows.IInspectable_Interface;
   
   function Validate
   (
      This       : access ICertificateChain_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.ChainValidationResult
   )
   return Windows.HRESULT is abstract;
   
   function ValidateWithParameters
   (
      This       : access ICertificateChain_Interface
      ; parameter : Windows.Security.Cryptography.Certificates.IChainValidationParameters
      ; RetVal : access Windows.Security.Cryptography.Certificates.ChainValidationResult
   )
   return Windows.HRESULT is abstract;
   
   function GetCertificates
   (
      This       : access ICertificateChain_Interface
      ; includeRoot : Windows.Boolean
      ; RetVal : access Windows.Security.Cryptography.Certificates.IVectorView_ICertificate -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICertificate : aliased constant Windows.IID := (859796492, 1240, 17331, (178, 120, 140, 95, 204, 155, 229, 160 ));
   
   type ICertificate_Interface is interface and Windows.IInspectable_Interface;
   
   function BuildChainAsync
   (
      This       : access ICertificate_Interface
      ; certificates : Windows.Security.Cryptography.Certificates.IIterable_ICertificate
      ; RetVal : access Windows.Security.Cryptography.Certificates.IAsyncOperation_ICertificateChain -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function BuildChainWithParametersAsync
   (
      This       : access ICertificate_Interface
      ; certificates : Windows.Security.Cryptography.Certificates.IIterable_ICertificate
      ; parameters : Windows.Security.Cryptography.Certificates.IChainBuildingParameters
      ; RetVal : access Windows.Security.Cryptography.Certificates.IAsyncOperation_ICertificateChain -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SerialNumber
   (
      This       : access ICertificate_Interface
      ; RetVal : access UInt8_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   function GetHashValue
   (
      This       : access ICertificate_Interface
      ; RetVal : access UInt8_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   function GetHashValueWithAlgorithm
   (
      This       : access ICertificate_Interface
      ; hashAlgorithmName : Windows.String
      ; RetVal : access UInt8_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   function GetCertificateBlob
   (
      This       : access ICertificate_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_Subject
   (
      This       : access ICertificate_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Issuer
   (
      This       : access ICertificate_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HasPrivateKey
   (
      This       : access ICertificate_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsStronglyProtected
   (
      This       : access ICertificate_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ValidFrom
   (
      This       : access ICertificate_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_ValidTo
   (
      This       : access ICertificate_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_EnhancedKeyUsages
   (
      This       : access ICertificate_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_FriendlyName
   (
      This       : access ICertificate_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FriendlyName
   (
      This       : access ICertificate_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICertificate2 : aliased constant Windows.IID := (397948748, 35365, 19862, (164, 146, 143, 194, 154, 196, 253, 166 ));
   
   type ICertificate2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsSecurityDeviceBound
   (
      This       : access ICertificate2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyUsages
   (
      This       : access ICertificate2_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICertificateKeyUsages
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyAlgorithmName
   (
      This       : access ICertificate2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SignatureAlgorithmName
   (
      This       : access ICertificate2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SignatureHashAlgorithmName
   (
      This       : access ICertificate2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SubjectAlternativeName
   (
      This       : access ICertificate2_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.ISubjectAlternativeNameInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICertificate3 : aliased constant Windows.IID := (3193022822, 44639, 18002, (172, 231, 198, 215, 231, 114, 76, 243 ));
   
   type ICertificate3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsPerUser
   (
      This       : access ICertificate3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_StoreName
   (
      This       : access ICertificate3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyStorageProviderName
   (
      This       : access ICertificate3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICertificateFactory : aliased constant Windows.IID := (397681180, 19375, 17570, (150, 8, 4, 251, 98, 177, 105, 66 ));
   
   type ICertificateFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateCertificate
   (
      This       : access ICertificateFactory_Interface
      ; certBlob : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICertificate
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICmsTimestampInfo : aliased constant Windows.IID := (794755314, 11288, 20360, (132, 53, 197, 52, 8, 96, 118, 245 ));
   
   type ICmsTimestampInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SigningCertificate
   (
      This       : access ICmsTimestampInfo_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICertificate
   )
   return Windows.HRESULT is abstract;
   
   function get_Certificates
   (
      This       : access ICmsTimestampInfo_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.IVectorView_ICertificate -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Timestamp
   (
      This       : access ICmsTimestampInfo_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICmsSignerInfo : aliased constant Windows.IID := (1355817179, 7471, 19482, (181, 197, 208, 24, 143, 249, 31, 71 ));
   
   type ICmsSignerInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Certificate
   (
      This       : access ICmsSignerInfo_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICertificate
   )
   return Windows.HRESULT is abstract;
   
   function put_Certificate
   (
      This       : access ICmsSignerInfo_Interface
      ; value : Windows.Security.Cryptography.Certificates.ICertificate
   )
   return Windows.HRESULT is abstract;
   
   function get_HashAlgorithmName
   (
      This       : access ICmsSignerInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_HashAlgorithmName
   (
      This       : access ICmsSignerInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TimestampInfo
   (
      This       : access ICmsSignerInfo_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICmsTimestampInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISubjectAlternativeNameInfo : aliased constant Windows.IID := (1479039473, 22173, 19488, (190, 123, 78, 28, 154, 11, 197, 43 ));
   
   type ISubjectAlternativeNameInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EmailName
   (
      This       : access ISubjectAlternativeNameInfo_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_IPAddress
   (
      This       : access ISubjectAlternativeNameInfo_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Url
   (
      This       : access ISubjectAlternativeNameInfo_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_DnsName
   (
      This       : access ISubjectAlternativeNameInfo_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_DistinguishedName
   (
      This       : access ISubjectAlternativeNameInfo_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_PrincipalName
   (
      This       : access ISubjectAlternativeNameInfo_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISubjectAlternativeNameInfo2 : aliased constant Windows.IID := (1132099782, 7249, 16874, (179, 74, 61, 101, 67, 152, 163, 112 ));
   
   type ISubjectAlternativeNameInfo2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EmailNames
   (
      This       : access ISubjectAlternativeNameInfo2_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_IPAddresses
   (
      This       : access ISubjectAlternativeNameInfo2_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Urls
   (
      This       : access ISubjectAlternativeNameInfo2_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_DnsNames
   (
      This       : access ISubjectAlternativeNameInfo2_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_DistinguishedNames
   (
      This       : access ISubjectAlternativeNameInfo2_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_PrincipalNames
   (
      This       : access ISubjectAlternativeNameInfo2_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Extension
   (
      This       : access ISubjectAlternativeNameInfo2_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICertificateExtension
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPfxImportParameters : aliased constant Windows.IID := (1745696017, 39432, 18376, (134, 74, 46, 221, 77, 142, 180, 108 ));
   
   type IPfxImportParameters_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Exportable
   (
      This       : access IPfxImportParameters_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.ExportOption
   )
   return Windows.HRESULT is abstract;
   
   function put_Exportable
   (
      This       : access IPfxImportParameters_Interface
      ; value : Windows.Security.Cryptography.Certificates.ExportOption
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyProtectionLevel
   (
      This       : access IPfxImportParameters_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.KeyProtectionLevel
   )
   return Windows.HRESULT is abstract;
   
   function put_KeyProtectionLevel
   (
      This       : access IPfxImportParameters_Interface
      ; value : Windows.Security.Cryptography.Certificates.KeyProtectionLevel
   )
   return Windows.HRESULT is abstract;
   
   function get_InstallOptions
   (
      This       : access IPfxImportParameters_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.InstallOptions
   )
   return Windows.HRESULT is abstract;
   
   function put_InstallOptions
   (
      This       : access IPfxImportParameters_Interface
      ; value : Windows.Security.Cryptography.Certificates.InstallOptions
   )
   return Windows.HRESULT is abstract;
   
   function get_FriendlyName
   (
      This       : access IPfxImportParameters_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_FriendlyName
   (
      This       : access IPfxImportParameters_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyStorageProviderName
   (
      This       : access IPfxImportParameters_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_KeyStorageProviderName
   (
      This       : access IPfxImportParameters_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ContainerNamePrefix
   (
      This       : access IPfxImportParameters_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ContainerNamePrefix
   (
      This       : access IPfxImportParameters_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ReaderName
   (
      This       : access IPfxImportParameters_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ReaderName
   (
      This       : access IPfxImportParameters_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICertificateKeyUsages : aliased constant Windows.IID := (1791369327, 57807, 18538, (180, 133, 166, 156, 131, 228, 111, 209 ));
   
   type ICertificateKeyUsages_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EncipherOnly
   (
      This       : access ICertificateKeyUsages_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_EncipherOnly
   (
      This       : access ICertificateKeyUsages_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CrlSign
   (
      This       : access ICertificateKeyUsages_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CrlSign
   (
      This       : access ICertificateKeyUsages_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyCertificateSign
   (
      This       : access ICertificateKeyUsages_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_KeyCertificateSign
   (
      This       : access ICertificateKeyUsages_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyAgreement
   (
      This       : access ICertificateKeyUsages_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_KeyAgreement
   (
      This       : access ICertificateKeyUsages_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_DataEncipherment
   (
      This       : access ICertificateKeyUsages_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_DataEncipherment
   (
      This       : access ICertificateKeyUsages_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyEncipherment
   (
      This       : access ICertificateKeyUsages_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_KeyEncipherment
   (
      This       : access ICertificateKeyUsages_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_NonRepudiation
   (
      This       : access ICertificateKeyUsages_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_NonRepudiation
   (
      This       : access ICertificateKeyUsages_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_DigitalSignature
   (
      This       : access ICertificateKeyUsages_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_DigitalSignature
   (
      This       : access ICertificateKeyUsages_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICmsAttachedSignature : aliased constant Windows.IID := (1636408733, 14167, 20171, (189, 220, 12, 163, 87, 215, 169, 54 ));
   
   type ICmsAttachedSignature_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Certificates
   (
      This       : access ICmsAttachedSignature_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.IVectorView_ICertificate -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Content
   (
      This       : access ICmsAttachedSignature_Interface
      ; RetVal : access UInt8_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   function get_Signers
   (
      This       : access ICmsAttachedSignature_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.IVectorView_ICmsSignerInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function VerifySignature
   (
      This       : access ICmsAttachedSignature_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.SignatureValidationResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICmsAttachedSignatureFactory : aliased constant Windows.IID := (3502832661, 63319, 19556, (163, 98, 82, 204, 28, 119, 207, 251 ));
   
   type ICmsAttachedSignatureFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateCmsAttachedSignature
   (
      This       : access ICmsAttachedSignatureFactory_Interface
      ; inputBlob : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICmsAttachedSignature
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICmsAttachedSignatureStatics : aliased constant Windows.IID := (2274925710, 45229, 18829, (167, 245, 120, 181, 155, 206, 75, 54 ));
   
   type ICmsAttachedSignatureStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GenerateSignatureAsync
   (
      This       : access ICmsAttachedSignatureStatics_Interface
      ; data : Windows.Storage.Streams.IBuffer
      ; signers : Windows.Security.Cryptography.Certificates.IIterable_ICmsSignerInfo
      ; certificates : Windows.Security.Cryptography.Certificates.IIterable_ICertificate
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IBuffer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICmsDetachedSignature : aliased constant Windows.IID := (253686100, 63070, 17718, (131, 57, 89, 68, 8, 29, 178, 202 ));
   
   type ICmsDetachedSignature_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Certificates
   (
      This       : access ICmsDetachedSignature_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.IVectorView_ICertificate -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Signers
   (
      This       : access ICmsDetachedSignature_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.IVectorView_ICmsSignerInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function VerifySignatureAsync
   (
      This       : access ICmsDetachedSignature_Interface
      ; data : Windows.Storage.Streams.IInputStream
      ; RetVal : access Windows.Security.Cryptography.Certificates.IAsyncOperation_SignatureValidationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICmsDetachedSignatureFactory : aliased constant Windows.IID := (3299554563, 44671, 17287, (173, 25, 0, 241, 80, 228, 142, 187 ));
   
   type ICmsDetachedSignatureFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateCmsDetachedSignature
   (
      This       : access ICmsDetachedSignatureFactory_Interface
      ; inputBlob : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICmsDetachedSignature
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICmsDetachedSignatureStatics : aliased constant Windows.IID := (1024543997, 49051, 18050, (155, 230, 145, 245, 124, 5, 56, 8 ));
   
   type ICmsDetachedSignatureStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GenerateSignatureAsync
   (
      This       : access ICmsDetachedSignatureStatics_Interface
      ; data : Windows.Storage.Streams.IInputStream
      ; signers : Windows.Security.Cryptography.Certificates.IIterable_ICmsSignerInfo
      ; certificates : Windows.Security.Cryptography.Certificates.IIterable_ICertificate
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IBuffer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_ICertificateExtension : aliased constant Windows.IID := (1583020418, 13101, 21740, (142, 84, 230, 44, 26, 30, 172, 233 ));
   
   type IIterator_ICertificateExtension_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ICertificateExtension_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICertificateExtension
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ICertificateExtension_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ICertificateExtension_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ICertificateExtension_Interface
      ; items : Windows.Security.Cryptography.Certificates.ICertificateExtension_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_ICertificateExtension : aliased constant Windows.IID := (467497255, 29619, 20882, (139, 222, 32, 193, 54, 40, 18, 96 ));
   
   type IIterable_ICertificateExtension_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ICertificateExtension_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.IIterator_ICertificateExtension
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_ICertificateExtension : aliased constant Windows.IID := (1132819539, 59313, 23738, (151, 48, 94, 164, 221, 235, 221, 149 ));
   
   type IVectorView_ICertificateExtension_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ICertificateExtension_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICertificateExtension
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ICertificateExtension_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ICertificateExtension_Interface
      ; value : Windows.Security.Cryptography.Certificates.ICertificateExtension
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ICertificateExtension_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Security.Cryptography.Certificates.ICertificateExtension_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_ICertificateExtension : aliased constant Windows.IID := (1277502440, 38771, 20734, (184, 112, 72, 63, 216, 185, 6, 220 ));
   
   type IVector_ICertificateExtension_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_ICertificateExtension_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICertificateExtension
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_ICertificateExtension_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_ICertificateExtension_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.IVectorView_ICertificateExtension
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_ICertificateExtension_Interface
      ; value : Windows.Security.Cryptography.Certificates.ICertificateExtension
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_ICertificateExtension_Interface
      ; index : Windows.UInt32
      ; value : Windows.Security.Cryptography.Certificates.ICertificateExtension
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_ICertificateExtension_Interface
      ; index : Windows.UInt32
      ; value : Windows.Security.Cryptography.Certificates.ICertificateExtension
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_ICertificateExtension_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_ICertificateExtension_Interface
      ; value : Windows.Security.Cryptography.Certificates.ICertificateExtension
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_ICertificateExtension_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_ICertificateExtension_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_ICertificateExtension_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Security.Cryptography.Certificates.ICertificateExtension_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_ICertificateExtension_Interface
      ; items : Windows.Security.Cryptography.Certificates.ICertificateExtension_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_ICertificate : aliased constant Windows.IID := (1735377241, 61788, 22717, (145, 167, 40, 247, 231, 149, 199, 86 ));
   
   type IIterator_ICertificate_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ICertificate_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICertificate
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ICertificate_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ICertificate_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ICertificate_Interface
      ; items : Windows.Security.Cryptography.Certificates.ICertificate_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_ICertificate : aliased constant Windows.IID := (209523747, 59645, 23185, (181, 92, 139, 251, 231, 172, 45, 64 ));
   
   type IIterable_ICertificate_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ICertificate_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.IIterator_ICertificate
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_ICertificate : aliased constant Windows.IID := (2520739859, 30658, 20933, (128, 56, 181, 188, 239, 99, 62, 219 ));
   
   type IVectorView_ICertificate_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ICertificate_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICertificate
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ICertificate_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ICertificate_Interface
      ; value : Windows.Security.Cryptography.Certificates.ICertificate
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ICertificate_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Security.Cryptography.Certificates.ICertificate_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_ICertificate : aliased constant Windows.IID := (908602383, 12063, 22516, (178, 177, 134, 122, 249, 12, 61, 19 ));
   
   type IVector_ICertificate_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_ICertificate_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICertificate
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_ICertificate_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_ICertificate_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.IVectorView_ICertificate
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_ICertificate_Interface
      ; value : Windows.Security.Cryptography.Certificates.ICertificate
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_ICertificate_Interface
      ; index : Windows.UInt32
      ; value : Windows.Security.Cryptography.Certificates.ICertificate
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_ICertificate_Interface
      ; index : Windows.UInt32
      ; value : Windows.Security.Cryptography.Certificates.ICertificate
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_ICertificate_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_ICertificate_Interface
      ; value : Windows.Security.Cryptography.Certificates.ICertificate
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_ICertificate_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_ICertificate_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_ICertificate_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Security.Cryptography.Certificates.ICertificate_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_ICertificate_Interface
      ; items : Windows.Security.Cryptography.Certificates.ICertificate_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ICertificateChain : aliased constant Windows.IID := (4128819156, 44769, 22702, (175, 232, 252, 51, 109, 175, 3, 149 ));
   
   type IAsyncOperation_ICertificateChain_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ICertificateChain_Interface
      ; handler : Windows.Security.Cryptography.Certificates.AsyncOperationCompletedHandler_ICertificateChain
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ICertificateChain_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.AsyncOperationCompletedHandler_ICertificateChain
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ICertificateChain_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICertificateChain
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_ICmsSignerInfo : aliased constant Windows.IID := (3127449128, 54297, 24074, (185, 36, 3, 235, 194, 54, 177, 30 ));
   
   type IIterator_ICmsSignerInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ICmsSignerInfo_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICmsSignerInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ICmsSignerInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ICmsSignerInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ICmsSignerInfo_Interface
      ; items : Windows.Security.Cryptography.Certificates.ICmsSignerInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_ICmsSignerInfo : aliased constant Windows.IID := (1794261364, 11738, 23124, (160, 185, 77, 102, 144, 5, 148, 39 ));
   
   type IIterable_ICmsSignerInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ICmsSignerInfo_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.IIterator_ICmsSignerInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_ICmsSignerInfo : aliased constant Windows.IID := (4100704936, 29820, 23187, (130, 254, 133, 214, 53, 73, 254, 129 ));
   
   type IVectorView_ICmsSignerInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ICmsSignerInfo_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICmsSignerInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ICmsSignerInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ICmsSignerInfo_Interface
      ; value : Windows.Security.Cryptography.Certificates.ICmsSignerInfo
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ICmsSignerInfo_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Security.Cryptography.Certificates.ICmsSignerInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_SignatureValidationResult : aliased constant Windows.IID := (4036758479, 52795, 24063, (151, 31, 44, 63, 254, 111, 208, 77 ));
   
   type IAsyncOperation_SignatureValidationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_SignatureValidationResult_Interface
      ; handler : Windows.Security.Cryptography.Certificates.AsyncOperationCompletedHandler_SignatureValidationResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_SignatureValidationResult_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.AsyncOperationCompletedHandler_SignatureValidationResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_SignatureValidationResult_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.SignatureValidationResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_ChainValidationResult : aliased constant Windows.IID := (2345325239, 3643, 24238, (191, 105, 225, 246, 217, 200, 136, 248 ));
   
   type IIterator_ChainValidationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ChainValidationResult_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.ChainValidationResult
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ChainValidationResult_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ChainValidationResult_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ChainValidationResult_Interface
      ; items : Windows.Security.Cryptography.Certificates.ChainValidationResult_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_ChainValidationResult : aliased constant Windows.IID := (640218511, 16130, 21746, (128, 143, 225, 17, 119, 9, 214, 208 ));
   
   type IIterable_ChainValidationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ChainValidationResult_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.IIterator_ChainValidationResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_ChainValidationResult : aliased constant Windows.IID := (3409458310, 49852, 22358, (145, 45, 106, 112, 138, 7, 229, 189 ));
   
   type IVectorView_ChainValidationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ChainValidationResult_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Security.Cryptography.Certificates.ChainValidationResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ChainValidationResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ChainValidationResult_Interface
      ; value : Windows.Security.Cryptography.Certificates.ChainValidationResult
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ChainValidationResult_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Security.Cryptography.Certificates.ChainValidationResult_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_ChainValidationResult : aliased constant Windows.IID := (3615657207, 17153, 22739, (170, 181, 6, 229, 238, 252, 247, 159 ));
   
   type IVector_ChainValidationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_ChainValidationResult_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Security.Cryptography.Certificates.ChainValidationResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_ChainValidationResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_ChainValidationResult_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.IVectorView_ChainValidationResult
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_ChainValidationResult_Interface
      ; value : Windows.Security.Cryptography.Certificates.ChainValidationResult
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_ChainValidationResult_Interface
      ; index : Windows.UInt32
      ; value : Windows.Security.Cryptography.Certificates.ChainValidationResult
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_ChainValidationResult_Interface
      ; index : Windows.UInt32
      ; value : Windows.Security.Cryptography.Certificates.ChainValidationResult
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_ChainValidationResult_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_ChainValidationResult_Interface
      ; value : Windows.Security.Cryptography.Certificates.ChainValidationResult
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_ChainValidationResult_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_ChainValidationResult_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_ChainValidationResult_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Security.Cryptography.Certificates.ChainValidationResult_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_ChainValidationResult_Interface
      ; items : Windows.Security.Cryptography.Certificates.ChainValidationResult_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ICertificateChain : aliased constant Windows.IID := (1279217897, 37091, 23088, (144, 21, 74, 160, 55, 105, 4, 243 ));
   
   type AsyncOperationCompletedHandler_ICertificateChain_Interface(Callback : access procedure (asyncInfo : Windows.Security.Cryptography.Certificates.IAsyncOperation_ICertificateChain ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ICertificateChain'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ICertificateChain_Interface
      ; asyncInfo : Windows.Security.Cryptography.Certificates.IAsyncOperation_ICertificateChain
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_SignatureValidationResult : aliased constant Windows.IID := (3757375493, 30893, 24399, (160, 133, 203, 97, 74, 103, 74, 37 ));
   
   type AsyncOperationCompletedHandler_SignatureValidationResult_Interface(Callback : access procedure (asyncInfo : Windows.Security.Cryptography.Certificates.IAsyncOperation_SignatureValidationResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_SignatureValidationResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_SignatureValidationResult_Interface
      ; asyncInfo : Windows.Security.Cryptography.Certificates.IAsyncOperation_SignatureValidationResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype CertificateExtension is Windows.Security.Cryptography.Certificates.ICertificateExtension;
   
   function CreateCertificateExtension return Windows.Security.Cryptography.Certificates.ICertificateExtension;
   
   subtype Certificate is Windows.Security.Cryptography.Certificates.ICertificate;
   function CreateCertificate
   (
      certBlob : Windows.Storage.Streams.IBuffer
   )
   return Windows.Security.Cryptography.Certificates.ICertificate;
   
   
   subtype SubjectAlternativeNameInfo is Windows.Security.Cryptography.Certificates.ISubjectAlternativeNameInfo;
   
   function CreateSubjectAlternativeNameInfo return Windows.Security.Cryptography.Certificates.ISubjectAlternativeNameInfo;
   
   subtype CertificateRequestProperties is Windows.Security.Cryptography.Certificates.ICertificateRequestProperties;
   
   function CreateCertificateRequestProperties return Windows.Security.Cryptography.Certificates.ICertificateRequestProperties;
   
   subtype UserCertificateEnrollmentManager is Windows.Security.Cryptography.Certificates.IUserCertificateEnrollmentManager;
   subtype PfxImportParameters is Windows.Security.Cryptography.Certificates.IPfxImportParameters;
   
   function CreatePfxImportParameters return Windows.Security.Cryptography.Certificates.IPfxImportParameters;
   
   subtype CertificateQuery is Windows.Security.Cryptography.Certificates.ICertificateQuery;
   
   function CreateCertificateQuery return Windows.Security.Cryptography.Certificates.ICertificateQuery;
   
   subtype CertificateStore is Windows.Security.Cryptography.Certificates.ICertificateStore;
   subtype UserCertificateStore is Windows.Security.Cryptography.Certificates.IUserCertificateStore;
   subtype ChainBuildingParameters is Windows.Security.Cryptography.Certificates.IChainBuildingParameters;
   
   function CreateChainBuildingParameters return Windows.Security.Cryptography.Certificates.IChainBuildingParameters;
   
   subtype ChainValidationParameters is Windows.Security.Cryptography.Certificates.IChainValidationParameters;
   
   function CreateChainValidationParameters return Windows.Security.Cryptography.Certificates.IChainValidationParameters;
   
   subtype CertificateChain is Windows.Security.Cryptography.Certificates.ICertificateChain;
   subtype CertificateKeyUsages is Windows.Security.Cryptography.Certificates.ICertificateKeyUsages;
   
   function CreateCertificateKeyUsages return Windows.Security.Cryptography.Certificates.ICertificateKeyUsages;
   
   subtype CmsTimestampInfo is Windows.Security.Cryptography.Certificates.ICmsTimestampInfo;
   subtype CmsSignerInfo is Windows.Security.Cryptography.Certificates.ICmsSignerInfo;
   
   function CreateCmsSignerInfo return Windows.Security.Cryptography.Certificates.ICmsSignerInfo;
   
   subtype CmsAttachedSignature is Windows.Security.Cryptography.Certificates.ICmsAttachedSignature;
   function CreateCmsAttachedSignature
   (
      inputBlob : Windows.Storage.Streams.IBuffer
   )
   return Windows.Security.Cryptography.Certificates.ICmsAttachedSignature;
   
   
   subtype CmsDetachedSignature is Windows.Security.Cryptography.Certificates.ICmsDetachedSignature;
   function CreateCmsDetachedSignature
   (
      inputBlob : Windows.Storage.Streams.IBuffer
   )
   return Windows.Security.Cryptography.Certificates.ICmsDetachedSignature;
   
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function ImportPfxDataToKspWithParametersAsync
   (
      pfxData : Windows.String
      ; password : Windows.String
      ; pfxImportParameters : Windows.Security.Cryptography.Certificates.IPfxImportParameters
   )
   return Windows.Foundation.IAsyncAction;
   
   function CreateRequestAsync
   (
      request : Windows.Security.Cryptography.Certificates.ICertificateRequestProperties
   )
   return Windows.Foundation.IAsyncOperation_String;
   
   function InstallCertificateAsync
   (
      certificate : Windows.String
      ; installOption : Windows.Security.Cryptography.Certificates.InstallOptions
   )
   return Windows.Foundation.IAsyncAction;
   
   function ImportPfxDataAsync
   (
      pfxData : Windows.String
      ; password : Windows.String
      ; exportable : Windows.Security.Cryptography.Certificates.ExportOption
      ; keyProtectionLevel : Windows.Security.Cryptography.Certificates.KeyProtectionLevel
      ; installOption : Windows.Security.Cryptography.Certificates.InstallOptions
      ; friendlyName : Windows.String
   )
   return Windows.Foundation.IAsyncAction;
   
   function get_UserCertificateEnrollmentManager
   return Windows.Security.Cryptography.Certificates.IUserCertificateEnrollmentManager;
   
   function ImportPfxDataToKspAsync
   (
      pfxData : Windows.String
      ; password : Windows.String
      ; exportable : Windows.Security.Cryptography.Certificates.ExportOption
      ; keyProtectionLevel : Windows.Security.Cryptography.Certificates.KeyProtectionLevel
      ; installOption : Windows.Security.Cryptography.Certificates.InstallOptions
      ; friendlyName : Windows.String
      ; keyStorageProvider : Windows.String
   )
   return Windows.Foundation.IAsyncAction;
   
   function DecryptTpmAttestationCredentialAsync
   (
      credential : Windows.String
   )
   return Windows.Foundation.IAsyncOperation_String;
   
   function GetTpmAttestationCredentialId
   (
      credential : Windows.String
   )
   return Windows.String;
   
   function DecryptTpmAttestationCredentialWithContainerNameAsync
   (
      credential : Windows.String
      ; containerName : Windows.String
   )
   return Windows.Foundation.IAsyncOperation_String;
   
   function GetUserStoreByName
   (
      storeName : Windows.String
   )
   return Windows.Security.Cryptography.Certificates.IUserCertificateStore;
   
   function FindAllAsync
   return Windows.Address;
   
   function FindAllWithQueryAsync
   (
      query : Windows.Security.Cryptography.Certificates.ICertificateQuery
   )
   return Windows.Address;
   
   function get_TrustedRootCertificationAuthorities
   return Windows.Security.Cryptography.Certificates.ICertificateStore;
   
   function get_IntermediateCertificationAuthorities
   return Windows.Security.Cryptography.Certificates.ICertificateStore;
   
   function GetStoreByName
   (
      storeName : Windows.String
   )
   return Windows.Security.Cryptography.Certificates.ICertificateStore;
   
   function get_Personal
   return Windows.String;
   
   function get_TrustedRootCertificationAuthorities
   return Windows.String;
   
   function get_IntermediateCertificationAuthorities
   return Windows.String;
   
   function get_Rsa
   return Windows.String;
   
   function get_Dsa
   return Windows.String;
   
   function get_Ecdh256
   return Windows.String;
   
   function get_Ecdh384
   return Windows.String;
   
   function get_Ecdh521
   return Windows.String;
   
   function get_Ecdsa256
   return Windows.String;
   
   function get_Ecdsa384
   return Windows.String;
   
   function get_Ecdsa521
   return Windows.String;
   
   function get_Ecdsa
   return Windows.String;
   
   function get_Ecdh
   return Windows.String;
   
   function get_SoftwareKeyStorageProvider
   return Windows.String;
   
   function get_SmartcardKeyStorageProvider
   return Windows.String;
   
   function get_PlatformKeyStorageProvider
   return Windows.String;
   
   function get_PassportKeyStorageProvider
   return Windows.String;
   
   function GenerateSignatureAsync
   (
      data : Windows.Storage.Streams.IBuffer
      ; signers : Windows.Security.Cryptography.Certificates.IIterable_ICmsSignerInfo
      ; certificates : Windows.Security.Cryptography.Certificates.IIterable_ICertificate
   )
   return Windows.Storage.Streams.IAsyncOperation_IBuffer;
   
   function GenerateSignatureAsync
   (
      data : Windows.Storage.Streams.IInputStream
      ; signers : Windows.Security.Cryptography.Certificates.IIterable_ICmsSignerInfo
      ; certificates : Windows.Security.Cryptography.Certificates.IIterable_ICertificate
   )
   return Windows.Storage.Streams.IAsyncOperation_IBuffer;
   

end;
