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
limited with Windows.Web.Http.Filters;
limited with Windows.Web.Http.Headers;
with Windows.Foundation.Collections;
with Windows.Foundation;
limited with Windows.Storage.Streams;
limited with Windows.Security.Cryptography.Certificates;
limited with Windows.Networking.Sockets;
--------------------------------------------------------------------------------
package Windows.Web.Http is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type HttpVersion is (
      None,
      Http10,
      Http11,
      Http20
   );
   for HttpVersion use (
      None => 0,
      Http10 => 1,
      Http11 => 2,
      Http20 => 3
   );
   for HttpVersion'Size use 32;
   
   type HttpVersion_Ptr is access HttpVersion;
   
   type HttpCompletionOption is (
      ResponseContentRead,
      ResponseHeadersRead
   );
   for HttpCompletionOption use (
      ResponseContentRead => 0,
      ResponseHeadersRead => 1
   );
   for HttpCompletionOption'Size use 32;
   
   type HttpCompletionOption_Ptr is access HttpCompletionOption;
   
   type HttpStatusCode is (
      None,
      Continue,
      SwitchingProtocols,
      Processing,
      Ok,
      Created,
      Accepted,
      NonAuthoritativeInformation,
      NoContent,
      ResetContent,
      PartialContent,
      MultiStatus,
      AlreadyReported,
      IMUsed,
      MultipleChoices,
      MovedPermanently,
      Found,
      SeeOther,
      NotModified,
      UseProxy,
      TemporaryRedirect,
      PermanentRedirect,
      BadRequest,
      Unauthorized,
      PaymentRequired,
      Forbidden,
      NotFound,
      MethodNotAllowed,
      NotAcceptable,
      ProxyAuthenticationRequired,
      RequestTimeout,
      Conflict,
      Gone,
      LengthRequired,
      PreconditionFailed,
      RequestEntityTooLarge,
      RequestUriTooLong,
      UnsupportedMediaType,
      RequestedRangeNotSatisfiable,
      ExpectationFailed,
      UnprocessableEntity,
      Locked,
      FailedDependency,
      UpgradeRequired,
      PreconditionRequired,
      TooManyRequests,
      RequestHeaderFieldsTooLarge,
      InternalServerError,
      NotImplemented,
      BadGateway,
      ServiceUnavailable,
      GatewayTimeout,
      HttpVersionNotSupported,
      VariantAlsoNegotiates,
      InsufficientStorage,
      LoopDetected,
      NotExtended,
      NetworkAuthenticationRequired
   );
   for HttpStatusCode use (
      None => 0,
      Continue => 100,
      SwitchingProtocols => 101,
      Processing => 102,
      Ok => 200,
      Created => 201,
      Accepted => 202,
      NonAuthoritativeInformation => 203,
      NoContent => 204,
      ResetContent => 205,
      PartialContent => 206,
      MultiStatus => 207,
      AlreadyReported => 208,
      IMUsed => 226,
      MultipleChoices => 300,
      MovedPermanently => 301,
      Found => 302,
      SeeOther => 303,
      NotModified => 304,
      UseProxy => 305,
      TemporaryRedirect => 307,
      PermanentRedirect => 308,
      BadRequest => 400,
      Unauthorized => 401,
      PaymentRequired => 402,
      Forbidden => 403,
      NotFound => 404,
      MethodNotAllowed => 405,
      NotAcceptable => 406,
      ProxyAuthenticationRequired => 407,
      RequestTimeout => 408,
      Conflict => 409,
      Gone => 410,
      LengthRequired => 411,
      PreconditionFailed => 412,
      RequestEntityTooLarge => 413,
      RequestUriTooLong => 414,
      UnsupportedMediaType => 415,
      RequestedRangeNotSatisfiable => 416,
      ExpectationFailed => 417,
      UnprocessableEntity => 422,
      Locked => 423,
      FailedDependency => 424,
      UpgradeRequired => 426,
      PreconditionRequired => 428,
      TooManyRequests => 429,
      RequestHeaderFieldsTooLarge => 431,
      InternalServerError => 500,
      NotImplemented => 501,
      BadGateway => 502,
      ServiceUnavailable => 503,
      GatewayTimeout => 504,
      HttpVersionNotSupported => 505,
      VariantAlsoNegotiates => 506,
      InsufficientStorage => 507,
      LoopDetected => 508,
      NotExtended => 510,
      NetworkAuthenticationRequired => 511
   );
   for HttpStatusCode'Size use 32;
   
   type HttpStatusCode_Ptr is access HttpStatusCode;
   
   type HttpProgressStage is (
      None,
      DetectingProxy,
      ResolvingName,
      ConnectingToServer,
      NegotiatingSsl,
      SendingHeaders,
      SendingContent,
      WaitingForResponse,
      ReceivingHeaders,
      ReceivingContent
   );
   for HttpProgressStage use (
      None => 0,
      DetectingProxy => 10,
      ResolvingName => 20,
      ConnectingToServer => 30,
      NegotiatingSsl => 40,
      SendingHeaders => 50,
      SendingContent => 60,
      WaitingForResponse => 70,
      ReceivingHeaders => 80,
      ReceivingContent => 90
   );
   for HttpProgressStage'Size use 32;
   
   type HttpProgressStage_Ptr is access HttpProgressStage;
   
   type HttpResponseMessageSource is (
      None,
      Cache,
      Network
   );
   for HttpResponseMessageSource use (
      None => 0,
      Cache => 1,
      Network => 2
   );
   for HttpResponseMessageSource'Size use 32;
   
   type HttpResponseMessageSource_Ptr is access HttpResponseMessageSource;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type HttpProgress is record
      Stage : Windows.Web.Http.HttpProgressStage;
      BytesSent : Windows.UInt64;
      TotalBytesToSend : Windows.GenericType;
      BytesReceived : Windows.UInt64;
      TotalBytesToReceive : Windows.GenericType;
      Retries : Windows.UInt32;
   end record;
   pragma Convention (C_Pass_By_Copy , HttpProgress);
   
   type HttpProgress_Ptr is access HttpProgress;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IHttpClientFactory_Interface;
   type IHttpClientFactory is access all IHttpClientFactory_Interface'Class;
   type IHttpClientFactory_Ptr is access all IHttpClientFactory;
   type IHttpClient_Interface;
   type IHttpClient is access all IHttpClient_Interface'Class;
   type IHttpClient_Ptr is access all IHttpClient;
   type IHttpContent_Interface;
   type IHttpContent is access all IHttpContent_Interface'Class;
   type IHttpContent_Ptr is access all IHttpContent;
   type IHttpCookieManager_Interface;
   type IHttpCookieManager is access all IHttpCookieManager_Interface'Class;
   type IHttpCookieManager_Ptr is access all IHttpCookieManager;
   type IVectorView_HttpCookie_Interface;
   type IVectorView_HttpCookie is access all IVectorView_HttpCookie_Interface'Class;
   type IVectorView_HttpCookie_Ptr is access all IVectorView_HttpCookie;
   type IIterable_HttpCookie_Interface;
   type IIterable_HttpCookie is access all IIterable_HttpCookie_Interface'Class;
   type IIterable_HttpCookie_Ptr is access all IIterable_HttpCookie;
   type IHttpCookieFactory_Interface;
   type IHttpCookieFactory is access all IHttpCookieFactory_Interface'Class;
   type IHttpCookieFactory_Ptr is access all IHttpCookieFactory;
   type IHttpCookie_Interface;
   type IHttpCookie is access all IHttpCookie_Interface'Class;
   type IHttpCookie_Ptr is access all IHttpCookie;
   type IHttpMethodStatics_Interface;
   type IHttpMethodStatics is access all IHttpMethodStatics_Interface'Class;
   type IHttpMethodStatics_Ptr is access all IHttpMethodStatics;
   type IHttpMethodFactory_Interface;
   type IHttpMethodFactory is access all IHttpMethodFactory_Interface'Class;
   type IHttpMethodFactory_Ptr is access all IHttpMethodFactory;
   type IHttpMethod_Interface;
   type IHttpMethod is access all IHttpMethod_Interface'Class;
   type IHttpMethod_Ptr is access all IHttpMethod;
   type IHttpTransportInformation_Interface;
   type IHttpTransportInformation is access all IHttpTransportInformation_Interface'Class;
   type IHttpTransportInformation_Ptr is access all IHttpTransportInformation;
   type IHttpRequestMessageFactory_Interface;
   type IHttpRequestMessageFactory is access all IHttpRequestMessageFactory_Interface'Class;
   type IHttpRequestMessageFactory_Ptr is access all IHttpRequestMessageFactory;
   type IHttpRequestMessage_Interface;
   type IHttpRequestMessage is access all IHttpRequestMessage_Interface'Class;
   type IHttpRequestMessage_Ptr is access all IHttpRequestMessage;
   type IHttpResponseMessageFactory_Interface;
   type IHttpResponseMessageFactory is access all IHttpResponseMessageFactory_Interface'Class;
   type IHttpResponseMessageFactory_Ptr is access all IHttpResponseMessageFactory;
   type IHttpResponseMessage_Interface;
   type IHttpResponseMessage is access all IHttpResponseMessage_Interface'Class;
   type IHttpResponseMessage_Ptr is access all IHttpResponseMessage;
   type IHttpStringContentFactory_Interface;
   type IHttpStringContentFactory is access all IHttpStringContentFactory_Interface'Class;
   type IHttpStringContentFactory_Ptr is access all IHttpStringContentFactory;
   type IHttpBufferContentFactory_Interface;
   type IHttpBufferContentFactory is access all IHttpBufferContentFactory_Interface'Class;
   type IHttpBufferContentFactory_Ptr is access all IHttpBufferContentFactory;
   type IHttpStreamContentFactory_Interface;
   type IHttpStreamContentFactory is access all IHttpStreamContentFactory_Interface'Class;
   type IHttpStreamContentFactory_Ptr is access all IHttpStreamContentFactory;
   type IHttpFormUrlEncodedContentFactory_Interface;
   type IHttpFormUrlEncodedContentFactory is access all IHttpFormUrlEncodedContentFactory_Interface'Class;
   type IHttpFormUrlEncodedContentFactory_Ptr is access all IHttpFormUrlEncodedContentFactory;
   type IHttpMultipartContentFactory_Interface;
   type IHttpMultipartContentFactory is access all IHttpMultipartContentFactory_Interface'Class;
   type IHttpMultipartContentFactory_Ptr is access all IHttpMultipartContentFactory;
   type IIterable_IHttpContent_Interface;
   type IIterable_IHttpContent is access all IIterable_IHttpContent_Interface'Class;
   type IIterable_IHttpContent_Ptr is access all IIterable_IHttpContent;
   type IHttpMultipartContent_Interface;
   type IHttpMultipartContent is access all IHttpMultipartContent_Interface'Class;
   type IHttpMultipartContent_Ptr is access all IHttpMultipartContent;
   type IHttpMultipartFormDataContentFactory_Interface;
   type IHttpMultipartFormDataContentFactory is access all IHttpMultipartFormDataContentFactory_Interface'Class;
   type IHttpMultipartFormDataContentFactory_Ptr is access all IHttpMultipartFormDataContentFactory;
   type IHttpMultipartFormDataContent_Interface;
   type IHttpMultipartFormDataContent is access all IHttpMultipartFormDataContent_Interface'Class;
   type IHttpMultipartFormDataContent_Ptr is access all IHttpMultipartFormDataContent;
   type IIterator_IHttpCookie_Interface;
   type IIterator_IHttpCookie is access all IIterator_IHttpCookie_Interface'Class;
   type IIterator_IHttpCookie_Ptr is access all IIterator_IHttpCookie;
   type IIterable_IHttpCookie_Interface;
   type IIterable_IHttpCookie is access all IIterable_IHttpCookie_Interface'Class;
   type IIterable_IHttpCookie_Ptr is access all IIterable_IHttpCookie;
   type IVectorView_IHttpCookie_Interface;
   type IVectorView_IHttpCookie is access all IVectorView_IHttpCookie_Interface'Class;
   type IVectorView_IHttpCookie_Ptr is access all IVectorView_IHttpCookie;
   type IVector_IHttpCookie_Interface;
   type IVector_IHttpCookie is access all IVector_IHttpCookie_Interface'Class;
   type IVector_IHttpCookie_Ptr is access all IVector_IHttpCookie;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IHttpClientFactory : aliased constant Windows.IID := (3272363722, 58362, 20377, (175, 180, 99, 204, 101, 0, 148, 98 ));
   
   type IHttpClientFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IHttpClientFactory_Interface
      ; filter : Windows.Web.Http.Filters.IHttpFilter
      ; RetVal : access Windows.Web.Http.IHttpClient
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpClient : aliased constant Windows.IID := (2144997713, 13684, 18560, (168, 186, 230, 177, 224, 6, 31, 61 ));
   
   type IHttpClient_Interface is interface and Windows.IInspectable_Interface;
   
   function DeleteAsync
   (
      This       : access IHttpClient_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetAsync
   (
      This       : access IHttpClient_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetWithOptionAsync
   (
      This       : access IHttpClient_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; completionOption : Windows.Web.Http.HttpCompletionOption
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetBufferAsync
   (
      This       : access IHttpClient_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetInputStreamAsync
   (
      This       : access IHttpClient_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetStringAsync
   (
      This       : access IHttpClient_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function PostAsync
   (
      This       : access IHttpClient_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; content : Windows.Web.Http.IHttpContent
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function PutAsync
   (
      This       : access IHttpClient_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; content : Windows.Web.Http.IHttpContent
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SendRequestAsync
   (
      This       : access IHttpClient_Interface
      ; request : Windows.Web.Http.IHttpRequestMessage
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SendRequestWithOptionAsync
   (
      This       : access IHttpClient_Interface
      ; request : Windows.Web.Http.IHttpRequestMessage
      ; completionOption : Windows.Web.Http.HttpCompletionOption
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_DefaultRequestHeaders
   (
      This       : access IHttpClient_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpRequestHeaderCollection
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpContent : aliased constant Windows.IID := (1796514881, 64423, 19410, (175, 10, 131, 157, 231, 194, 149, 218 ));
   
   type IHttpContent_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Headers
   (
      This       : access IHttpContent_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpContentHeaderCollection
   )
   return Windows.HRESULT is abstract;
   
   function BufferAllAsync
   (
      This       : access IHttpContent_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ReadAsBufferAsync
   (
      This       : access IHttpContent_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ReadAsInputStreamAsync
   (
      This       : access IHttpContent_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ReadAsStringAsync
   (
      This       : access IHttpContent_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryComputeLength
   (
      This       : access IHttpContent_Interface
      ; length : access Windows.UInt64
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function WriteToStreamAsync
   (
      This       : access IHttpContent_Interface
      ; outputStream : Windows.Storage.Streams.IOutputStream
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpCookieManager : aliased constant Windows.IID := (2051217280, 52559, 20055, (168, 74, 91, 10, 83, 214, 187, 150 ));
   
   type IHttpCookieManager_Interface is interface and Windows.IInspectable_Interface;
   
   function SetCookie
   (
      This       : access IHttpCookieManager_Interface
      ; cookie : Windows.Web.Http.IHttpCookie
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetCookieWithThirdParty
   (
      This       : access IHttpCookieManager_Interface
      ; cookie : Windows.Web.Http.IHttpCookie
      ; thirdParty : Windows.Boolean
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function DeleteCookie
   (
      This       : access IHttpCookieManager_Interface
      ; cookie : Windows.Web.Http.IHttpCookie
   )
   return Windows.HRESULT is abstract;
   
   function GetCookies
   (
      This       : access IHttpCookieManager_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Web.Http.IVectorView_HttpCookie
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_HttpCookie : aliased constant Windows.IID := (6604022, 16330, 22563, (157, 146, 134, 196, 11, 40, 173, 188 ));
   
   type IVectorView_HttpCookie_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_HttpCookie_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.Http.IHttpCookie
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_HttpCookie_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_HttpCookie_Interface
      ; value : Windows.Web.Http.IHttpCookie
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_HttpCookie_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.Http.IHttpCookie_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_HttpCookie : aliased constant Windows.IID := (247069238, 35038, 22797, (142, 160, 182, 19, 208, 171, 1, 95 ));
   
   type IIterable_HttpCookie_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_HttpCookie_Interface
      ; RetVal : access Windows.Web.Http.IHttpCookie
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpCookieFactory : aliased constant Windows.IID := (1778746793, 37660, 19665, (169, 109, 194, 23, 1, 120, 92, 95 ));
   
   type IHttpCookieFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IHttpCookieFactory_Interface
      ; name : Windows.String
      ; domain : Windows.String
      ; path : Windows.String
      ; RetVal : access Windows.Web.Http.IHttpCookie
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpCookie : aliased constant Windows.IID := (525633762, 52269, 18297, (134, 167, 136, 241, 6, 135, 210, 73 ));
   
   type IHttpCookie_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IHttpCookie_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Domain
   (
      This       : access IHttpCookie_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Path
   (
      This       : access IHttpCookie_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Expires
   (
      This       : access IHttpCookie_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Expires
   (
      This       : access IHttpCookie_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_HttpOnly
   (
      This       : access IHttpCookie_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_HttpOnly
   (
      This       : access IHttpCookie_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Secure
   (
      This       : access IHttpCookie_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Secure
   (
      This       : access IHttpCookie_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IHttpCookie_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Value
   (
      This       : access IHttpCookie_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpMethodStatics : aliased constant Windows.IID := (1691447792, 55706, 16723, (141, 198, 214, 140, 196, 204, 227, 23 ));
   
   type IHttpMethodStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Delete
   (
      This       : access IHttpMethodStatics_Interface
      ; RetVal : access Windows.Web.Http.IHttpMethod
   )
   return Windows.HRESULT is abstract;
   
   function get_Get
   (
      This       : access IHttpMethodStatics_Interface
      ; RetVal : access Windows.Web.Http.IHttpMethod
   )
   return Windows.HRESULT is abstract;
   
   function get_Head
   (
      This       : access IHttpMethodStatics_Interface
      ; RetVal : access Windows.Web.Http.IHttpMethod
   )
   return Windows.HRESULT is abstract;
   
   function get_Options
   (
      This       : access IHttpMethodStatics_Interface
      ; RetVal : access Windows.Web.Http.IHttpMethod
   )
   return Windows.HRESULT is abstract;
   
   function get_Patch
   (
      This       : access IHttpMethodStatics_Interface
      ; RetVal : access Windows.Web.Http.IHttpMethod
   )
   return Windows.HRESULT is abstract;
   
   function get_Post
   (
      This       : access IHttpMethodStatics_Interface
      ; RetVal : access Windows.Web.Http.IHttpMethod
   )
   return Windows.HRESULT is abstract;
   
   function get_Put
   (
      This       : access IHttpMethodStatics_Interface
      ; RetVal : access Windows.Web.Http.IHttpMethod
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpMethodFactory : aliased constant Windows.IID := (1011994893, 14039, 16632, (168, 109, 231, 89, 202, 242, 248, 63 ));
   
   type IHttpMethodFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IHttpMethodFactory_Interface
      ; method : Windows.String
      ; RetVal : access Windows.Web.Http.IHttpMethod
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpMethod : aliased constant Windows.IID := (1921859618, 28685, 20448, (175, 165, 64, 41, 156, 88, 219, 253 ));
   
   type IHttpMethod_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Method
   (
      This       : access IHttpMethod_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpTransportInformation : aliased constant Windows.IID := (1880256920, 50855, 20176, (131, 58, 131, 253, 139, 143, 23, 141 ));
   
   type IHttpTransportInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ServerCertificate
   (
      This       : access IHttpTransportInformation_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICertificate
   )
   return Windows.HRESULT is abstract;
   
   function get_ServerCertificateErrorSeverity
   (
      This       : access IHttpTransportInformation_Interface
      ; RetVal : access Windows.Networking.Sockets.SocketSslErrorSeverity
   )
   return Windows.HRESULT is abstract;
   
   function get_ServerCertificateErrors
   (
      This       : access IHttpTransportInformation_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.IVectorView_ChainValidationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ServerIntermediateCertificates
   (
      This       : access IHttpTransportInformation_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.IVectorView_ICertificate -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpRequestMessageFactory : aliased constant Windows.IID := (1538038094, 14470, 16686, (174, 195, 82, 236, 127, 37, 97, 111 ));
   
   type IHttpRequestMessageFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IHttpRequestMessageFactory_Interface
      ; method : Windows.Web.Http.IHttpMethod
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Web.Http.IHttpRequestMessage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpRequestMessage : aliased constant Windows.IID := (4118162236, 29908, 18449, (181, 220, 159, 139, 78, 47, 154, 191 ));
   
   type IHttpRequestMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Content
   (
      This       : access IHttpRequestMessage_Interface
      ; RetVal : access Windows.Web.Http.IHttpContent
   )
   return Windows.HRESULT is abstract;
   
   function put_Content
   (
      This       : access IHttpRequestMessage_Interface
      ; value : Windows.Web.Http.IHttpContent
   )
   return Windows.HRESULT is abstract;
   
   function get_Headers
   (
      This       : access IHttpRequestMessage_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpRequestHeaderCollection
   )
   return Windows.HRESULT is abstract;
   
   function get_Method
   (
      This       : access IHttpRequestMessage_Interface
      ; RetVal : access Windows.Web.Http.IHttpMethod
   )
   return Windows.HRESULT is abstract;
   
   function put_Method
   (
      This       : access IHttpRequestMessage_Interface
      ; value : Windows.Web.Http.IHttpMethod
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IHttpRequestMessage_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_RequestUri
   (
      This       : access IHttpRequestMessage_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_RequestUri
   (
      This       : access IHttpRequestMessage_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_TransportInformation
   (
      This       : access IHttpRequestMessage_Interface
      ; RetVal : access Windows.Web.Http.IHttpTransportInformation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpResponseMessageFactory : aliased constant Windows.IID := (1386786713, 61589, 17370, (182, 15, 124, 252, 43, 199, 234, 47 ));
   
   type IHttpResponseMessageFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IHttpResponseMessageFactory_Interface
      ; statusCode : Windows.Web.Http.HttpStatusCode
      ; RetVal : access Windows.Web.Http.IHttpResponseMessage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpResponseMessage : aliased constant Windows.IID := (4276224251, 34404, 17632, (149, 217, 66, 105, 97, 153, 191, 252 ));
   
   type IHttpResponseMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Content
   (
      This       : access IHttpResponseMessage_Interface
      ; RetVal : access Windows.Web.Http.IHttpContent
   )
   return Windows.HRESULT is abstract;
   
   function put_Content
   (
      This       : access IHttpResponseMessage_Interface
      ; value : Windows.Web.Http.IHttpContent
   )
   return Windows.HRESULT is abstract;
   
   function get_Headers
   (
      This       : access IHttpResponseMessage_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpResponseHeaderCollection
   )
   return Windows.HRESULT is abstract;
   
   function get_IsSuccessStatusCode
   (
      This       : access IHttpResponseMessage_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ReasonPhrase
   (
      This       : access IHttpResponseMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ReasonPhrase
   (
      This       : access IHttpResponseMessage_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RequestMessage
   (
      This       : access IHttpResponseMessage_Interface
      ; RetVal : access Windows.Web.Http.IHttpRequestMessage
   )
   return Windows.HRESULT is abstract;
   
   function put_RequestMessage
   (
      This       : access IHttpResponseMessage_Interface
      ; value : Windows.Web.Http.IHttpRequestMessage
   )
   return Windows.HRESULT is abstract;
   
   function get_Source
   (
      This       : access IHttpResponseMessage_Interface
      ; RetVal : access Windows.Web.Http.HttpResponseMessageSource
   )
   return Windows.HRESULT is abstract;
   
   function put_Source
   (
      This       : access IHttpResponseMessage_Interface
      ; value : Windows.Web.Http.HttpResponseMessageSource
   )
   return Windows.HRESULT is abstract;
   
   function get_StatusCode
   (
      This       : access IHttpResponseMessage_Interface
      ; RetVal : access Windows.Web.Http.HttpStatusCode
   )
   return Windows.HRESULT is abstract;
   
   function put_StatusCode
   (
      This       : access IHttpResponseMessage_Interface
      ; value : Windows.Web.Http.HttpStatusCode
   )
   return Windows.HRESULT is abstract;
   
   function get_Version
   (
      This       : access IHttpResponseMessage_Interface
      ; RetVal : access Windows.Web.Http.HttpVersion
   )
   return Windows.HRESULT is abstract;
   
   function put_Version
   (
      This       : access IHttpResponseMessage_Interface
      ; value : Windows.Web.Http.HttpVersion
   )
   return Windows.HRESULT is abstract;
   
   function EnsureSuccessStatusCode
   (
      This       : access IHttpResponseMessage_Interface
      ; RetVal : access Windows.Web.Http.IHttpResponseMessage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpStringContentFactory : aliased constant Windows.IID := (1180999003, 11923, 18667, (142, 97, 25, 103, 120, 120, 229, 127 ));
   
   type IHttpStringContentFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromString
   (
      This       : access IHttpStringContentFactory_Interface
      ; content : Windows.String
      ; RetVal : access Windows.Web.Http.IHttpContent
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromStringWithEncoding
   (
      This       : access IHttpStringContentFactory_Interface
      ; content : Windows.String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
      ; RetVal : access Windows.Web.Http.IHttpContent
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromStringWithEncodingAndMediaType
   (
      This       : access IHttpStringContentFactory_Interface
      ; content : Windows.String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
      ; mediaType : Windows.String
      ; RetVal : access Windows.Web.Http.IHttpContent
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpBufferContentFactory : aliased constant Windows.IID := (3156263315, 50207, 20471, (145, 35, 100, 53, 115, 110, 173, 194 ));
   
   type IHttpBufferContentFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromBuffer
   (
      This       : access IHttpBufferContentFactory_Interface
      ; content : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Web.Http.IHttpContent
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromBufferWithOffset
   (
      This       : access IHttpBufferContentFactory_Interface
      ; content : Windows.Storage.Streams.IBuffer
      ; offset : Windows.UInt32
      ; count : Windows.UInt32
      ; RetVal : access Windows.Web.Http.IHttpContent
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpStreamContentFactory : aliased constant Windows.IID := (4091956637, 63269, 16510, (148, 47, 14, 218, 24, 152, 9, 244 ));
   
   type IHttpStreamContentFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromInputStream
   (
      This       : access IHttpStreamContentFactory_Interface
      ; content : Windows.Storage.Streams.IInputStream
      ; RetVal : access Windows.Web.Http.IHttpContent
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpFormUrlEncodedContentFactory : aliased constant Windows.IID := (1139807116, 12147, 17154, (181, 243, 234, 233, 35, 138, 94, 1 ));
   
   type IHttpFormUrlEncodedContentFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IHttpFormUrlEncodedContentFactory_Interface
      ; content : Windows.Address
      ; RetVal : access Windows.Web.Http.IHttpContent
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpMultipartContentFactory : aliased constant Windows.IID := (2125737570, 546, 20256, (179, 114, 71, 213, 219, 93, 51, 180 ));
   
   type IHttpMultipartContentFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWithSubtype
   (
      This       : access IHttpMultipartContentFactory_Interface
      ; subtype_x : Windows.String
      ; RetVal : access Windows.Web.Http.IHttpContent
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithSubtypeAndBoundary
   (
      This       : access IHttpMultipartContentFactory_Interface
      ; subtype_x : Windows.String
      ; boundary : Windows.String
      ; RetVal : access Windows.Web.Http.IHttpContent
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IHttpContent : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_IHttpContent_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IHttpContent_Interface
      ; RetVal : access Windows.Web.Http.IHttpContent
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpMultipartContent : aliased constant Windows.IID := (3750849279, 39206, 19145, (170, 241, 224, 208, 78, 240, 155, 185 ));
   
   type IHttpMultipartContent_Interface is interface and Windows.IInspectable_Interface;
   
   function Add
   (
      This       : access IHttpMultipartContent_Interface
      ; content : Windows.Web.Http.IHttpContent
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpMultipartFormDataContentFactory : aliased constant Windows.IID := (2689430289, 20503, 17954, (147, 168, 73, 178, 74, 79, 203, 252 ));
   
   type IHttpMultipartFormDataContentFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWithBoundary
   (
      This       : access IHttpMultipartFormDataContentFactory_Interface
      ; boundary : Windows.String
      ; RetVal : access Windows.Web.Http.IHttpContent
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpMultipartFormDataContent : aliased constant Windows.IID := (1691564002, 59751, 17956, (182, 209, 207, 116, 96, 74, 74, 66 ));
   
   type IHttpMultipartFormDataContent_Interface is interface and Windows.IInspectable_Interface;
   
   function Add
   (
      This       : access IHttpMultipartFormDataContent_Interface
      ; content : Windows.Web.Http.IHttpContent
   )
   return Windows.HRESULT is abstract;
   
   function AddWithName
   (
      This       : access IHttpMultipartFormDataContent_Interface
      ; content : Windows.Web.Http.IHttpContent
      ; name : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function AddWithNameAndFileName
   (
      This       : access IHttpMultipartFormDataContent_Interface
      ; content : Windows.Web.Http.IHttpContent
      ; name : Windows.String
      ; fileName : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IHttpCookie : aliased constant Windows.IID := (1651229047, 33795, 20528, (168, 140, 116, 133, 204, 137, 215, 48 ));
   
   type IIterator_IHttpCookie_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IHttpCookie_Interface
      ; RetVal : access Windows.Web.Http.IHttpCookie
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IHttpCookie_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IHttpCookie_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IHttpCookie_Interface
      ; items : Windows.Web.Http.IHttpCookie_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IHttpCookie : aliased constant Windows.IID := (247069238, 35038, 22797, (142, 160, 182, 19, 208, 171, 1, 95 ));
   
   type IIterable_IHttpCookie_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IHttpCookie_Interface
      ; RetVal : access Windows.Web.Http.IIterator_IHttpCookie
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IHttpCookie : aliased constant Windows.IID := (6604022, 16330, 22563, (157, 146, 134, 196, 11, 40, 173, 188 ));
   
   type IVectorView_IHttpCookie_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IHttpCookie_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.Http.IHttpCookie
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IHttpCookie_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IHttpCookie_Interface
      ; value : Windows.Web.Http.IHttpCookie
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IHttpCookie_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.Http.IHttpCookie_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IHttpCookie : aliased constant Windows.IID := (2561065726, 18075, 23517, (161, 109, 112, 2, 195, 160, 133, 61 ));
   
   type IVector_IHttpCookie_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IHttpCookie_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.Http.IHttpCookie
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IHttpCookie_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IHttpCookie_Interface
      ; RetVal : access Windows.Web.Http.IVectorView_IHttpCookie
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IHttpCookie_Interface
      ; value : Windows.Web.Http.IHttpCookie
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IHttpCookie_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Http.IHttpCookie
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IHttpCookie_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Http.IHttpCookie
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IHttpCookie_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IHttpCookie_Interface
      ; value : Windows.Web.Http.IHttpCookie
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IHttpCookie_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IHttpCookie_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IHttpCookie_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.Http.IHttpCookie_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IHttpCookie_Interface
      ; items : Windows.Web.Http.IHttpCookie_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype HttpRequestMessage is Windows.Web.Http.IHttpRequestMessage;
   function Create
   (
      method : Windows.Web.Http.IHttpMethod
      ; uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Web.Http.IHttpRequestMessage;
   
   
   subtype HttpResponseMessage is Windows.Web.Http.IHttpResponseMessage;
   
   function CreateHttpResponseMessage return Windows.Web.Http.IHttpResponseMessage;
   
   subtype HttpClient is Windows.Web.Http.IHttpClient;
   
   function CreateHttpClient return Windows.Web.Http.IHttpClient;
   
   subtype HttpCookie is Windows.Web.Http.IHttpCookie;
   function Create
   (
      name : Windows.String
      ; domain : Windows.String
      ; path : Windows.String
   )
   return Windows.Web.Http.IHttpCookie;
   
   
   subtype HttpCookieCollection is Windows.Web.Http.IVectorView_HttpCookie;
   subtype HttpMethod is Windows.Web.Http.IHttpMethod;
   function Create
   (
      method : Windows.String
   )
   return Windows.Web.Http.IHttpMethod;
   
   
   subtype HttpTransportInformation is Windows.Web.Http.IHttpTransportInformation;
   subtype HttpStringContent is Windows.Web.Http.IHttpContent;
   function CreateFromString
   (
      content : Windows.String
   )
   return Windows.Web.Http.IHttpContent;
   
   function CreateFromStringWithEncoding
   (
      content : Windows.String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
   )
   return Windows.Web.Http.IHttpContent;
   
   function CreateFromStringWithEncodingAndMediaType
   (
      content : Windows.String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
      ; mediaType : Windows.String
   )
   return Windows.Web.Http.IHttpContent;
   
   
   subtype HttpBufferContent is Windows.Web.Http.IHttpContent;
   function CreateFromBuffer
   (
      content : Windows.Storage.Streams.IBuffer
   )
   return Windows.Web.Http.IHttpContent;
   
   function CreateFromBufferWithOffset
   (
      content : Windows.Storage.Streams.IBuffer
      ; offset : Windows.UInt32
      ; count : Windows.UInt32
   )
   return Windows.Web.Http.IHttpContent;
   
   
   subtype HttpStreamContent is Windows.Web.Http.IHttpContent;
   function CreateFromInputStream
   (
      content : Windows.Storage.Streams.IInputStream
   )
   return Windows.Web.Http.IHttpContent;
   
   
   subtype HttpFormUrlEncodedContent is Windows.Web.Http.IHttpContent;
   function Create
   (
      content : Windows.Address
   )
   return Windows.Web.Http.IHttpContent;
   
   
   subtype HttpMultipartContent is Windows.Web.Http.IHttpContent;
   function CreateWithSubtype
   (
      subtype_x : Windows.String
   )
   return Windows.Web.Http.IHttpContent;
   
   function CreateWithSubtypeAndBoundary
   (
      subtype_x : Windows.String
      ; boundary : Windows.String
   )
   return Windows.Web.Http.IHttpContent;
   
   
   subtype HttpMultipartFormDataContent is Windows.Web.Http.IHttpContent;
   function CreateWithBoundary
   (
      boundary : Windows.String
   )
   return Windows.Web.Http.IHttpContent;
   
   
   subtype HttpCookieManager is Windows.Web.Http.IHttpCookieManager;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function get_Delete
   return Windows.Web.Http.IHttpMethod;
   
   function get_Get
   return Windows.Web.Http.IHttpMethod;
   
   function get_Head
   return Windows.Web.Http.IHttpMethod;
   
   function get_Options
   return Windows.Web.Http.IHttpMethod;
   
   function get_Patch
   return Windows.Web.Http.IHttpMethod;
   
   function get_Post
   return Windows.Web.Http.IHttpMethod;
   
   function get_Put
   return Windows.Web.Http.IHttpMethod;
   
end;
