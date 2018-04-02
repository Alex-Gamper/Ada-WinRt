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
with Windows.Foundation.Numerics;
limited with Windows.Graphics.Imaging;
limited with Windows.Media;
--------------------------------------------------------------------------------
package Windows.Devices.Perception.Provider is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type PerceptionStartFaceAuthenticationHandler_Interface;
   type PerceptionStartFaceAuthenticationHandler is access all PerceptionStartFaceAuthenticationHandler_Interface'Class;
   type PerceptionStartFaceAuthenticationHandler_Ptr is access all PerceptionStartFaceAuthenticationHandler;
   type PerceptionStopFaceAuthenticationHandler_Interface;
   type PerceptionStopFaceAuthenticationHandler is access all PerceptionStopFaceAuthenticationHandler_Interface'Class;
   type PerceptionStopFaceAuthenticationHandler_Ptr is access all PerceptionStopFaceAuthenticationHandler;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IKnownPerceptionFrameKindStatics_Interface;
   type IKnownPerceptionFrameKindStatics is access all IKnownPerceptionFrameKindStatics_Interface'Class;
   type IKnownPerceptionFrameKindStatics_Ptr is access all IKnownPerceptionFrameKindStatics;
   type IPerceptionFrameProviderManagerServiceStatics_Interface;
   type IPerceptionFrameProviderManagerServiceStatics is access all IPerceptionFrameProviderManagerServiceStatics_Interface'Class;
   type IPerceptionFrameProviderManagerServiceStatics_Ptr is access all IPerceptionFrameProviderManagerServiceStatics;
   type IPerceptionFrameProviderManager_Interface;
   type IPerceptionFrameProviderManager is access all IPerceptionFrameProviderManager_Interface'Class;
   type IPerceptionFrameProviderManager_Ptr is access all IPerceptionFrameProviderManager;
   type IPerceptionFrameProvider_Interface;
   type IPerceptionFrameProvider is access all IPerceptionFrameProvider_Interface'Class;
   type IPerceptionFrameProvider_Ptr is access all IPerceptionFrameProvider;
   type IPerceptionFrameProviderInfo_Interface;
   type IPerceptionFrameProviderInfo is access all IPerceptionFrameProviderInfo_Interface'Class;
   type IPerceptionFrameProviderInfo_Ptr is access all IPerceptionFrameProviderInfo;
   type IPerceptionControlGroupFactory_Interface;
   type IPerceptionControlGroupFactory is access all IPerceptionControlGroupFactory_Interface'Class;
   type IPerceptionControlGroupFactory_Ptr is access all IPerceptionControlGroupFactory;
   type IPerceptionControlGroup_Interface;
   type IPerceptionControlGroup is access all IPerceptionControlGroup_Interface'Class;
   type IPerceptionControlGroup_Ptr is access all IPerceptionControlGroup;
   type IPerceptionFaceAuthenticationGroupFactory_Interface;
   type IPerceptionFaceAuthenticationGroupFactory is access all IPerceptionFaceAuthenticationGroupFactory_Interface'Class;
   type IPerceptionFaceAuthenticationGroupFactory_Ptr is access all IPerceptionFaceAuthenticationGroupFactory;
   type IPerceptionFaceAuthenticationGroup_Interface;
   type IPerceptionFaceAuthenticationGroup is access all IPerceptionFaceAuthenticationGroup_Interface'Class;
   type IPerceptionFaceAuthenticationGroup_Ptr is access all IPerceptionFaceAuthenticationGroup;
   type IPerceptionCorrelationFactory_Interface;
   type IPerceptionCorrelationFactory is access all IPerceptionCorrelationFactory_Interface'Class;
   type IPerceptionCorrelationFactory_Ptr is access all IPerceptionCorrelationFactory;
   type IPerceptionCorrelation_Interface;
   type IPerceptionCorrelation is access all IPerceptionCorrelation_Interface'Class;
   type IPerceptionCorrelation_Ptr is access all IPerceptionCorrelation;
   type IPerceptionCorrelationGroupFactory_Interface;
   type IPerceptionCorrelationGroupFactory is access all IPerceptionCorrelationGroupFactory_Interface'Class;
   type IPerceptionCorrelationGroupFactory_Ptr is access all IPerceptionCorrelationGroupFactory;
   type IPerceptionCorrelationGroup_Interface;
   type IPerceptionCorrelationGroup is access all IPerceptionCorrelationGroup_Interface'Class;
   type IPerceptionCorrelationGroup_Ptr is access all IPerceptionCorrelationGroup;
   type IPerceptionFrame_Interface;
   type IPerceptionFrame is access all IPerceptionFrame_Interface'Class;
   type IPerceptionFrame_Ptr is access all IPerceptionFrame;
   type IPerceptionVideoFrameAllocatorFactory_Interface;
   type IPerceptionVideoFrameAllocatorFactory is access all IPerceptionVideoFrameAllocatorFactory_Interface'Class;
   type IPerceptionVideoFrameAllocatorFactory_Ptr is access all IPerceptionVideoFrameAllocatorFactory;
   type IPerceptionVideoFrameAllocator_Interface;
   type IPerceptionVideoFrameAllocator is access all IPerceptionVideoFrameAllocator_Interface'Class;
   type IPerceptionVideoFrameAllocator_Ptr is access all IPerceptionVideoFrameAllocator;
   type IPerceptionPropertyChangeRequest_Interface;
   type IPerceptionPropertyChangeRequest is access all IPerceptionPropertyChangeRequest_Interface'Class;
   type IPerceptionPropertyChangeRequest_Ptr is access all IPerceptionPropertyChangeRequest;
   type IIterator_IPerceptionCorrelation_Interface;
   type IIterator_IPerceptionCorrelation is access all IIterator_IPerceptionCorrelation_Interface'Class;
   type IIterator_IPerceptionCorrelation_Ptr is access all IIterator_IPerceptionCorrelation;
   type IIterable_IPerceptionCorrelation_Interface;
   type IIterable_IPerceptionCorrelation is access all IIterable_IPerceptionCorrelation_Interface'Class;
   type IIterable_IPerceptionCorrelation_Ptr is access all IIterable_IPerceptionCorrelation;
   type IVectorView_IPerceptionCorrelation_Interface;
   type IVectorView_IPerceptionCorrelation is access all IVectorView_IPerceptionCorrelation_Interface'Class;
   type IVectorView_IPerceptionCorrelation_Ptr is access all IVectorView_IPerceptionCorrelation;
   
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
   type IKnownPerceptionFrameKindStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Color
   (
      This       : access IKnownPerceptionFrameKindStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Depth
   (
      This       : access IKnownPerceptionFrameKindStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Infrared
   (
      This       : access IKnownPerceptionFrameKindStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IKnownPerceptionFrameKindStatics : aliased constant Windows.IID := (988172758, 38505, 16646, (159, 174, 72, 53, 193, 185, 97, 4 ));
   
   ------------------------------------------------------------------------
   type IPerceptionFrameProviderManagerServiceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function RegisterFrameProviderInfo
   (
      This       : access IPerceptionFrameProviderManagerServiceStatics_Interface
      ; manager : Windows.Devices.Perception.Provider.IPerceptionFrameProviderManager
      ; frameProviderInfo : Windows.Devices.Perception.Provider.IPerceptionFrameProviderInfo
   )
   return Windows.HRESULT is abstract;
   
   function UnregisterFrameProviderInfo
   (
      This       : access IPerceptionFrameProviderManagerServiceStatics_Interface
      ; manager : Windows.Devices.Perception.Provider.IPerceptionFrameProviderManager
      ; frameProviderInfo : Windows.Devices.Perception.Provider.IPerceptionFrameProviderInfo
   )
   return Windows.HRESULT is abstract;
   
   function RegisterFaceAuthenticationGroup
   (
      This       : access IPerceptionFrameProviderManagerServiceStatics_Interface
      ; manager : Windows.Devices.Perception.Provider.IPerceptionFrameProviderManager
      ; faceAuthenticationGroup : Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroup
   )
   return Windows.HRESULT is abstract;
   
   function UnregisterFaceAuthenticationGroup
   (
      This       : access IPerceptionFrameProviderManagerServiceStatics_Interface
      ; manager : Windows.Devices.Perception.Provider.IPerceptionFrameProviderManager
      ; faceAuthenticationGroup : Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroup
   )
   return Windows.HRESULT is abstract;
   
   function RegisterControlGroup
   (
      This       : access IPerceptionFrameProviderManagerServiceStatics_Interface
      ; manager : Windows.Devices.Perception.Provider.IPerceptionFrameProviderManager
      ; controlGroup : Windows.Devices.Perception.Provider.IPerceptionControlGroup
   )
   return Windows.HRESULT is abstract;
   
   function UnregisterControlGroup
   (
      This       : access IPerceptionFrameProviderManagerServiceStatics_Interface
      ; manager : Windows.Devices.Perception.Provider.IPerceptionFrameProviderManager
      ; controlGroup : Windows.Devices.Perception.Provider.IPerceptionControlGroup
   )
   return Windows.HRESULT is abstract;
   
   function RegisterCorrelationGroup
   (
      This       : access IPerceptionFrameProviderManagerServiceStatics_Interface
      ; manager : Windows.Devices.Perception.Provider.IPerceptionFrameProviderManager
      ; correlationGroup : Windows.Devices.Perception.Provider.IPerceptionCorrelationGroup
   )
   return Windows.HRESULT is abstract;
   
   function UnregisterCorrelationGroup
   (
      This       : access IPerceptionFrameProviderManagerServiceStatics_Interface
      ; manager : Windows.Devices.Perception.Provider.IPerceptionFrameProviderManager
      ; correlationGroup : Windows.Devices.Perception.Provider.IPerceptionCorrelationGroup
   )
   return Windows.HRESULT is abstract;
   
   function UpdateAvailabilityForProvider
   (
      This       : access IPerceptionFrameProviderManagerServiceStatics_Interface
      ; provider : Windows.Devices.Perception.Provider.IPerceptionFrameProvider
      ; available : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function PublishFrameForProvider
   (
      This       : access IPerceptionFrameProviderManagerServiceStatics_Interface
      ; provider : Windows.Devices.Perception.Provider.IPerceptionFrameProvider
      ; frame : Windows.Devices.Perception.Provider.IPerceptionFrame
   )
   return Windows.HRESULT is abstract;
   
   IID_IPerceptionFrameProviderManagerServiceStatics : aliased constant Windows.IID := (2927855334, 51929, 17241, (143, 150, 142, 174, 81, 129, 5, 38 ));
   
   ------------------------------------------------------------------------
   type IPerceptionFrameProviderManager_Interface is interface and Windows.IInspectable_Interface;
   
   function GetFrameProvider
   (
      This       : access IPerceptionFrameProviderManager_Interface
      ; frameProviderInfo : Windows.Devices.Perception.Provider.IPerceptionFrameProviderInfo
      ; RetVal : access Windows.Devices.Perception.Provider.IPerceptionFrameProvider
   )
   return Windows.HRESULT is abstract;
   
   IID_IPerceptionFrameProviderManager : aliased constant Windows.IID := (2841234951, 60115, 13279, (142, 193, 185, 36, 171, 224, 25, 196 ));
   
   ------------------------------------------------------------------------
   type IPerceptionFrameProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FrameProviderInfo
   (
      This       : access IPerceptionFrameProvider_Interface
      ; RetVal : access Windows.Devices.Perception.Provider.IPerceptionFrameProviderInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Available
   (
      This       : access IPerceptionFrameProvider_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IPerceptionFrameProvider_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IPerceptionFrameProvider_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IPerceptionFrameProvider_Interface
   )
   return Windows.HRESULT is abstract;
   
   function SetProperty
   (
      This       : access IPerceptionFrameProvider_Interface
      ; value : Windows.Devices.Perception.Provider.IPerceptionPropertyChangeRequest
   )
   return Windows.HRESULT is abstract;
   
   IID_IPerceptionFrameProvider : aliased constant Windows.IID := (2035251897, 45949, 15155, (161, 13, 48, 98, 100, 25, 206, 101 ));
   
   ------------------------------------------------------------------------
   type IPerceptionFrameProviderInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IPerceptionFrameProviderInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Id
   (
      This       : access IPerceptionFrameProviderInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IPerceptionFrameProviderInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayName
   (
      This       : access IPerceptionFrameProviderInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceKind
   (
      This       : access IPerceptionFrameProviderInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DeviceKind
   (
      This       : access IPerceptionFrameProviderInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FrameKind
   (
      This       : access IPerceptionFrameProviderInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_FrameKind
   (
      This       : access IPerceptionFrameProviderInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Hidden
   (
      This       : access IPerceptionFrameProviderInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Hidden
   (
      This       : access IPerceptionFrameProviderInfo_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IPerceptionFrameProviderInfo : aliased constant Windows.IID := (3433650664, 31102, 20099, (155, 135, 3, 106, 116, 20, 47, 196 ));
   
   ------------------------------------------------------------------------
   type IPerceptionControlGroupFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IPerceptionControlGroupFactory_Interface
      ; ids : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Devices.Perception.Provider.IPerceptionControlGroup
   )
   return Windows.HRESULT is abstract;
   
   IID_IPerceptionControlGroupFactory : aliased constant Windows.IID := (790295264, 47857, 17723, (190, 212, 205, 157, 70, 25, 21, 76 ));
   
   ------------------------------------------------------------------------
   type IPerceptionControlGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FrameProviderIds
   (
      This       : access IPerceptionControlGroup_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IPerceptionControlGroup : aliased constant Windows.IID := (388778114, 12249, 19534, (186, 52, 253, 242, 10, 115, 221, 229 ));
   
   ------------------------------------------------------------------------
   type IPerceptionFaceAuthenticationGroupFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IPerceptionFaceAuthenticationGroupFactory_Interface
      ; ids : Windows.Foundation.Collections.IIterable_String
      ; startHandler : Windows.Devices.Perception.Provider.PerceptionStartFaceAuthenticationHandler
      ; stopHandler : Windows.Devices.Perception.Provider.PerceptionStopFaceAuthenticationHandler
      ; RetVal : access Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroup
   )
   return Windows.HRESULT is abstract;
   
   IID_IPerceptionFaceAuthenticationGroupFactory : aliased constant Windows.IID := (3867805140, 46604, 16628, (188, 185, 242, 77, 70, 70, 115, 32 ));
   
   ------------------------------------------------------------------------
   type IPerceptionFaceAuthenticationGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FrameProviderIds
   (
      This       : access IPerceptionFaceAuthenticationGroup_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IPerceptionFaceAuthenticationGroup : aliased constant Windows.IID := (3892418580, 19089, 16816, (131, 166, 136, 26, 23, 117, 53, 62 ));
   
   ------------------------------------------------------------------------
   type IPerceptionCorrelationFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IPerceptionCorrelationFactory_Interface
      ; targetId : Windows.String
      ; position : Windows.Foundation.Numerics.Vector3
      ; orientation : Windows.Foundation.Numerics.Quaternion
      ; RetVal : access Windows.Devices.Perception.Provider.IPerceptionCorrelation
   )
   return Windows.HRESULT is abstract;
   
   IID_IPerceptionCorrelationFactory : aliased constant Windows.IID := (3567698981, 10372, 19087, (129, 52, 40, 53, 215, 40, 108, 191 ));
   
   ------------------------------------------------------------------------
   type IPerceptionCorrelation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TargetId
   (
      This       : access IPerceptionCorrelation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access IPerceptionCorrelation_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_Orientation
   (
      This       : access IPerceptionCorrelation_Interface
      ; RetVal : access Windows.Foundation.Numerics.Quaternion
   )
   return Windows.HRESULT is abstract;
   
   IID_IPerceptionCorrelation : aliased constant Windows.IID := (3021150850, 57333, 16455, (138, 25, 59, 77, 128, 95, 113, 118 ));
   
   ------------------------------------------------------------------------
   type IPerceptionCorrelationGroupFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IPerceptionCorrelationGroupFactory_Interface
      ; relativeLocations : Windows.Devices.Perception.Provider.IIterable_IPerceptionCorrelation
      ; RetVal : access Windows.Devices.Perception.Provider.IPerceptionCorrelationGroup
   )
   return Windows.HRESULT is abstract;
   
   IID_IPerceptionCorrelationGroupFactory : aliased constant Windows.IID := (2113806472, 25567, 18669, (131, 177, 74, 184, 41, 19, 41, 149 ));
   
   ------------------------------------------------------------------------
   type IPerceptionCorrelationGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RelativeLocations
   (
      This       : access IPerceptionCorrelationGroup_Interface
      ; RetVal : access Windows.Devices.Perception.Provider.IVectorView_IPerceptionCorrelation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IPerceptionCorrelationGroup : aliased constant Windows.IID := (1965689094, 13991, 18363, (155, 121, 86, 204, 107, 116, 103, 112 ));
   
   ------------------------------------------------------------------------
   type IPerceptionFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RelativeTime
   (
      This       : access IPerceptionFrame_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_RelativeTime
   (
      This       : access IPerceptionFrame_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IPerceptionFrame_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function get_FrameData
   (
      This       : access IPerceptionFrame_Interface
      ; RetVal : access Windows.Foundation.IMemoryBuffer
   )
   return Windows.HRESULT is abstract;
   
   IID_IPerceptionFrame : aliased constant Windows.IID := (2097051685, 21691, 19869, (190, 197, 142, 246, 97, 81, 210, 172 ));
   
   ------------------------------------------------------------------------
   type IPerceptionVideoFrameAllocatorFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IPerceptionVideoFrameAllocatorFactory_Interface
      ; maxOutstandingFrameCountForWrite : Windows.UInt32
      ; format : Windows.Graphics.Imaging.BitmapPixelFormat
      ; resolution : Windows.Foundation.Size
      ; alpha : Windows.Graphics.Imaging.BitmapAlphaMode
      ; RetVal : access Windows.Devices.Perception.Provider.IPerceptionVideoFrameAllocator
   )
   return Windows.HRESULT is abstract;
   
   IID_IPerceptionVideoFrameAllocatorFactory : aliased constant Windows.IID := (442020065, 59674, 18462, (184, 118, 168, 158, 43, 188, 107, 51 ));
   
   ------------------------------------------------------------------------
   type IPerceptionVideoFrameAllocator_Interface is interface and Windows.IInspectable_Interface;
   
   function AllocateFrame
   (
      This       : access IPerceptionVideoFrameAllocator_Interface
      ; RetVal : access Windows.Devices.Perception.Provider.IPerceptionFrame
   )
   return Windows.HRESULT is abstract;
   
   function CopyFromVideoFrame
   (
      This       : access IPerceptionVideoFrameAllocator_Interface
      ; frame : Windows.Media.IVideoFrame
      ; RetVal : access Windows.Devices.Perception.Provider.IPerceptionFrame
   )
   return Windows.HRESULT is abstract;
   
   IID_IPerceptionVideoFrameAllocator : aliased constant Windows.IID := (1278781402, 64984, 20180, (160, 57, 42, 111, 155, 35, 80, 56 ));
   
   ------------------------------------------------------------------------
   type IPerceptionPropertyChangeRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IPerceptionPropertyChangeRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IPerceptionPropertyChangeRequest_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IPerceptionPropertyChangeRequest_Interface
      ; RetVal : access Windows.Devices.Perception.PerceptionFrameSourcePropertyChangeStatus
   )
   return Windows.HRESULT is abstract;
   
   function put_Status
   (
      This       : access IPerceptionPropertyChangeRequest_Interface
      ; value : Windows.Devices.Perception.PerceptionFrameSourcePropertyChangeStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IPerceptionPropertyChangeRequest_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IPerceptionPropertyChangeRequest : aliased constant Windows.IID := (1012591441, 13579, 19960, (148, 20, 89, 224, 152, 21, 81, 11 ));
   
   ------------------------------------------------------------------------
   type IIterator_IPerceptionCorrelation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPerceptionCorrelation_Interface
      ; RetVal : access Windows.Devices.Perception.Provider.IPerceptionCorrelation
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPerceptionCorrelation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPerceptionCorrelation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPerceptionCorrelation_Interface
      ; items : Windows.Devices.Perception.Provider.IPerceptionCorrelation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IPerceptionCorrelation : aliased constant Windows.IID := (3302690963, 55045, 21763, (139, 206, 104, 83, 92, 212, 47, 250 ));
   
   ------------------------------------------------------------------------
   type IIterable_IPerceptionCorrelation_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPerceptionCorrelation_Interface
      ; RetVal : access Windows.Devices.Perception.Provider.IIterator_IPerceptionCorrelation
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IPerceptionCorrelation : aliased constant Windows.IID := (3396073598, 5957, 23760, (174, 226, 89, 115, 111, 90, 32, 109 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IPerceptionCorrelation_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPerceptionCorrelation_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Perception.Provider.IPerceptionCorrelation
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPerceptionCorrelation_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPerceptionCorrelation_Interface
      ; value : Windows.Devices.Perception.Provider.IPerceptionCorrelation
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPerceptionCorrelation_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Perception.Provider.IPerceptionCorrelation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IPerceptionCorrelation : aliased constant Windows.IID := (609004902, 44990, 21396, (183, 183, 67, 166, 31, 203, 252, 109 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type PerceptionStartFaceAuthenticationHandler_Interface(Callback : access procedure (sender : Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroup)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access PerceptionStartFaceAuthenticationHandler_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access PerceptionStartFaceAuthenticationHandler_Interface
      ; sender : Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroup
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT;
   
   IID_PerceptionStartFaceAuthenticationHandler : aliased constant Windows.IID := (1954639146, 8336, 18032, (140, 72, 239, 57, 231, 255, 124, 38 ));
   
   ------------------------------------------------------------------------
   type PerceptionStopFaceAuthenticationHandler_Interface(Callback : access procedure (sender : Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroup)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access PerceptionStopFaceAuthenticationHandler_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access PerceptionStopFaceAuthenticationHandler_Interface
      ; sender : Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroup
   )
   return Windows.HRESULT;
   
   IID_PerceptionStopFaceAuthenticationHandler : aliased constant Windows.IID := (947840682, 35277, 18462, (170, 222, 221, 146, 247, 11, 42, 215 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype PerceptionFrameProviderInfo is Windows.Devices.Perception.Provider.IPerceptionFrameProviderInfo;
   
   function CreatePerceptionFrameProviderInfo return Windows.Devices.Perception.Provider.IPerceptionFrameProviderInfo;
   
   subtype PerceptionPropertyChangeRequest is Windows.Devices.Perception.Provider.IPerceptionPropertyChangeRequest;
   subtype PerceptionFaceAuthenticationGroup is Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroup;
   
   function Create
   (
      ids : Windows.Foundation.Collections.IIterable_String
      ; startHandler : Windows.Devices.Perception.Provider.PerceptionStartFaceAuthenticationHandler
      ; stopHandler : Windows.Devices.Perception.Provider.PerceptionStopFaceAuthenticationHandler
   )
   return Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroup;
   
   subtype PerceptionControlGroup is Windows.Devices.Perception.Provider.IPerceptionControlGroup;
   
   function Create
   (
      ids : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Devices.Perception.Provider.IPerceptionControlGroup;
   
   subtype PerceptionCorrelationGroup is Windows.Devices.Perception.Provider.IPerceptionCorrelationGroup;
   
   function Create
   (
      relativeLocations : Windows.Devices.Perception.Provider.IIterable_IPerceptionCorrelation
   )
   return Windows.Devices.Perception.Provider.IPerceptionCorrelationGroup;
   
   subtype PerceptionFrame is Windows.Devices.Perception.Provider.IPerceptionFrame;
   subtype PerceptionCorrelation is Windows.Devices.Perception.Provider.IPerceptionCorrelation;
   
   function Create
   (
      targetId : Windows.String
      ; position : Windows.Foundation.Numerics.Vector3
      ; orientation : Windows.Foundation.Numerics.Quaternion
   )
   return Windows.Devices.Perception.Provider.IPerceptionCorrelation;
   
   subtype PerceptionVideoFrameAllocator is Windows.Devices.Perception.Provider.IPerceptionVideoFrameAllocator;
   
   function Create
   (
      maxOutstandingFrameCountForWrite : Windows.UInt32
      ; format : Windows.Graphics.Imaging.BitmapPixelFormat
      ; resolution : Windows.Foundation.Size
      ; alpha : Windows.Graphics.Imaging.BitmapAlphaMode
   )
   return Windows.Devices.Perception.Provider.IPerceptionVideoFrameAllocator;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   

end;
