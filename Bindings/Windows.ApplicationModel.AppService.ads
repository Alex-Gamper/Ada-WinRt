--------------------------------------------------------------------------------
-- <auto-generated>                                                           --
--     This code was generated by a tool.                                     --
--                                                                            --
--     Changes to this file may cause incorrect behavior and will be lost if  --
--     the code is regenerated.                                               --
-- </auto-generated>                                                          --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--                                                                            --
-- This program is free software: you can redistribute it and / or modify     --
-- it under the terms of the GNU Lesser General Public License as published by--
-- the Free Software Foundation, either version 3 of the License, or          --
-- (at your option) any later version.                                        --
--                                                                            --
-- This program is distributed in the hope that it will be useful,            --
-- but WITHOUT ANY WARRANTY; without even the implied warranty of             --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the               --
-- GNU Lesser General Public License for more details.                        --
--                                                                            --
-- You should have received a copy of the GNU Lesser General Public License   --
-- along with this program.If not, see http://www.gnu.org/licenses            --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.Foundation;
with Windows.Foundation.Collections;
limited with Windows.System;
limited with Windows.System.RemoteSystems;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.AppService is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type AppServiceClosedStatus is (
      Completed,
      Canceled,
      ResourceLimitsExceeded,
      Unknown
   );
   for AppServiceClosedStatus use (
      Completed => 0,
      Canceled => 1,
      ResourceLimitsExceeded => 2,
      Unknown => 3
   );
   for AppServiceClosedStatus'Size use 32;
   
   type AppServiceClosedStatus_Ptr is access AppServiceClosedStatus;
   
   type AppServiceConnectionStatus is (
      Success,
      AppNotInstalled,
      AppUnavailable,
      AppServiceUnavailable,
      Unknown,
      RemoteSystemUnavailable,
      RemoteSystemNotSupportedByApp,
      NotAuthorized,
      AuthenticationError,
      NetworkNotAvailable,
      DisabledByPolicy,
      WebServiceUnavailable
   );
   for AppServiceConnectionStatus use (
      Success => 0,
      AppNotInstalled => 1,
      AppUnavailable => 2,
      AppServiceUnavailable => 3,
      Unknown => 4,
      RemoteSystemUnavailable => 5,
      RemoteSystemNotSupportedByApp => 6,
      NotAuthorized => 7,
      AuthenticationError => 8,
      NetworkNotAvailable => 9,
      DisabledByPolicy => 10,
      WebServiceUnavailable => 11
   );
   for AppServiceConnectionStatus'Size use 32;
   
   type AppServiceConnectionStatus_Ptr is access AppServiceConnectionStatus;
   
   type AppServiceResponseStatus is (
      Success,
      Failure,
      ResourceLimitsExceeded,
      Unknown,
      RemoteSystemUnavailable,
      MessageSizeTooLarge,
      AppUnavailable,
      AuthenticationError,
      NetworkNotAvailable,
      DisabledByPolicy,
      WebServiceUnavailable
   );
   for AppServiceResponseStatus use (
      Success => 0,
      Failure => 1,
      ResourceLimitsExceeded => 2,
      Unknown => 3,
      RemoteSystemUnavailable => 4,
      MessageSizeTooLarge => 5,
      AppUnavailable => 6,
      AuthenticationError => 7,
      NetworkNotAvailable => 8,
      DisabledByPolicy => 9,
      WebServiceUnavailable => 10
   );
   for AppServiceResponseStatus'Size use 32;
   
   type AppServiceResponseStatus_Ptr is access AppServiceResponseStatus;
   
   type StatelessAppServiceResponseStatus is (
      Success,
      AppNotInstalled,
      AppUnavailable,
      AppServiceUnavailable,
      RemoteSystemUnavailable,
      RemoteSystemNotSupportedByApp,
      NotAuthorized,
      ResourceLimitsExceeded,
      MessageSizeTooLarge,
      Failure,
      Unknown,
      AuthenticationError,
      NetworkNotAvailable,
      DisabledByPolicy,
      WebServiceUnavailable
   );
   for StatelessAppServiceResponseStatus use (
      Success => 0,
      AppNotInstalled => 1,
      AppUnavailable => 2,
      AppServiceUnavailable => 3,
      RemoteSystemUnavailable => 4,
      RemoteSystemNotSupportedByApp => 5,
      NotAuthorized => 6,
      ResourceLimitsExceeded => 7,
      MessageSizeTooLarge => 8,
      Failure => 9,
      Unknown => 10,
      AuthenticationError => 11,
      NetworkNotAvailable => 12,
      DisabledByPolicy => 13,
      WebServiceUnavailable => 14
   );
   for StatelessAppServiceResponseStatus'Size use 32;
   
   type StatelessAppServiceResponseStatus_Ptr is access StatelessAppServiceResponseStatus;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_AppServiceConnectionStatus_Interface;
   type AsyncOperationCompletedHandler_AppServiceConnectionStatus is access all AsyncOperationCompletedHandler_AppServiceConnectionStatus_Interface'Class;
   type AsyncOperationCompletedHandler_AppServiceConnectionStatus_Ptr is access all AsyncOperationCompletedHandler_AppServiceConnectionStatus;
   type AsyncOperationCompletedHandler_AppServiceResponseStatus_Interface;
   type AsyncOperationCompletedHandler_AppServiceResponseStatus is access all AsyncOperationCompletedHandler_AppServiceResponseStatus_Interface'Class;
   type AsyncOperationCompletedHandler_AppServiceResponseStatus_Ptr is access all AsyncOperationCompletedHandler_AppServiceResponseStatus;
   type AsyncOperationCompletedHandler_IAppServiceResponse_Interface;
   type AsyncOperationCompletedHandler_IAppServiceResponse is access all AsyncOperationCompletedHandler_IAppServiceResponse_Interface'Class;
   type AsyncOperationCompletedHandler_IAppServiceResponse_Ptr is access all AsyncOperationCompletedHandler_IAppServiceResponse;
   type AsyncOperationCompletedHandler_IStatelessAppServiceResponse_Interface;
   type AsyncOperationCompletedHandler_IStatelessAppServiceResponse is access all AsyncOperationCompletedHandler_IStatelessAppServiceResponse_Interface'Class;
   type AsyncOperationCompletedHandler_IStatelessAppServiceResponse_Ptr is access all AsyncOperationCompletedHandler_IStatelessAppServiceResponse;
   type TypedEventHandler_IAppServiceConnection_add_RequestReceived_Interface;
   type TypedEventHandler_IAppServiceConnection_add_RequestReceived is access all TypedEventHandler_IAppServiceConnection_add_RequestReceived_Interface'Class;
   type TypedEventHandler_IAppServiceConnection_add_RequestReceived_Ptr is access all TypedEventHandler_IAppServiceConnection_add_RequestReceived;
   type TypedEventHandler_IAppServiceConnection_add_ServiceClosed_Interface;
   type TypedEventHandler_IAppServiceConnection_add_ServiceClosed is access all TypedEventHandler_IAppServiceConnection_add_ServiceClosed_Interface'Class;
   type TypedEventHandler_IAppServiceConnection_add_ServiceClosed_Ptr is access all TypedEventHandler_IAppServiceConnection_add_ServiceClosed;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IAppServiceCatalogStatics_Interface;
   type IAppServiceCatalogStatics is access all IAppServiceCatalogStatics_Interface'Class;
   type IAppServiceCatalogStatics_Ptr is access all IAppServiceCatalogStatics;
   type IAppServiceClosedEventArgs_Interface;
   type IAppServiceClosedEventArgs is access all IAppServiceClosedEventArgs_Interface'Class;
   type IAppServiceClosedEventArgs_Ptr is access all IAppServiceClosedEventArgs;
   type IAppServiceConnection_Interface;
   type IAppServiceConnection is access all IAppServiceConnection_Interface'Class;
   type IAppServiceConnection_Ptr is access all IAppServiceConnection;
   type IAppServiceConnection2_Interface;
   type IAppServiceConnection2 is access all IAppServiceConnection2_Interface'Class;
   type IAppServiceConnection2_Ptr is access all IAppServiceConnection2;
   type IAppServiceConnectionStatics_Interface;
   type IAppServiceConnectionStatics is access all IAppServiceConnectionStatics_Interface'Class;
   type IAppServiceConnectionStatics_Ptr is access all IAppServiceConnectionStatics;
   type IAppServiceDeferral_Interface;
   type IAppServiceDeferral is access all IAppServiceDeferral_Interface'Class;
   type IAppServiceDeferral_Ptr is access all IAppServiceDeferral;
   type IAppServiceRequest_Interface;
   type IAppServiceRequest is access all IAppServiceRequest_Interface'Class;
   type IAppServiceRequest_Ptr is access all IAppServiceRequest;
   type IAppServiceRequestReceivedEventArgs_Interface;
   type IAppServiceRequestReceivedEventArgs is access all IAppServiceRequestReceivedEventArgs_Interface'Class;
   type IAppServiceRequestReceivedEventArgs_Ptr is access all IAppServiceRequestReceivedEventArgs;
   type IAppServiceResponse_Interface;
   type IAppServiceResponse is access all IAppServiceResponse_Interface'Class;
   type IAppServiceResponse_Ptr is access all IAppServiceResponse;
   type IAppServiceTriggerDetails_Interface;
   type IAppServiceTriggerDetails is access all IAppServiceTriggerDetails_Interface'Class;
   type IAppServiceTriggerDetails_Ptr is access all IAppServiceTriggerDetails;
   type IAppServiceTriggerDetails2_Interface;
   type IAppServiceTriggerDetails2 is access all IAppServiceTriggerDetails2_Interface'Class;
   type IAppServiceTriggerDetails2_Ptr is access all IAppServiceTriggerDetails2;
   type IAppServiceTriggerDetails3_Interface;
   type IAppServiceTriggerDetails3 is access all IAppServiceTriggerDetails3_Interface'Class;
   type IAppServiceTriggerDetails3_Ptr is access all IAppServiceTriggerDetails3;
   type IAppServiceTriggerDetails4_Interface;
   type IAppServiceTriggerDetails4 is access all IAppServiceTriggerDetails4_Interface'Class;
   type IAppServiceTriggerDetails4_Ptr is access all IAppServiceTriggerDetails4;
   type IAsyncOperation_AppServiceConnectionStatus_Interface;
   type IAsyncOperation_AppServiceConnectionStatus is access all IAsyncOperation_AppServiceConnectionStatus_Interface'Class;
   type IAsyncOperation_AppServiceConnectionStatus_Ptr is access all IAsyncOperation_AppServiceConnectionStatus;
   type IAsyncOperation_AppServiceResponseStatus_Interface;
   type IAsyncOperation_AppServiceResponseStatus is access all IAsyncOperation_AppServiceResponseStatus_Interface'Class;
   type IAsyncOperation_AppServiceResponseStatus_Ptr is access all IAsyncOperation_AppServiceResponseStatus;
   type IAsyncOperation_IAppServiceResponse_Interface;
   type IAsyncOperation_IAppServiceResponse is access all IAsyncOperation_IAppServiceResponse_Interface'Class;
   type IAsyncOperation_IAppServiceResponse_Ptr is access all IAsyncOperation_IAppServiceResponse;
   type IAsyncOperation_IStatelessAppServiceResponse_Interface;
   type IAsyncOperation_IStatelessAppServiceResponse is access all IAsyncOperation_IStatelessAppServiceResponse_Interface'Class;
   type IAsyncOperation_IStatelessAppServiceResponse_Ptr is access all IAsyncOperation_IStatelessAppServiceResponse;
   type IStatelessAppServiceResponse_Interface;
   type IStatelessAppServiceResponse is access all IStatelessAppServiceResponse_Interface'Class;
   type IStatelessAppServiceResponse_Ptr is access all IStatelessAppServiceResponse;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IAppServiceCatalogStatics : aliased constant Windows.IID := (4010616071, 53554, 19589, (131, 149, 60, 49, 213, 161, 233, 65 ));
   
   type IAppServiceCatalogStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FindAppServiceProvidersAsync
   (
      This       : access IAppServiceCatalogStatics_Interface
      ; appServiceName : Windows.String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppServiceClosedEventArgs : aliased constant Windows.IID := (3730839286, 51971, 19765, (172, 141, 204, 99, 3, 35, 151, 49 ));
   
   type IAppServiceClosedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IAppServiceClosedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.AppService.AppServiceClosedStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppServiceConnection : aliased constant Windows.IID := (2647946402, 34591, 19794, (137, 169, 158, 9, 5, 49, 189, 39 ));
   
   type IAppServiceConnection_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppServiceName
   (
      This       : access IAppServiceConnection_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_AppServiceName
   (
      This       : access IAppServiceConnection_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PackageFamilyName
   (
      This       : access IAppServiceConnection_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_PackageFamilyName
   (
      This       : access IAppServiceConnection_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function OpenAsync
   (
      This       : access IAppServiceConnection_Interface
      ; RetVal : access Windows.ApplicationModel.AppService.IAsyncOperation_AppServiceConnectionStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SendMessageAsync
   (
      This       : access IAppServiceConnection_Interface
      ; message : Windows.Foundation.Collections.IPropertySet
      ; RetVal : access Windows.ApplicationModel.AppService.IAsyncOperation_IAppServiceResponse -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_RequestReceived
   (
      This       : access IAppServiceConnection_Interface
      ; handler : TypedEventHandler_IAppServiceConnection_add_RequestReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RequestReceived
   (
      This       : access IAppServiceConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ServiceClosed
   (
      This       : access IAppServiceConnection_Interface
      ; handler : TypedEventHandler_IAppServiceConnection_add_ServiceClosed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ServiceClosed
   (
      This       : access IAppServiceConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppServiceConnection2 : aliased constant Windows.IID := (2346700127, 8962, 20413, (128, 97, 82, 81, 28, 47, 139, 249 ));
   
   type IAppServiceConnection2_Interface is interface and Windows.IInspectable_Interface;
   
   function OpenRemoteAsync
   (
      This       : access IAppServiceConnection2_Interface
      ; remoteSystemConnectionRequest : Windows.System.RemoteSystems.IRemoteSystemConnectionRequest
      ; RetVal : access Windows.ApplicationModel.AppService.IAsyncOperation_AppServiceConnectionStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_User
   (
      This       : access IAppServiceConnection2_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   function put_User
   (
      This       : access IAppServiceConnection2_Interface
      ; value : Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppServiceConnectionStatics : aliased constant Windows.IID := (2915396841, 54280, 22131, (134, 55, 130, 122, 75, 39, 65, 104 ));
   
   type IAppServiceConnectionStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function SendStatelessMessageAsync
   (
      This       : access IAppServiceConnectionStatics_Interface
      ; connection : Windows.ApplicationModel.AppService.IAppServiceConnection
      ; connectionRequest : Windows.System.RemoteSystems.IRemoteSystemConnectionRequest
      ; message : Windows.Foundation.Collections.IPropertySet
      ; RetVal : access Windows.ApplicationModel.AppService.IAsyncOperation_IStatelessAppServiceResponse -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppServiceDeferral : aliased constant Windows.IID := (2115719970, 60080, 16968, (174, 4, 253, 249, 56, 56, 228, 114 ));
   
   type IAppServiceDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access IAppServiceDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppServiceRequest : aliased constant Windows.IID := (551914909, 6366, 19201, (128, 186, 144, 167, 98, 4, 227, 200 ));
   
   type IAppServiceRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Message
   (
      This       : access IAppServiceRequest_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function SendResponseAsync
   (
      This       : access IAppServiceRequest_Interface
      ; message : Windows.Foundation.Collections.IPropertySet
      ; RetVal : access Windows.ApplicationModel.AppService.IAsyncOperation_AppServiceResponseStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppServiceRequestReceivedEventArgs : aliased constant Windows.IID := (1846682464, 65381, 17582, (158, 69, 133, 127, 228, 24, 6, 129 ));
   
   type IAppServiceRequestReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IAppServiceRequestReceivedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.AppService.IAppServiceRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IAppServiceRequestReceivedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.AppService.IAppServiceDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppServiceResponse : aliased constant Windows.IID := (2370845932, 39587, 20072, (149, 89, 157, 230, 62, 55, 44, 228 ));
   
   type IAppServiceResponse_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Message
   (
      This       : access IAppServiceResponse_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IAppServiceResponse_Interface
      ; RetVal : access Windows.ApplicationModel.AppService.AppServiceResponseStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppServiceTriggerDetails : aliased constant Windows.IID := (2292374700, 44328, 16824, (128, 187, 189, 241, 178, 22, 158, 25 ));
   
   type IAppServiceTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IAppServiceTriggerDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CallerPackageFamilyName
   (
      This       : access IAppServiceTriggerDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AppServiceConnection
   (
      This       : access IAppServiceTriggerDetails_Interface
      ; RetVal : access Windows.ApplicationModel.AppService.IAppServiceConnection
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppServiceTriggerDetails2 : aliased constant Windows.IID := (3896333490, 10444, 17394, (180, 101, 192, 72, 46, 89, 226, 220 ));
   
   type IAppServiceTriggerDetails2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsRemoteSystemConnection
   (
      This       : access IAppServiceTriggerDetails2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppServiceTriggerDetails3 : aliased constant Windows.IID := (4225179169, 31033, 20072, (158, 60, 119, 128, 20, 122, 171, 182 ));
   
   type IAppServiceTriggerDetails3_Interface is interface and Windows.IInspectable_Interface;
   
   function CheckCallerForCapabilityAsync
   (
      This       : access IAppServiceTriggerDetails3_Interface
      ; capabilityName : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppServiceTriggerDetails4 : aliased constant Windows.IID := (293974400, 34913, 24112, (171, 85, 28, 244, 208, 139, 191, 109 ));
   
   type IAppServiceTriggerDetails4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CallerRemoteConnectionToken
   (
      This       : access IAppServiceTriggerDetails4_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_AppServiceConnectionStatus : aliased constant Windows.IID := (219047523, 9785, 23194, (156, 188, 48, 215, 212, 206, 83, 59 ));
   
   type IAsyncOperation_AppServiceConnectionStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_AppServiceConnectionStatus_Interface
      ; handler : Windows.ApplicationModel.AppService.AsyncOperationCompletedHandler_AppServiceConnectionStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_AppServiceConnectionStatus_Interface
      ; RetVal : access Windows.ApplicationModel.AppService.AsyncOperationCompletedHandler_AppServiceConnectionStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_AppServiceConnectionStatus_Interface
      ; RetVal : access Windows.ApplicationModel.AppService.AppServiceConnectionStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_AppServiceResponseStatus : aliased constant Windows.IID := (2566764610, 23051, 21402, (163, 92, 85, 172, 95, 34, 134, 18 ));
   
   type IAsyncOperation_AppServiceResponseStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_AppServiceResponseStatus_Interface
      ; handler : Windows.ApplicationModel.AppService.AsyncOperationCompletedHandler_AppServiceResponseStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_AppServiceResponseStatus_Interface
      ; RetVal : access Windows.ApplicationModel.AppService.AsyncOperationCompletedHandler_AppServiceResponseStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_AppServiceResponseStatus_Interface
      ; RetVal : access Windows.ApplicationModel.AppService.AppServiceResponseStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IAppServiceResponse : aliased constant Windows.IID := (1215650428, 51343, 24304, (155, 76, 135, 111, 204, 38, 16, 180 ));
   
   type IAsyncOperation_IAppServiceResponse_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IAppServiceResponse_Interface
      ; handler : Windows.ApplicationModel.AppService.AsyncOperationCompletedHandler_IAppServiceResponse
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IAppServiceResponse_Interface
      ; RetVal : access Windows.ApplicationModel.AppService.AsyncOperationCompletedHandler_IAppServiceResponse
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IAppServiceResponse_Interface
      ; RetVal : access Windows.ApplicationModel.AppService.IAppServiceResponse
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IStatelessAppServiceResponse : aliased constant Windows.IID := (2996916814, 48811, 23531, (170, 233, 180, 53, 1, 195, 164, 136 ));
   
   type IAsyncOperation_IStatelessAppServiceResponse_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IStatelessAppServiceResponse_Interface
      ; handler : Windows.ApplicationModel.AppService.AsyncOperationCompletedHandler_IStatelessAppServiceResponse
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IStatelessAppServiceResponse_Interface
      ; RetVal : access Windows.ApplicationModel.AppService.AsyncOperationCompletedHandler_IStatelessAppServiceResponse
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IStatelessAppServiceResponse_Interface
      ; RetVal : access Windows.ApplicationModel.AppService.IStatelessAppServiceResponse
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IStatelessAppServiceResponse : aliased constant Windows.IID := (1131760375, 43500, 21246, (130, 231, 147, 155, 104, 220, 147, 136 ));
   
   type IStatelessAppServiceResponse_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Message
   (
      This       : access IStatelessAppServiceResponse_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IStatelessAppServiceResponse_Interface
      ; RetVal : access Windows.ApplicationModel.AppService.StatelessAppServiceResponseStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_AppServiceConnectionStatus : aliased constant Windows.IID := (3066477554, 29386, 22425, (166, 81, 209, 153, 6, 112, 9, 123 ));
   
   type AsyncOperationCompletedHandler_AppServiceConnectionStatus_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.AppService.IAsyncOperation_AppServiceConnectionStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_AppServiceConnectionStatus'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_AppServiceConnectionStatus_Interface
      ; asyncInfo : Windows.ApplicationModel.AppService.IAsyncOperation_AppServiceConnectionStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_AppServiceResponseStatus : aliased constant Windows.IID := (3089381437, 13024, 21881, (134, 112, 160, 106, 97, 69, 127, 32 ));
   
   type AsyncOperationCompletedHandler_AppServiceResponseStatus_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.AppService.IAsyncOperation_AppServiceResponseStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_AppServiceResponseStatus'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_AppServiceResponseStatus_Interface
      ; asyncInfo : Windows.ApplicationModel.AppService.IAsyncOperation_AppServiceResponseStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IAppServiceResponse : aliased constant Windows.IID := (2124929004, 57700, 21187, (142, 50, 187, 167, 18, 109, 144, 40 ));
   
   type AsyncOperationCompletedHandler_IAppServiceResponse_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.AppService.IAsyncOperation_IAppServiceResponse ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IAppServiceResponse'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IAppServiceResponse_Interface
      ; asyncInfo : Windows.ApplicationModel.AppService.IAsyncOperation_IAppServiceResponse
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IStatelessAppServiceResponse : aliased constant Windows.IID := (1293870317, 19833, 21498, (169, 215, 201, 201, 53, 78, 79, 85 ));
   
   type AsyncOperationCompletedHandler_IStatelessAppServiceResponse_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.AppService.IAsyncOperation_IStatelessAppServiceResponse ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IStatelessAppServiceResponse'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IStatelessAppServiceResponse_Interface
      ; asyncInfo : Windows.ApplicationModel.AppService.IAsyncOperation_IStatelessAppServiceResponse
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppServiceConnection_add_RequestReceived : aliased constant Windows.IID := (415661409, 16758, 21843, (177, 141, 216, 245, 127, 231, 149, 82 ));
   
   type TypedEventHandler_IAppServiceConnection_add_RequestReceived_Interface(Callback : access procedure (sender : Windows.ApplicationModel.AppService.IAppServiceConnection ; args : Windows.ApplicationModel.AppService.IAppServiceRequestReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppServiceConnection_add_RequestReceived'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAppServiceConnection_add_RequestReceived_Interface
      ; sender : Windows.ApplicationModel.AppService.IAppServiceConnection
      ; args : Windows.ApplicationModel.AppService.IAppServiceRequestReceivedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppServiceConnection_add_ServiceClosed : aliased constant Windows.IID := (3840911757, 19452, 24161, (162, 51, 104, 143, 95, 6, 82, 31 ));
   
   type TypedEventHandler_IAppServiceConnection_add_ServiceClosed_Interface(Callback : access procedure (sender : Windows.ApplicationModel.AppService.IAppServiceConnection ; args : Windows.ApplicationModel.AppService.IAppServiceClosedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppServiceConnection_add_ServiceClosed'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAppServiceConnection_add_ServiceClosed_Interface
      ; sender : Windows.ApplicationModel.AppService.IAppServiceConnection
      ; args : Windows.ApplicationModel.AppService.IAppServiceClosedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype AppServiceClosedEventArgs is Windows.ApplicationModel.AppService.IAppServiceClosedEventArgs;
   subtype AppServiceConnection is Windows.ApplicationModel.AppService.IAppServiceConnection;
   function Create return Windows.ApplicationModel.AppService.IAppServiceConnection;
   
   subtype AppServiceDeferral is Windows.ApplicationModel.AppService.IAppServiceDeferral;
   subtype AppServiceRequest is Windows.ApplicationModel.AppService.IAppServiceRequest;
   subtype AppServiceRequestReceivedEventArgs is Windows.ApplicationModel.AppService.IAppServiceRequestReceivedEventArgs;
   subtype AppServiceResponse is Windows.ApplicationModel.AppService.IAppServiceResponse;
   subtype AppServiceTriggerDetails is Windows.ApplicationModel.AppService.IAppServiceTriggerDetails;
   subtype StatelessAppServiceResponse is Windows.ApplicationModel.AppService.IStatelessAppServiceResponse;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function FindAppServiceProvidersAsync
   (
      appServiceName : Windows.String
   )
   return Windows.Address;
   
   function SendStatelessMessageAsync
   (
      connection : Windows.ApplicationModel.AppService.IAppServiceConnection
      ; connectionRequest : Windows.System.RemoteSystems.IRemoteSystemConnectionRequest
      ; message : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.ApplicationModel.AppService.IAsyncOperation_IStatelessAppServiceResponse;
   
end;
