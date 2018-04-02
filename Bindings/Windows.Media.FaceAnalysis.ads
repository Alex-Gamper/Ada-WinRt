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
limited with Windows.Graphics.Imaging;
with Windows.Foundation;
with Windows.Foundation.Collections;
--------------------------------------------------------------------------------
package Windows.Media.FaceAnalysis is

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
   
   type AsyncOperationCompletedHandler_IFaceDetector_Interface;
   type AsyncOperationCompletedHandler_IFaceDetector is access all AsyncOperationCompletedHandler_IFaceDetector_Interface'Class;
   type AsyncOperationCompletedHandler_IFaceDetector_Ptr is access all AsyncOperationCompletedHandler_IFaceDetector;
   type AsyncOperationCompletedHandler_IFaceTracker_Interface;
   type AsyncOperationCompletedHandler_IFaceTracker is access all AsyncOperationCompletedHandler_IFaceTracker_Interface'Class;
   type AsyncOperationCompletedHandler_IFaceTracker_Ptr is access all AsyncOperationCompletedHandler_IFaceTracker;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IDetectedFace_Interface;
   type IDetectedFace is access all IDetectedFace_Interface'Class;
   type IDetectedFace_Ptr is access all IDetectedFace;
   type IFaceDetector_Interface;
   type IFaceDetector is access all IFaceDetector_Interface'Class;
   type IFaceDetector_Ptr is access all IFaceDetector;
   type IFaceDetectorStatics_Interface;
   type IFaceDetectorStatics is access all IFaceDetectorStatics_Interface'Class;
   type IFaceDetectorStatics_Ptr is access all IFaceDetectorStatics;
   type IFaceTracker_Interface;
   type IFaceTracker is access all IFaceTracker_Interface'Class;
   type IFaceTracker_Ptr is access all IFaceTracker;
   type IFaceTrackerStatics_Interface;
   type IFaceTrackerStatics is access all IFaceTrackerStatics_Interface'Class;
   type IFaceTrackerStatics_Ptr is access all IFaceTrackerStatics;
   type IAsyncOperation_IFaceDetector_Interface;
   type IAsyncOperation_IFaceDetector is access all IAsyncOperation_IFaceDetector_Interface'Class;
   type IAsyncOperation_IFaceDetector_Ptr is access all IAsyncOperation_IFaceDetector;
   type IAsyncOperation_IFaceTracker_Interface;
   type IAsyncOperation_IFaceTracker is access all IAsyncOperation_IFaceTracker_Interface'Class;
   type IAsyncOperation_IFaceTracker_Ptr is access all IAsyncOperation_IFaceTracker;
   type IIterator_IDetectedFace_Interface;
   type IIterator_IDetectedFace is access all IIterator_IDetectedFace_Interface'Class;
   type IIterator_IDetectedFace_Ptr is access all IIterator_IDetectedFace;
   type IIterable_IDetectedFace_Interface;
   type IIterable_IDetectedFace is access all IIterable_IDetectedFace_Interface'Class;
   type IIterable_IDetectedFace_Ptr is access all IIterable_IDetectedFace;
   type IVectorView_IDetectedFace_Interface;
   type IVectorView_IDetectedFace is access all IVectorView_IDetectedFace_Interface'Class;
   type IVectorView_IDetectedFace_Ptr is access all IVectorView_IDetectedFace;
   
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
   type IDetectedFace_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FaceBox
   (
      This       : access IDetectedFace_Interface
      ; RetVal : access Windows.Graphics.Imaging.BitmapBounds
   )
   return Windows.HRESULT is abstract;
   
   IID_IDetectedFace : aliased constant Windows.IID := (2181092436, 26300, 13535, (148, 16, 232, 148, 0, 25, 84, 20 ));
   
   ------------------------------------------------------------------------
   type IFaceDetector_Interface is interface and Windows.IInspectable_Interface;
   
   function DetectFacesAsync
   (
      This       : access IFaceDetector_Interface
      ; image : Windows.Graphics.Imaging.ISoftwareBitmap
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function DetectFacesWithSearchAreaAsync
   (
      This       : access IFaceDetector_Interface
      ; image : Windows.Graphics.Imaging.ISoftwareBitmap
      ; searchArea : Windows.Graphics.Imaging.BitmapBounds
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_MinDetectableFaceSize
   (
      This       : access IFaceDetector_Interface
      ; RetVal : access Windows.Graphics.Imaging.BitmapSize
   )
   return Windows.HRESULT is abstract;
   
   function put_MinDetectableFaceSize
   (
      This       : access IFaceDetector_Interface
      ; value : Windows.Graphics.Imaging.BitmapSize
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxDetectableFaceSize
   (
      This       : access IFaceDetector_Interface
      ; RetVal : access Windows.Graphics.Imaging.BitmapSize
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxDetectableFaceSize
   (
      This       : access IFaceDetector_Interface
      ; value : Windows.Graphics.Imaging.BitmapSize
   )
   return Windows.HRESULT is abstract;
   
   IID_IFaceDetector : aliased constant Windows.IID := (381055708, 65135, 12567, (141, 149, 195, 240, 77, 81, 99, 12 ));
   
   ------------------------------------------------------------------------
   type IFaceDetectorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateAsync
   (
      This       : access IFaceDetectorStatics_Interface
      ; RetVal : access Windows.Media.FaceAnalysis.IAsyncOperation_IFaceDetector -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetSupportedBitmapPixelFormats
   (
      This       : access IFaceDetectorStatics_Interface
      ; RetVal : access Windows.Graphics.Imaging.IVectorView_BitmapPixelFormat -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function IsBitmapPixelFormatSupported
   (
      This       : access IFaceDetectorStatics_Interface
      ; bitmapPixelFormat : Windows.Graphics.Imaging.BitmapPixelFormat
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsSupported
   (
      This       : access IFaceDetectorStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IFaceDetectorStatics : aliased constant Windows.IID := (3154390375, 36935, 13302, (136, 27, 103, 70, 193, 178, 24, 184 ));
   
   ------------------------------------------------------------------------
   type IFaceTracker_Interface is interface and Windows.IInspectable_Interface;
   
   function ProcessNextFrameAsync
   (
      This       : access IFaceTracker_Interface
      ; videoFrame : Windows.Media.IVideoFrame
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_MinDetectableFaceSize
   (
      This       : access IFaceTracker_Interface
      ; RetVal : access Windows.Graphics.Imaging.BitmapSize
   )
   return Windows.HRESULT is abstract;
   
   function put_MinDetectableFaceSize
   (
      This       : access IFaceTracker_Interface
      ; value : Windows.Graphics.Imaging.BitmapSize
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxDetectableFaceSize
   (
      This       : access IFaceTracker_Interface
      ; RetVal : access Windows.Graphics.Imaging.BitmapSize
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxDetectableFaceSize
   (
      This       : access IFaceTracker_Interface
      ; value : Windows.Graphics.Imaging.BitmapSize
   )
   return Windows.HRESULT is abstract;
   
   IID_IFaceTracker : aliased constant Windows.IID := (1806073228, 43073, 17440, (147, 230, 36, 32, 161, 136, 79, 207 ));
   
   ------------------------------------------------------------------------
   type IFaceTrackerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateAsync
   (
      This       : access IFaceTrackerStatics_Interface
      ; RetVal : access Windows.Media.FaceAnalysis.IAsyncOperation_IFaceTracker -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetSupportedBitmapPixelFormats
   (
      This       : access IFaceTrackerStatics_Interface
      ; RetVal : access Windows.Graphics.Imaging.IVectorView_BitmapPixelFormat -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function IsBitmapPixelFormatSupported
   (
      This       : access IFaceTrackerStatics_Interface
      ; bitmapPixelFormat : Windows.Graphics.Imaging.BitmapPixelFormat
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsSupported
   (
      This       : access IFaceTrackerStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IFaceTrackerStatics : aliased constant Windows.IID := (3915551128, 6145, 16293, (147, 46, 49, 215, 103, 175, 108, 77 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IFaceDetector_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IFaceDetector_Interface
      ; handler : Windows.Media.FaceAnalysis.AsyncOperationCompletedHandler_IFaceDetector
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IFaceDetector_Interface
      ; RetVal : access Windows.Media.FaceAnalysis.AsyncOperationCompletedHandler_IFaceDetector
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IFaceDetector_Interface
      ; RetVal : access Windows.Media.FaceAnalysis.IFaceDetector
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IFaceDetector : aliased constant Windows.IID := (3222543570, 31333, 20812, (191, 196, 180, 158, 153, 31, 3, 235 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IFaceTracker_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IFaceTracker_Interface
      ; handler : Windows.Media.FaceAnalysis.AsyncOperationCompletedHandler_IFaceTracker
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IFaceTracker_Interface
      ; RetVal : access Windows.Media.FaceAnalysis.AsyncOperationCompletedHandler_IFaceTracker
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IFaceTracker_Interface
      ; RetVal : access Windows.Media.FaceAnalysis.IFaceTracker
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IFaceTracker : aliased constant Windows.IID := (2134034048, 58238, 21402, (137, 147, 42, 187, 234, 113, 175, 218 ));
   
   ------------------------------------------------------------------------
   type IIterator_IDetectedFace_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IDetectedFace_Interface
      ; RetVal : access Windows.Media.FaceAnalysis.IDetectedFace
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IDetectedFace_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IDetectedFace_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IDetectedFace_Interface
      ; items : Windows.Media.FaceAnalysis.IDetectedFace_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IDetectedFace : aliased constant Windows.IID := (2697922830, 832, 21279, (137, 139, 194, 30, 175, 185, 244, 174 ));
   
   ------------------------------------------------------------------------
   type IIterable_IDetectedFace_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IDetectedFace_Interface
      ; RetVal : access Windows.Media.FaceAnalysis.IIterator_IDetectedFace
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IDetectedFace : aliased constant Windows.IID := (624194339, 13654, 23739, (152, 85, 43, 88, 86, 67, 127, 77 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IDetectedFace_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IDetectedFace_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.FaceAnalysis.IDetectedFace
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IDetectedFace_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IDetectedFace_Interface
      ; value : Windows.Media.FaceAnalysis.IDetectedFace
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IDetectedFace_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.FaceAnalysis.IDetectedFace_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IDetectedFace : aliased constant Windows.IID := (971981841, 1560, 23437, (142, 162, 129, 198, 55, 248, 35, 248 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IFaceDetector_Interface(Callback : access procedure (asyncInfo : Windows.Media.FaceAnalysis.IAsyncOperation_IFaceDetector ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IFaceDetector_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IFaceDetector_Interface
      ; asyncInfo : Windows.Media.FaceAnalysis.IAsyncOperation_IFaceDetector
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IFaceDetector : aliased constant Windows.IID := (841264838, 59269, 20582, (151, 111, 121, 221, 8, 27, 117, 169 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IFaceTracker_Interface(Callback : access procedure (asyncInfo : Windows.Media.FaceAnalysis.IAsyncOperation_IFaceTracker ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IFaceTracker_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IFaceTracker_Interface
      ; asyncInfo : Windows.Media.FaceAnalysis.IAsyncOperation_IFaceTracker
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IFaceTracker : aliased constant Windows.IID := (1473582653, 40576, 22994, (147, 102, 210, 181, 36, 139, 39, 36 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype DetectedFace is Windows.Media.FaceAnalysis.IDetectedFace;
   subtype FaceTracker is Windows.Media.FaceAnalysis.IFaceTracker;
   subtype FaceDetector is Windows.Media.FaceAnalysis.IFaceDetector;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function CreateAsync
   return Windows.Media.FaceAnalysis.IAsyncOperation_IFaceTracker;
   
   function GetSupportedBitmapPixelFormats
   return Windows.Graphics.Imaging.IVectorView_BitmapPixelFormat;
   
   function IsBitmapPixelFormatSupported
   (
      bitmapPixelFormat : Windows.Graphics.Imaging.BitmapPixelFormat
   )
   return Windows.Boolean;
   
   function get_IsSupported
   return Windows.Boolean;
   
   function CreateAsync
   return Windows.Media.FaceAnalysis.IAsyncOperation_IFaceDetector;
   
   function GetSupportedBitmapPixelFormats_IFaceDetector
   return Windows.Graphics.Imaging.IVectorView_BitmapPixelFormat;
   
   function IsBitmapPixelFormatSupported_IFaceDetector
   (
      bitmapPixelFormat : Windows.Graphics.Imaging.BitmapPixelFormat
   )
   return Windows.Boolean;
   
   function get_IsSupported_IFaceDetector
   return Windows.Boolean;

end;
