--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.1.0.1                                                     --
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
-- along with this program.If not, see < http://www.gnu.org/licenses/>.       --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.Foundation;
with Windows.Foundation.Collections;
limited with Windows.Devices.HumanInterfaceDevice;
--------------------------------------------------------------------------------
package Windows.Devices.Input.Preview is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type GazeDeviceConfigurationStatePreview is (
      Unknown,
      Ready,
      Configuring,
      ScreenSetupNeeded,
      UserCalibrationNeeded
   );
   for GazeDeviceConfigurationStatePreview use (
      Unknown => 0,
      Ready => 1,
      Configuring => 2,
      ScreenSetupNeeded => 3,
      UserCalibrationNeeded => 4
   );
   for GazeDeviceConfigurationStatePreview'Size use 32;
   
   type GazeDeviceConfigurationStatePreview_Ptr is access GazeDeviceConfigurationStatePreview;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IGazeDeviceWatcherPreview_add_Added_Interface;
   type TypedEventHandler_IGazeDeviceWatcherPreview_add_Added is access all TypedEventHandler_IGazeDeviceWatcherPreview_add_Added_Interface'Class;
   type TypedEventHandler_IGazeDeviceWatcherPreview_add_Added_Ptr is access all TypedEventHandler_IGazeDeviceWatcherPreview_add_Added;
   type TypedEventHandler_IGazeDeviceWatcherPreview_add_Removed_Interface;
   type TypedEventHandler_IGazeDeviceWatcherPreview_add_Removed is access all TypedEventHandler_IGazeDeviceWatcherPreview_add_Removed_Interface'Class;
   type TypedEventHandler_IGazeDeviceWatcherPreview_add_Removed_Ptr is access all TypedEventHandler_IGazeDeviceWatcherPreview_add_Removed;
   type TypedEventHandler_IGazeDeviceWatcherPreview_add_Updated_Interface;
   type TypedEventHandler_IGazeDeviceWatcherPreview_add_Updated is access all TypedEventHandler_IGazeDeviceWatcherPreview_add_Updated_Interface'Class;
   type TypedEventHandler_IGazeDeviceWatcherPreview_add_Updated_Ptr is access all TypedEventHandler_IGazeDeviceWatcherPreview_add_Updated;
   type TypedEventHandler_IGazeDeviceWatcherPreview_add_EnumerationCompleted_Interface;
   type TypedEventHandler_IGazeDeviceWatcherPreview_add_EnumerationCompleted is access all TypedEventHandler_IGazeDeviceWatcherPreview_add_EnumerationCompleted_Interface'Class;
   type TypedEventHandler_IGazeDeviceWatcherPreview_add_EnumerationCompleted_Ptr is access all TypedEventHandler_IGazeDeviceWatcherPreview_add_EnumerationCompleted;
   type TypedEventHandler_IGazeInputSourcePreview_add_GazeMoved_Interface;
   type TypedEventHandler_IGazeInputSourcePreview_add_GazeMoved is access all TypedEventHandler_IGazeInputSourcePreview_add_GazeMoved_Interface'Class;
   type TypedEventHandler_IGazeInputSourcePreview_add_GazeMoved_Ptr is access all TypedEventHandler_IGazeInputSourcePreview_add_GazeMoved;
   type TypedEventHandler_IGazeInputSourcePreview_add_GazeEntered_Interface;
   type TypedEventHandler_IGazeInputSourcePreview_add_GazeEntered is access all TypedEventHandler_IGazeInputSourcePreview_add_GazeEntered_Interface'Class;
   type TypedEventHandler_IGazeInputSourcePreview_add_GazeEntered_Ptr is access all TypedEventHandler_IGazeInputSourcePreview_add_GazeEntered;
   type TypedEventHandler_IGazeInputSourcePreview_add_GazeExited_Interface;
   type TypedEventHandler_IGazeInputSourcePreview_add_GazeExited is access all TypedEventHandler_IGazeInputSourcePreview_add_GazeExited_Interface'Class;
   type TypedEventHandler_IGazeInputSourcePreview_add_GazeExited_Ptr is access all TypedEventHandler_IGazeInputSourcePreview_add_GazeExited;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IGazeInputSourcePreviewStatics_Interface;
   type IGazeInputSourcePreviewStatics is access all IGazeInputSourcePreviewStatics_Interface'Class;
   type IGazeInputSourcePreviewStatics_Ptr is access all IGazeInputSourcePreviewStatics;
   type IGazeDeviceWatcherPreview_Interface;
   type IGazeDeviceWatcherPreview is access all IGazeDeviceWatcherPreview_Interface'Class;
   type IGazeDeviceWatcherPreview_Ptr is access all IGazeDeviceWatcherPreview;
   type IGazeInputSourcePreview_Interface;
   type IGazeInputSourcePreview is access all IGazeInputSourcePreview_Interface'Class;
   type IGazeInputSourcePreview_Ptr is access all IGazeInputSourcePreview;
   type IGazeDeviceWatcherAddedPreviewEventArgs_Interface;
   type IGazeDeviceWatcherAddedPreviewEventArgs is access all IGazeDeviceWatcherAddedPreviewEventArgs_Interface'Class;
   type IGazeDeviceWatcherAddedPreviewEventArgs_Ptr is access all IGazeDeviceWatcherAddedPreviewEventArgs;
   type IGazeDeviceWatcherRemovedPreviewEventArgs_Interface;
   type IGazeDeviceWatcherRemovedPreviewEventArgs is access all IGazeDeviceWatcherRemovedPreviewEventArgs_Interface'Class;
   type IGazeDeviceWatcherRemovedPreviewEventArgs_Ptr is access all IGazeDeviceWatcherRemovedPreviewEventArgs;
   type IGazeDeviceWatcherUpdatedPreviewEventArgs_Interface;
   type IGazeDeviceWatcherUpdatedPreviewEventArgs is access all IGazeDeviceWatcherUpdatedPreviewEventArgs_Interface'Class;
   type IGazeDeviceWatcherUpdatedPreviewEventArgs_Ptr is access all IGazeDeviceWatcherUpdatedPreviewEventArgs;
   type IGazeDevicePreview_Interface;
   type IGazeDevicePreview is access all IGazeDevicePreview_Interface'Class;
   type IGazeDevicePreview_Ptr is access all IGazeDevicePreview;
   type IGazePointPreview_Interface;
   type IGazePointPreview is access all IGazePointPreview_Interface'Class;
   type IGazePointPreview_Ptr is access all IGazePointPreview;
   type IGazeEnteredPreviewEventArgs_Interface;
   type IGazeEnteredPreviewEventArgs is access all IGazeEnteredPreviewEventArgs_Interface'Class;
   type IGazeEnteredPreviewEventArgs_Ptr is access all IGazeEnteredPreviewEventArgs;
   type IGazeExitedPreviewEventArgs_Interface;
   type IGazeExitedPreviewEventArgs is access all IGazeExitedPreviewEventArgs_Interface'Class;
   type IGazeExitedPreviewEventArgs_Ptr is access all IGazeExitedPreviewEventArgs;
   type IGazeMovedPreviewEventArgs_Interface;
   type IGazeMovedPreviewEventArgs is access all IGazeMovedPreviewEventArgs_Interface'Class;
   type IGazeMovedPreviewEventArgs_Ptr is access all IGazeMovedPreviewEventArgs;
   type IIterator_IGazePointPreview_Interface;
   type IIterator_IGazePointPreview is access all IIterator_IGazePointPreview_Interface'Class;
   type IIterator_IGazePointPreview_Ptr is access all IIterator_IGazePointPreview;
   type IIterable_IGazePointPreview_Interface;
   type IIterable_IGazePointPreview is access all IIterable_IGazePointPreview_Interface'Class;
   type IIterable_IGazePointPreview_Ptr is access all IIterable_IGazePointPreview;
   type IVectorView_IGazePointPreview_Interface;
   type IVectorView_IGazePointPreview is access all IVectorView_IGazePointPreview_Interface'Class;
   type IVectorView_IGazePointPreview_Ptr is access all IVectorView_IGazePointPreview;
   type IVector_IGazePointPreview_Interface;
   type IVector_IGazePointPreview is access all IVector_IGazePointPreview_Interface'Class;
   type IVector_IGazePointPreview_Ptr is access all IVector_IGazePointPreview;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IGazeInputSourcePreviewStatics : aliased constant Windows.IID := (3885924070, 45961, 4583, (178, 1, 200, 211, 255, 183, 87, 33 ));
   
   type IGazeInputSourcePreviewStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access IGazeInputSourcePreviewStatics_Interface
      ; RetVal : access Windows.Devices.Input.Preview.IGazeInputSourcePreview
   )
   return Windows.HRESULT is abstract;
   
   function CreateWatcher
   (
      This       : access IGazeInputSourcePreviewStatics_Interface
      ; RetVal : access Windows.Devices.Input.Preview.IGazeDeviceWatcherPreview
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGazeDeviceWatcherPreview : aliased constant Windows.IID := (3885924071, 45961, 4583, (178, 1, 200, 211, 255, 183, 87, 33 ));
   
   type IGazeDeviceWatcherPreview_Interface is interface and Windows.IInspectable_Interface;
   
   function add_Added
   (
      This       : access IGazeDeviceWatcherPreview_Interface
      ; handler : TypedEventHandler_IGazeDeviceWatcherPreview_add_Added
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Added
   (
      This       : access IGazeDeviceWatcherPreview_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Removed
   (
      This       : access IGazeDeviceWatcherPreview_Interface
      ; handler : TypedEventHandler_IGazeDeviceWatcherPreview_add_Removed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Removed
   (
      This       : access IGazeDeviceWatcherPreview_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Updated
   (
      This       : access IGazeDeviceWatcherPreview_Interface
      ; handler : TypedEventHandler_IGazeDeviceWatcherPreview_add_Updated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Updated
   (
      This       : access IGazeDeviceWatcherPreview_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_EnumerationCompleted
   (
      This       : access IGazeDeviceWatcherPreview_Interface
      ; handler : TypedEventHandler_IGazeDeviceWatcherPreview_add_EnumerationCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_EnumerationCompleted
   (
      This       : access IGazeDeviceWatcherPreview_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IGazeDeviceWatcherPreview_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IGazeDeviceWatcherPreview_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGazeInputSourcePreview : aliased constant Windows.IID := (3885924072, 45961, 4583, (178, 1, 200, 211, 255, 183, 87, 33 ));
   
   type IGazeInputSourcePreview_Interface is interface and Windows.IInspectable_Interface;
   
   function add_GazeMoved
   (
      This       : access IGazeInputSourcePreview_Interface
      ; handler : TypedEventHandler_IGazeInputSourcePreview_add_GazeMoved
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_GazeMoved
   (
      This       : access IGazeInputSourcePreview_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_GazeEntered
   (
      This       : access IGazeInputSourcePreview_Interface
      ; handler : TypedEventHandler_IGazeInputSourcePreview_add_GazeEntered
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_GazeEntered
   (
      This       : access IGazeInputSourcePreview_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_GazeExited
   (
      This       : access IGazeInputSourcePreview_Interface
      ; handler : TypedEventHandler_IGazeInputSourcePreview_add_GazeExited
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_GazeExited
   (
      This       : access IGazeInputSourcePreview_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGazeDeviceWatcherAddedPreviewEventArgs : aliased constant Windows.IID := (3885924077, 45961, 4583, (178, 1, 200, 211, 255, 183, 87, 33 ));
   
   type IGazeDeviceWatcherAddedPreviewEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Device
   (
      This       : access IGazeDeviceWatcherAddedPreviewEventArgs_Interface
      ; RetVal : access Windows.Devices.Input.Preview.IGazeDevicePreview
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGazeDeviceWatcherRemovedPreviewEventArgs : aliased constant Windows.IID := (4066582280, 3647, 17183, (166, 6, 80, 179, 90, 249, 74, 28 ));
   
   type IGazeDeviceWatcherRemovedPreviewEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Device
   (
      This       : access IGazeDeviceWatcherRemovedPreviewEventArgs_Interface
      ; RetVal : access Windows.Devices.Input.Preview.IGazeDevicePreview
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGazeDeviceWatcherUpdatedPreviewEventArgs : aliased constant Windows.IID := (2145923311, 32520, 18231, (136, 225, 74, 131, 174, 78, 72, 133 ));
   
   type IGazeDeviceWatcherUpdatedPreviewEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Device
   (
      This       : access IGazeDeviceWatcherUpdatedPreviewEventArgs_Interface
      ; RetVal : access Windows.Devices.Input.Preview.IGazeDevicePreview
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGazeDevicePreview : aliased constant Windows.IID := (3885924073, 45961, 4583, (178, 1, 200, 211, 255, 183, 87, 33 ));
   
   type IGazeDevicePreview_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IGazeDevicePreview_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_CanTrackEyes
   (
      This       : access IGazeDevicePreview_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanTrackHead
   (
      This       : access IGazeDevicePreview_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ConfigurationState
   (
      This       : access IGazeDevicePreview_Interface
      ; RetVal : access Windows.Devices.Input.Preview.GazeDeviceConfigurationStatePreview
   )
   return Windows.HRESULT is abstract;
   
   function RequestCalibrationAsync
   (
      This       : access IGazeDevicePreview_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetNumericControlDescriptions
   (
      This       : access IGazeDevicePreview_Interface
      ; usagePage : Windows.UInt16
      ; usageId : Windows.UInt16
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IVectorView_IHidNumericControlDescription -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetBooleanControlDescriptions
   (
      This       : access IGazeDevicePreview_Interface
      ; usagePage : Windows.UInt16
      ; usageId : Windows.UInt16
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IVectorView_IHidBooleanControlDescription -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGazePointPreview : aliased constant Windows.IID := (3885924074, 45961, 4583, (178, 1, 200, 211, 255, 183, 87, 33 ));
   
   type IGazePointPreview_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SourceDevice
   (
      This       : access IGazePointPreview_Interface
      ; RetVal : access Windows.Devices.Input.Preview.IGazeDevicePreview
   )
   return Windows.HRESULT is abstract;
   
   function get_EyeGazePosition
   (
      This       : access IGazePointPreview_Interface
      ; RetVal : access Windows.Foundation.IReference_Point -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_HeadGazePosition
   (
      This       : access IGazePointPreview_Interface
      ; RetVal : access Windows.Foundation.IReference_Point -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Timestamp
   (
      This       : access IGazePointPreview_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_HidInputReport
   (
      This       : access IGazePointPreview_Interface
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IHidInputReport
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGazeEnteredPreviewEventArgs : aliased constant Windows.IID := (627556163, 4645, 18591, (157, 209, 218, 167, 197, 15, 191, 75 ));
   
   type IGazeEnteredPreviewEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Handled
   (
      This       : access IGazeEnteredPreviewEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IGazeEnteredPreviewEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentPoint
   (
      This       : access IGazeEnteredPreviewEventArgs_Interface
      ; RetVal : access Windows.Devices.Input.Preview.IGazePointPreview
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGazeExitedPreviewEventArgs : aliased constant Windows.IID := (1560998014, 32131, 16623, (159, 10, 251, 193, 187, 220, 197, 172 ));
   
   type IGazeExitedPreviewEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Handled
   (
      This       : access IGazeExitedPreviewEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IGazeExitedPreviewEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentPoint
   (
      This       : access IGazeExitedPreviewEventArgs_Interface
      ; RetVal : access Windows.Devices.Input.Preview.IGazePointPreview
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGazeMovedPreviewEventArgs : aliased constant Windows.IID := (3885924075, 45961, 4583, (178, 1, 200, 211, 255, 183, 87, 33 ));
   
   type IGazeMovedPreviewEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Handled
   (
      This       : access IGazeMovedPreviewEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IGazeMovedPreviewEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentPoint
   (
      This       : access IGazeMovedPreviewEventArgs_Interface
      ; RetVal : access Windows.Devices.Input.Preview.IGazePointPreview
   )
   return Windows.HRESULT is abstract;
   
   function GetIntermediatePoints
   (
      This       : access IGazeMovedPreviewEventArgs_Interface
      ; RetVal : access Windows.Devices.Input.Preview.IVector_IGazePointPreview -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IGazePointPreview : aliased constant Windows.IID := (2902547585, 11648, 20510, (188, 154, 166, 63, 5, 249, 59, 172 ));
   
   type IIterator_IGazePointPreview_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IGazePointPreview_Interface
      ; RetVal : access Windows.Devices.Input.Preview.IGazePointPreview
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IGazePointPreview_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IGazePointPreview_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IGazePointPreview_Interface
      ; items : Windows.Devices.Input.Preview.IGazePointPreview_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IGazePointPreview : aliased constant Windows.IID := (485917286, 16055, 21302, (132, 10, 60, 29, 159, 223, 83, 73 ));
   
   type IIterable_IGazePointPreview_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IGazePointPreview_Interface
      ; RetVal : access Windows.Devices.Input.Preview.IIterator_IGazePointPreview
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IGazePointPreview : aliased constant Windows.IID := (1027432776, 44290, 22251, (172, 175, 14, 169, 228, 124, 2, 152 ));
   
   type IVectorView_IGazePointPreview_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IGazePointPreview_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Input.Preview.IGazePointPreview
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IGazePointPreview_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IGazePointPreview_Interface
      ; value : Windows.Devices.Input.Preview.IGazePointPreview
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IGazePointPreview_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Input.Preview.IGazePointPreview_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IGazePointPreview : aliased constant Windows.IID := (1147823165, 14460, 24310, (168, 172, 204, 169, 216, 167, 147, 180 ));
   
   type IVector_IGazePointPreview_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IGazePointPreview_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Input.Preview.IGazePointPreview
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IGazePointPreview_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IGazePointPreview_Interface
      ; RetVal : access Windows.Devices.Input.Preview.IVectorView_IGazePointPreview
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IGazePointPreview_Interface
      ; value : Windows.Devices.Input.Preview.IGazePointPreview
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IGazePointPreview_Interface
      ; index : Windows.UInt32
      ; value : Windows.Devices.Input.Preview.IGazePointPreview
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IGazePointPreview_Interface
      ; index : Windows.UInt32
      ; value : Windows.Devices.Input.Preview.IGazePointPreview
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IGazePointPreview_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IGazePointPreview_Interface
      ; value : Windows.Devices.Input.Preview.IGazePointPreview
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IGazePointPreview_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IGazePointPreview_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IGazePointPreview_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Input.Preview.IGazePointPreview_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IGazePointPreview_Interface
      ; items : Windows.Devices.Input.Preview.IGazePointPreview_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IGazeDeviceWatcherPreview_add_Added : aliased constant Windows.IID := (1543067429, 26761, 21583, (186, 59, 221, 169, 134, 173, 216, 174 ));
   
   type TypedEventHandler_IGazeDeviceWatcherPreview_add_Added_Interface(Callback : access procedure (sender : Windows.Devices.Input.Preview.IGazeDeviceWatcherPreview ; args : Windows.Devices.Input.Preview.IGazeDeviceWatcherAddedPreviewEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IGazeDeviceWatcherPreview_add_Added'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IGazeDeviceWatcherPreview_add_Added_Interface
      ; sender : Windows.Devices.Input.Preview.IGazeDeviceWatcherPreview
      ; args : Windows.Devices.Input.Preview.IGazeDeviceWatcherAddedPreviewEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IGazeDeviceWatcherPreview_add_Removed : aliased constant Windows.IID := (113670726, 13491, 21502, (134, 223, 206, 181, 46, 45, 18, 231 ));
   
   type TypedEventHandler_IGazeDeviceWatcherPreview_add_Removed_Interface(Callback : access procedure (sender : Windows.Devices.Input.Preview.IGazeDeviceWatcherPreview ; args : Windows.Devices.Input.Preview.IGazeDeviceWatcherRemovedPreviewEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IGazeDeviceWatcherPreview_add_Removed'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IGazeDeviceWatcherPreview_add_Removed_Interface
      ; sender : Windows.Devices.Input.Preview.IGazeDeviceWatcherPreview
      ; args : Windows.Devices.Input.Preview.IGazeDeviceWatcherRemovedPreviewEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IGazeDeviceWatcherPreview_add_Updated : aliased constant Windows.IID := (4269838508, 32093, 20647, (163, 211, 243, 17, 100, 138, 123, 137 ));
   
   type TypedEventHandler_IGazeDeviceWatcherPreview_add_Updated_Interface(Callback : access procedure (sender : Windows.Devices.Input.Preview.IGazeDeviceWatcherPreview ; args : Windows.Devices.Input.Preview.IGazeDeviceWatcherUpdatedPreviewEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IGazeDeviceWatcherPreview_add_Updated'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IGazeDeviceWatcherPreview_add_Updated_Interface
      ; sender : Windows.Devices.Input.Preview.IGazeDeviceWatcherPreview
      ; args : Windows.Devices.Input.Preview.IGazeDeviceWatcherUpdatedPreviewEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IGazeDeviceWatcherPreview_add_EnumerationCompleted : aliased constant Windows.IID := (1939970811, 24705, 21787, (191, 115, 213, 210, 49, 85, 218, 142 ));
   
   type TypedEventHandler_IGazeDeviceWatcherPreview_add_EnumerationCompleted_Interface(Callback : access procedure (sender : Windows.Devices.Input.Preview.IGazeDeviceWatcherPreview ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IGazeDeviceWatcherPreview_add_EnumerationCompleted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IGazeDeviceWatcherPreview_add_EnumerationCompleted_Interface
      ; sender : Windows.Devices.Input.Preview.IGazeDeviceWatcherPreview
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IGazeInputSourcePreview_add_GazeMoved : aliased constant Windows.IID := (3888156303, 6842, 22866, (175, 92, 211, 162, 112, 127, 79, 228 ));
   
   type TypedEventHandler_IGazeInputSourcePreview_add_GazeMoved_Interface(Callback : access procedure (sender : Windows.Devices.Input.Preview.IGazeInputSourcePreview ; args : Windows.Devices.Input.Preview.IGazeMovedPreviewEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IGazeInputSourcePreview_add_GazeMoved'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IGazeInputSourcePreview_add_GazeMoved_Interface
      ; sender : Windows.Devices.Input.Preview.IGazeInputSourcePreview
      ; args : Windows.Devices.Input.Preview.IGazeMovedPreviewEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IGazeInputSourcePreview_add_GazeEntered : aliased constant Windows.IID := (947304901, 13984, 21025, (190, 4, 74, 238, 251, 152, 112, 178 ));
   
   type TypedEventHandler_IGazeInputSourcePreview_add_GazeEntered_Interface(Callback : access procedure (sender : Windows.Devices.Input.Preview.IGazeInputSourcePreview ; args : Windows.Devices.Input.Preview.IGazeEnteredPreviewEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IGazeInputSourcePreview_add_GazeEntered'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IGazeInputSourcePreview_add_GazeEntered_Interface
      ; sender : Windows.Devices.Input.Preview.IGazeInputSourcePreview
      ; args : Windows.Devices.Input.Preview.IGazeEnteredPreviewEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IGazeInputSourcePreview_add_GazeExited : aliased constant Windows.IID := (253342060, 29657, 22389, (146, 163, 15, 111, 148, 46, 78, 176 ));
   
   type TypedEventHandler_IGazeInputSourcePreview_add_GazeExited_Interface(Callback : access procedure (sender : Windows.Devices.Input.Preview.IGazeInputSourcePreview ; args : Windows.Devices.Input.Preview.IGazeExitedPreviewEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IGazeInputSourcePreview_add_GazeExited'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IGazeInputSourcePreview_add_GazeExited_Interface
      ; sender : Windows.Devices.Input.Preview.IGazeInputSourcePreview
      ; args : Windows.Devices.Input.Preview.IGazeExitedPreviewEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype GazeInputSourcePreview is Windows.Devices.Input.Preview.IGazeInputSourcePreview;
   subtype GazeDeviceWatcherPreview is Windows.Devices.Input.Preview.IGazeDeviceWatcherPreview;
   subtype GazeDeviceWatcherAddedPreviewEventArgs is Windows.Devices.Input.Preview.IGazeDeviceWatcherAddedPreviewEventArgs;
   subtype GazeDeviceWatcherRemovedPreviewEventArgs is Windows.Devices.Input.Preview.IGazeDeviceWatcherRemovedPreviewEventArgs;
   subtype GazeDeviceWatcherUpdatedPreviewEventArgs is Windows.Devices.Input.Preview.IGazeDeviceWatcherUpdatedPreviewEventArgs;
   subtype GazeMovedPreviewEventArgs is Windows.Devices.Input.Preview.IGazeMovedPreviewEventArgs;
   subtype GazeEnteredPreviewEventArgs is Windows.Devices.Input.Preview.IGazeEnteredPreviewEventArgs;
   subtype GazeExitedPreviewEventArgs is Windows.Devices.Input.Preview.IGazeExitedPreviewEventArgs;
   subtype GazeDevicePreview is Windows.Devices.Input.Preview.IGazeDevicePreview;
   subtype GazePointPreview is Windows.Devices.Input.Preview.IGazePointPreview;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetForCurrentView
   return Windows.Devices.Input.Preview.IGazeInputSourcePreview;
   
   function CreateWatcher
   return Windows.Devices.Input.Preview.IGazeDeviceWatcherPreview;
   
end;