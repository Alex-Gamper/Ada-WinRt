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
limited with Windows.Devices.Sensors;
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.System.Preview is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type HingeState is (
      Unknown,
      Closed,
      Concave,
      Flat,
      Convex,
      Full
   );
   for HingeState use (
      Unknown => 0,
      Closed => 1,
      Concave => 2,
      Flat => 3,
      Convex => 4,
      Full => 5
   );
   for HingeState'Size use 32;
   
   type HingeState_Ptr is access HingeState;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_ITwoPanelHingedDevicePosturePreview_Interface;
   type AsyncOperationCompletedHandler_ITwoPanelHingedDevicePosturePreview is access all AsyncOperationCompletedHandler_ITwoPanelHingedDevicePosturePreview_Interface'Class;
   type AsyncOperationCompletedHandler_ITwoPanelHingedDevicePosturePreview_Ptr is access all AsyncOperationCompletedHandler_ITwoPanelHingedDevicePosturePreview;
   type AsyncOperationCompletedHandler_ITwoPanelHingedDevicePosturePreviewReading_Interface;
   type AsyncOperationCompletedHandler_ITwoPanelHingedDevicePosturePreviewReading is access all AsyncOperationCompletedHandler_ITwoPanelHingedDevicePosturePreviewReading_Interface'Class;
   type AsyncOperationCompletedHandler_ITwoPanelHingedDevicePosturePreviewReading_Ptr is access all AsyncOperationCompletedHandler_ITwoPanelHingedDevicePosturePreviewReading;
   type TypedEventHandler_ITwoPanelHingedDevicePosturePreview_add_PostureChanged_Interface;
   type TypedEventHandler_ITwoPanelHingedDevicePosturePreview_add_PostureChanged is access all TypedEventHandler_ITwoPanelHingedDevicePosturePreview_add_PostureChanged_Interface'Class;
   type TypedEventHandler_ITwoPanelHingedDevicePosturePreview_add_PostureChanged_Ptr is access all TypedEventHandler_ITwoPanelHingedDevicePosturePreview_add_PostureChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IAsyncOperation_ITwoPanelHingedDevicePosturePreview_Interface;
   type IAsyncOperation_ITwoPanelHingedDevicePosturePreview is access all IAsyncOperation_ITwoPanelHingedDevicePosturePreview_Interface'Class;
   type IAsyncOperation_ITwoPanelHingedDevicePosturePreview_Ptr is access all IAsyncOperation_ITwoPanelHingedDevicePosturePreview;
   type IAsyncOperation_ITwoPanelHingedDevicePosturePreviewReading_Interface;
   type IAsyncOperation_ITwoPanelHingedDevicePosturePreviewReading is access all IAsyncOperation_ITwoPanelHingedDevicePosturePreviewReading_Interface'Class;
   type IAsyncOperation_ITwoPanelHingedDevicePosturePreviewReading_Ptr is access all IAsyncOperation_ITwoPanelHingedDevicePosturePreviewReading;
   type ITwoPanelHingedDevicePosturePreview_Interface;
   type ITwoPanelHingedDevicePosturePreview is access all ITwoPanelHingedDevicePosturePreview_Interface'Class;
   type ITwoPanelHingedDevicePosturePreview_Ptr is access all ITwoPanelHingedDevicePosturePreview;
   type ITwoPanelHingedDevicePosturePreviewReading_Interface;
   type ITwoPanelHingedDevicePosturePreviewReading is access all ITwoPanelHingedDevicePosturePreviewReading_Interface'Class;
   type ITwoPanelHingedDevicePosturePreviewReading_Ptr is access all ITwoPanelHingedDevicePosturePreviewReading;
   type ITwoPanelHingedDevicePosturePreviewReadingChangedEventArgs_Interface;
   type ITwoPanelHingedDevicePosturePreviewReadingChangedEventArgs is access all ITwoPanelHingedDevicePosturePreviewReadingChangedEventArgs_Interface'Class;
   type ITwoPanelHingedDevicePosturePreviewReadingChangedEventArgs_Ptr is access all ITwoPanelHingedDevicePosturePreviewReadingChangedEventArgs;
   type ITwoPanelHingedDevicePosturePreviewStatics_Interface;
   type ITwoPanelHingedDevicePosturePreviewStatics is access all ITwoPanelHingedDevicePosturePreviewStatics_Interface'Class;
   type ITwoPanelHingedDevicePosturePreviewStatics_Ptr is access all ITwoPanelHingedDevicePosturePreviewStatics;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ITwoPanelHingedDevicePosturePreview : aliased constant Windows.IID := (3110209817, 57617, 21007, (128, 151, 142, 155, 39, 83, 145, 181 ));
   
   type IAsyncOperation_ITwoPanelHingedDevicePosturePreview_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ITwoPanelHingedDevicePosturePreview_Interface
      ; handler : Windows.System.Preview.AsyncOperationCompletedHandler_ITwoPanelHingedDevicePosturePreview
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ITwoPanelHingedDevicePosturePreview_Interface
      ; RetVal : access Windows.System.Preview.AsyncOperationCompletedHandler_ITwoPanelHingedDevicePosturePreview
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ITwoPanelHingedDevicePosturePreview_Interface
      ; RetVal : access Windows.System.Preview.ITwoPanelHingedDevicePosturePreview
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ITwoPanelHingedDevicePosturePreviewReading : aliased constant Windows.IID := (579249200, 41049, 22936, (129, 12, 37, 186, 22, 1, 124, 158 ));
   
   type IAsyncOperation_ITwoPanelHingedDevicePosturePreviewReading_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ITwoPanelHingedDevicePosturePreviewReading_Interface
      ; handler : Windows.System.Preview.AsyncOperationCompletedHandler_ITwoPanelHingedDevicePosturePreviewReading
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ITwoPanelHingedDevicePosturePreviewReading_Interface
      ; RetVal : access Windows.System.Preview.AsyncOperationCompletedHandler_ITwoPanelHingedDevicePosturePreviewReading
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ITwoPanelHingedDevicePosturePreviewReading_Interface
      ; RetVal : access Windows.System.Preview.ITwoPanelHingedDevicePosturePreviewReading
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITwoPanelHingedDevicePosturePreview : aliased constant Windows.IID := (1914985521, 19257, 17062, (142, 115, 114, 53, 173, 225, 104, 83 ));
   
   type ITwoPanelHingedDevicePosturePreview_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCurrentPostureAsync
   (
      This       : access ITwoPanelHingedDevicePosturePreview_Interface
      ; RetVal : access Windows.System.Preview.IAsyncOperation_ITwoPanelHingedDevicePosturePreviewReading -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_PostureChanged
   (
      This       : access ITwoPanelHingedDevicePosturePreview_Interface
      ; handler : TypedEventHandler_ITwoPanelHingedDevicePosturePreview_add_PostureChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PostureChanged
   (
      This       : access ITwoPanelHingedDevicePosturePreview_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITwoPanelHingedDevicePosturePreviewReading : aliased constant Windows.IID := (2686784594, 19158, 19256, (132, 38, 197, 154, 21, 73, 58, 125 ));
   
   type ITwoPanelHingedDevicePosturePreviewReading_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Timestamp
   (
      This       : access ITwoPanelHingedDevicePosturePreviewReading_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_HingeState
   (
      This       : access ITwoPanelHingedDevicePosturePreviewReading_Interface
      ; RetVal : access Windows.System.Preview.HingeState
   )
   return Windows.HRESULT is abstract;
   
   function get_Panel1Orientation
   (
      This       : access ITwoPanelHingedDevicePosturePreviewReading_Interface
      ; RetVal : access Windows.Devices.Sensors.SimpleOrientation
   )
   return Windows.HRESULT is abstract;
   
   function get_Panel1Id
   (
      This       : access ITwoPanelHingedDevicePosturePreviewReading_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Panel2Orientation
   (
      This       : access ITwoPanelHingedDevicePosturePreviewReading_Interface
      ; RetVal : access Windows.Devices.Sensors.SimpleOrientation
   )
   return Windows.HRESULT is abstract;
   
   function get_Panel2Id
   (
      This       : access ITwoPanelHingedDevicePosturePreviewReading_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITwoPanelHingedDevicePosturePreviewReadingChangedEventArgs : aliased constant Windows.IID := (757930950, 718, 18250, (165, 86, 167, 91, 28, 249, 58, 3 ));
   
   type ITwoPanelHingedDevicePosturePreviewReadingChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Reading
   (
      This       : access ITwoPanelHingedDevicePosturePreviewReadingChangedEventArgs_Interface
      ; RetVal : access Windows.System.Preview.ITwoPanelHingedDevicePosturePreviewReading
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITwoPanelHingedDevicePosturePreviewStatics : aliased constant Windows.IID := (205992914, 22496, 16768, (189, 94, 243, 26, 33, 56, 66, 62 ));
   
   type ITwoPanelHingedDevicePosturePreviewStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefaultAsync
   (
      This       : access ITwoPanelHingedDevicePosturePreviewStatics_Interface
      ; RetVal : access Windows.System.Preview.IAsyncOperation_ITwoPanelHingedDevicePosturePreview -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ITwoPanelHingedDevicePosturePreview : aliased constant Windows.IID := (4075996494, 57170, 23167, (134, 16, 229, 121, 253, 133, 147, 216 ));
   
   type AsyncOperationCompletedHandler_ITwoPanelHingedDevicePosturePreview_Interface(Callback : access procedure (asyncInfo : Windows.System.Preview.IAsyncOperation_ITwoPanelHingedDevicePosturePreview ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ITwoPanelHingedDevicePosturePreview'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ITwoPanelHingedDevicePosturePreview_Interface
      ; asyncInfo : Windows.System.Preview.IAsyncOperation_ITwoPanelHingedDevicePosturePreview
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ITwoPanelHingedDevicePosturePreviewReading : aliased constant Windows.IID := (1259477165, 54169, 22370, (130, 2, 197, 208, 212, 182, 235, 84 ));
   
   type AsyncOperationCompletedHandler_ITwoPanelHingedDevicePosturePreviewReading_Interface(Callback : access procedure (asyncInfo : Windows.System.Preview.IAsyncOperation_ITwoPanelHingedDevicePosturePreviewReading ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ITwoPanelHingedDevicePosturePreviewReading'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ITwoPanelHingedDevicePosturePreviewReading_Interface
      ; asyncInfo : Windows.System.Preview.IAsyncOperation_ITwoPanelHingedDevicePosturePreviewReading
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ITwoPanelHingedDevicePosturePreview_add_PostureChanged : aliased constant Windows.IID := (1070148647, 5997, 22698, (167, 72, 190, 130, 195, 120, 223, 65 ));
   
   type TypedEventHandler_ITwoPanelHingedDevicePosturePreview_add_PostureChanged_Interface(Callback : access procedure (sender : Windows.System.Preview.ITwoPanelHingedDevicePosturePreview ; args : Windows.System.Preview.ITwoPanelHingedDevicePosturePreviewReadingChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ITwoPanelHingedDevicePosturePreview_add_PostureChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ITwoPanelHingedDevicePosturePreview_add_PostureChanged_Interface
      ; sender : Windows.System.Preview.ITwoPanelHingedDevicePosturePreview
      ; args : Windows.System.Preview.ITwoPanelHingedDevicePosturePreviewReadingChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype TwoPanelHingedDevicePosturePreview is Windows.System.Preview.ITwoPanelHingedDevicePosturePreview;
   subtype TwoPanelHingedDevicePosturePreviewReading is Windows.System.Preview.ITwoPanelHingedDevicePosturePreviewReading;
   subtype TwoPanelHingedDevicePosturePreviewReadingChangedEventArgs is Windows.System.Preview.ITwoPanelHingedDevicePosturePreviewReadingChangedEventArgs;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetDefaultAsync
   return Windows.System.Preview.IAsyncOperation_ITwoPanelHingedDevicePosturePreview;
   
end;
