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
with Windows.Foundation.Collections;
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.Devices.Enumeration.Pnp is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type PnpObjectType is (
      Unknown,
      DeviceInterface,
      DeviceContainer,
      Device,
      DeviceInterfaceClass,
      AssociationEndpoint,
      AssociationEndpointContainer,
      AssociationEndpointService
   );
   for PnpObjectType use (
      Unknown => 0,
      DeviceInterface => 1,
      DeviceContainer => 2,
      Device => 3,
      DeviceInterfaceClass => 4,
      AssociationEndpoint => 5,
      AssociationEndpointContainer => 6,
      AssociationEndpointService => 7
   );
   for PnpObjectType'Size use 32;
   
   type PnpObjectType_Ptr is access PnpObjectType;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IPnpObjectWatcher_add_Added_Interface;
   type TypedEventHandler_IPnpObjectWatcher_add_Added is access all TypedEventHandler_IPnpObjectWatcher_add_Added_Interface'Class;
   type TypedEventHandler_IPnpObjectWatcher_add_Added_Ptr is access all TypedEventHandler_IPnpObjectWatcher_add_Added;
   type TypedEventHandler_IPnpObjectWatcher_add_Updated_Interface;
   type TypedEventHandler_IPnpObjectWatcher_add_Updated is access all TypedEventHandler_IPnpObjectWatcher_add_Updated_Interface'Class;
   type TypedEventHandler_IPnpObjectWatcher_add_Updated_Ptr is access all TypedEventHandler_IPnpObjectWatcher_add_Updated;
   type TypedEventHandler_IPnpObjectWatcher_add_Removed_Interface;
   type TypedEventHandler_IPnpObjectWatcher_add_Removed is access all TypedEventHandler_IPnpObjectWatcher_add_Removed_Interface'Class;
   type TypedEventHandler_IPnpObjectWatcher_add_Removed_Ptr is access all TypedEventHandler_IPnpObjectWatcher_add_Removed;
   type TypedEventHandler_IPnpObjectWatcher_add_EnumerationCompleted_Interface;
   type TypedEventHandler_IPnpObjectWatcher_add_EnumerationCompleted is access all TypedEventHandler_IPnpObjectWatcher_add_EnumerationCompleted_Interface'Class;
   type TypedEventHandler_IPnpObjectWatcher_add_EnumerationCompleted_Ptr is access all TypedEventHandler_IPnpObjectWatcher_add_EnumerationCompleted;
   type TypedEventHandler_IPnpObjectWatcher_add_Stopped_Interface;
   type TypedEventHandler_IPnpObjectWatcher_add_Stopped is access all TypedEventHandler_IPnpObjectWatcher_add_Stopped_Interface'Class;
   type TypedEventHandler_IPnpObjectWatcher_add_Stopped_Ptr is access all TypedEventHandler_IPnpObjectWatcher_add_Stopped;
   type AsyncOperationCompletedHandler_IPnpObject_Interface;
   type AsyncOperationCompletedHandler_IPnpObject is access all AsyncOperationCompletedHandler_IPnpObject_Interface'Class;
   type AsyncOperationCompletedHandler_IPnpObject_Ptr is access all AsyncOperationCompletedHandler_IPnpObject;
   type AsyncOperationCompletedHandler_IVectorView_PnpObject_Interface;
   type AsyncOperationCompletedHandler_IVectorView_PnpObject is access all AsyncOperationCompletedHandler_IVectorView_PnpObject_Interface'Class;
   type AsyncOperationCompletedHandler_IVectorView_PnpObject_Ptr is access all AsyncOperationCompletedHandler_IVectorView_PnpObject;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IPnpObjectUpdate_Interface;
   type IPnpObjectUpdate is access all IPnpObjectUpdate_Interface'Class;
   type IPnpObjectUpdate_Ptr is access all IPnpObjectUpdate;
   type IVectorView_PnpObject_Interface;
   type IVectorView_PnpObject is access all IVectorView_PnpObject_Interface'Class;
   type IVectorView_PnpObject_Ptr is access all IVectorView_PnpObject;
   type IIterable_PnpObject_Interface;
   type IIterable_PnpObject is access all IIterable_PnpObject_Interface'Class;
   type IIterable_PnpObject_Ptr is access all IIterable_PnpObject;
   type IPnpObjectWatcher_Interface;
   type IPnpObjectWatcher is access all IPnpObjectWatcher_Interface'Class;
   type IPnpObjectWatcher_Ptr is access all IPnpObjectWatcher;
   type IPnpObjectStatics_Interface;
   type IPnpObjectStatics is access all IPnpObjectStatics_Interface'Class;
   type IPnpObjectStatics_Ptr is access all IPnpObjectStatics;
   type IPnpObject_Interface;
   type IPnpObject is access all IPnpObject_Interface'Class;
   type IPnpObject_Ptr is access all IPnpObject;
   type IAsyncOperation_IPnpObject_Interface;
   type IAsyncOperation_IPnpObject is access all IAsyncOperation_IPnpObject_Interface'Class;
   type IAsyncOperation_IPnpObject_Ptr is access all IAsyncOperation_IPnpObject;
   type IAsyncOperation_IVectorView_PnpObject_Interface;
   type IAsyncOperation_IVectorView_PnpObject is access all IAsyncOperation_IVectorView_PnpObject_Interface'Class;
   type IAsyncOperation_IVectorView_PnpObject_Ptr is access all IAsyncOperation_IVectorView_PnpObject;
   
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
   type IPnpObjectUpdate_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Type
   (
      This       : access IPnpObjectUpdate_Interface
      ; RetVal : access Windows.Devices.Enumeration.Pnp.PnpObjectType
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access IPnpObjectUpdate_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IPnpObjectUpdate_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IPnpObjectUpdate : aliased constant Windows.IID := (1868163090, 30, 18500, (188, 198, 67, 40, 134, 133, 106, 23 ));
   
   ------------------------------------------------------------------------
   type IVectorView_PnpObject_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_PnpObject_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Enumeration.Pnp.IPnpObject
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_PnpObject_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_PnpObject_Interface
      ; value : Windows.Devices.Enumeration.Pnp.IPnpObject
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_PnpObject_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Enumeration.Pnp.IPnpObject_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_PnpObject : aliased constant Windows.IID := (3437602712, 53865, 24526, (153, 206, 239, 10, 227, 205, 5, 105 ));
   
   ------------------------------------------------------------------------
   type IIterable_PnpObject_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_PnpObject_Interface
      ; RetVal : access Windows.Devices.Enumeration.Pnp.IPnpObject
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_PnpObject : aliased constant Windows.IID := (817168530, 14062, 21503, (148, 80, 2, 144, 4, 67, 108, 96 ));
   
   ------------------------------------------------------------------------
   type IPnpObjectWatcher_Interface is interface and Windows.IInspectable_Interface;
   
   function add_Added
   (
      This       : access IPnpObjectWatcher_Interface
      ; handler : TypedEventHandler_IPnpObjectWatcher_add_Added
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Added
   (
      This       : access IPnpObjectWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Updated
   (
      This       : access IPnpObjectWatcher_Interface
      ; handler : TypedEventHandler_IPnpObjectWatcher_add_Updated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Updated
   (
      This       : access IPnpObjectWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Removed
   (
      This       : access IPnpObjectWatcher_Interface
      ; handler : TypedEventHandler_IPnpObjectWatcher_add_Removed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Removed
   (
      This       : access IPnpObjectWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_EnumerationCompleted
   (
      This       : access IPnpObjectWatcher_Interface
      ; handler : TypedEventHandler_IPnpObjectWatcher_add_EnumerationCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_EnumerationCompleted
   (
      This       : access IPnpObjectWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Stopped
   (
      This       : access IPnpObjectWatcher_Interface
      ; handler : TypedEventHandler_IPnpObjectWatcher_add_Stopped
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Stopped
   (
      This       : access IPnpObjectWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IPnpObjectWatcher_Interface
      ; RetVal : access Windows.Devices.Enumeration.DeviceWatcherStatus
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IPnpObjectWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IPnpObjectWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IPnpObjectWatcher : aliased constant Windows.IID := (2211011752, 18290, 19066, (172, 168, 228, 140, 66, 168, 156, 68 ));
   
   ------------------------------------------------------------------------
   type IPnpObjectStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromIdAsync
   (
      This       : access IPnpObjectStatics_Interface
      ; type_x : Windows.Devices.Enumeration.Pnp.PnpObjectType
      ; id : Windows.String
      ; requestedProperties : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Devices.Enumeration.Pnp.IAsyncOperation_IPnpObject -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAllAsync
   (
      This       : access IPnpObjectStatics_Interface
      ; type_x : Windows.Devices.Enumeration.Pnp.PnpObjectType
      ; requestedProperties : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Devices.Enumeration.Pnp.IAsyncOperation_IVectorView_PnpObject -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAllAsyncAqsFilter
   (
      This       : access IPnpObjectStatics_Interface
      ; type_x : Windows.Devices.Enumeration.Pnp.PnpObjectType
      ; requestedProperties : Windows.Foundation.Collections.IIterable_String
      ; aqsFilter : Windows.String
      ; RetVal : access Windows.Devices.Enumeration.Pnp.IAsyncOperation_IVectorView_PnpObject -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateWatcher
   (
      This       : access IPnpObjectStatics_Interface
      ; type_x : Windows.Devices.Enumeration.Pnp.PnpObjectType
      ; requestedProperties : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher
   )
   return Windows.HRESULT is abstract;
   
   function CreateWatcherAqsFilter
   (
      This       : access IPnpObjectStatics_Interface
      ; type_x : Windows.Devices.Enumeration.Pnp.PnpObjectType
      ; requestedProperties : Windows.Foundation.Collections.IIterable_String
      ; aqsFilter : Windows.String
      ; RetVal : access Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher
   )
   return Windows.HRESULT is abstract;
   
   IID_IPnpObjectStatics : aliased constant Windows.IID := (3015911997, 53608, 18016, (187, 243, 167, 51, 177, 75, 110, 1 ));
   
   ------------------------------------------------------------------------
   type IPnpObject_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Type
   (
      This       : access IPnpObject_Interface
      ; RetVal : access Windows.Devices.Enumeration.Pnp.PnpObjectType
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access IPnpObject_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IPnpObject_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function Update
   (
      This       : access IPnpObject_Interface
      ; updateInfo : Windows.Devices.Enumeration.Pnp.IPnpObjectUpdate
   )
   return Windows.HRESULT is abstract;
   
   IID_IPnpObject : aliased constant Windows.IID := (2512806488, 29499, 19087, (147, 163, 219, 7, 138, 200, 112, 193 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IPnpObject_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPnpObject_Interface
      ; handler : Windows.Devices.Enumeration.Pnp.AsyncOperationCompletedHandler_IPnpObject
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPnpObject_Interface
      ; RetVal : access Windows.Devices.Enumeration.Pnp.AsyncOperationCompletedHandler_IPnpObject
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPnpObject_Interface
      ; RetVal : access Windows.Devices.Enumeration.Pnp.IPnpObject
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IPnpObject : aliased constant Windows.IID := (582024083, 12518, 20506, (189, 59, 159, 163, 6, 62, 156, 22 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IVectorView_PnpObject_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IVectorView_PnpObject_Interface
      ; handler : Windows.Devices.Enumeration.Pnp.AsyncOperationCompletedHandler_IVectorView_PnpObject
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IVectorView_PnpObject_Interface
      ; RetVal : access Windows.Devices.Enumeration.Pnp.AsyncOperationCompletedHandler_IVectorView_PnpObject
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IVectorView_PnpObject_Interface
      ; RetVal : access Windows.Devices.Enumeration.Pnp.IVectorView_PnpObject
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IVectorView_PnpObject : aliased constant Windows.IID := (4085498572, 62246, 23486, (149, 209, 203, 194, 71, 20, 239, 134 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IPnpObjectWatcher_add_Added_Interface(Callback : access procedure (sender : Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher ; args : Windows.Devices.Enumeration.Pnp.IPnpObject)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IPnpObjectWatcher_add_Added_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPnpObjectWatcher_add_Added_Interface
      ; sender : Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher
      ; args : Windows.Devices.Enumeration.Pnp.IPnpObject
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IPnpObjectWatcher_add_Added : aliased constant Windows.IID := (3581472466, 22757, 22565, (138, 242, 18, 248, 147, 135, 182, 86 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IPnpObjectWatcher_add_Updated_Interface(Callback : access procedure (sender : Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher ; args : Windows.Devices.Enumeration.Pnp.IPnpObjectUpdate)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IPnpObjectWatcher_add_Updated_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPnpObjectWatcher_add_Updated_Interface
      ; sender : Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher
      ; args : Windows.Devices.Enumeration.Pnp.IPnpObjectUpdate
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IPnpObjectWatcher_add_Updated : aliased constant Windows.IID := (2945421981, 32856, 23608, (163, 216, 48, 170, 122, 8, 181, 136 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IPnpObjectWatcher_add_Removed_Interface(Callback : access procedure (sender : Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher ; args : Windows.Devices.Enumeration.Pnp.IPnpObjectUpdate)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IPnpObjectWatcher_add_Removed_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPnpObjectWatcher_add_Removed_Interface
      ; sender : Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher
      ; args : Windows.Devices.Enumeration.Pnp.IPnpObjectUpdate
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IPnpObjectWatcher_add_Removed : aliased constant Windows.IID := (2945421981, 32856, 23608, (163, 216, 48, 170, 122, 8, 181, 136 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IPnpObjectWatcher_add_EnumerationCompleted_Interface(Callback : access procedure (sender : Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IPnpObjectWatcher_add_EnumerationCompleted_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPnpObjectWatcher_add_EnumerationCompleted_Interface
      ; sender : Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IPnpObjectWatcher_add_EnumerationCompleted : aliased constant Windows.IID := (786609353, 46742, 24268, (178, 155, 241, 224, 239, 95, 225, 247 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IPnpObjectWatcher_add_Stopped_Interface(Callback : access procedure (sender : Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IPnpObjectWatcher_add_Stopped_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPnpObjectWatcher_add_Stopped_Interface
      ; sender : Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IPnpObjectWatcher_add_Stopped : aliased constant Windows.IID := (786609353, 46742, 24268, (178, 155, 241, 224, 239, 95, 225, 247 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IPnpObject_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Enumeration.Pnp.IAsyncOperation_IPnpObject ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IPnpObject_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPnpObject_Interface
      ; asyncInfo : Windows.Devices.Enumeration.Pnp.IAsyncOperation_IPnpObject
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IPnpObject : aliased constant Windows.IID := (2640401507, 26745, 21023, (142, 151, 230, 109, 61, 219, 201, 94 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IVectorView_PnpObject_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Enumeration.Pnp.IAsyncOperation_IVectorView_PnpObject ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IVectorView_PnpObject_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IVectorView_PnpObject_Interface
      ; asyncInfo : Windows.Devices.Enumeration.Pnp.IAsyncOperation_IVectorView_PnpObject
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IVectorView_PnpObject : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype PnpObjectUpdate is Windows.Devices.Enumeration.Pnp.IPnpObjectUpdate;
   subtype PnpObjectCollection is Windows.Devices.Enumeration.Pnp.IVectorView_PnpObject;
   subtype PnpObjectWatcher is Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher;
   subtype PnpObject is Windows.Devices.Enumeration.Pnp.IPnpObject;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function CreateFromIdAsync
   (
      type_x : Windows.Devices.Enumeration.Pnp.PnpObjectType
      ; id : Windows.String
      ; requestedProperties : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Devices.Enumeration.Pnp.IAsyncOperation_IPnpObject;
   
   function FindAllAsync
   (
      type_x : Windows.Devices.Enumeration.Pnp.PnpObjectType
      ; requestedProperties : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Devices.Enumeration.Pnp.IAsyncOperation_IVectorView_PnpObject;
   
   function FindAllAsyncAqsFilter
   (
      type_x : Windows.Devices.Enumeration.Pnp.PnpObjectType
      ; requestedProperties : Windows.Foundation.Collections.IIterable_String
      ; aqsFilter : Windows.String
   )
   return Windows.Devices.Enumeration.Pnp.IAsyncOperation_IVectorView_PnpObject;
   
   function CreateWatcher
   (
      type_x : Windows.Devices.Enumeration.Pnp.PnpObjectType
      ; requestedProperties : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher;
   
   function CreateWatcherAqsFilter
   (
      type_x : Windows.Devices.Enumeration.Pnp.PnpObjectType
      ; requestedProperties : Windows.Foundation.Collections.IIterable_String
      ; aqsFilter : Windows.String
   )
   return Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher;

end;
