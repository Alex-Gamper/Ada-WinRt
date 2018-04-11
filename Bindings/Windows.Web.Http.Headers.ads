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
limited with Windows.Storage.Streams;
with Windows.Foundation.Collections;
limited with Windows.Networking;
limited with Windows.Globalization;
--------------------------------------------------------------------------------
package Windows.Web.Http.Headers is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IMap_String_String_Interface;
   type IMap_String_String is access all IMap_String_String_Interface'Class;
   type IMap_String_String_Ptr is access all IMap_String_String;
   type IIterable_IKeyValuePair_Interface;
   type IIterable_IKeyValuePair is access all IIterable_IKeyValuePair_Interface'Class;
   type IIterable_IKeyValuePair_Ptr is access all IIterable_IKeyValuePair;
   type IHttpContentHeaderCollection_Interface;
   type IHttpContentHeaderCollection is access all IHttpContentHeaderCollection_Interface'Class;
   type IHttpContentHeaderCollection_Ptr is access all IHttpContentHeaderCollection;
   type IVector_HttpContentCodingHeaderValue_Interface;
   type IVector_HttpContentCodingHeaderValue is access all IVector_HttpContentCodingHeaderValue_Interface'Class;
   type IVector_HttpContentCodingHeaderValue_Ptr is access all IVector_HttpContentCodingHeaderValue;
   type IIterable_HttpContentCodingHeaderValue_Interface;
   type IIterable_HttpContentCodingHeaderValue is access all IIterable_HttpContentCodingHeaderValue_Interface'Class;
   type IIterable_HttpContentCodingHeaderValue_Ptr is access all IIterable_HttpContentCodingHeaderValue;
   type IVector_Language_Interface;
   type IVector_Language is access all IVector_Language_Interface'Class;
   type IVector_Language_Ptr is access all IVector_Language;
   type IIterable_Language_Interface;
   type IIterable_Language is access all IIterable_Language_Interface'Class;
   type IIterable_Language_Ptr is access all IIterable_Language;
   type IHttpRequestHeaderCollection_Interface;
   type IHttpRequestHeaderCollection is access all IHttpRequestHeaderCollection_Interface'Class;
   type IHttpRequestHeaderCollection_Ptr is access all IHttpRequestHeaderCollection;
   type IVector_HttpMediaTypeWithQualityHeaderValue_Interface;
   type IVector_HttpMediaTypeWithQualityHeaderValue is access all IVector_HttpMediaTypeWithQualityHeaderValue_Interface'Class;
   type IVector_HttpMediaTypeWithQualityHeaderValue_Ptr is access all IVector_HttpMediaTypeWithQualityHeaderValue;
   type IIterable_HttpMediaTypeWithQualityHeaderValue_Interface;
   type IIterable_HttpMediaTypeWithQualityHeaderValue is access all IIterable_HttpMediaTypeWithQualityHeaderValue_Interface'Class;
   type IIterable_HttpMediaTypeWithQualityHeaderValue_Ptr is access all IIterable_HttpMediaTypeWithQualityHeaderValue;
   type IVector_HttpContentCodingWithQualityHeaderValue_Interface;
   type IVector_HttpContentCodingWithQualityHeaderValue is access all IVector_HttpContentCodingWithQualityHeaderValue_Interface'Class;
   type IVector_HttpContentCodingWithQualityHeaderValue_Ptr is access all IVector_HttpContentCodingWithQualityHeaderValue;
   type IIterable_HttpContentCodingWithQualityHeaderValue_Interface;
   type IIterable_HttpContentCodingWithQualityHeaderValue is access all IIterable_HttpContentCodingWithQualityHeaderValue_Interface'Class;
   type IIterable_HttpContentCodingWithQualityHeaderValue_Ptr is access all IIterable_HttpContentCodingWithQualityHeaderValue;
   type IVector_HttpLanguageRangeWithQualityHeaderValue_Interface;
   type IVector_HttpLanguageRangeWithQualityHeaderValue is access all IVector_HttpLanguageRangeWithQualityHeaderValue_Interface'Class;
   type IVector_HttpLanguageRangeWithQualityHeaderValue_Ptr is access all IVector_HttpLanguageRangeWithQualityHeaderValue;
   type IIterable_HttpLanguageRangeWithQualityHeaderValue_Interface;
   type IIterable_HttpLanguageRangeWithQualityHeaderValue is access all IIterable_HttpLanguageRangeWithQualityHeaderValue_Interface'Class;
   type IIterable_HttpLanguageRangeWithQualityHeaderValue_Ptr is access all IIterable_HttpLanguageRangeWithQualityHeaderValue;
   type IVector_HttpNameValueHeaderValue_Interface;
   type IVector_HttpNameValueHeaderValue is access all IVector_HttpNameValueHeaderValue_Interface'Class;
   type IVector_HttpNameValueHeaderValue_Ptr is access all IVector_HttpNameValueHeaderValue;
   type IIterable_HttpNameValueHeaderValue_Interface;
   type IIterable_HttpNameValueHeaderValue is access all IIterable_HttpNameValueHeaderValue_Interface'Class;
   type IIterable_HttpNameValueHeaderValue_Ptr is access all IIterable_HttpNameValueHeaderValue;
   type IVector_HttpConnectionOptionHeaderValue_Interface;
   type IVector_HttpConnectionOptionHeaderValue is access all IVector_HttpConnectionOptionHeaderValue_Interface'Class;
   type IVector_HttpConnectionOptionHeaderValue_Ptr is access all IVector_HttpConnectionOptionHeaderValue;
   type IIterable_HttpConnectionOptionHeaderValue_Interface;
   type IIterable_HttpConnectionOptionHeaderValue is access all IIterable_HttpConnectionOptionHeaderValue_Interface'Class;
   type IIterable_HttpConnectionOptionHeaderValue_Ptr is access all IIterable_HttpConnectionOptionHeaderValue;
   type IVector_HttpCookiePairHeaderValue_Interface;
   type IVector_HttpCookiePairHeaderValue is access all IVector_HttpCookiePairHeaderValue_Interface'Class;
   type IVector_HttpCookiePairHeaderValue_Ptr is access all IVector_HttpCookiePairHeaderValue;
   type IIterable_HttpCookiePairHeaderValue_Interface;
   type IIterable_HttpCookiePairHeaderValue is access all IIterable_HttpCookiePairHeaderValue_Interface'Class;
   type IIterable_HttpCookiePairHeaderValue_Ptr is access all IIterable_HttpCookiePairHeaderValue;
   type IVector_HttpExpectationHeaderValue_Interface;
   type IVector_HttpExpectationHeaderValue is access all IVector_HttpExpectationHeaderValue_Interface'Class;
   type IVector_HttpExpectationHeaderValue_Ptr is access all IVector_HttpExpectationHeaderValue;
   type IIterable_HttpExpectationHeaderValue_Interface;
   type IIterable_HttpExpectationHeaderValue is access all IIterable_HttpExpectationHeaderValue_Interface'Class;
   type IIterable_HttpExpectationHeaderValue_Ptr is access all IIterable_HttpExpectationHeaderValue;
   type IVector_HttpTransferCodingHeaderValue_Interface;
   type IVector_HttpTransferCodingHeaderValue is access all IVector_HttpTransferCodingHeaderValue_Interface'Class;
   type IVector_HttpTransferCodingHeaderValue_Ptr is access all IVector_HttpTransferCodingHeaderValue;
   type IIterable_HttpTransferCodingHeaderValue_Interface;
   type IIterable_HttpTransferCodingHeaderValue is access all IIterable_HttpTransferCodingHeaderValue_Interface'Class;
   type IIterable_HttpTransferCodingHeaderValue_Ptr is access all IIterable_HttpTransferCodingHeaderValue;
   type IVector_HttpProductInfoHeaderValue_Interface;
   type IVector_HttpProductInfoHeaderValue is access all IVector_HttpProductInfoHeaderValue_Interface'Class;
   type IVector_HttpProductInfoHeaderValue_Ptr is access all IVector_HttpProductInfoHeaderValue;
   type IIterable_HttpProductInfoHeaderValue_Interface;
   type IIterable_HttpProductInfoHeaderValue is access all IIterable_HttpProductInfoHeaderValue_Interface'Class;
   type IIterable_HttpProductInfoHeaderValue_Ptr is access all IIterable_HttpProductInfoHeaderValue;
   type IHttpResponseHeaderCollection_Interface;
   type IHttpResponseHeaderCollection is access all IHttpResponseHeaderCollection_Interface'Class;
   type IHttpResponseHeaderCollection_Ptr is access all IHttpResponseHeaderCollection;
   type IVector_HttpMethod_Interface;
   type IVector_HttpMethod is access all IVector_HttpMethod_Interface'Class;
   type IVector_HttpMethod_Ptr is access all IVector_HttpMethod;
   type IIterable_HttpMethod_Interface;
   type IIterable_HttpMethod is access all IIterable_HttpMethod_Interface'Class;
   type IIterable_HttpMethod_Ptr is access all IIterable_HttpMethod;
   type IVector_HttpChallengeHeaderValue_Interface;
   type IVector_HttpChallengeHeaderValue is access all IVector_HttpChallengeHeaderValue_Interface'Class;
   type IVector_HttpChallengeHeaderValue_Ptr is access all IVector_HttpChallengeHeaderValue;
   type IIterable_HttpChallengeHeaderValue_Interface;
   type IIterable_HttpChallengeHeaderValue is access all IIterable_HttpChallengeHeaderValue_Interface'Class;
   type IIterable_HttpChallengeHeaderValue_Ptr is access all IIterable_HttpChallengeHeaderValue;
   type IHttpCacheDirectiveHeaderValueCollection_Interface;
   type IHttpCacheDirectiveHeaderValueCollection is access all IHttpCacheDirectiveHeaderValueCollection_Interface'Class;
   type IHttpCacheDirectiveHeaderValueCollection_Ptr is access all IHttpCacheDirectiveHeaderValueCollection;
   type IHttpChallengeHeaderValueStatics_Interface;
   type IHttpChallengeHeaderValueStatics is access all IHttpChallengeHeaderValueStatics_Interface'Class;
   type IHttpChallengeHeaderValueStatics_Ptr is access all IHttpChallengeHeaderValueStatics;
   type IHttpChallengeHeaderValueFactory_Interface;
   type IHttpChallengeHeaderValueFactory is access all IHttpChallengeHeaderValueFactory_Interface'Class;
   type IHttpChallengeHeaderValueFactory_Ptr is access all IHttpChallengeHeaderValueFactory;
   type IHttpChallengeHeaderValue_Interface;
   type IHttpChallengeHeaderValue is access all IHttpChallengeHeaderValue_Interface'Class;
   type IHttpChallengeHeaderValue_Ptr is access all IHttpChallengeHeaderValue;
   type IHttpChallengeHeaderValueCollection_Interface;
   type IHttpChallengeHeaderValueCollection is access all IHttpChallengeHeaderValueCollection_Interface'Class;
   type IHttpChallengeHeaderValueCollection_Ptr is access all IHttpChallengeHeaderValueCollection;
   type IHttpCredentialsHeaderValueStatics_Interface;
   type IHttpCredentialsHeaderValueStatics is access all IHttpCredentialsHeaderValueStatics_Interface'Class;
   type IHttpCredentialsHeaderValueStatics_Ptr is access all IHttpCredentialsHeaderValueStatics;
   type IHttpCredentialsHeaderValueFactory_Interface;
   type IHttpCredentialsHeaderValueFactory is access all IHttpCredentialsHeaderValueFactory_Interface'Class;
   type IHttpCredentialsHeaderValueFactory_Ptr is access all IHttpCredentialsHeaderValueFactory;
   type IHttpCredentialsHeaderValue_Interface;
   type IHttpCredentialsHeaderValue is access all IHttpCredentialsHeaderValue_Interface'Class;
   type IHttpCredentialsHeaderValue_Ptr is access all IHttpCredentialsHeaderValue;
   type IHttpConnectionOptionHeaderValueStatics_Interface;
   type IHttpConnectionOptionHeaderValueStatics is access all IHttpConnectionOptionHeaderValueStatics_Interface'Class;
   type IHttpConnectionOptionHeaderValueStatics_Ptr is access all IHttpConnectionOptionHeaderValueStatics;
   type IHttpConnectionOptionHeaderValueFactory_Interface;
   type IHttpConnectionOptionHeaderValueFactory is access all IHttpConnectionOptionHeaderValueFactory_Interface'Class;
   type IHttpConnectionOptionHeaderValueFactory_Ptr is access all IHttpConnectionOptionHeaderValueFactory;
   type IHttpConnectionOptionHeaderValue_Interface;
   type IHttpConnectionOptionHeaderValue is access all IHttpConnectionOptionHeaderValue_Interface'Class;
   type IHttpConnectionOptionHeaderValue_Ptr is access all IHttpConnectionOptionHeaderValue;
   type IHttpConnectionOptionHeaderValueCollection_Interface;
   type IHttpConnectionOptionHeaderValueCollection is access all IHttpConnectionOptionHeaderValueCollection_Interface'Class;
   type IHttpConnectionOptionHeaderValueCollection_Ptr is access all IHttpConnectionOptionHeaderValueCollection;
   type IHttpContentCodingHeaderValueStatics_Interface;
   type IHttpContentCodingHeaderValueStatics is access all IHttpContentCodingHeaderValueStatics_Interface'Class;
   type IHttpContentCodingHeaderValueStatics_Ptr is access all IHttpContentCodingHeaderValueStatics;
   type IHttpContentCodingHeaderValueFactory_Interface;
   type IHttpContentCodingHeaderValueFactory is access all IHttpContentCodingHeaderValueFactory_Interface'Class;
   type IHttpContentCodingHeaderValueFactory_Ptr is access all IHttpContentCodingHeaderValueFactory;
   type IHttpContentCodingHeaderValue_Interface;
   type IHttpContentCodingHeaderValue is access all IHttpContentCodingHeaderValue_Interface'Class;
   type IHttpContentCodingHeaderValue_Ptr is access all IHttpContentCodingHeaderValue;
   type IHttpContentCodingHeaderValueCollection_Interface;
   type IHttpContentCodingHeaderValueCollection is access all IHttpContentCodingHeaderValueCollection_Interface'Class;
   type IHttpContentCodingHeaderValueCollection_Ptr is access all IHttpContentCodingHeaderValueCollection;
   type IHttpContentDispositionHeaderValueStatics_Interface;
   type IHttpContentDispositionHeaderValueStatics is access all IHttpContentDispositionHeaderValueStatics_Interface'Class;
   type IHttpContentDispositionHeaderValueStatics_Ptr is access all IHttpContentDispositionHeaderValueStatics;
   type IHttpContentDispositionHeaderValueFactory_Interface;
   type IHttpContentDispositionHeaderValueFactory is access all IHttpContentDispositionHeaderValueFactory_Interface'Class;
   type IHttpContentDispositionHeaderValueFactory_Ptr is access all IHttpContentDispositionHeaderValueFactory;
   type IHttpContentDispositionHeaderValue_Interface;
   type IHttpContentDispositionHeaderValue is access all IHttpContentDispositionHeaderValue_Interface'Class;
   type IHttpContentDispositionHeaderValue_Ptr is access all IHttpContentDispositionHeaderValue;
   type IHttpContentRangeHeaderValueStatics_Interface;
   type IHttpContentRangeHeaderValueStatics is access all IHttpContentRangeHeaderValueStatics_Interface'Class;
   type IHttpContentRangeHeaderValueStatics_Ptr is access all IHttpContentRangeHeaderValueStatics;
   type IHttpContentRangeHeaderValueFactory_Interface;
   type IHttpContentRangeHeaderValueFactory is access all IHttpContentRangeHeaderValueFactory_Interface'Class;
   type IHttpContentRangeHeaderValueFactory_Ptr is access all IHttpContentRangeHeaderValueFactory;
   type IHttpContentRangeHeaderValue_Interface;
   type IHttpContentRangeHeaderValue is access all IHttpContentRangeHeaderValue_Interface'Class;
   type IHttpContentRangeHeaderValue_Ptr is access all IHttpContentRangeHeaderValue;
   type IHttpCookiePairHeaderValueStatics_Interface;
   type IHttpCookiePairHeaderValueStatics is access all IHttpCookiePairHeaderValueStatics_Interface'Class;
   type IHttpCookiePairHeaderValueStatics_Ptr is access all IHttpCookiePairHeaderValueStatics;
   type IHttpCookiePairHeaderValueFactory_Interface;
   type IHttpCookiePairHeaderValueFactory is access all IHttpCookiePairHeaderValueFactory_Interface'Class;
   type IHttpCookiePairHeaderValueFactory_Ptr is access all IHttpCookiePairHeaderValueFactory;
   type IHttpCookiePairHeaderValue_Interface;
   type IHttpCookiePairHeaderValue is access all IHttpCookiePairHeaderValue_Interface'Class;
   type IHttpCookiePairHeaderValue_Ptr is access all IHttpCookiePairHeaderValue;
   type IHttpCookiePairHeaderValueCollection_Interface;
   type IHttpCookiePairHeaderValueCollection is access all IHttpCookiePairHeaderValueCollection_Interface'Class;
   type IHttpCookiePairHeaderValueCollection_Ptr is access all IHttpCookiePairHeaderValueCollection;
   type IHttpDateOrDeltaHeaderValueStatics_Interface;
   type IHttpDateOrDeltaHeaderValueStatics is access all IHttpDateOrDeltaHeaderValueStatics_Interface'Class;
   type IHttpDateOrDeltaHeaderValueStatics_Ptr is access all IHttpDateOrDeltaHeaderValueStatics;
   type IHttpDateOrDeltaHeaderValue_Interface;
   type IHttpDateOrDeltaHeaderValue is access all IHttpDateOrDeltaHeaderValue_Interface'Class;
   type IHttpDateOrDeltaHeaderValue_Ptr is access all IHttpDateOrDeltaHeaderValue;
   type IHttpExpectationHeaderValueStatics_Interface;
   type IHttpExpectationHeaderValueStatics is access all IHttpExpectationHeaderValueStatics_Interface'Class;
   type IHttpExpectationHeaderValueStatics_Ptr is access all IHttpExpectationHeaderValueStatics;
   type IHttpExpectationHeaderValueFactory_Interface;
   type IHttpExpectationHeaderValueFactory is access all IHttpExpectationHeaderValueFactory_Interface'Class;
   type IHttpExpectationHeaderValueFactory_Ptr is access all IHttpExpectationHeaderValueFactory;
   type IHttpExpectationHeaderValue_Interface;
   type IHttpExpectationHeaderValue is access all IHttpExpectationHeaderValue_Interface'Class;
   type IHttpExpectationHeaderValue_Ptr is access all IHttpExpectationHeaderValue;
   type IHttpExpectationHeaderValueCollection_Interface;
   type IHttpExpectationHeaderValueCollection is access all IHttpExpectationHeaderValueCollection_Interface'Class;
   type IHttpExpectationHeaderValueCollection_Ptr is access all IHttpExpectationHeaderValueCollection;
   type IHttpLanguageHeaderValueCollection_Interface;
   type IHttpLanguageHeaderValueCollection is access all IHttpLanguageHeaderValueCollection_Interface'Class;
   type IHttpLanguageHeaderValueCollection_Ptr is access all IHttpLanguageHeaderValueCollection;
   type IHttpLanguageRangeWithQualityHeaderValueStatics_Interface;
   type IHttpLanguageRangeWithQualityHeaderValueStatics is access all IHttpLanguageRangeWithQualityHeaderValueStatics_Interface'Class;
   type IHttpLanguageRangeWithQualityHeaderValueStatics_Ptr is access all IHttpLanguageRangeWithQualityHeaderValueStatics;
   type IHttpLanguageRangeWithQualityHeaderValueFactory_Interface;
   type IHttpLanguageRangeWithQualityHeaderValueFactory is access all IHttpLanguageRangeWithQualityHeaderValueFactory_Interface'Class;
   type IHttpLanguageRangeWithQualityHeaderValueFactory_Ptr is access all IHttpLanguageRangeWithQualityHeaderValueFactory;
   type IHttpLanguageRangeWithQualityHeaderValue_Interface;
   type IHttpLanguageRangeWithQualityHeaderValue is access all IHttpLanguageRangeWithQualityHeaderValue_Interface'Class;
   type IHttpLanguageRangeWithQualityHeaderValue_Ptr is access all IHttpLanguageRangeWithQualityHeaderValue;
   type IHttpLanguageRangeWithQualityHeaderValueCollection_Interface;
   type IHttpLanguageRangeWithQualityHeaderValueCollection is access all IHttpLanguageRangeWithQualityHeaderValueCollection_Interface'Class;
   type IHttpLanguageRangeWithQualityHeaderValueCollection_Ptr is access all IHttpLanguageRangeWithQualityHeaderValueCollection;
   type IHttpMediaTypeHeaderValueStatics_Interface;
   type IHttpMediaTypeHeaderValueStatics is access all IHttpMediaTypeHeaderValueStatics_Interface'Class;
   type IHttpMediaTypeHeaderValueStatics_Ptr is access all IHttpMediaTypeHeaderValueStatics;
   type IHttpMediaTypeHeaderValueFactory_Interface;
   type IHttpMediaTypeHeaderValueFactory is access all IHttpMediaTypeHeaderValueFactory_Interface'Class;
   type IHttpMediaTypeHeaderValueFactory_Ptr is access all IHttpMediaTypeHeaderValueFactory;
   type IHttpMediaTypeHeaderValue_Interface;
   type IHttpMediaTypeHeaderValue is access all IHttpMediaTypeHeaderValue_Interface'Class;
   type IHttpMediaTypeHeaderValue_Ptr is access all IHttpMediaTypeHeaderValue;
   type IHttpMediaTypeWithQualityHeaderValueStatics_Interface;
   type IHttpMediaTypeWithQualityHeaderValueStatics is access all IHttpMediaTypeWithQualityHeaderValueStatics_Interface'Class;
   type IHttpMediaTypeWithQualityHeaderValueStatics_Ptr is access all IHttpMediaTypeWithQualityHeaderValueStatics;
   type IHttpMediaTypeWithQualityHeaderValueFactory_Interface;
   type IHttpMediaTypeWithQualityHeaderValueFactory is access all IHttpMediaTypeWithQualityHeaderValueFactory_Interface'Class;
   type IHttpMediaTypeWithQualityHeaderValueFactory_Ptr is access all IHttpMediaTypeWithQualityHeaderValueFactory;
   type IHttpMediaTypeWithQualityHeaderValue_Interface;
   type IHttpMediaTypeWithQualityHeaderValue is access all IHttpMediaTypeWithQualityHeaderValue_Interface'Class;
   type IHttpMediaTypeWithQualityHeaderValue_Ptr is access all IHttpMediaTypeWithQualityHeaderValue;
   type IHttpMediaTypeWithQualityHeaderValueCollection_Interface;
   type IHttpMediaTypeWithQualityHeaderValueCollection is access all IHttpMediaTypeWithQualityHeaderValueCollection_Interface'Class;
   type IHttpMediaTypeWithQualityHeaderValueCollection_Ptr is access all IHttpMediaTypeWithQualityHeaderValueCollection;
   type IHttpMethodHeaderValueCollection_Interface;
   type IHttpMethodHeaderValueCollection is access all IHttpMethodHeaderValueCollection_Interface'Class;
   type IHttpMethodHeaderValueCollection_Ptr is access all IHttpMethodHeaderValueCollection;
   type IHttpNameValueHeaderValueStatics_Interface;
   type IHttpNameValueHeaderValueStatics is access all IHttpNameValueHeaderValueStatics_Interface'Class;
   type IHttpNameValueHeaderValueStatics_Ptr is access all IHttpNameValueHeaderValueStatics;
   type IHttpNameValueHeaderValueFactory_Interface;
   type IHttpNameValueHeaderValueFactory is access all IHttpNameValueHeaderValueFactory_Interface'Class;
   type IHttpNameValueHeaderValueFactory_Ptr is access all IHttpNameValueHeaderValueFactory;
   type IHttpNameValueHeaderValue_Interface;
   type IHttpNameValueHeaderValue is access all IHttpNameValueHeaderValue_Interface'Class;
   type IHttpNameValueHeaderValue_Ptr is access all IHttpNameValueHeaderValue;
   type IHttpProductHeaderValueStatics_Interface;
   type IHttpProductHeaderValueStatics is access all IHttpProductHeaderValueStatics_Interface'Class;
   type IHttpProductHeaderValueStatics_Ptr is access all IHttpProductHeaderValueStatics;
   type IHttpProductHeaderValueFactory_Interface;
   type IHttpProductHeaderValueFactory is access all IHttpProductHeaderValueFactory_Interface'Class;
   type IHttpProductHeaderValueFactory_Ptr is access all IHttpProductHeaderValueFactory;
   type IHttpProductHeaderValue_Interface;
   type IHttpProductHeaderValue is access all IHttpProductHeaderValue_Interface'Class;
   type IHttpProductHeaderValue_Ptr is access all IHttpProductHeaderValue;
   type IHttpProductInfoHeaderValueStatics_Interface;
   type IHttpProductInfoHeaderValueStatics is access all IHttpProductInfoHeaderValueStatics_Interface'Class;
   type IHttpProductInfoHeaderValueStatics_Ptr is access all IHttpProductInfoHeaderValueStatics;
   type IHttpProductInfoHeaderValueFactory_Interface;
   type IHttpProductInfoHeaderValueFactory is access all IHttpProductInfoHeaderValueFactory_Interface'Class;
   type IHttpProductInfoHeaderValueFactory_Ptr is access all IHttpProductInfoHeaderValueFactory;
   type IHttpProductInfoHeaderValue_Interface;
   type IHttpProductInfoHeaderValue is access all IHttpProductInfoHeaderValue_Interface'Class;
   type IHttpProductInfoHeaderValue_Ptr is access all IHttpProductInfoHeaderValue;
   type IHttpProductInfoHeaderValueCollection_Interface;
   type IHttpProductInfoHeaderValueCollection is access all IHttpProductInfoHeaderValueCollection_Interface'Class;
   type IHttpProductInfoHeaderValueCollection_Ptr is access all IHttpProductInfoHeaderValueCollection;
   type IHttpContentCodingWithQualityHeaderValueStatics_Interface;
   type IHttpContentCodingWithQualityHeaderValueStatics is access all IHttpContentCodingWithQualityHeaderValueStatics_Interface'Class;
   type IHttpContentCodingWithQualityHeaderValueStatics_Ptr is access all IHttpContentCodingWithQualityHeaderValueStatics;
   type IHttpContentCodingWithQualityHeaderValueFactory_Interface;
   type IHttpContentCodingWithQualityHeaderValueFactory is access all IHttpContentCodingWithQualityHeaderValueFactory_Interface'Class;
   type IHttpContentCodingWithQualityHeaderValueFactory_Ptr is access all IHttpContentCodingWithQualityHeaderValueFactory;
   type IHttpContentCodingWithQualityHeaderValue_Interface;
   type IHttpContentCodingWithQualityHeaderValue is access all IHttpContentCodingWithQualityHeaderValue_Interface'Class;
   type IHttpContentCodingWithQualityHeaderValue_Ptr is access all IHttpContentCodingWithQualityHeaderValue;
   type IHttpContentCodingWithQualityHeaderValueCollection_Interface;
   type IHttpContentCodingWithQualityHeaderValueCollection is access all IHttpContentCodingWithQualityHeaderValueCollection_Interface'Class;
   type IHttpContentCodingWithQualityHeaderValueCollection_Ptr is access all IHttpContentCodingWithQualityHeaderValueCollection;
   type IHttpTransferCodingHeaderValueStatics_Interface;
   type IHttpTransferCodingHeaderValueStatics is access all IHttpTransferCodingHeaderValueStatics_Interface'Class;
   type IHttpTransferCodingHeaderValueStatics_Ptr is access all IHttpTransferCodingHeaderValueStatics;
   type IHttpTransferCodingHeaderValueFactory_Interface;
   type IHttpTransferCodingHeaderValueFactory is access all IHttpTransferCodingHeaderValueFactory_Interface'Class;
   type IHttpTransferCodingHeaderValueFactory_Ptr is access all IHttpTransferCodingHeaderValueFactory;
   type IHttpTransferCodingHeaderValue_Interface;
   type IHttpTransferCodingHeaderValue is access all IHttpTransferCodingHeaderValue_Interface'Class;
   type IHttpTransferCodingHeaderValue_Ptr is access all IHttpTransferCodingHeaderValue;
   type IHttpTransferCodingHeaderValueCollection_Interface;
   type IHttpTransferCodingHeaderValueCollection is access all IHttpTransferCodingHeaderValueCollection_Interface'Class;
   type IHttpTransferCodingHeaderValueCollection_Ptr is access all IHttpTransferCodingHeaderValueCollection;
   type IIterator_IHttpNameValueHeaderValue_Interface;
   type IIterator_IHttpNameValueHeaderValue is access all IIterator_IHttpNameValueHeaderValue_Interface'Class;
   type IIterator_IHttpNameValueHeaderValue_Ptr is access all IIterator_IHttpNameValueHeaderValue;
   type IIterable_IHttpNameValueHeaderValue_Interface;
   type IIterable_IHttpNameValueHeaderValue is access all IIterable_IHttpNameValueHeaderValue_Interface'Class;
   type IIterable_IHttpNameValueHeaderValue_Ptr is access all IIterable_IHttpNameValueHeaderValue;
   type IVectorView_IHttpNameValueHeaderValue_Interface;
   type IVectorView_IHttpNameValueHeaderValue is access all IVectorView_IHttpNameValueHeaderValue_Interface'Class;
   type IVectorView_IHttpNameValueHeaderValue_Ptr is access all IVectorView_IHttpNameValueHeaderValue;
   type IVector_IHttpNameValueHeaderValue_Interface;
   type IVector_IHttpNameValueHeaderValue is access all IVector_IHttpNameValueHeaderValue_Interface'Class;
   type IVector_IHttpNameValueHeaderValue_Ptr is access all IVector_IHttpNameValueHeaderValue;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IMap_String_String : aliased constant Windows.IID := (4140955392, 18882, 21166, (129, 84, 130, 111, 153, 8, 119, 60 ));
   
   type IMap_String_String_Interface is interface and Windows.IInspectable_Interface;
   
   function Lookup
   (
      This       : access IMap_String_String_Interface
      ; key : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IMap_String_String_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function HasKey
   (
      This       : access IMap_String_String_Interface
      ; key : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IMap_String_String_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Insert
   (
      This       : access IMap_String_String_Interface
      ; key : Windows.String
      ; value : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Remove
   (
      This       : access IMap_String_String_Interface
      ; key : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IMap_String_String_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IKeyValuePair : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_IKeyValuePair_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IKeyValuePair_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpContentHeaderCollection : aliased constant Windows.IID := (1080109636, 18350, 19326, (145, 36, 105, 98, 139, 100, 170, 24 ));
   
   type IHttpContentHeaderCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContentDisposition
   (
      This       : access IHttpContentHeaderCollection_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpContentDispositionHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function put_ContentDisposition
   (
      This       : access IHttpContentHeaderCollection_Interface
      ; value : Windows.Web.Http.Headers.IHttpContentDispositionHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentEncoding
   (
      This       : access IHttpContentHeaderCollection_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpContentCodingHeaderValueCollection
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentLanguage
   (
      This       : access IHttpContentHeaderCollection_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpLanguageHeaderValueCollection
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentLength
   (
      This       : access IHttpContentHeaderCollection_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt64 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_ContentLength
   (
      This       : access IHttpContentHeaderCollection_Interface
      ; value : Windows.Foundation.IReference_UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentLocation
   (
      This       : access IHttpContentHeaderCollection_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_ContentLocation
   (
      This       : access IHttpContentHeaderCollection_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentMD5
   (
      This       : access IHttpContentHeaderCollection_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function put_ContentMD5
   (
      This       : access IHttpContentHeaderCollection_Interface
      ; value : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentRange
   (
      This       : access IHttpContentHeaderCollection_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpContentRangeHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function put_ContentRange
   (
      This       : access IHttpContentHeaderCollection_Interface
      ; value : Windows.Web.Http.Headers.IHttpContentRangeHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentType
   (
      This       : access IHttpContentHeaderCollection_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpMediaTypeHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function put_ContentType
   (
      This       : access IHttpContentHeaderCollection_Interface
      ; value : Windows.Web.Http.Headers.IHttpMediaTypeHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function get_Expires
   (
      This       : access IHttpContentHeaderCollection_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Expires
   (
      This       : access IHttpContentHeaderCollection_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_LastModified
   (
      This       : access IHttpContentHeaderCollection_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_LastModified
   (
      This       : access IHttpContentHeaderCollection_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IHttpContentHeaderCollection_Interface
      ; name : Windows.String
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function TryAppendWithoutValidation
   (
      This       : access IHttpContentHeaderCollection_Interface
      ; name : Windows.String
      ; value : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_HttpContentCodingHeaderValue : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IVector_HttpContentCodingHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_HttpContentCodingHeaderValue_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.Http.Headers.IHttpContentCodingHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_HttpContentCodingHeaderValue_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_HttpContentCodingHeaderValue_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpContentCodingHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_HttpContentCodingHeaderValue_Interface
      ; value : Windows.Web.Http.Headers.IHttpContentCodingHeaderValue
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_HttpContentCodingHeaderValue_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Http.Headers.IHttpContentCodingHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_HttpContentCodingHeaderValue_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Http.Headers.IHttpContentCodingHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_HttpContentCodingHeaderValue_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_HttpContentCodingHeaderValue_Interface
      ; value : Windows.Web.Http.Headers.IHttpContentCodingHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_HttpContentCodingHeaderValue_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_HttpContentCodingHeaderValue_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_HttpContentCodingHeaderValue_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.Http.Headers.IHttpContentCodingHeaderValue_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_HttpContentCodingHeaderValue_Interface
      ; items : Windows.Web.Http.Headers.IHttpContentCodingHeaderValue_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_HttpContentCodingHeaderValue : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_HttpContentCodingHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_HttpContentCodingHeaderValue_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpContentCodingHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_Language : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IVector_Language_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_Language_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Globalization.ILanguage
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_Language_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_Language_Interface
      ; RetVal : access Windows.Globalization.ILanguage
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_Language_Interface
      ; value : Windows.Globalization.ILanguage
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_Language_Interface
      ; index : Windows.UInt32
      ; value : Windows.Globalization.ILanguage
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_Language_Interface
      ; index : Windows.UInt32
      ; value : Windows.Globalization.ILanguage
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_Language_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_Language_Interface
      ; value : Windows.Globalization.ILanguage
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_Language_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_Language_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_Language_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Globalization.ILanguage_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_Language_Interface
      ; items : Windows.Globalization.ILanguage_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_Language : aliased constant Windows.IID := (1212193296, 25014, 23985, (166, 157, 138, 188, 70, 172, 96, 138 ));
   
   type IIterable_Language_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_Language_Interface
      ; RetVal : access Windows.Globalization.ILanguage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpRequestHeaderCollection : aliased constant Windows.IID := (2940220059, 46404, 18075, (134, 185, 172, 61, 70, 111, 234, 54 ));
   
   type IHttpRequestHeaderCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Accept
   (
      This       : access IHttpRequestHeaderCollection_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValueCollection
   )
   return Windows.HRESULT is abstract;
   
   function get_AcceptEncoding
   (
      This       : access IHttpRequestHeaderCollection_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValueCollection
   )
   return Windows.HRESULT is abstract;
   
   function get_AcceptLanguage
   (
      This       : access IHttpRequestHeaderCollection_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValueCollection
   )
   return Windows.HRESULT is abstract;
   
   function get_Authorization
   (
      This       : access IHttpRequestHeaderCollection_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpCredentialsHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function put_Authorization
   (
      This       : access IHttpRequestHeaderCollection_Interface
      ; value : Windows.Web.Http.Headers.IHttpCredentialsHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function get_CacheControl
   (
      This       : access IHttpRequestHeaderCollection_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpCacheDirectiveHeaderValueCollection
   )
   return Windows.HRESULT is abstract;
   
   function get_Connection
   (
      This       : access IHttpRequestHeaderCollection_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValueCollection
   )
   return Windows.HRESULT is abstract;
   
   function get_Cookie
   (
      This       : access IHttpRequestHeaderCollection_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpCookiePairHeaderValueCollection
   )
   return Windows.HRESULT is abstract;
   
   function get_Date
   (
      This       : access IHttpRequestHeaderCollection_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Date
   (
      This       : access IHttpRequestHeaderCollection_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Expect
   (
      This       : access IHttpRequestHeaderCollection_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpExpectationHeaderValueCollection
   )
   return Windows.HRESULT is abstract;
   
   function get_From
   (
      This       : access IHttpRequestHeaderCollection_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_From
   (
      This       : access IHttpRequestHeaderCollection_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Host
   (
      This       : access IHttpRequestHeaderCollection_Interface
      ; RetVal : access Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function put_Host
   (
      This       : access IHttpRequestHeaderCollection_Interface
      ; value : Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function get_IfModifiedSince
   (
      This       : access IHttpRequestHeaderCollection_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_IfModifiedSince
   (
      This       : access IHttpRequestHeaderCollection_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_IfUnmodifiedSince
   (
      This       : access IHttpRequestHeaderCollection_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_IfUnmodifiedSince
   (
      This       : access IHttpRequestHeaderCollection_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxForwards
   (
      This       : access IHttpRequestHeaderCollection_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxForwards
   (
      This       : access IHttpRequestHeaderCollection_Interface
      ; value : Windows.Foundation.IReference_UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ProxyAuthorization
   (
      This       : access IHttpRequestHeaderCollection_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpCredentialsHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function put_ProxyAuthorization
   (
      This       : access IHttpRequestHeaderCollection_Interface
      ; value : Windows.Web.Http.Headers.IHttpCredentialsHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function get_Referer
   (
      This       : access IHttpRequestHeaderCollection_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_Referer
   (
      This       : access IHttpRequestHeaderCollection_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_TransferEncoding
   (
      This       : access IHttpRequestHeaderCollection_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpTransferCodingHeaderValueCollection
   )
   return Windows.HRESULT is abstract;
   
   function get_UserAgent
   (
      This       : access IHttpRequestHeaderCollection_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpProductInfoHeaderValueCollection
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IHttpRequestHeaderCollection_Interface
      ; name : Windows.String
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function TryAppendWithoutValidation
   (
      This       : access IHttpRequestHeaderCollection_Interface
      ; name : Windows.String
      ; value : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_HttpMediaTypeWithQualityHeaderValue : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IVector_HttpMediaTypeWithQualityHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_HttpMediaTypeWithQualityHeaderValue_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_HttpMediaTypeWithQualityHeaderValue_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_HttpMediaTypeWithQualityHeaderValue_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_HttpMediaTypeWithQualityHeaderValue_Interface
      ; value : Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_HttpMediaTypeWithQualityHeaderValue_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_HttpMediaTypeWithQualityHeaderValue_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_HttpMediaTypeWithQualityHeaderValue_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_HttpMediaTypeWithQualityHeaderValue_Interface
      ; value : Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_HttpMediaTypeWithQualityHeaderValue_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_HttpMediaTypeWithQualityHeaderValue_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_HttpMediaTypeWithQualityHeaderValue_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_HttpMediaTypeWithQualityHeaderValue_Interface
      ; items : Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_HttpMediaTypeWithQualityHeaderValue : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_HttpMediaTypeWithQualityHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_HttpMediaTypeWithQualityHeaderValue_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_HttpContentCodingWithQualityHeaderValue : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IVector_HttpContentCodingWithQualityHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_HttpContentCodingWithQualityHeaderValue_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_HttpContentCodingWithQualityHeaderValue_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_HttpContentCodingWithQualityHeaderValue_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_HttpContentCodingWithQualityHeaderValue_Interface
      ; value : Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_HttpContentCodingWithQualityHeaderValue_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_HttpContentCodingWithQualityHeaderValue_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_HttpContentCodingWithQualityHeaderValue_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_HttpContentCodingWithQualityHeaderValue_Interface
      ; value : Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_HttpContentCodingWithQualityHeaderValue_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_HttpContentCodingWithQualityHeaderValue_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_HttpContentCodingWithQualityHeaderValue_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_HttpContentCodingWithQualityHeaderValue_Interface
      ; items : Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_HttpContentCodingWithQualityHeaderValue : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_HttpContentCodingWithQualityHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_HttpContentCodingWithQualityHeaderValue_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_HttpLanguageRangeWithQualityHeaderValue : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IVector_HttpLanguageRangeWithQualityHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_HttpLanguageRangeWithQualityHeaderValue_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_HttpLanguageRangeWithQualityHeaderValue_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_HttpLanguageRangeWithQualityHeaderValue_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_HttpLanguageRangeWithQualityHeaderValue_Interface
      ; value : Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_HttpLanguageRangeWithQualityHeaderValue_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_HttpLanguageRangeWithQualityHeaderValue_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_HttpLanguageRangeWithQualityHeaderValue_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_HttpLanguageRangeWithQualityHeaderValue_Interface
      ; value : Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_HttpLanguageRangeWithQualityHeaderValue_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_HttpLanguageRangeWithQualityHeaderValue_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_HttpLanguageRangeWithQualityHeaderValue_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_HttpLanguageRangeWithQualityHeaderValue_Interface
      ; items : Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_HttpLanguageRangeWithQualityHeaderValue : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_HttpLanguageRangeWithQualityHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_HttpLanguageRangeWithQualityHeaderValue_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_HttpNameValueHeaderValue : aliased constant Windows.IID := (754450644, 13776, 21596, (171, 130, 246, 121, 59, 231, 76, 186 ));
   
   type IVector_HttpNameValueHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_HttpNameValueHeaderValue_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.Http.Headers.IHttpNameValueHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_HttpNameValueHeaderValue_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_HttpNameValueHeaderValue_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpNameValueHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_HttpNameValueHeaderValue_Interface
      ; value : Windows.Web.Http.Headers.IHttpNameValueHeaderValue
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_HttpNameValueHeaderValue_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Http.Headers.IHttpNameValueHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_HttpNameValueHeaderValue_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Http.Headers.IHttpNameValueHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_HttpNameValueHeaderValue_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_HttpNameValueHeaderValue_Interface
      ; value : Windows.Web.Http.Headers.IHttpNameValueHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_HttpNameValueHeaderValue_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_HttpNameValueHeaderValue_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_HttpNameValueHeaderValue_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.Http.Headers.IHttpNameValueHeaderValue_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_HttpNameValueHeaderValue_Interface
      ; items : Windows.Web.Http.Headers.IHttpNameValueHeaderValue_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_HttpNameValueHeaderValue : aliased constant Windows.IID := (1480106278, 46615, 21527, (179, 46, 222, 210, 210, 125, 64, 163 ));
   
   type IIterable_HttpNameValueHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_HttpNameValueHeaderValue_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpNameValueHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_HttpConnectionOptionHeaderValue : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IVector_HttpConnectionOptionHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_HttpConnectionOptionHeaderValue_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_HttpConnectionOptionHeaderValue_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_HttpConnectionOptionHeaderValue_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_HttpConnectionOptionHeaderValue_Interface
      ; value : Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_HttpConnectionOptionHeaderValue_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_HttpConnectionOptionHeaderValue_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_HttpConnectionOptionHeaderValue_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_HttpConnectionOptionHeaderValue_Interface
      ; value : Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_HttpConnectionOptionHeaderValue_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_HttpConnectionOptionHeaderValue_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_HttpConnectionOptionHeaderValue_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_HttpConnectionOptionHeaderValue_Interface
      ; items : Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_HttpConnectionOptionHeaderValue : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_HttpConnectionOptionHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_HttpConnectionOptionHeaderValue_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_HttpCookiePairHeaderValue : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IVector_HttpCookiePairHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_HttpCookiePairHeaderValue_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.Http.Headers.IHttpCookiePairHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_HttpCookiePairHeaderValue_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_HttpCookiePairHeaderValue_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpCookiePairHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_HttpCookiePairHeaderValue_Interface
      ; value : Windows.Web.Http.Headers.IHttpCookiePairHeaderValue
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_HttpCookiePairHeaderValue_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Http.Headers.IHttpCookiePairHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_HttpCookiePairHeaderValue_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Http.Headers.IHttpCookiePairHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_HttpCookiePairHeaderValue_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_HttpCookiePairHeaderValue_Interface
      ; value : Windows.Web.Http.Headers.IHttpCookiePairHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_HttpCookiePairHeaderValue_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_HttpCookiePairHeaderValue_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_HttpCookiePairHeaderValue_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.Http.Headers.IHttpCookiePairHeaderValue_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_HttpCookiePairHeaderValue_Interface
      ; items : Windows.Web.Http.Headers.IHttpCookiePairHeaderValue_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_HttpCookiePairHeaderValue : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_HttpCookiePairHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_HttpCookiePairHeaderValue_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpCookiePairHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_HttpExpectationHeaderValue : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IVector_HttpExpectationHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_HttpExpectationHeaderValue_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.Http.Headers.IHttpExpectationHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_HttpExpectationHeaderValue_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_HttpExpectationHeaderValue_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpExpectationHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_HttpExpectationHeaderValue_Interface
      ; value : Windows.Web.Http.Headers.IHttpExpectationHeaderValue
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_HttpExpectationHeaderValue_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Http.Headers.IHttpExpectationHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_HttpExpectationHeaderValue_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Http.Headers.IHttpExpectationHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_HttpExpectationHeaderValue_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_HttpExpectationHeaderValue_Interface
      ; value : Windows.Web.Http.Headers.IHttpExpectationHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_HttpExpectationHeaderValue_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_HttpExpectationHeaderValue_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_HttpExpectationHeaderValue_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.Http.Headers.IHttpExpectationHeaderValue_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_HttpExpectationHeaderValue_Interface
      ; items : Windows.Web.Http.Headers.IHttpExpectationHeaderValue_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_HttpExpectationHeaderValue : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_HttpExpectationHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_HttpExpectationHeaderValue_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpExpectationHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_HttpTransferCodingHeaderValue : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IVector_HttpTransferCodingHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_HttpTransferCodingHeaderValue_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_HttpTransferCodingHeaderValue_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_HttpTransferCodingHeaderValue_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_HttpTransferCodingHeaderValue_Interface
      ; value : Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_HttpTransferCodingHeaderValue_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_HttpTransferCodingHeaderValue_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_HttpTransferCodingHeaderValue_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_HttpTransferCodingHeaderValue_Interface
      ; value : Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_HttpTransferCodingHeaderValue_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_HttpTransferCodingHeaderValue_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_HttpTransferCodingHeaderValue_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_HttpTransferCodingHeaderValue_Interface
      ; items : Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_HttpTransferCodingHeaderValue : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_HttpTransferCodingHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_HttpTransferCodingHeaderValue_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_HttpProductInfoHeaderValue : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IVector_HttpProductInfoHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_HttpProductInfoHeaderValue_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.Http.Headers.IHttpProductInfoHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_HttpProductInfoHeaderValue_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_HttpProductInfoHeaderValue_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpProductInfoHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_HttpProductInfoHeaderValue_Interface
      ; value : Windows.Web.Http.Headers.IHttpProductInfoHeaderValue
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_HttpProductInfoHeaderValue_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Http.Headers.IHttpProductInfoHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_HttpProductInfoHeaderValue_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Http.Headers.IHttpProductInfoHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_HttpProductInfoHeaderValue_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_HttpProductInfoHeaderValue_Interface
      ; value : Windows.Web.Http.Headers.IHttpProductInfoHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_HttpProductInfoHeaderValue_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_HttpProductInfoHeaderValue_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_HttpProductInfoHeaderValue_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.Http.Headers.IHttpProductInfoHeaderValue_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_HttpProductInfoHeaderValue_Interface
      ; items : Windows.Web.Http.Headers.IHttpProductInfoHeaderValue_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_HttpProductInfoHeaderValue : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_HttpProductInfoHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_HttpProductInfoHeaderValue_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpProductInfoHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpResponseHeaderCollection : aliased constant Windows.IID := (2056849769, 64063, 16877, (170, 198, 191, 149, 121, 117, 193, 107 ));
   
   type IHttpResponseHeaderCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Age
   (
      This       : access IHttpResponseHeaderCollection_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Age
   (
      This       : access IHttpResponseHeaderCollection_Interface
      ; value : Windows.Foundation.IReference_TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Allow
   (
      This       : access IHttpResponseHeaderCollection_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpMethodHeaderValueCollection
   )
   return Windows.HRESULT is abstract;
   
   function get_CacheControl
   (
      This       : access IHttpResponseHeaderCollection_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpCacheDirectiveHeaderValueCollection
   )
   return Windows.HRESULT is abstract;
   
   function get_Connection
   (
      This       : access IHttpResponseHeaderCollection_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValueCollection
   )
   return Windows.HRESULT is abstract;
   
   function get_Date
   (
      This       : access IHttpResponseHeaderCollection_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Date
   (
      This       : access IHttpResponseHeaderCollection_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Location
   (
      This       : access IHttpResponseHeaderCollection_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_Location
   (
      This       : access IHttpResponseHeaderCollection_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_ProxyAuthenticate
   (
      This       : access IHttpResponseHeaderCollection_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpChallengeHeaderValueCollection
   )
   return Windows.HRESULT is abstract;
   
   function get_RetryAfter
   (
      This       : access IHttpResponseHeaderCollection_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpDateOrDeltaHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function put_RetryAfter
   (
      This       : access IHttpResponseHeaderCollection_Interface
      ; value : Windows.Web.Http.Headers.IHttpDateOrDeltaHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function get_TransferEncoding
   (
      This       : access IHttpResponseHeaderCollection_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpTransferCodingHeaderValueCollection
   )
   return Windows.HRESULT is abstract;
   
   function get_WwwAuthenticate
   (
      This       : access IHttpResponseHeaderCollection_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpChallengeHeaderValueCollection
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IHttpResponseHeaderCollection_Interface
      ; name : Windows.String
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function TryAppendWithoutValidation
   (
      This       : access IHttpResponseHeaderCollection_Interface
      ; name : Windows.String
      ; value : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_HttpMethod : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IVector_HttpMethod_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_HttpMethod_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.Http.IHttpMethod
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_HttpMethod_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_HttpMethod_Interface
      ; RetVal : access Windows.Web.Http.IHttpMethod
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_HttpMethod_Interface
      ; value : Windows.Web.Http.IHttpMethod
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_HttpMethod_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Http.IHttpMethod
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_HttpMethod_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Http.IHttpMethod
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_HttpMethod_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_HttpMethod_Interface
      ; value : Windows.Web.Http.IHttpMethod
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_HttpMethod_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_HttpMethod_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_HttpMethod_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.Http.IHttpMethod_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_HttpMethod_Interface
      ; items : Windows.Web.Http.IHttpMethod_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_HttpMethod : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_HttpMethod_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_HttpMethod_Interface
      ; RetVal : access Windows.Web.Http.IHttpMethod
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_HttpChallengeHeaderValue : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IVector_HttpChallengeHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_HttpChallengeHeaderValue_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.Http.Headers.IHttpChallengeHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_HttpChallengeHeaderValue_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_HttpChallengeHeaderValue_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpChallengeHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_HttpChallengeHeaderValue_Interface
      ; value : Windows.Web.Http.Headers.IHttpChallengeHeaderValue
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_HttpChallengeHeaderValue_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Http.Headers.IHttpChallengeHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_HttpChallengeHeaderValue_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Http.Headers.IHttpChallengeHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_HttpChallengeHeaderValue_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_HttpChallengeHeaderValue_Interface
      ; value : Windows.Web.Http.Headers.IHttpChallengeHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_HttpChallengeHeaderValue_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_HttpChallengeHeaderValue_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_HttpChallengeHeaderValue_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.Http.Headers.IHttpChallengeHeaderValue_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_HttpChallengeHeaderValue_Interface
      ; items : Windows.Web.Http.Headers.IHttpChallengeHeaderValue_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_HttpChallengeHeaderValue : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_HttpChallengeHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_HttpChallengeHeaderValue_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpChallengeHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpCacheDirectiveHeaderValueCollection : aliased constant Windows.IID := (2589485961, 54736, 20414, (189, 157, 181, 179, 99, 104, 17, 180 ));
   
   type IHttpCacheDirectiveHeaderValueCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MaxAge
   (
      This       : access IHttpCacheDirectiveHeaderValueCollection_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxAge
   (
      This       : access IHttpCacheDirectiveHeaderValueCollection_Interface
      ; value : Windows.Foundation.IReference_TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxStale
   (
      This       : access IHttpCacheDirectiveHeaderValueCollection_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxStale
   (
      This       : access IHttpCacheDirectiveHeaderValueCollection_Interface
      ; value : Windows.Foundation.IReference_TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_MinFresh
   (
      This       : access IHttpCacheDirectiveHeaderValueCollection_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_MinFresh
   (
      This       : access IHttpCacheDirectiveHeaderValueCollection_Interface
      ; value : Windows.Foundation.IReference_TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_SharedMaxAge
   (
      This       : access IHttpCacheDirectiveHeaderValueCollection_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_SharedMaxAge
   (
      This       : access IHttpCacheDirectiveHeaderValueCollection_Interface
      ; value : Windows.Foundation.IReference_TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function ParseAdd
   (
      This       : access IHttpCacheDirectiveHeaderValueCollection_Interface
      ; input : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function TryParseAdd
   (
      This       : access IHttpCacheDirectiveHeaderValueCollection_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpChallengeHeaderValueStatics : aliased constant Windows.IID := (4090727026, 64513, 19713, (160, 8, 252, 183, 196, 89, 214, 53 ));
   
   type IHttpChallengeHeaderValueStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Parse
   (
      This       : access IHttpChallengeHeaderValueStatics_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpChallengeHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function TryParse
   (
      This       : access IHttpChallengeHeaderValueStatics_Interface
      ; input : Windows.String
      ; challengeHeaderValue : access Windows.Web.Http.Headers.IHttpChallengeHeaderValue
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpChallengeHeaderValueFactory : aliased constant Windows.IID := (3293758545, 55708, 16554, (147, 153, 144, 238, 185, 143, 198, 19 ));
   
   type IHttpChallengeHeaderValueFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromScheme
   (
      This       : access IHttpChallengeHeaderValueFactory_Interface
      ; scheme : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpChallengeHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromSchemeWithToken
   (
      This       : access IHttpChallengeHeaderValueFactory_Interface
      ; scheme : Windows.String
      ; token : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpChallengeHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpChallengeHeaderValue : aliased constant Windows.IID := (959668655, 3965, 18464, (159, 221, 162, 185, 86, 238, 174, 171 ));
   
   type IHttpChallengeHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Parameters
   (
      This       : access IHttpChallengeHeaderValue_Interface
      ; RetVal : access Windows.Web.Http.Headers.IVector_IHttpNameValueHeaderValue -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Scheme
   (
      This       : access IHttpChallengeHeaderValue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Token
   (
      This       : access IHttpChallengeHeaderValue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpChallengeHeaderValueCollection : aliased constant Windows.IID := (3399376769, 44768, 17235, (161, 11, 230, 37, 186, 189, 100, 194 ));
   
   type IHttpChallengeHeaderValueCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function ParseAdd
   (
      This       : access IHttpChallengeHeaderValueCollection_Interface
      ; input : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function TryParseAdd
   (
      This       : access IHttpChallengeHeaderValueCollection_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpCredentialsHeaderValueStatics : aliased constant Windows.IID := (2795187174, 52876, 17475, (163, 90, 27, 114, 123, 19, 16, 54 ));
   
   type IHttpCredentialsHeaderValueStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Parse
   (
      This       : access IHttpCredentialsHeaderValueStatics_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpCredentialsHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function TryParse
   (
      This       : access IHttpCredentialsHeaderValueStatics_Interface
      ; input : Windows.String
      ; credentialsHeaderValue : access Windows.Web.Http.Headers.IHttpCredentialsHeaderValue
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpCredentialsHeaderValueFactory : aliased constant Windows.IID := (4062027409, 19740, 16770, (191, 209, 52, 71, 10, 98, 249, 80 ));
   
   type IHttpCredentialsHeaderValueFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromScheme
   (
      This       : access IHttpCredentialsHeaderValueFactory_Interface
      ; scheme : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpCredentialsHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromSchemeWithToken
   (
      This       : access IHttpCredentialsHeaderValueFactory_Interface
      ; scheme : Windows.String
      ; token : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpCredentialsHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpCredentialsHeaderValue : aliased constant Windows.IID := (3276587979, 21550, 16759, (166, 199, 182, 116, 206, 25, 63, 191 ));
   
   type IHttpCredentialsHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Parameters
   (
      This       : access IHttpCredentialsHeaderValue_Interface
      ; RetVal : access Windows.Web.Http.Headers.IVector_IHttpNameValueHeaderValue -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Scheme
   (
      This       : access IHttpCredentialsHeaderValue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Token
   (
      This       : access IHttpCredentialsHeaderValue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpConnectionOptionHeaderValueStatics : aliased constant Windows.IID := (2863095095, 43334, 19231, (133, 175, 72, 182, 139, 60, 80, 189 ));
   
   type IHttpConnectionOptionHeaderValueStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Parse
   (
      This       : access IHttpConnectionOptionHeaderValueStatics_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function TryParse
   (
      This       : access IHttpConnectionOptionHeaderValueStatics_Interface
      ; input : Windows.String
      ; connectionOptionHeaderValue : access Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpConnectionOptionHeaderValueFactory : aliased constant Windows.IID := (3644640286, 2941, 19519, (165, 141, 162, 161, 189, 234, 188, 10 ));
   
   type IHttpConnectionOptionHeaderValueFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IHttpConnectionOptionHeaderValueFactory_Interface
      ; token : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpConnectionOptionHeaderValue : aliased constant Windows.IID := (3410686586, 20112, 17899, (141, 205, 253, 20, 8, 244, 196, 79 ));
   
   type IHttpConnectionOptionHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Token
   (
      This       : access IHttpConnectionOptionHeaderValue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpConnectionOptionHeaderValueCollection : aliased constant Windows.IID := (3841289245, 20802, 19968, (142, 15, 1, 149, 9, 51, 118, 41 ));
   
   type IHttpConnectionOptionHeaderValueCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function ParseAdd
   (
      This       : access IHttpConnectionOptionHeaderValueCollection_Interface
      ; input : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function TryParseAdd
   (
      This       : access IHttpConnectionOptionHeaderValueCollection_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpContentCodingHeaderValueStatics : aliased constant Windows.IID := (2497208366, 63935, 17143, (170, 70, 237, 39, 42, 65, 226, 18 ));
   
   type IHttpContentCodingHeaderValueStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Parse
   (
      This       : access IHttpContentCodingHeaderValueStatics_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpContentCodingHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function TryParse
   (
      This       : access IHttpContentCodingHeaderValueStatics_Interface
      ; input : Windows.String
      ; contentCodingHeaderValue : access Windows.Web.Http.Headers.IHttpContentCodingHeaderValue
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpContentCodingHeaderValueFactory : aliased constant Windows.IID := (3309120471, 13099, 17232, (133, 16, 46, 103, 162, 40, 154, 90 ));
   
   type IHttpContentCodingHeaderValueFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IHttpContentCodingHeaderValueFactory_Interface
      ; contentCoding : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpContentCodingHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpContentCodingHeaderValue : aliased constant Windows.IID := (3170367786, 37750, 19845, (188, 204, 159, 79, 154, 202, 180, 52 ));
   
   type IHttpContentCodingHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContentCoding
   (
      This       : access IHttpContentCodingHeaderValue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpContentCodingHeaderValueCollection : aliased constant Windows.IID := (2099386145, 42715, 17262, (142, 131, 145, 89, 97, 146, 129, 156 ));
   
   type IHttpContentCodingHeaderValueCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function ParseAdd
   (
      This       : access IHttpContentCodingHeaderValueCollection_Interface
      ; input : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function TryParseAdd
   (
      This       : access IHttpContentCodingHeaderValueCollection_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpContentDispositionHeaderValueStatics : aliased constant Windows.IID := (700801127, 23095, 18148, (176, 116, 197, 23, 125, 105, 202, 102 ));
   
   type IHttpContentDispositionHeaderValueStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Parse
   (
      This       : access IHttpContentDispositionHeaderValueStatics_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpContentDispositionHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function TryParse
   (
      This       : access IHttpContentDispositionHeaderValueStatics_Interface
      ; input : Windows.String
      ; contentDispositionHeaderValue : access Windows.Web.Http.Headers.IHttpContentDispositionHeaderValue
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpContentDispositionHeaderValueFactory : aliased constant Windows.IID := (2568338372, 17772, 20097, (130, 149, 178, 171, 60, 188, 245, 69 ));
   
   type IHttpContentDispositionHeaderValueFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IHttpContentDispositionHeaderValueFactory_Interface
      ; dispositionType : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpContentDispositionHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpContentDispositionHeaderValue : aliased constant Windows.IID := (4070764252, 9769, 19273, (153, 8, 150, 161, 104, 233, 54, 94 ));
   
   type IHttpContentDispositionHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DispositionType
   (
      This       : access IHttpContentDispositionHeaderValue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DispositionType
   (
      This       : access IHttpContentDispositionHeaderValue_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FileName
   (
      This       : access IHttpContentDispositionHeaderValue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_FileName
   (
      This       : access IHttpContentDispositionHeaderValue_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FileNameStar
   (
      This       : access IHttpContentDispositionHeaderValue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_FileNameStar
   (
      This       : access IHttpContentDispositionHeaderValue_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access IHttpContentDispositionHeaderValue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Name
   (
      This       : access IHttpContentDispositionHeaderValue_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Parameters
   (
      This       : access IHttpContentDispositionHeaderValue_Interface
      ; RetVal : access Windows.Web.Http.Headers.IVector_IHttpNameValueHeaderValue -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IHttpContentDispositionHeaderValue_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt64 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Size
   (
      This       : access IHttpContentDispositionHeaderValue_Interface
      ; value : Windows.Foundation.IReference_UInt64
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpContentRangeHeaderValueStatics : aliased constant Windows.IID := (2158184138, 5964, 20398, (130, 28, 19, 76, 210, 148, 170, 56 ));
   
   type IHttpContentRangeHeaderValueStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Parse
   (
      This       : access IHttpContentRangeHeaderValueStatics_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpContentRangeHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function TryParse
   (
      This       : access IHttpContentRangeHeaderValueStatics_Interface
      ; input : Windows.String
      ; contentRangeHeaderValue : access Windows.Web.Http.Headers.IHttpContentRangeHeaderValue
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpContentRangeHeaderValueFactory : aliased constant Windows.IID := (1062983313, 41020, 17494, (154, 111, 239, 39, 236, 208, 60, 174 ));
   
   type IHttpContentRangeHeaderValueFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromLength
   (
      This       : access IHttpContentRangeHeaderValueFactory_Interface
      ; length : Windows.UInt64
      ; RetVal : access Windows.Web.Http.Headers.IHttpContentRangeHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromRange
   (
      This       : access IHttpContentRangeHeaderValueFactory_Interface
      ; from : Windows.UInt64
      ; to : Windows.UInt64
      ; RetVal : access Windows.Web.Http.Headers.IHttpContentRangeHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromRangeWithLength
   (
      This       : access IHttpContentRangeHeaderValueFactory_Interface
      ; from : Windows.UInt64
      ; to : Windows.UInt64
      ; length : Windows.UInt64
      ; RetVal : access Windows.Web.Http.Headers.IHttpContentRangeHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpContentRangeHeaderValue : aliased constant Windows.IID := (81356755, 42230, 18780, (149, 48, 133, 121, 252, 186, 138, 169 ));
   
   type IHttpContentRangeHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FirstBytePosition
   (
      This       : access IHttpContentRangeHeaderValue_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt64 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_LastBytePosition
   (
      This       : access IHttpContentRangeHeaderValue_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt64 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Length
   (
      This       : access IHttpContentRangeHeaderValue_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt64 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Unit
   (
      This       : access IHttpContentRangeHeaderValue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Unit
   (
      This       : access IHttpContentRangeHeaderValue_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpCookiePairHeaderValueStatics : aliased constant Windows.IID := (1854303560, 1711, 17506, (129, 88, 153, 56, 141, 93, 202, 129 ));
   
   type IHttpCookiePairHeaderValueStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Parse
   (
      This       : access IHttpCookiePairHeaderValueStatics_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpCookiePairHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function TryParse
   (
      This       : access IHttpCookiePairHeaderValueStatics_Interface
      ; input : Windows.String
      ; cookiePairHeaderValue : access Windows.Web.Http.Headers.IHttpCookiePairHeaderValue
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpCookiePairHeaderValueFactory : aliased constant Windows.IID := (1667117679, 5231, 20310, (170, 33, 44, 183, 214, 213, 139, 30 ));
   
   type IHttpCookiePairHeaderValueFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromName
   (
      This       : access IHttpCookiePairHeaderValueFactory_Interface
      ; name : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpCookiePairHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromNameWithValue
   (
      This       : access IHttpCookiePairHeaderValueFactory_Interface
      ; name : Windows.String
      ; value : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpCookiePairHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpCookiePairHeaderValue : aliased constant Windows.IID := (3419693591, 19241, 16683, (189, 144, 179, 216, 20, 171, 142, 27 ));
   
   type IHttpCookiePairHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IHttpCookiePairHeaderValue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IHttpCookiePairHeaderValue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Value
   (
      This       : access IHttpCookiePairHeaderValue_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpCookiePairHeaderValueCollection : aliased constant Windows.IID := (4092871504, 22558, 20172, (159, 89, 229, 7, 208, 79, 6, 230 ));
   
   type IHttpCookiePairHeaderValueCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function ParseAdd
   (
      This       : access IHttpCookiePairHeaderValueCollection_Interface
      ; input : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function TryParseAdd
   (
      This       : access IHttpCookiePairHeaderValueCollection_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpDateOrDeltaHeaderValueStatics : aliased constant Windows.IID := (2082888104, 26226, 20112, (154, 154, 243, 151, 102, 247, 245, 118 ));
   
   type IHttpDateOrDeltaHeaderValueStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Parse
   (
      This       : access IHttpDateOrDeltaHeaderValueStatics_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpDateOrDeltaHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function TryParse
   (
      This       : access IHttpDateOrDeltaHeaderValueStatics_Interface
      ; input : Windows.String
      ; dateOrDeltaHeaderValue : access Windows.Web.Http.Headers.IHttpDateOrDeltaHeaderValue
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpDateOrDeltaHeaderValue : aliased constant Windows.IID := (3942427242, 50396, 18914, (162, 125, 4, 58, 223, 88, 103, 163 ));
   
   type IHttpDateOrDeltaHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Date
   (
      This       : access IHttpDateOrDeltaHeaderValue_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Delta
   (
      This       : access IHttpDateOrDeltaHeaderValue_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpExpectationHeaderValueStatics : aliased constant Windows.IID := (806988770, 53221, 18235, (165, 127, 251, 165, 177, 78, 178, 87 ));
   
   type IHttpExpectationHeaderValueStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Parse
   (
      This       : access IHttpExpectationHeaderValueStatics_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpExpectationHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function TryParse
   (
      This       : access IHttpExpectationHeaderValueStatics_Interface
      ; input : Windows.String
      ; expectationHeaderValue : access Windows.Web.Http.Headers.IHttpExpectationHeaderValue
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpExpectationHeaderValueFactory : aliased constant Windows.IID := (1319269835, 54590, 18536, (136, 86, 30, 33, 165, 3, 13, 192 ));
   
   type IHttpExpectationHeaderValueFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromName
   (
      This       : access IHttpExpectationHeaderValueFactory_Interface
      ; name : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpExpectationHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromNameWithValue
   (
      This       : access IHttpExpectationHeaderValueFactory_Interface
      ; name : Windows.String
      ; value : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpExpectationHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpExpectationHeaderValue : aliased constant Windows.IID := (1290110413, 15001, 17327, (162, 230, 236, 35, 47, 234, 150, 88 ));
   
   type IHttpExpectationHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IHttpExpectationHeaderValue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IHttpExpectationHeaderValue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Value
   (
      This       : access IHttpExpectationHeaderValue_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Parameters
   (
      This       : access IHttpExpectationHeaderValue_Interface
      ; RetVal : access Windows.Web.Http.Headers.IVector_IHttpNameValueHeaderValue -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpExpectationHeaderValueCollection : aliased constant Windows.IID := (3884261811, 41186, 19140, (158, 102, 121, 112, 108, 185, 253, 88 ));
   
   type IHttpExpectationHeaderValueCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function ParseAdd
   (
      This       : access IHttpExpectationHeaderValueCollection_Interface
      ; input : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function TryParseAdd
   (
      This       : access IHttpExpectationHeaderValueCollection_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpLanguageHeaderValueCollection : aliased constant Windows.IID := (2663218339, 33305, 17654, (153, 2, 140, 86, 223, 211, 52, 12 ));
   
   type IHttpLanguageHeaderValueCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function ParseAdd
   (
      This       : access IHttpLanguageHeaderValueCollection_Interface
      ; input : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function TryParseAdd
   (
      This       : access IHttpLanguageHeaderValueCollection_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpLanguageRangeWithQualityHeaderValueStatics : aliased constant Windows.IID := (625074502, 62216, 18165, (182, 149, 66, 245, 64, 36, 236, 104 ));
   
   type IHttpLanguageRangeWithQualityHeaderValueStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Parse
   (
      This       : access IHttpLanguageRangeWithQualityHeaderValueStatics_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function TryParse
   (
      This       : access IHttpLanguageRangeWithQualityHeaderValueStatics_Interface
      ; input : Windows.String
      ; languageRangeWithQualityHeaderValue : access Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpLanguageRangeWithQualityHeaderValueFactory : aliased constant Windows.IID := (2075670896, 30735, 19587, (159, 228, 220, 48, 135, 246, 189, 85 ));
   
   type IHttpLanguageRangeWithQualityHeaderValueFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromLanguageRange
   (
      This       : access IHttpLanguageRangeWithQualityHeaderValueFactory_Interface
      ; languageRange : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromLanguageRangeWithQuality
   (
      This       : access IHttpLanguageRangeWithQualityHeaderValueFactory_Interface
      ; languageRange : Windows.String
      ; quality : Windows.Double
      ; RetVal : access Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpLanguageRangeWithQualityHeaderValue : aliased constant Windows.IID := (1918296322, 128, 19892, (160, 131, 125, 231, 178, 229, 186, 76 ));
   
   type IHttpLanguageRangeWithQualityHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LanguageRange
   (
      This       : access IHttpLanguageRangeWithQualityHeaderValue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Quality
   (
      This       : access IHttpLanguageRangeWithQualityHeaderValue_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpLanguageRangeWithQualityHeaderValueCollection : aliased constant Windows.IID := (2287819453, 19279, 18442, (137, 206, 138, 237, 206, 230, 227, 160 ));
   
   type IHttpLanguageRangeWithQualityHeaderValueCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function ParseAdd
   (
      This       : access IHttpLanguageRangeWithQualityHeaderValueCollection_Interface
      ; input : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function TryParseAdd
   (
      This       : access IHttpLanguageRangeWithQualityHeaderValueCollection_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpMediaTypeHeaderValueStatics : aliased constant Windows.IID := (3763176415, 7489, 19852, (162, 222, 111, 210, 237, 135, 57, 155 ));
   
   type IHttpMediaTypeHeaderValueStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Parse
   (
      This       : access IHttpMediaTypeHeaderValueStatics_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpMediaTypeHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function TryParse
   (
      This       : access IHttpMediaTypeHeaderValueStatics_Interface
      ; input : Windows.String
      ; mediaTypeHeaderValue : access Windows.Web.Http.Headers.IHttpMediaTypeHeaderValue
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpMediaTypeHeaderValueFactory : aliased constant Windows.IID := (3201779624, 52503, 17117, (147, 103, 171, 156, 91, 86, 221, 125 ));
   
   type IHttpMediaTypeHeaderValueFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IHttpMediaTypeHeaderValueFactory_Interface
      ; mediaType : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpMediaTypeHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpMediaTypeHeaderValue : aliased constant Windows.IID := (380798259, 59176, 20427, (189, 176, 8, 164, 49, 161, 72, 68 ));
   
   type IHttpMediaTypeHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CharSet
   (
      This       : access IHttpMediaTypeHeaderValue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_CharSet
   (
      This       : access IHttpMediaTypeHeaderValue_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MediaType
   (
      This       : access IHttpMediaTypeHeaderValue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_MediaType
   (
      This       : access IHttpMediaTypeHeaderValue_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Parameters
   (
      This       : access IHttpMediaTypeHeaderValue_Interface
      ; RetVal : access Windows.Web.Http.Headers.IVector_IHttpNameValueHeaderValue -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpMediaTypeWithQualityHeaderValueStatics : aliased constant Windows.IID := (1527188697, 46432, 20424, (152, 53, 126, 108, 10, 101, 123, 36 ));
   
   type IHttpMediaTypeWithQualityHeaderValueStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Parse
   (
      This       : access IHttpMediaTypeWithQualityHeaderValueStatics_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function TryParse
   (
      This       : access IHttpMediaTypeWithQualityHeaderValueStatics_Interface
      ; input : Windows.String
      ; mediaTypeWithQualityHeaderValue : access Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpMediaTypeWithQualityHeaderValueFactory : aliased constant Windows.IID := (1282220276, 37975, 17638, (163, 35, 209, 34, 185, 88, 120, 11 ));
   
   type IHttpMediaTypeWithQualityHeaderValueFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromMediaType
   (
      This       : access IHttpMediaTypeWithQualityHeaderValueFactory_Interface
      ; mediaType : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromMediaTypeWithQuality
   (
      This       : access IHttpMediaTypeWithQualityHeaderValueFactory_Interface
      ; mediaType : Windows.String
      ; quality : Windows.Double
      ; RetVal : access Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpMediaTypeWithQualityHeaderValue : aliased constant Windows.IID := (411917874, 30398, 17568, (177, 205, 32, 116, 189, 237, 45, 222 ));
   
   type IHttpMediaTypeWithQualityHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CharSet
   (
      This       : access IHttpMediaTypeWithQualityHeaderValue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_CharSet
   (
      This       : access IHttpMediaTypeWithQualityHeaderValue_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MediaType
   (
      This       : access IHttpMediaTypeWithQualityHeaderValue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_MediaType
   (
      This       : access IHttpMediaTypeWithQualityHeaderValue_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Parameters
   (
      This       : access IHttpMediaTypeWithQualityHeaderValue_Interface
      ; RetVal : access Windows.Web.Http.Headers.IVector_IHttpNameValueHeaderValue -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Quality
   (
      This       : access IHttpMediaTypeWithQualityHeaderValue_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Quality
   (
      This       : access IHttpMediaTypeWithQualityHeaderValue_Interface
      ; value : Windows.Foundation.IReference_Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpMediaTypeWithQualityHeaderValueCollection : aliased constant Windows.IID := (1007446899, 4930, 17799, (160, 86, 24, 208, 47, 246, 113, 101 ));
   
   type IHttpMediaTypeWithQualityHeaderValueCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function ParseAdd
   (
      This       : access IHttpMediaTypeWithQualityHeaderValueCollection_Interface
      ; input : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function TryParseAdd
   (
      This       : access IHttpMediaTypeWithQualityHeaderValueCollection_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpMethodHeaderValueCollection : aliased constant Windows.IID := (1136410612, 24857, 19167, (147, 140, 52, 191, 255, 207, 146, 237 ));
   
   type IHttpMethodHeaderValueCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function ParseAdd
   (
      This       : access IHttpMethodHeaderValueCollection_Interface
      ; input : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function TryParseAdd
   (
      This       : access IHttpMethodHeaderValueCollection_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpNameValueHeaderValueStatics : aliased constant Windows.IID := (4292084495, 4400, 16722, (134, 89, 37, 105, 9, 169, 209, 21 ));
   
   type IHttpNameValueHeaderValueStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Parse
   (
      This       : access IHttpNameValueHeaderValueStatics_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpNameValueHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function TryParse
   (
      This       : access IHttpNameValueHeaderValueStatics_Interface
      ; input : Windows.String
      ; nameValueHeaderValue : access Windows.Web.Http.Headers.IHttpNameValueHeaderValue
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpNameValueHeaderValueFactory : aliased constant Windows.IID := (1997415015, 52216, 18230, (169, 37, 147, 251, 225, 12, 124, 168 ));
   
   type IHttpNameValueHeaderValueFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromName
   (
      This       : access IHttpNameValueHeaderValueFactory_Interface
      ; name : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpNameValueHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromNameWithValue
   (
      This       : access IHttpNameValueHeaderValueFactory_Interface
      ; name : Windows.String
      ; value : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpNameValueHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpNameValueHeaderValue : aliased constant Windows.IID := (3636098147, 23450, 19739, (147, 249, 170, 91, 68, 236, 253, 223 ));
   
   type IHttpNameValueHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IHttpNameValueHeaderValue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IHttpNameValueHeaderValue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Value
   (
      This       : access IHttpNameValueHeaderValue_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpProductHeaderValueStatics : aliased constant Windows.IID := (2428714537, 48892, 17207, (190, 98, 73, 240, 151, 151, 95, 83 ));
   
   type IHttpProductHeaderValueStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Parse
   (
      This       : access IHttpProductHeaderValueStatics_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpProductHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function TryParse
   (
      This       : access IHttpProductHeaderValueStatics_Interface
      ; input : Windows.String
      ; productHeaderValue : access Windows.Web.Http.Headers.IHttpProductHeaderValue
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpProductHeaderValueFactory : aliased constant Windows.IID := (1629136117, 33468, 17147, (151, 123, 220, 0, 83, 110, 94, 134 ));
   
   type IHttpProductHeaderValueFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromName
   (
      This       : access IHttpProductHeaderValueFactory_Interface
      ; productName : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpProductHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromNameWithVersion
   (
      This       : access IHttpProductHeaderValueFactory_Interface
      ; productName : Windows.String
      ; productVersion : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpProductHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpProductHeaderValue : aliased constant Windows.IID := (4110347779, 60372, 16736, (185, 255, 128, 124, 81, 131, 182, 230 ));
   
   type IHttpProductHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IHttpProductHeaderValue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Version
   (
      This       : access IHttpProductHeaderValue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpProductInfoHeaderValueStatics : aliased constant Windows.IID := (3682588759, 12922, 20083, (129, 229, 112, 89, 163, 2, 176, 66 ));
   
   type IHttpProductInfoHeaderValueStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Parse
   (
      This       : access IHttpProductInfoHeaderValueStatics_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpProductInfoHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function TryParse
   (
      This       : access IHttpProductInfoHeaderValueStatics_Interface
      ; input : Windows.String
      ; productInfoHeaderValue : access Windows.Web.Http.Headers.IHttpProductInfoHeaderValue
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpProductInfoHeaderValueFactory : aliased constant Windows.IID := (606212030, 60094, 17508, (180, 96, 236, 1, 11, 124, 65, 226 ));
   
   type IHttpProductInfoHeaderValueFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromComment
   (
      This       : access IHttpProductInfoHeaderValueFactory_Interface
      ; productComment : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpProductInfoHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromNameWithVersion
   (
      This       : access IHttpProductInfoHeaderValueFactory_Interface
      ; productName : Windows.String
      ; productVersion : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpProductInfoHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpProductInfoHeaderValue : aliased constant Windows.IID := (454723378, 19509, 18538, (150, 111, 100, 100, 137, 25, 142, 77 ));
   
   type IHttpProductInfoHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Product
   (
      This       : access IHttpProductInfoHeaderValue_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpProductHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function get_Comment
   (
      This       : access IHttpProductInfoHeaderValue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpProductInfoHeaderValueCollection : aliased constant Windows.IID := (2273179466, 54939, 17656, (173, 79, 69, 58, 249, 196, 46, 208 ));
   
   type IHttpProductInfoHeaderValueCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function ParseAdd
   (
      This       : access IHttpProductInfoHeaderValueCollection_Interface
      ; input : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function TryParseAdd
   (
      This       : access IHttpProductInfoHeaderValueCollection_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpContentCodingWithQualityHeaderValueStatics : aliased constant Windows.IID := (3905500540, 36745, 18433, (142, 117, 76, 154, 191, 195, 222, 113 ));
   
   type IHttpContentCodingWithQualityHeaderValueStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Parse
   (
      This       : access IHttpContentCodingWithQualityHeaderValueStatics_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function TryParse
   (
      This       : access IHttpContentCodingWithQualityHeaderValueStatics_Interface
      ; input : Windows.String
      ; contentCodingWithQualityHeaderValue : access Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpContentCodingWithQualityHeaderValueFactory : aliased constant Windows.IID := (3294555674, 50515, 18172, (173, 226, 215, 92, 29, 83, 223, 123 ));
   
   type IHttpContentCodingWithQualityHeaderValueFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromValue
   (
      This       : access IHttpContentCodingWithQualityHeaderValueFactory_Interface
      ; contentCoding : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromValueWithQuality
   (
      This       : access IHttpContentCodingWithQualityHeaderValueFactory_Interface
      ; contentCoding : Windows.String
      ; quality : Windows.Double
      ; RetVal : access Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpContentCodingWithQualityHeaderValue : aliased constant Windows.IID := (2488474837, 35603, 19827, (134, 81, 247, 107, 56, 248, 132, 149 ));
   
   type IHttpContentCodingWithQualityHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContentCoding
   (
      This       : access IHttpContentCodingWithQualityHeaderValue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Quality
   (
      This       : access IHttpContentCodingWithQualityHeaderValue_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpContentCodingWithQualityHeaderValueCollection : aliased constant Windows.IID := (2081256766, 59545, 17272, (181, 200, 65, 45, 130, 7, 17, 204 ));
   
   type IHttpContentCodingWithQualityHeaderValueCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function ParseAdd
   (
      This       : access IHttpContentCodingWithQualityHeaderValueCollection_Interface
      ; input : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function TryParseAdd
   (
      This       : access IHttpContentCodingWithQualityHeaderValueCollection_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpTransferCodingHeaderValueStatics : aliased constant Windows.IID := (1790478634, 6808, 19762, (169, 6, 116, 112, 169, 135, 92, 229 ));
   
   type IHttpTransferCodingHeaderValueStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Parse
   (
      This       : access IHttpTransferCodingHeaderValueStatics_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function TryParse
   (
      This       : access IHttpTransferCodingHeaderValueStatics_Interface
      ; input : Windows.String
      ; transferCodingHeaderValue : access Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpTransferCodingHeaderValueFactory : aliased constant Windows.IID := (3143819260, 58209, 20232, (142, 79, 201, 231, 35, 222, 112, 59 ));
   
   type IHttpTransferCodingHeaderValueFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IHttpTransferCodingHeaderValueFactory_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpTransferCodingHeaderValue : aliased constant Windows.IID := (1131361017, 15853, 17085, (179, 138, 84, 150, 162, 81, 28, 230 ));
   
   type IHttpTransferCodingHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Parameters
   (
      This       : access IHttpTransferCodingHeaderValue_Interface
      ; RetVal : access Windows.Web.Http.Headers.IVector_IHttpNameValueHeaderValue -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IHttpTransferCodingHeaderValue_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpTransferCodingHeaderValueCollection : aliased constant Windows.IID := (539790388, 11267, 18872, (150, 101, 115, 226, 124, 178, 252, 121 ));
   
   type IHttpTransferCodingHeaderValueCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function ParseAdd
   (
      This       : access IHttpTransferCodingHeaderValueCollection_Interface
      ; input : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function TryParseAdd
   (
      This       : access IHttpTransferCodingHeaderValueCollection_Interface
      ; input : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IHttpNameValueHeaderValue : aliased constant Windows.IID := (1001441530, 24351, 23664, (153, 80, 93, 29, 26, 112, 61, 212 ));
   
   type IIterator_IHttpNameValueHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IHttpNameValueHeaderValue_Interface
      ; RetVal : access Windows.Web.Http.Headers.IHttpNameValueHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IHttpNameValueHeaderValue_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IHttpNameValueHeaderValue_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IHttpNameValueHeaderValue_Interface
      ; items : Windows.Web.Http.Headers.IHttpNameValueHeaderValue_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IHttpNameValueHeaderValue : aliased constant Windows.IID := (1480106278, 46615, 21527, (179, 46, 222, 210, 210, 125, 64, 163 ));
   
   type IIterable_IHttpNameValueHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IHttpNameValueHeaderValue_Interface
      ; RetVal : access Windows.Web.Http.Headers.IIterator_IHttpNameValueHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IHttpNameValueHeaderValue : aliased constant Windows.IID := (519635912, 36591, 24222, (185, 56, 185, 228, 40, 167, 118, 114 ));
   
   type IVectorView_IHttpNameValueHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IHttpNameValueHeaderValue_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.Http.Headers.IHttpNameValueHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IHttpNameValueHeaderValue_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IHttpNameValueHeaderValue_Interface
      ; value : Windows.Web.Http.Headers.IHttpNameValueHeaderValue
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IHttpNameValueHeaderValue_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.Http.Headers.IHttpNameValueHeaderValue_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IHttpNameValueHeaderValue : aliased constant Windows.IID := (754450644, 13776, 21596, (171, 130, 246, 121, 59, 231, 76, 186 ));
   
   type IVector_IHttpNameValueHeaderValue_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IHttpNameValueHeaderValue_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.Http.Headers.IHttpNameValueHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IHttpNameValueHeaderValue_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IHttpNameValueHeaderValue_Interface
      ; RetVal : access Windows.Web.Http.Headers.IVectorView_IHttpNameValueHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IHttpNameValueHeaderValue_Interface
      ; value : Windows.Web.Http.Headers.IHttpNameValueHeaderValue
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IHttpNameValueHeaderValue_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Http.Headers.IHttpNameValueHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IHttpNameValueHeaderValue_Interface
      ; index : Windows.UInt32
      ; value : Windows.Web.Http.Headers.IHttpNameValueHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IHttpNameValueHeaderValue_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IHttpNameValueHeaderValue_Interface
      ; value : Windows.Web.Http.Headers.IHttpNameValueHeaderValue
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IHttpNameValueHeaderValue_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IHttpNameValueHeaderValue_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IHttpNameValueHeaderValue_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.Http.Headers.IHttpNameValueHeaderValue_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IHttpNameValueHeaderValue_Interface
      ; items : Windows.Web.Http.Headers.IHttpNameValueHeaderValue_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype HttpContentHeaderCollection is Windows.Web.Http.Headers.IHttpContentHeaderCollection;
   
   function CreateHttpContentHeaderCollection return Windows.Web.Http.Headers.IHttpContentHeaderCollection;
   
   subtype HttpRequestHeaderCollection is Windows.Web.Http.Headers.IHttpRequestHeaderCollection;
   subtype HttpResponseHeaderCollection is Windows.Web.Http.Headers.IHttpResponseHeaderCollection;
   subtype HttpContentDispositionHeaderValue is Windows.Web.Http.Headers.IHttpContentDispositionHeaderValue;
   function Create
   (
      dispositionType : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpContentDispositionHeaderValue;
   
   
   subtype HttpContentCodingHeaderValueCollection is Windows.Web.Http.Headers.IHttpContentCodingHeaderValueCollection;
   subtype HttpLanguageHeaderValueCollection is Windows.Web.Http.Headers.IHttpLanguageHeaderValueCollection;
   subtype HttpContentRangeHeaderValue is Windows.Web.Http.Headers.IHttpContentRangeHeaderValue;
   function CreateFromLength
   (
      length : Windows.UInt64
   )
   return Windows.Web.Http.Headers.IHttpContentRangeHeaderValue;
   
   function CreateFromRange
   (
      from : Windows.UInt64
      ; to : Windows.UInt64
   )
   return Windows.Web.Http.Headers.IHttpContentRangeHeaderValue;
   
   function CreateFromRangeWithLength
   (
      from : Windows.UInt64
      ; to : Windows.UInt64
      ; length : Windows.UInt64
   )
   return Windows.Web.Http.Headers.IHttpContentRangeHeaderValue;
   
   
   subtype HttpMediaTypeHeaderValue is Windows.Web.Http.Headers.IHttpMediaTypeHeaderValue;
   function Create
   (
      mediaType : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpMediaTypeHeaderValue;
   
   
   subtype HttpMediaTypeWithQualityHeaderValueCollection is Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValueCollection;
   subtype HttpContentCodingWithQualityHeaderValueCollection is Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValueCollection;
   subtype HttpLanguageRangeWithQualityHeaderValueCollection is Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValueCollection;
   subtype HttpCredentialsHeaderValue is Windows.Web.Http.Headers.IHttpCredentialsHeaderValue;
   function CreateFromScheme
   (
      scheme : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpCredentialsHeaderValue;
   
   function CreateFromSchemeWithToken
   (
      scheme : Windows.String
      ; token : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpCredentialsHeaderValue;
   
   
   subtype HttpCacheDirectiveHeaderValueCollection is Windows.Web.Http.Headers.IHttpCacheDirectiveHeaderValueCollection;
   subtype HttpConnectionOptionHeaderValueCollection is Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValueCollection;
   subtype HttpCookiePairHeaderValueCollection is Windows.Web.Http.Headers.IHttpCookiePairHeaderValueCollection;
   subtype HttpExpectationHeaderValueCollection is Windows.Web.Http.Headers.IHttpExpectationHeaderValueCollection;
   subtype HttpTransferCodingHeaderValueCollection is Windows.Web.Http.Headers.IHttpTransferCodingHeaderValueCollection;
   subtype HttpProductInfoHeaderValueCollection is Windows.Web.Http.Headers.IHttpProductInfoHeaderValueCollection;
   subtype HttpMethodHeaderValueCollection is Windows.Web.Http.Headers.IHttpMethodHeaderValueCollection;
   subtype HttpChallengeHeaderValueCollection is Windows.Web.Http.Headers.IHttpChallengeHeaderValueCollection;
   subtype HttpDateOrDeltaHeaderValue is Windows.Web.Http.Headers.IHttpDateOrDeltaHeaderValue;
   subtype HttpNameValueHeaderValue is Windows.Web.Http.Headers.IHttpNameValueHeaderValue;
   function CreateFromName
   (
      name : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpNameValueHeaderValue;
   
   function CreateFromNameWithValue
   (
      name : Windows.String
      ; value : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpNameValueHeaderValue;
   
   
   subtype HttpChallengeHeaderValue is Windows.Web.Http.Headers.IHttpChallengeHeaderValue;
   function CreateFromScheme
   (
      scheme : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpChallengeHeaderValue;
   
   function CreateFromSchemeWithToken
   (
      scheme : Windows.String
      ; token : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpChallengeHeaderValue;
   
   
   subtype HttpConnectionOptionHeaderValue is Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue;
   function Create
   (
      token : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue;
   
   
   subtype HttpContentCodingHeaderValue is Windows.Web.Http.Headers.IHttpContentCodingHeaderValue;
   function Create
   (
      contentCoding : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpContentCodingHeaderValue;
   
   
   subtype HttpCookiePairHeaderValue is Windows.Web.Http.Headers.IHttpCookiePairHeaderValue;
   function CreateFromName
   (
      name : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpCookiePairHeaderValue;
   
   function CreateFromNameWithValue
   (
      name : Windows.String
      ; value : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpCookiePairHeaderValue;
   
   
   subtype HttpExpectationHeaderValue is Windows.Web.Http.Headers.IHttpExpectationHeaderValue;
   function CreateFromName
   (
      name : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpExpectationHeaderValue;
   
   function CreateFromNameWithValue
   (
      name : Windows.String
      ; value : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpExpectationHeaderValue;
   
   
   subtype HttpLanguageRangeWithQualityHeaderValue is Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue;
   function CreateFromLanguageRange
   (
      languageRange : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue;
   
   function CreateFromLanguageRangeWithQuality
   (
      languageRange : Windows.String
      ; quality : Windows.Double
   )
   return Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue;
   
   
   subtype HttpMediaTypeWithQualityHeaderValue is Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue;
   function CreateFromMediaType
   (
      mediaType : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue;
   
   function CreateFromMediaTypeWithQuality
   (
      mediaType : Windows.String
      ; quality : Windows.Double
   )
   return Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue;
   
   
   subtype HttpProductHeaderValue is Windows.Web.Http.Headers.IHttpProductHeaderValue;
   function CreateFromName
   (
      productName : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpProductHeaderValue;
   
   function CreateFromNameWithVersion
   (
      productName : Windows.String
      ; productVersion : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpProductHeaderValue;
   
   
   subtype HttpProductInfoHeaderValue is Windows.Web.Http.Headers.IHttpProductInfoHeaderValue;
   function CreateFromComment
   (
      productComment : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpProductInfoHeaderValue;
   
   function CreateFromNameWithVersion
   (
      productName : Windows.String
      ; productVersion : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpProductInfoHeaderValue;
   
   
   subtype HttpContentCodingWithQualityHeaderValue is Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue;
   function CreateFromValue
   (
      contentCoding : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue;
   
   function CreateFromValueWithQuality
   (
      contentCoding : Windows.String
      ; quality : Windows.Double
   )
   return Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue;
   
   
   subtype HttpTransferCodingHeaderValue is Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue;
   function Create
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue;
   
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpContentDispositionHeaderValue;
   
   function TryParse
   (
      input : Windows.String
      ; contentDispositionHeaderValue : access Windows.Web.Http.Headers.IHttpContentDispositionHeaderValue
   )
   return Windows.Boolean;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpContentRangeHeaderValue;
   
   function TryParse
   (
      input : Windows.String
      ; contentRangeHeaderValue : access Windows.Web.Http.Headers.IHttpContentRangeHeaderValue
   )
   return Windows.Boolean;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpMediaTypeHeaderValue;
   
   function TryParse
   (
      input : Windows.String
      ; mediaTypeHeaderValue : access Windows.Web.Http.Headers.IHttpMediaTypeHeaderValue
   )
   return Windows.Boolean;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpCredentialsHeaderValue;
   
   function TryParse
   (
      input : Windows.String
      ; credentialsHeaderValue : access Windows.Web.Http.Headers.IHttpCredentialsHeaderValue
   )
   return Windows.Boolean;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpDateOrDeltaHeaderValue;
   
   function TryParse
   (
      input : Windows.String
      ; dateOrDeltaHeaderValue : access Windows.Web.Http.Headers.IHttpDateOrDeltaHeaderValue
   )
   return Windows.Boolean;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpNameValueHeaderValue;
   
   function TryParse
   (
      input : Windows.String
      ; nameValueHeaderValue : access Windows.Web.Http.Headers.IHttpNameValueHeaderValue
   )
   return Windows.Boolean;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpChallengeHeaderValue;
   
   function TryParse
   (
      input : Windows.String
      ; challengeHeaderValue : access Windows.Web.Http.Headers.IHttpChallengeHeaderValue
   )
   return Windows.Boolean;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue;
   
   function TryParse
   (
      input : Windows.String
      ; connectionOptionHeaderValue : access Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue
   )
   return Windows.Boolean;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpContentCodingHeaderValue;
   
   function TryParse
   (
      input : Windows.String
      ; contentCodingHeaderValue : access Windows.Web.Http.Headers.IHttpContentCodingHeaderValue
   )
   return Windows.Boolean;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpCookiePairHeaderValue;
   
   function TryParse
   (
      input : Windows.String
      ; cookiePairHeaderValue : access Windows.Web.Http.Headers.IHttpCookiePairHeaderValue
   )
   return Windows.Boolean;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpExpectationHeaderValue;
   
   function TryParse
   (
      input : Windows.String
      ; expectationHeaderValue : access Windows.Web.Http.Headers.IHttpExpectationHeaderValue
   )
   return Windows.Boolean;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue;
   
   function TryParse
   (
      input : Windows.String
      ; languageRangeWithQualityHeaderValue : access Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue
   )
   return Windows.Boolean;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue;
   
   function TryParse
   (
      input : Windows.String
      ; mediaTypeWithQualityHeaderValue : access Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue
   )
   return Windows.Boolean;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpProductHeaderValue;
   
   function TryParse
   (
      input : Windows.String
      ; productHeaderValue : access Windows.Web.Http.Headers.IHttpProductHeaderValue
   )
   return Windows.Boolean;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpProductInfoHeaderValue;
   
   function TryParse
   (
      input : Windows.String
      ; productInfoHeaderValue : access Windows.Web.Http.Headers.IHttpProductInfoHeaderValue
   )
   return Windows.Boolean;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue;
   
   function TryParse
   (
      input : Windows.String
      ; contentCodingWithQualityHeaderValue : access Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue
   )
   return Windows.Boolean;
   
   function Parse
   (
      input : Windows.String
   )
   return Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue;
   
   function TryParse
   (
      input : Windows.String
      ; transferCodingHeaderValue : access Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue
   )
   return Windows.Boolean;
   
end;
