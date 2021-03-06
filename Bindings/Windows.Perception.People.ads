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
with Windows.Foundation.Numerics;
limited with Windows.Perception.Spatial;
limited with Windows.UI.Input;
limited with Windows.UI.Input.Spatial;
--------------------------------------------------------------------------------
package Windows.Perception.People is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type HandJointKind is (
      Palm,
      Wrist,
      ThumbMetacarpal,
      ThumbProximal,
      ThumbDistal,
      ThumbTip,
      IndexMetacarpal,
      IndexProximal,
      IndexIntermediate,
      IndexDistal,
      IndexTip,
      MiddleMetacarpal,
      MiddleProximal,
      MiddleIntermediate,
      MiddleDistal,
      MiddleTip,
      RingMetacarpal,
      RingProximal,
      RingIntermediate,
      RingDistal,
      RingTip,
      LittleMetacarpal,
      LittleProximal,
      LittleIntermediate,
      LittleDistal,
      LittleTip
   );
   for HandJointKind use (
      Palm => 0,
      Wrist => 1,
      ThumbMetacarpal => 2,
      ThumbProximal => 3,
      ThumbDistal => 4,
      ThumbTip => 5,
      IndexMetacarpal => 6,
      IndexProximal => 7,
      IndexIntermediate => 8,
      IndexDistal => 9,
      IndexTip => 10,
      MiddleMetacarpal => 11,
      MiddleProximal => 12,
      MiddleIntermediate => 13,
      MiddleDistal => 14,
      MiddleTip => 15,
      RingMetacarpal => 16,
      RingProximal => 17,
      RingIntermediate => 18,
      RingDistal => 19,
      RingTip => 20,
      LittleMetacarpal => 21,
      LittleProximal => 22,
      LittleIntermediate => 23,
      LittleDistal => 24,
      LittleTip => 25
   );
   for HandJointKind'Size use 32;
   
   type HandJointKind_Ptr is access HandJointKind;
   
   type JointPoseAccuracy is (
      High,
      Approximate
   );
   for JointPoseAccuracy use (
      High => 0,
      Approximate => 1
   );
   for JointPoseAccuracy'Size use 32;
   
   type JointPoseAccuracy_Ptr is access JointPoseAccuracy;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type HandMeshVertex is record
      Position : Windows.Foundation.Numerics.Vector3;
      Normal : Windows.Foundation.Numerics.Vector3;
   end record;
   pragma Convention (C_Pass_By_Copy , HandMeshVertex);
   
   type HandMeshVertex_Ptr is access HandMeshVertex;
   
   type JointPose is record
      Orientation : Windows.Foundation.Numerics.Quaternion;
      Position : Windows.Foundation.Numerics.Vector3;
      Radius : Windows.Single;
      Accuracy : Windows.Perception.People.JointPoseAccuracy;
   end record;
   pragma Convention (C_Pass_By_Copy , JointPose);
   
   type JointPose_Ptr is access JointPose;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IHandMeshObserver_Interface;
   type AsyncOperationCompletedHandler_IHandMeshObserver is access all AsyncOperationCompletedHandler_IHandMeshObserver_Interface'Class;
   type AsyncOperationCompletedHandler_IHandMeshObserver_Ptr is access all AsyncOperationCompletedHandler_IHandMeshObserver;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IAsyncOperation_IHandMeshObserver_Interface;
   type IAsyncOperation_IHandMeshObserver is access all IAsyncOperation_IHandMeshObserver_Interface'Class;
   type IAsyncOperation_IHandMeshObserver_Ptr is access all IAsyncOperation_IHandMeshObserver;
   type IEyesPose_Interface;
   type IEyesPose is access all IEyesPose_Interface'Class;
   type IEyesPose_Ptr is access all IEyesPose;
   type IEyesPoseStatics_Interface;
   type IEyesPoseStatics is access all IEyesPoseStatics_Interface'Class;
   type IEyesPoseStatics_Ptr is access all IEyesPoseStatics;
   type IHandMeshObserver_Interface;
   type IHandMeshObserver is access all IHandMeshObserver_Interface'Class;
   type IHandMeshObserver_Ptr is access all IHandMeshObserver;
   type IHandMeshVertexState_Interface;
   type IHandMeshVertexState is access all IHandMeshVertexState_Interface'Class;
   type IHandMeshVertexState_Ptr is access all IHandMeshVertexState;
   type IHandPose_Interface;
   type IHandPose is access all IHandPose_Interface'Class;
   type IHandPose_Ptr is access all IHandPose;
   type IHeadPose_Interface;
   type IHeadPose is access all IHeadPose_Interface'Class;
   type IHeadPose_Ptr is access all IHeadPose;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IHandMeshObserver : aliased constant Windows.IID := (201255488, 39831, 23231, (175, 158, 46, 99, 103, 165, 11, 248 ));
   
   type IAsyncOperation_IHandMeshObserver_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IHandMeshObserver_Interface
      ; handler : Windows.Perception.People.AsyncOperationCompletedHandler_IHandMeshObserver
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IHandMeshObserver_Interface
      ; RetVal : access Windows.Perception.People.AsyncOperationCompletedHandler_IHandMeshObserver
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IHandMeshObserver_Interface
      ; RetVal : access Windows.Perception.People.IHandMeshObserver
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEyesPose : aliased constant Windows.IID := (1747622691, 35358, 23430, (160, 96, 144, 111, 250, 203, 98, 164 ));
   
   type IEyesPose_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsCalibrationValid
   (
      This       : access IEyesPose_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Gaze
   (
      This       : access IEyesPose_Interface
      ; RetVal : access Windows.Perception.Spatial.IReference_SpatialRay -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_UpdateTimestamp
   (
      This       : access IEyesPose_Interface
      ; RetVal : access Windows.Perception.IPerceptionTimestamp
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEyesPoseStatics : aliased constant Windows.IID := (486503443, 45599, 21696, (128, 193, 230, 13, 153, 76, 165, 140 ));
   
   type IEyesPoseStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function IsSupported
   (
      This       : access IEyesPoseStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function RequestAccessAsync
   (
      This       : access IEyesPoseStatics_Interface
      ; RetVal : access Windows.UI.Input.IAsyncOperation_GazeInputAccessStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHandMeshObserver : aliased constant Windows.IID := (2242785483, 28611, 21956, (167, 180, 41, 227, 56, 150, 202, 105 ));
   
   type IHandMeshObserver_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Source
   (
      This       : access IHandMeshObserver_Interface
      ; RetVal : access Windows.UI.Input.Spatial.ISpatialInteractionSource
   )
   return Windows.HRESULT is abstract;
   
   function get_TriangleIndexCount
   (
      This       : access IHandMeshObserver_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_VertexCount
   (
      This       : access IHandMeshObserver_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetTriangleIndices
   (
      This       : access IHandMeshObserver_Interface
      ; indices : Windows.UInt16_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function GetVertexStateForPose
   (
      This       : access IHandMeshObserver_Interface
      ; handPose : Windows.Perception.People.IHandPose
      ; RetVal : access Windows.Perception.People.IHandMeshVertexState
   )
   return Windows.HRESULT is abstract;
   
   function get_NeutralPose
   (
      This       : access IHandMeshObserver_Interface
      ; RetVal : access Windows.Perception.People.IHandPose
   )
   return Windows.HRESULT is abstract;
   
   function get_NeutralPoseVersion
   (
      This       : access IHandMeshObserver_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ModelId
   (
      This       : access IHandMeshObserver_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHandMeshVertexState : aliased constant Windows.IID := (74211311, 7563, 21982, (171, 44, 28, 212, 36, 136, 109, 143 ));
   
   type IHandMeshVertexState_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CoordinateSystem
   (
      This       : access IHandMeshVertexState_Interface
      ; RetVal : access Windows.Perception.Spatial.ISpatialCoordinateSystem
   )
   return Windows.HRESULT is abstract;
   
   function GetVertices
   (
      This       : access IHandMeshVertexState_Interface
      ; vertices : Windows.Perception.People.HandMeshVertex_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function get_UpdateTimestamp
   (
      This       : access IHandMeshVertexState_Interface
      ; RetVal : access Windows.Perception.IPerceptionTimestamp
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHandPose : aliased constant Windows.IID := (1301866394, 47880, 23817, (145, 222, 223, 13, 211, 250, 228, 108 ));
   
   type IHandPose_Interface is interface and Windows.IInspectable_Interface;
   
   function TryGetJoint
   (
      This       : access IHandPose_Interface
      ; coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; joint : Windows.Perception.People.HandJointKind
      ; jointPose : access Windows.Perception.People.JointPose
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TryGetJoints
   (
      This       : access IHandPose_Interface
      ; coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; joints : Windows.Perception.People.HandJointKind_Ptr
      ; jointPoses : Windows.Perception.People.JointPose_Ptr
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetRelativeJoint
   (
      This       : access IHandPose_Interface
      ; joint : Windows.Perception.People.HandJointKind
      ; referenceJoint : Windows.Perception.People.HandJointKind
      ; RetVal : access Windows.Perception.People.JointPose
   )
   return Windows.HRESULT is abstract;
   
   function GetRelativeJoints
   (
      This       : access IHandPose_Interface
      ; joints : Windows.Perception.People.HandJointKind_Ptr
      ; referenceJoints : Windows.Perception.People.HandJointKind_Ptr
      ; jointPoses : Windows.Perception.People.JointPose_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHeadPose : aliased constant Windows.IID := (2136655269, 18907, 14239, (148, 41, 50, 162, 250, 243, 79, 166 ));
   
   type IHeadPose_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Position
   (
      This       : access IHeadPose_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_ForwardDirection
   (
      This       : access IHeadPose_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_UpDirection
   (
      This       : access IHeadPose_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IHandMeshObserver : aliased constant Windows.IID := (1978116263, 46701, 24171, (160, 96, 238, 247, 0, 45, 158, 98 ));
   
   type AsyncOperationCompletedHandler_IHandMeshObserver_Interface(Callback : access procedure (asyncInfo : Windows.Perception.People.IAsyncOperation_IHandMeshObserver ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IHandMeshObserver'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IHandMeshObserver_Interface
      ; asyncInfo : Windows.Perception.People.IAsyncOperation_IHandMeshObserver
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype EyesPose is Windows.Perception.People.IEyesPose;
   subtype HandMeshObserver is Windows.Perception.People.IHandMeshObserver;
   subtype HandMeshVertexState is Windows.Perception.People.IHandMeshVertexState;
   subtype HandPose is Windows.Perception.People.IHandPose;
   subtype HeadPose is Windows.Perception.People.IHeadPose;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function IsSupported
   return Windows.Boolean;
   
   function RequestAccessAsync
   return Windows.UI.Input.IAsyncOperation_GazeInputAccessStatus;
   
end;
