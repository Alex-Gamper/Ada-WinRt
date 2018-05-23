--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.2.0.1                                                     --
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
limited with Windows.Storage.Streams;
limited with Windows.ApplicationModel;
with Windows; use Windows;
limited with Windows.System.Diagnostics;
limited with Windows.UI.Popups;
limited with Windows.Storage.Search;
limited with Windows.UI.ViewManagement;
limited with Windows.Storage;
limited with Windows.System.RemoteSystems;
--------------------------------------------------------------------------------
package Windows.System is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type ProcessorArchitecture is (
      X86,
      Arm,
      X64,
      Neutral,
      Unknown
   );
   for ProcessorArchitecture use (
      X86 => 0,
      Arm => 5,
      X64 => 9,
      Neutral => 11,
      Unknown => 65535
   );
   for ProcessorArchitecture'Size use 32;
   
   type ProcessorArchitecture_Ptr is access ProcessorArchitecture;
   
   type DispatcherQueuePriority is (
      Low,
      Normal,
      High
   );
   for DispatcherQueuePriority use (
      Low => -10,
      Normal => 0,
      High => 10
   );
   for DispatcherQueuePriority'Size use 32;
   
   type DispatcherQueuePriority_Ptr is access DispatcherQueuePriority;
   
   type UserAuthenticationStatus is (
      Unauthenticated,
      LocallyAuthenticated,
      RemotelyAuthenticated
   );
   for UserAuthenticationStatus use (
      Unauthenticated => 0,
      LocallyAuthenticated => 1,
      RemotelyAuthenticated => 2
   );
   for UserAuthenticationStatus'Size use 32;
   
   type UserAuthenticationStatus_Ptr is access UserAuthenticationStatus;
   
   type UserType is (
      LocalUser,
      RemoteUser,
      LocalGuest,
      RemoteGuest
   );
   for UserType use (
      LocalUser => 0,
      RemoteUser => 1,
      LocalGuest => 2,
      RemoteGuest => 3
   );
   for UserType'Size use 32;
   
   type UserType_Ptr is access UserType;
   
   type UserPictureSize is (
      Size64x64,
      Size208x208,
      Size424x424,
      Size1080x1080
   );
   for UserPictureSize use (
      Size64x64 => 0,
      Size208x208 => 1,
      Size424x424 => 2,
      Size1080x1080 => 3
   );
   for UserPictureSize'Size use 32;
   
   type UserPictureSize_Ptr is access UserPictureSize;
   
   type UserWatcherStatus is (
      Created,
      Started,
      EnumerationCompleted,
      Stopping,
      Stopped,
      Aborted
   );
   for UserWatcherStatus use (
      Created => 0,
      Started => 1,
      EnumerationCompleted => 2,
      Stopping => 3,
      Stopped => 4,
      Aborted => 5
   );
   for UserWatcherStatus'Size use 32;
   
   type UserWatcherStatus_Ptr is access UserWatcherStatus;
   
   type AppMemoryUsageLevel is (
      Low,
      Medium,
      High,
      OverLimit
   );
   for AppMemoryUsageLevel use (
      Low => 0,
      Medium => 1,
      High => 2,
      OverLimit => 3
   );
   for AppMemoryUsageLevel'Size use 32;
   
   type AppMemoryUsageLevel_Ptr is access AppMemoryUsageLevel;
   
   type DiagnosticAccessStatus is (
      Unspecified,
      Denied,
      Limited_x,
      Allowed
   );
   for DiagnosticAccessStatus use (
      Unspecified => 0,
      Denied => 1,
      Limited_x => 2,
      Allowed => 3
   );
   for DiagnosticAccessStatus'Size use 32;
   
   type DiagnosticAccessStatus_Ptr is access DiagnosticAccessStatus;
   
   type AppDiagnosticInfoWatcherStatus is (
      Created,
      Started,
      EnumerationCompleted,
      Stopping,
      Stopped,
      Aborted
   );
   for AppDiagnosticInfoWatcherStatus use (
      Created => 0,
      Started => 1,
      EnumerationCompleted => 2,
      Stopping => 3,
      Stopped => 4,
      Aborted => 5
   );
   for AppDiagnosticInfoWatcherStatus'Size use 32;
   
   type AppDiagnosticInfoWatcherStatus_Ptr is access AppDiagnosticInfoWatcherStatus;
   
   type AppResourceGroupExecutionState is (
      Unknown,
      Running,
      Suspending,
      Suspended,
      NotRunning
   );
   for AppResourceGroupExecutionState use (
      Unknown => 0,
      Running => 1,
      Suspending => 2,
      Suspended => 3,
      NotRunning => 4
   );
   for AppResourceGroupExecutionState'Size use 32;
   
   type AppResourceGroupExecutionState_Ptr is access AppResourceGroupExecutionState;
   
   type AppResourceGroupInfoWatcherStatus is (
      Created,
      Started,
      EnumerationCompleted,
      Stopping,
      Stopped,
      Aborted
   );
   for AppResourceGroupInfoWatcherStatus use (
      Created => 0,
      Started => 1,
      EnumerationCompleted => 2,
      Stopping => 3,
      Stopped => 4,
      Aborted => 5
   );
   for AppResourceGroupInfoWatcherStatus'Size use 32;
   
   type AppResourceGroupInfoWatcherStatus_Ptr is access AppResourceGroupInfoWatcherStatus;
   
   type AppResourceGroupEnergyQuotaState is (
      Unknown,
      Over,
      Under
   );
   for AppResourceGroupEnergyQuotaState use (
      Unknown => 0,
      Over => 1,
      Under => 2
   );
   for AppResourceGroupEnergyQuotaState'Size use 32;
   
   type AppResourceGroupEnergyQuotaState_Ptr is access AppResourceGroupEnergyQuotaState;
   
   type VirtualKeyModifiers is (
      None,
      Control,
      Menu,
      Shift,
      Windows_x
   );
   for VirtualKeyModifiers use (
      None => 0,
      Control => 1,
      Menu => 2,
      Shift => 4,
      Windows_x => 8
   );
   for VirtualKeyModifiers'Size use 32;
   
   type VirtualKeyModifiers_Ptr is access VirtualKeyModifiers;
   
   
   type VirtualKey is new Windows.Int32;
   
   type VirtualKey_Ptr is access VirtualKey;
   
   type LaunchQuerySupportType is (
      Uri,
      UriForResults
   );
   for LaunchQuerySupportType use (
      Uri => 0,
      UriForResults => 1
   );
   for LaunchQuerySupportType'Size use 32;
   
   type LaunchQuerySupportType_Ptr is access LaunchQuerySupportType;
   
   type LaunchQuerySupportStatus is (
      Available,
      AppNotInstalled,
      AppUnavailable,
      NotSupported,
      Unknown
   );
   for LaunchQuerySupportStatus use (
      Available => 0,
      AppNotInstalled => 1,
      AppUnavailable => 2,
      NotSupported => 3,
      Unknown => 4
   );
   for LaunchQuerySupportStatus'Size use 32;
   
   type LaunchQuerySupportStatus_Ptr is access LaunchQuerySupportStatus;
   
   type LaunchUriStatus is (
      Success,
      AppUnavailable,
      ProtocolUnavailable,
      Unknown
   );
   for LaunchUriStatus use (
      Success => 0,
      AppUnavailable => 1,
      ProtocolUnavailable => 2,
      Unknown => 3
   );
   for LaunchUriStatus'Size use 32;
   
   type LaunchUriStatus_Ptr is access LaunchUriStatus;
   
   type LaunchFileStatus is (
      Success,
      AppUnavailable,
      DeniedByPolicy,
      FileTypeNotSupported,
      Unknown
   );
   for LaunchFileStatus use (
      Success => 0,
      AppUnavailable => 1,
      DeniedByPolicy => 2,
      FileTypeNotSupported => 3,
      Unknown => 4
   );
   for LaunchFileStatus'Size use 32;
   
   type LaunchFileStatus_Ptr is access LaunchFileStatus;
   
   type RemoteLaunchUriStatus is (
      Unknown,
      Success,
      AppUnavailable,
      ProtocolUnavailable,
      RemoteSystemUnavailable,
      ValueSetTooLarge,
      DeniedByLocalSystem,
      DeniedByRemoteSystem
   );
   for RemoteLaunchUriStatus use (
      Unknown => 0,
      Success => 1,
      AppUnavailable => 2,
      ProtocolUnavailable => 3,
      RemoteSystemUnavailable => 4,
      ValueSetTooLarge => 5,
      DeniedByLocalSystem => 6,
      DeniedByRemoteSystem => 7
   );
   for RemoteLaunchUriStatus'Size use 32;
   
   type RemoteLaunchUriStatus_Ptr is access RemoteLaunchUriStatus;
   
   type ShutdownKind is (
      Shutdown,
      Restart
   );
   for ShutdownKind use (
      Shutdown => 0,
      Restart => 1
   );
   for ShutdownKind'Size use 32;
   
   type ShutdownKind_Ptr is access ShutdownKind;
   
   type PowerState is (
      ConnectedStandby,
      SleepS3
   );
   for PowerState use (
      ConnectedStandby => 0,
      SleepS3 => 1
   );
   for PowerState'Size use 32;
   
   type PowerState_Ptr is access PowerState;
   
   type AutoUpdateTimeZoneStatus is (
      Attempted,
      TimedOut,
      Failed
   );
   for AutoUpdateTimeZoneStatus use (
      Attempted => 0,
      TimedOut => 1,
      Failed => 2
   );
   for AutoUpdateTimeZoneStatus'Size use 32;
   
   type AutoUpdateTimeZoneStatus_Ptr is access AutoUpdateTimeZoneStatus;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type SystemManagementContract is null record;
   pragma Convention (C_Pass_By_Copy , SystemManagementContract);
   
   type SystemManagementContract_Ptr is access SystemManagementContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type DispatcherQueueHandler_Interface;
   type DispatcherQueueHandler is access all DispatcherQueueHandler_Interface'Class;
   type DispatcherQueueHandler_Ptr is access all DispatcherQueueHandler;
   type TypedEventHandler_IDispatcherQueue_add_ShutdownStarting_Interface;
   type TypedEventHandler_IDispatcherQueue_add_ShutdownStarting is access all TypedEventHandler_IDispatcherQueue_add_ShutdownStarting_Interface'Class;
   type TypedEventHandler_IDispatcherQueue_add_ShutdownStarting_Ptr is access all TypedEventHandler_IDispatcherQueue_add_ShutdownStarting;
   type TypedEventHandler_IDispatcherQueue_add_ShutdownCompleted_Interface;
   type TypedEventHandler_IDispatcherQueue_add_ShutdownCompleted is access all TypedEventHandler_IDispatcherQueue_add_ShutdownCompleted_Interface'Class;
   type TypedEventHandler_IDispatcherQueue_add_ShutdownCompleted_Ptr is access all TypedEventHandler_IDispatcherQueue_add_ShutdownCompleted;
   type TypedEventHandler_IDispatcherQueueTimer_add_Tick_Interface;
   type TypedEventHandler_IDispatcherQueueTimer_add_Tick is access all TypedEventHandler_IDispatcherQueueTimer_add_Tick_Interface'Class;
   type TypedEventHandler_IDispatcherQueueTimer_add_Tick_Ptr is access all TypedEventHandler_IDispatcherQueueTimer_add_Tick;
   type TypedEventHandler_IUserWatcher_add_Added_Interface;
   type TypedEventHandler_IUserWatcher_add_Added is access all TypedEventHandler_IUserWatcher_add_Added_Interface'Class;
   type TypedEventHandler_IUserWatcher_add_Added_Ptr is access all TypedEventHandler_IUserWatcher_add_Added;
   type TypedEventHandler_IUserWatcher_add_Removed_Interface;
   type TypedEventHandler_IUserWatcher_add_Removed is access all TypedEventHandler_IUserWatcher_add_Removed_Interface'Class;
   type TypedEventHandler_IUserWatcher_add_Removed_Ptr is access all TypedEventHandler_IUserWatcher_add_Removed;
   type TypedEventHandler_IUserWatcher_add_Updated_Interface;
   type TypedEventHandler_IUserWatcher_add_Updated is access all TypedEventHandler_IUserWatcher_add_Updated_Interface'Class;
   type TypedEventHandler_IUserWatcher_add_Updated_Ptr is access all TypedEventHandler_IUserWatcher_add_Updated;
   type TypedEventHandler_IUserWatcher_add_AuthenticationStatusChanged_Interface;
   type TypedEventHandler_IUserWatcher_add_AuthenticationStatusChanged is access all TypedEventHandler_IUserWatcher_add_AuthenticationStatusChanged_Interface'Class;
   type TypedEventHandler_IUserWatcher_add_AuthenticationStatusChanged_Ptr is access all TypedEventHandler_IUserWatcher_add_AuthenticationStatusChanged;
   type TypedEventHandler_IUserWatcher_add_AuthenticationStatusChanging_Interface;
   type TypedEventHandler_IUserWatcher_add_AuthenticationStatusChanging is access all TypedEventHandler_IUserWatcher_add_AuthenticationStatusChanging_Interface'Class;
   type TypedEventHandler_IUserWatcher_add_AuthenticationStatusChanging_Ptr is access all TypedEventHandler_IUserWatcher_add_AuthenticationStatusChanging;
   type TypedEventHandler_IUserWatcher_add_EnumerationCompleted_Interface;
   type TypedEventHandler_IUserWatcher_add_EnumerationCompleted is access all TypedEventHandler_IUserWatcher_add_EnumerationCompleted_Interface'Class;
   type TypedEventHandler_IUserWatcher_add_EnumerationCompleted_Ptr is access all TypedEventHandler_IUserWatcher_add_EnumerationCompleted;
   type TypedEventHandler_IUserWatcher_add_Stopped_Interface;
   type TypedEventHandler_IUserWatcher_add_Stopped is access all TypedEventHandler_IUserWatcher_add_Stopped_Interface'Class;
   type TypedEventHandler_IUserWatcher_add_Stopped_Ptr is access all TypedEventHandler_IUserWatcher_add_Stopped;
   type AsyncOperationCompletedHandler_IUser_Interface;
   type AsyncOperationCompletedHandler_IUser is access all AsyncOperationCompletedHandler_IUser_Interface'Class;
   type AsyncOperationCompletedHandler_IUser_Ptr is access all AsyncOperationCompletedHandler_IUser;
   type EventHandler_IUserDeviceAssociationChangedEventArgs_Interface;
   type EventHandler_IUserDeviceAssociationChangedEventArgs is access all EventHandler_IUserDeviceAssociationChangedEventArgs_Interface'Class;
   type EventHandler_IUserDeviceAssociationChangedEventArgs_Ptr is access all EventHandler_IUserDeviceAssociationChangedEventArgs;
   type EventHandler_IAppMemoryUsageLimitChangingEventArgs_Interface;
   type EventHandler_IAppMemoryUsageLimitChangingEventArgs is access all EventHandler_IAppMemoryUsageLimitChangingEventArgs_Interface'Class;
   type EventHandler_IAppMemoryUsageLimitChangingEventArgs_Ptr is access all EventHandler_IAppMemoryUsageLimitChangingEventArgs;
   type AsyncOperationCompletedHandler_DiagnosticAccessStatus_Interface;
   type AsyncOperationCompletedHandler_DiagnosticAccessStatus is access all AsyncOperationCompletedHandler_DiagnosticAccessStatus_Interface'Class;
   type AsyncOperationCompletedHandler_DiagnosticAccessStatus_Ptr is access all AsyncOperationCompletedHandler_DiagnosticAccessStatus;
   type AsyncOperationCompletedHandler_IAppActivationResult_Interface;
   type AsyncOperationCompletedHandler_IAppActivationResult is access all AsyncOperationCompletedHandler_IAppActivationResult_Interface'Class;
   type AsyncOperationCompletedHandler_IAppActivationResult_Ptr is access all AsyncOperationCompletedHandler_IAppActivationResult;
   type TypedEventHandler_IAppDiagnosticInfoWatcher_add_Added_Interface;
   type TypedEventHandler_IAppDiagnosticInfoWatcher_add_Added is access all TypedEventHandler_IAppDiagnosticInfoWatcher_add_Added_Interface'Class;
   type TypedEventHandler_IAppDiagnosticInfoWatcher_add_Added_Ptr is access all TypedEventHandler_IAppDiagnosticInfoWatcher_add_Added;
   type TypedEventHandler_IAppDiagnosticInfoWatcher_add_Removed_Interface;
   type TypedEventHandler_IAppDiagnosticInfoWatcher_add_Removed is access all TypedEventHandler_IAppDiagnosticInfoWatcher_add_Removed_Interface'Class;
   type TypedEventHandler_IAppDiagnosticInfoWatcher_add_Removed_Ptr is access all TypedEventHandler_IAppDiagnosticInfoWatcher_add_Removed;
   type TypedEventHandler_IAppDiagnosticInfoWatcher_add_EnumerationCompleted_Interface;
   type TypedEventHandler_IAppDiagnosticInfoWatcher_add_EnumerationCompleted is access all TypedEventHandler_IAppDiagnosticInfoWatcher_add_EnumerationCompleted_Interface'Class;
   type TypedEventHandler_IAppDiagnosticInfoWatcher_add_EnumerationCompleted_Ptr is access all TypedEventHandler_IAppDiagnosticInfoWatcher_add_EnumerationCompleted;
   type TypedEventHandler_IAppDiagnosticInfoWatcher_add_Stopped_Interface;
   type TypedEventHandler_IAppDiagnosticInfoWatcher_add_Stopped is access all TypedEventHandler_IAppDiagnosticInfoWatcher_add_Stopped_Interface'Class;
   type TypedEventHandler_IAppDiagnosticInfoWatcher_add_Stopped_Ptr is access all TypedEventHandler_IAppDiagnosticInfoWatcher_add_Stopped;
   type AsyncOperationCompletedHandler_IAppExecutionStateChangeResult_Interface;
   type AsyncOperationCompletedHandler_IAppExecutionStateChangeResult is access all AsyncOperationCompletedHandler_IAppExecutionStateChangeResult_Interface'Class;
   type AsyncOperationCompletedHandler_IAppExecutionStateChangeResult_Ptr is access all AsyncOperationCompletedHandler_IAppExecutionStateChangeResult;
   type TypedEventHandler_IAppResourceGroupInfoWatcher_add_Added_Interface;
   type TypedEventHandler_IAppResourceGroupInfoWatcher_add_Added is access all TypedEventHandler_IAppResourceGroupInfoWatcher_add_Added_Interface'Class;
   type TypedEventHandler_IAppResourceGroupInfoWatcher_add_Added_Ptr is access all TypedEventHandler_IAppResourceGroupInfoWatcher_add_Added;
   type TypedEventHandler_IAppResourceGroupInfoWatcher_add_Removed_Interface;
   type TypedEventHandler_IAppResourceGroupInfoWatcher_add_Removed is access all TypedEventHandler_IAppResourceGroupInfoWatcher_add_Removed_Interface'Class;
   type TypedEventHandler_IAppResourceGroupInfoWatcher_add_Removed_Ptr is access all TypedEventHandler_IAppResourceGroupInfoWatcher_add_Removed;
   type TypedEventHandler_IAppResourceGroupInfoWatcher_add_EnumerationCompleted_Interface;
   type TypedEventHandler_IAppResourceGroupInfoWatcher_add_EnumerationCompleted is access all TypedEventHandler_IAppResourceGroupInfoWatcher_add_EnumerationCompleted_Interface'Class;
   type TypedEventHandler_IAppResourceGroupInfoWatcher_add_EnumerationCompleted_Ptr is access all TypedEventHandler_IAppResourceGroupInfoWatcher_add_EnumerationCompleted;
   type TypedEventHandler_IAppResourceGroupInfoWatcher_add_Stopped_Interface;
   type TypedEventHandler_IAppResourceGroupInfoWatcher_add_Stopped is access all TypedEventHandler_IAppResourceGroupInfoWatcher_add_Stopped_Interface'Class;
   type TypedEventHandler_IAppResourceGroupInfoWatcher_add_Stopped_Ptr is access all TypedEventHandler_IAppResourceGroupInfoWatcher_add_Stopped;
   type TypedEventHandler_IAppResourceGroupInfoWatcher_add_ExecutionStateChanged_Interface;
   type TypedEventHandler_IAppResourceGroupInfoWatcher_add_ExecutionStateChanged is access all TypedEventHandler_IAppResourceGroupInfoWatcher_add_ExecutionStateChanged_Interface'Class;
   type TypedEventHandler_IAppResourceGroupInfoWatcher_add_ExecutionStateChanged_Ptr is access all TypedEventHandler_IAppResourceGroupInfoWatcher_add_ExecutionStateChanged;
   type AsyncOperationCompletedHandler_ILaunchUriResult_Interface;
   type AsyncOperationCompletedHandler_ILaunchUriResult is access all AsyncOperationCompletedHandler_ILaunchUriResult_Interface'Class;
   type AsyncOperationCompletedHandler_ILaunchUriResult_Ptr is access all AsyncOperationCompletedHandler_ILaunchUriResult;
   type AsyncOperationCompletedHandler_LaunchQuerySupportStatus_Interface;
   type AsyncOperationCompletedHandler_LaunchQuerySupportStatus is access all AsyncOperationCompletedHandler_LaunchQuerySupportStatus_Interface'Class;
   type AsyncOperationCompletedHandler_LaunchQuerySupportStatus_Ptr is access all AsyncOperationCompletedHandler_LaunchQuerySupportStatus;
   type AsyncOperationCompletedHandler_LaunchUriStatus_Interface;
   type AsyncOperationCompletedHandler_LaunchUriStatus is access all AsyncOperationCompletedHandler_LaunchUriStatus_Interface'Class;
   type AsyncOperationCompletedHandler_LaunchUriStatus_Ptr is access all AsyncOperationCompletedHandler_LaunchUriStatus;
   type AsyncOperationCompletedHandler_RemoteLaunchUriStatus_Interface;
   type AsyncOperationCompletedHandler_RemoteLaunchUriStatus is access all AsyncOperationCompletedHandler_RemoteLaunchUriStatus_Interface'Class;
   type AsyncOperationCompletedHandler_RemoteLaunchUriStatus_Ptr is access all AsyncOperationCompletedHandler_RemoteLaunchUriStatus;
   type AsyncOperationCompletedHandler_IProcessLauncherResult_Interface;
   type AsyncOperationCompletedHandler_IProcessLauncherResult is access all AsyncOperationCompletedHandler_IProcessLauncherResult_Interface'Class;
   type AsyncOperationCompletedHandler_IProcessLauncherResult_Ptr is access all AsyncOperationCompletedHandler_IProcessLauncherResult;
   type AsyncOperationCompletedHandler_AutoUpdateTimeZoneStatus_Interface;
   type AsyncOperationCompletedHandler_AutoUpdateTimeZoneStatus is access all AsyncOperationCompletedHandler_AutoUpdateTimeZoneStatus_Interface'Class;
   type AsyncOperationCompletedHandler_AutoUpdateTimeZoneStatus_Ptr is access all AsyncOperationCompletedHandler_AutoUpdateTimeZoneStatus;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IDispatcherQueueShutdownStartingEventArgs_Interface;
   type IDispatcherQueueShutdownStartingEventArgs is access all IDispatcherQueueShutdownStartingEventArgs_Interface'Class;
   type IDispatcherQueueShutdownStartingEventArgs_Ptr is access all IDispatcherQueueShutdownStartingEventArgs;
   type IDispatcherQueue_Interface;
   type IDispatcherQueue is access all IDispatcherQueue_Interface'Class;
   type IDispatcherQueue_Ptr is access all IDispatcherQueue;
   type IDispatcherQueueController_Interface;
   type IDispatcherQueueController is access all IDispatcherQueueController_Interface'Class;
   type IDispatcherQueueController_Ptr is access all IDispatcherQueueController;
   type IDispatcherQueueControllerStatics_Interface;
   type IDispatcherQueueControllerStatics is access all IDispatcherQueueControllerStatics_Interface'Class;
   type IDispatcherQueueControllerStatics_Ptr is access all IDispatcherQueueControllerStatics;
   type IDispatcherQueueStatics_Interface;
   type IDispatcherQueueStatics is access all IDispatcherQueueStatics_Interface'Class;
   type IDispatcherQueueStatics_Ptr is access all IDispatcherQueueStatics;
   type IDispatcherQueueTimer_Interface;
   type IDispatcherQueueTimer is access all IDispatcherQueueTimer_Interface'Class;
   type IDispatcherQueueTimer_Ptr is access all IDispatcherQueueTimer;
   type IUser_Interface;
   type IUser is access all IUser_Interface'Class;
   type IUser_Ptr is access all IUser;
   type IUserStatics_Interface;
   type IUserStatics is access all IUserStatics_Interface'Class;
   type IUserStatics_Ptr is access all IUserStatics;
   type IUserWatcher_Interface;
   type IUserWatcher is access all IUserWatcher_Interface'Class;
   type IUserWatcher_Ptr is access all IUserWatcher;
   type IUserChangedEventArgs_Interface;
   type IUserChangedEventArgs is access all IUserChangedEventArgs_Interface'Class;
   type IUserChangedEventArgs_Ptr is access all IUserChangedEventArgs;
   type IUserAuthenticationStatusChangeDeferral_Interface;
   type IUserAuthenticationStatusChangeDeferral is access all IUserAuthenticationStatusChangeDeferral_Interface'Class;
   type IUserAuthenticationStatusChangeDeferral_Ptr is access all IUserAuthenticationStatusChangeDeferral;
   type IUserAuthenticationStatusChangingEventArgs_Interface;
   type IUserAuthenticationStatusChangingEventArgs is access all IUserAuthenticationStatusChangingEventArgs_Interface'Class;
   type IUserAuthenticationStatusChangingEventArgs_Ptr is access all IUserAuthenticationStatusChangingEventArgs;
   type IKnownUserPropertiesStatics_Interface;
   type IKnownUserPropertiesStatics is access all IKnownUserPropertiesStatics_Interface'Class;
   type IKnownUserPropertiesStatics_Ptr is access all IKnownUserPropertiesStatics;
   type IUserPickerStatics_Interface;
   type IUserPickerStatics is access all IUserPickerStatics_Interface'Class;
   type IUserPickerStatics_Ptr is access all IUserPickerStatics;
   type IUserPicker_Interface;
   type IUserPicker is access all IUserPicker_Interface'Class;
   type IUserPicker_Ptr is access all IUserPicker;
   type IUserDeviceAssociationChangedEventArgs_Interface;
   type IUserDeviceAssociationChangedEventArgs is access all IUserDeviceAssociationChangedEventArgs_Interface'Class;
   type IUserDeviceAssociationChangedEventArgs_Ptr is access all IUserDeviceAssociationChangedEventArgs;
   type IUserDeviceAssociationStatics_Interface;
   type IUserDeviceAssociationStatics is access all IUserDeviceAssociationStatics_Interface'Class;
   type IUserDeviceAssociationStatics_Ptr is access all IUserDeviceAssociationStatics;
   type IAppMemoryReport_Interface;
   type IAppMemoryReport is access all IAppMemoryReport_Interface'Class;
   type IAppMemoryReport_Ptr is access all IAppMemoryReport;
   type IAppMemoryReport2_Interface;
   type IAppMemoryReport2 is access all IAppMemoryReport2_Interface'Class;
   type IAppMemoryReport2_Ptr is access all IAppMemoryReport2;
   type IProcessMemoryReport_Interface;
   type IProcessMemoryReport is access all IProcessMemoryReport_Interface'Class;
   type IProcessMemoryReport_Ptr is access all IProcessMemoryReport;
   type IAppMemoryUsageLimitChangingEventArgs_Interface;
   type IAppMemoryUsageLimitChangingEventArgs is access all IAppMemoryUsageLimitChangingEventArgs_Interface'Class;
   type IAppMemoryUsageLimitChangingEventArgs_Ptr is access all IAppMemoryUsageLimitChangingEventArgs;
   type IMemoryManagerStatics_Interface;
   type IMemoryManagerStatics is access all IMemoryManagerStatics_Interface'Class;
   type IMemoryManagerStatics_Ptr is access all IMemoryManagerStatics;
   type IMemoryManagerStatics2_Interface;
   type IMemoryManagerStatics2 is access all IMemoryManagerStatics2_Interface'Class;
   type IMemoryManagerStatics2_Ptr is access all IMemoryManagerStatics2;
   type IMemoryManagerStatics3_Interface;
   type IMemoryManagerStatics3 is access all IMemoryManagerStatics3_Interface'Class;
   type IMemoryManagerStatics3_Ptr is access all IMemoryManagerStatics3;
   type IMemoryManagerStatics4_Interface;
   type IMemoryManagerStatics4 is access all IMemoryManagerStatics4_Interface'Class;
   type IMemoryManagerStatics4_Ptr is access all IMemoryManagerStatics4;
   type IProtocolForResultsOperation_Interface;
   type IProtocolForResultsOperation is access all IProtocolForResultsOperation_Interface'Class;
   type IProtocolForResultsOperation_Ptr is access all IProtocolForResultsOperation;
   type IAppDiagnosticInfoStatics_Interface;
   type IAppDiagnosticInfoStatics is access all IAppDiagnosticInfoStatics_Interface'Class;
   type IAppDiagnosticInfoStatics_Ptr is access all IAppDiagnosticInfoStatics;
   type IAppDiagnosticInfoStatics2_Interface;
   type IAppDiagnosticInfoStatics2 is access all IAppDiagnosticInfoStatics2_Interface'Class;
   type IAppDiagnosticInfoStatics2_Ptr is access all IAppDiagnosticInfoStatics2;
   type IAppActivationResult_Interface;
   type IAppActivationResult is access all IAppActivationResult_Interface'Class;
   type IAppActivationResult_Ptr is access all IAppActivationResult;
   type IAppDiagnosticInfo_Interface;
   type IAppDiagnosticInfo is access all IAppDiagnosticInfo_Interface'Class;
   type IAppDiagnosticInfo_Ptr is access all IAppDiagnosticInfo;
   type IAppDiagnosticInfo2_Interface;
   type IAppDiagnosticInfo2 is access all IAppDiagnosticInfo2_Interface'Class;
   type IAppDiagnosticInfo2_Ptr is access all IAppDiagnosticInfo2;
   type IAppDiagnosticInfo3_Interface;
   type IAppDiagnosticInfo3 is access all IAppDiagnosticInfo3_Interface'Class;
   type IAppDiagnosticInfo3_Ptr is access all IAppDiagnosticInfo3;
   type IAppDiagnosticInfoWatcherEventArgs_Interface;
   type IAppDiagnosticInfoWatcherEventArgs is access all IAppDiagnosticInfoWatcherEventArgs_Interface'Class;
   type IAppDiagnosticInfoWatcherEventArgs_Ptr is access all IAppDiagnosticInfoWatcherEventArgs;
   type IAppDiagnosticInfoWatcher_Interface;
   type IAppDiagnosticInfoWatcher is access all IAppDiagnosticInfoWatcher_Interface'Class;
   type IAppDiagnosticInfoWatcher_Ptr is access all IAppDiagnosticInfoWatcher;
   type IAppExecutionStateChangeResult_Interface;
   type IAppExecutionStateChangeResult is access all IAppExecutionStateChangeResult_Interface'Class;
   type IAppExecutionStateChangeResult_Ptr is access all IAppExecutionStateChangeResult;
   type IAppResourceGroupBackgroundTaskReport_Interface;
   type IAppResourceGroupBackgroundTaskReport is access all IAppResourceGroupBackgroundTaskReport_Interface'Class;
   type IAppResourceGroupBackgroundTaskReport_Ptr is access all IAppResourceGroupBackgroundTaskReport;
   type IAppResourceGroupMemoryReport_Interface;
   type IAppResourceGroupMemoryReport is access all IAppResourceGroupMemoryReport_Interface'Class;
   type IAppResourceGroupMemoryReport_Ptr is access all IAppResourceGroupMemoryReport;
   type IAppResourceGroupInfo_Interface;
   type IAppResourceGroupInfo is access all IAppResourceGroupInfo_Interface'Class;
   type IAppResourceGroupInfo_Ptr is access all IAppResourceGroupInfo;
   type IAppResourceGroupInfo2_Interface;
   type IAppResourceGroupInfo2 is access all IAppResourceGroupInfo2_Interface'Class;
   type IAppResourceGroupInfo2_Ptr is access all IAppResourceGroupInfo2;
   type IAppResourceGroupInfoWatcherEventArgs_Interface;
   type IAppResourceGroupInfoWatcherEventArgs is access all IAppResourceGroupInfoWatcherEventArgs_Interface'Class;
   type IAppResourceGroupInfoWatcherEventArgs_Ptr is access all IAppResourceGroupInfoWatcherEventArgs;
   type IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs_Interface;
   type IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs is access all IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs_Interface'Class;
   type IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs_Ptr is access all IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs;
   type IAppResourceGroupInfoWatcher_Interface;
   type IAppResourceGroupInfoWatcher is access all IAppResourceGroupInfoWatcher_Interface'Class;
   type IAppResourceGroupInfoWatcher_Ptr is access all IAppResourceGroupInfoWatcher;
   type IAppResourceGroupStateReport_Interface;
   type IAppResourceGroupStateReport is access all IAppResourceGroupStateReport_Interface'Class;
   type IAppResourceGroupStateReport_Ptr is access all IAppResourceGroupStateReport;
   type ILaunchUriResult_Interface;
   type ILaunchUriResult is access all ILaunchUriResult_Interface'Class;
   type ILaunchUriResult_Ptr is access all ILaunchUriResult;
   type ILauncherUIOptions_Interface;
   type ILauncherUIOptions is access all ILauncherUIOptions_Interface'Class;
   type ILauncherUIOptions_Ptr is access all ILauncherUIOptions;
   type ILauncherOptions_Interface;
   type ILauncherOptions is access all ILauncherOptions_Interface'Class;
   type ILauncherOptions_Ptr is access all ILauncherOptions;
   type ILauncherOptions2_Interface;
   type ILauncherOptions2 is access all ILauncherOptions2_Interface'Class;
   type ILauncherOptions2_Ptr is access all ILauncherOptions2;
   type ILauncherOptions3_Interface;
   type ILauncherOptions3 is access all ILauncherOptions3_Interface'Class;
   type ILauncherOptions3_Ptr is access all ILauncherOptions3;
   type ILauncherOptions4_Interface;
   type ILauncherOptions4 is access all ILauncherOptions4_Interface'Class;
   type ILauncherOptions4_Ptr is access all ILauncherOptions4;
   type ILauncherViewOptions_Interface;
   type ILauncherViewOptions is access all ILauncherViewOptions_Interface'Class;
   type ILauncherViewOptions_Ptr is access all ILauncherViewOptions;
   type IRemoteLauncherOptions_Interface;
   type IRemoteLauncherOptions is access all IRemoteLauncherOptions_Interface'Class;
   type IRemoteLauncherOptions_Ptr is access all IRemoteLauncherOptions;
   type IFolderLauncherOptions_Interface;
   type IFolderLauncherOptions is access all IFolderLauncherOptions_Interface'Class;
   type IFolderLauncherOptions_Ptr is access all IFolderLauncherOptions;
   type ILauncherStatics_Interface;
   type ILauncherStatics is access all ILauncherStatics_Interface'Class;
   type ILauncherStatics_Ptr is access all ILauncherStatics;
   type ILauncherStatics2_Interface;
   type ILauncherStatics2 is access all ILauncherStatics2_Interface'Class;
   type ILauncherStatics2_Ptr is access all ILauncherStatics2;
   type ILauncherStatics3_Interface;
   type ILauncherStatics3 is access all ILauncherStatics3_Interface'Class;
   type ILauncherStatics3_Ptr is access all ILauncherStatics3;
   type ILauncherStatics4_Interface;
   type ILauncherStatics4 is access all ILauncherStatics4_Interface'Class;
   type ILauncherStatics4_Ptr is access all ILauncherStatics4;
   type IRemoteLauncherStatics_Interface;
   type IRemoteLauncherStatics is access all IRemoteLauncherStatics_Interface'Class;
   type IRemoteLauncherStatics_Ptr is access all IRemoteLauncherStatics;
   type IDateTimeSettingsStatics_Interface;
   type IDateTimeSettingsStatics is access all IDateTimeSettingsStatics_Interface'Class;
   type IDateTimeSettingsStatics_Ptr is access all IDateTimeSettingsStatics;
   type IProcessLauncherOptions_Interface;
   type IProcessLauncherOptions is access all IProcessLauncherOptions_Interface'Class;
   type IProcessLauncherOptions_Ptr is access all IProcessLauncherOptions;
   type IProcessLauncherStatics_Interface;
   type IProcessLauncherStatics is access all IProcessLauncherStatics_Interface'Class;
   type IProcessLauncherStatics_Ptr is access all IProcessLauncherStatics;
   type IProcessLauncherResult_Interface;
   type IProcessLauncherResult is access all IProcessLauncherResult_Interface'Class;
   type IProcessLauncherResult_Ptr is access all IProcessLauncherResult;
   type IShutdownManagerStatics_Interface;
   type IShutdownManagerStatics is access all IShutdownManagerStatics_Interface'Class;
   type IShutdownManagerStatics_Ptr is access all IShutdownManagerStatics;
   type IShutdownManagerStatics2_Interface;
   type IShutdownManagerStatics2 is access all IShutdownManagerStatics2_Interface'Class;
   type IShutdownManagerStatics2_Ptr is access all IShutdownManagerStatics2;
   type ITimeZoneSettingsStatics_Interface;
   type ITimeZoneSettingsStatics is access all ITimeZoneSettingsStatics_Interface'Class;
   type ITimeZoneSettingsStatics_Ptr is access all ITimeZoneSettingsStatics;
   type ITimeZoneSettingsStatics2_Interface;
   type ITimeZoneSettingsStatics2 is access all ITimeZoneSettingsStatics2_Interface'Class;
   type ITimeZoneSettingsStatics2_Ptr is access all ITimeZoneSettingsStatics2;
   type IAsyncOperation_IUser_Interface;
   type IAsyncOperation_IUser is access all IAsyncOperation_IUser_Interface'Class;
   type IAsyncOperation_IUser_Ptr is access all IAsyncOperation_IUser;
   type IIterator_IAppDiagnosticInfo_Interface;
   type IIterator_IAppDiagnosticInfo is access all IIterator_IAppDiagnosticInfo_Interface'Class;
   type IIterator_IAppDiagnosticInfo_Ptr is access all IIterator_IAppDiagnosticInfo;
   type IIterable_IAppDiagnosticInfo_Interface;
   type IIterable_IAppDiagnosticInfo is access all IIterable_IAppDiagnosticInfo_Interface'Class;
   type IIterable_IAppDiagnosticInfo_Ptr is access all IIterable_IAppDiagnosticInfo;
   type IVectorView_IAppDiagnosticInfo_Interface;
   type IVectorView_IAppDiagnosticInfo is access all IVectorView_IAppDiagnosticInfo_Interface'Class;
   type IVectorView_IAppDiagnosticInfo_Ptr is access all IVectorView_IAppDiagnosticInfo;
   type IVector_IAppDiagnosticInfo_Interface;
   type IVector_IAppDiagnosticInfo is access all IVector_IAppDiagnosticInfo_Interface'Class;
   type IVector_IAppDiagnosticInfo_Ptr is access all IVector_IAppDiagnosticInfo;
   type IAsyncOperation_DiagnosticAccessStatus_Interface;
   type IAsyncOperation_DiagnosticAccessStatus is access all IAsyncOperation_DiagnosticAccessStatus_Interface'Class;
   type IAsyncOperation_DiagnosticAccessStatus_Ptr is access all IAsyncOperation_DiagnosticAccessStatus;
   type IIterator_IAppResourceGroupInfo_Interface;
   type IIterator_IAppResourceGroupInfo is access all IIterator_IAppResourceGroupInfo_Interface'Class;
   type IIterator_IAppResourceGroupInfo_Ptr is access all IIterator_IAppResourceGroupInfo;
   type IIterable_IAppResourceGroupInfo_Interface;
   type IIterable_IAppResourceGroupInfo is access all IIterable_IAppResourceGroupInfo_Interface'Class;
   type IIterable_IAppResourceGroupInfo_Ptr is access all IIterable_IAppResourceGroupInfo;
   type IVectorView_IAppResourceGroupInfo_Interface;
   type IVectorView_IAppResourceGroupInfo is access all IVectorView_IAppResourceGroupInfo_Interface'Class;
   type IVectorView_IAppResourceGroupInfo_Ptr is access all IVectorView_IAppResourceGroupInfo;
   type IVector_IAppResourceGroupInfo_Interface;
   type IVector_IAppResourceGroupInfo is access all IVector_IAppResourceGroupInfo_Interface'Class;
   type IVector_IAppResourceGroupInfo_Ptr is access all IVector_IAppResourceGroupInfo;
   type IAsyncOperation_IAppActivationResult_Interface;
   type IAsyncOperation_IAppActivationResult is access all IAsyncOperation_IAppActivationResult_Interface'Class;
   type IAsyncOperation_IAppActivationResult_Ptr is access all IAsyncOperation_IAppActivationResult;
   type IIterator_IAppResourceGroupBackgroundTaskReport_Interface;
   type IIterator_IAppResourceGroupBackgroundTaskReport is access all IIterator_IAppResourceGroupBackgroundTaskReport_Interface'Class;
   type IIterator_IAppResourceGroupBackgroundTaskReport_Ptr is access all IIterator_IAppResourceGroupBackgroundTaskReport;
   type IIterable_IAppResourceGroupBackgroundTaskReport_Interface;
   type IIterable_IAppResourceGroupBackgroundTaskReport is access all IIterable_IAppResourceGroupBackgroundTaskReport_Interface'Class;
   type IIterable_IAppResourceGroupBackgroundTaskReport_Ptr is access all IIterable_IAppResourceGroupBackgroundTaskReport;
   type IVectorView_IAppResourceGroupBackgroundTaskReport_Interface;
   type IVectorView_IAppResourceGroupBackgroundTaskReport is access all IVectorView_IAppResourceGroupBackgroundTaskReport_Interface'Class;
   type IVectorView_IAppResourceGroupBackgroundTaskReport_Ptr is access all IVectorView_IAppResourceGroupBackgroundTaskReport;
   type IVector_IAppResourceGroupBackgroundTaskReport_Interface;
   type IVector_IAppResourceGroupBackgroundTaskReport is access all IVector_IAppResourceGroupBackgroundTaskReport_Interface'Class;
   type IVector_IAppResourceGroupBackgroundTaskReport_Ptr is access all IVector_IAppResourceGroupBackgroundTaskReport;
   type IAsyncOperation_IAppExecutionStateChangeResult_Interface;
   type IAsyncOperation_IAppExecutionStateChangeResult is access all IAsyncOperation_IAppExecutionStateChangeResult_Interface'Class;
   type IAsyncOperation_IAppExecutionStateChangeResult_Ptr is access all IAsyncOperation_IAppExecutionStateChangeResult;
   type IAsyncOperation_ILaunchUriResult_Interface;
   type IAsyncOperation_ILaunchUriResult is access all IAsyncOperation_ILaunchUriResult_Interface'Class;
   type IAsyncOperation_ILaunchUriResult_Ptr is access all IAsyncOperation_ILaunchUriResult;
   type IAsyncOperation_LaunchQuerySupportStatus_Interface;
   type IAsyncOperation_LaunchQuerySupportStatus is access all IAsyncOperation_LaunchQuerySupportStatus_Interface'Class;
   type IAsyncOperation_LaunchQuerySupportStatus_Ptr is access all IAsyncOperation_LaunchQuerySupportStatus;
   type IAsyncOperation_LaunchUriStatus_Interface;
   type IAsyncOperation_LaunchUriStatus is access all IAsyncOperation_LaunchUriStatus_Interface'Class;
   type IAsyncOperation_LaunchUriStatus_Ptr is access all IAsyncOperation_LaunchUriStatus;
   type IAsyncOperation_RemoteLaunchUriStatus_Interface;
   type IAsyncOperation_RemoteLaunchUriStatus is access all IAsyncOperation_RemoteLaunchUriStatus_Interface'Class;
   type IAsyncOperation_RemoteLaunchUriStatus_Ptr is access all IAsyncOperation_RemoteLaunchUriStatus;
   type IAsyncOperation_IProcessLauncherResult_Interface;
   type IAsyncOperation_IProcessLauncherResult is access all IAsyncOperation_IProcessLauncherResult_Interface'Class;
   type IAsyncOperation_IProcessLauncherResult_Ptr is access all IAsyncOperation_IProcessLauncherResult;
   type IAsyncOperation_AutoUpdateTimeZoneStatus_Interface;
   type IAsyncOperation_AutoUpdateTimeZoneStatus is access all IAsyncOperation_AutoUpdateTimeZoneStatus_Interface'Class;
   type IAsyncOperation_AutoUpdateTimeZoneStatus_Ptr is access all IAsyncOperation_AutoUpdateTimeZoneStatus;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IDispatcherQueueShutdownStartingEventArgs : aliased constant Windows.IID := (3295824972, 65431, 16576, (162, 38, 204, 10, 170, 84, 94, 137 ));
   
   type IDispatcherQueueShutdownStartingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeferral
   (
      This       : access IDispatcherQueueShutdownStartingEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDispatcherQueue : aliased constant Windows.IID := (1614711012, 41784, 20478, (164, 87, 165, 207, 185, 206, 184, 153 ));
   
   type IDispatcherQueue_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateTimer
   (
      This       : access IDispatcherQueue_Interface
      ; RetVal : access Windows.System.IDispatcherQueueTimer
   )
   return Windows.HRESULT is abstract;
   
   function TryEnqueue
   (
      This       : access IDispatcherQueue_Interface
      ; callback : Windows.System.DispatcherQueueHandler
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TryEnqueueWithPriority
   (
      This       : access IDispatcherQueue_Interface
      ; priority : Windows.System.DispatcherQueuePriority
      ; callback : Windows.System.DispatcherQueueHandler
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_ShutdownStarting
   (
      This       : access IDispatcherQueue_Interface
      ; handler : TypedEventHandler_IDispatcherQueue_add_ShutdownStarting
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ShutdownStarting
   (
      This       : access IDispatcherQueue_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ShutdownCompleted
   (
      This       : access IDispatcherQueue_Interface
      ; handler : TypedEventHandler_IDispatcherQueue_add_ShutdownCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ShutdownCompleted
   (
      This       : access IDispatcherQueue_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDispatcherQueueController : aliased constant Windows.IID := (586370662, 20699, 20022, (169, 141, 97, 192, 27, 56, 77, 32 ));
   
   type IDispatcherQueueController_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DispatcherQueue
   (
      This       : access IDispatcherQueueController_Interface
      ; RetVal : access Windows.System.IDispatcherQueue
   )
   return Windows.HRESULT is abstract;
   
   function ShutdownQueueAsync
   (
      This       : access IDispatcherQueueController_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDispatcherQueueControllerStatics : aliased constant Windows.IID := (174889184, 20888, 18850, (163, 19, 63, 112, 209, 241, 60, 39 ));
   
   type IDispatcherQueueControllerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateOnDedicatedThread
   (
      This       : access IDispatcherQueueControllerStatics_Interface
      ; RetVal : access Windows.System.IDispatcherQueueController
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDispatcherQueueStatics : aliased constant Windows.IID := (2842526679, 37745, 17687, (146, 69, 208, 130, 74, 193, 44, 116 ));
   
   type IDispatcherQueueStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentThread
   (
      This       : access IDispatcherQueueStatics_Interface
      ; RetVal : access Windows.System.IDispatcherQueue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDispatcherQueueTimer : aliased constant Windows.IID := (1609218845, 41756, 18215, (177, 172, 55, 69, 70, 73, 213, 106 ));
   
   type IDispatcherQueueTimer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Interval
   (
      This       : access IDispatcherQueueTimer_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_Interval
   (
      This       : access IDispatcherQueueTimer_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_IsRunning
   (
      This       : access IDispatcherQueueTimer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsRepeating
   (
      This       : access IDispatcherQueueTimer_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsRepeating
   (
      This       : access IDispatcherQueueTimer_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IDispatcherQueueTimer_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IDispatcherQueueTimer_Interface
   )
   return Windows.HRESULT is abstract;
   
   function add_Tick
   (
      This       : access IDispatcherQueueTimer_Interface
      ; handler : TypedEventHandler_IDispatcherQueueTimer_add_Tick
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Tick
   (
      This       : access IDispatcherQueueTimer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUser : aliased constant Windows.IID := (3751421638, 59206, 19405, (181, 212, 18, 1, 3, 196, 32, 155 ));
   
   type IUser_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NonRoamableId
   (
      This       : access IUser_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AuthenticationStatus
   (
      This       : access IUser_Interface
      ; RetVal : access Windows.System.UserAuthenticationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Type
   (
      This       : access IUser_Interface
      ; RetVal : access Windows.System.UserType
   )
   return Windows.HRESULT is abstract;
   
   function GetPropertyAsync
   (
      This       : access IUser_Interface
      ; value : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Object -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetPropertiesAsync
   (
      This       : access IUser_Interface
      ; values : Windows.Foundation.Collections.IVectorView_String
      ; RetVal : access Windows.Foundation.Collections.IAsyncOperation_IPropertySet -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetPictureAsync
   (
      This       : access IUser_Interface
      ; desiredSize : Windows.System.UserPictureSize
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamReference -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserStatics : aliased constant Windows.IID := (358527547, 9258, 17888, (162, 233, 49, 113, 252, 106, 127, 221 ));
   
   type IUserStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWatcher
   (
      This       : access IUserStatics_Interface
      ; RetVal : access Windows.System.IUserWatcher
   )
   return Windows.HRESULT is abstract;
   
   function FindAllAsync
   (
      This       : access IUserStatics_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAllAsyncByType
   (
      This       : access IUserStatics_Interface
      ; type_x : Windows.System.UserType
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAllAsyncByTypeAndStatus
   (
      This       : access IUserStatics_Interface
      ; type_x : Windows.System.UserType
      ; status : Windows.System.UserAuthenticationStatus
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetFromId
   (
      This       : access IUserStatics_Interface
      ; nonRoamableId : Windows.String
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserWatcher : aliased constant Windows.IID := (358527547, 9258, 17888, (162, 233, 49, 113, 252, 106, 127, 187 ));
   
   type IUserWatcher_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IUserWatcher_Interface
      ; RetVal : access Windows.System.UserWatcherStatus
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IUserWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IUserWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   
   function add_Added
   (
      This       : access IUserWatcher_Interface
      ; handler : TypedEventHandler_IUserWatcher_add_Added
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Added
   (
      This       : access IUserWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Removed
   (
      This       : access IUserWatcher_Interface
      ; handler : TypedEventHandler_IUserWatcher_add_Removed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Removed
   (
      This       : access IUserWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Updated
   (
      This       : access IUserWatcher_Interface
      ; handler : TypedEventHandler_IUserWatcher_add_Updated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Updated
   (
      This       : access IUserWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_AuthenticationStatusChanged
   (
      This       : access IUserWatcher_Interface
      ; handler : TypedEventHandler_IUserWatcher_add_AuthenticationStatusChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AuthenticationStatusChanged
   (
      This       : access IUserWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_AuthenticationStatusChanging
   (
      This       : access IUserWatcher_Interface
      ; handler : TypedEventHandler_IUserWatcher_add_AuthenticationStatusChanging
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AuthenticationStatusChanging
   (
      This       : access IUserWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_EnumerationCompleted
   (
      This       : access IUserWatcher_Interface
      ; handler : TypedEventHandler_IUserWatcher_add_EnumerationCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_EnumerationCompleted
   (
      This       : access IUserWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Stopped
   (
      This       : access IUserWatcher_Interface
      ; handler : TypedEventHandler_IUserWatcher_add_Stopped
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Stopped
   (
      This       : access IUserWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserChangedEventArgs : aliased constant Windows.IID := (140794332, 6342, 18651, (188, 153, 114, 79, 185, 32, 60, 204 ));
   
   type IUserChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_User
   (
      This       : access IUserChangedEventArgs_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserAuthenticationStatusChangeDeferral : aliased constant Windows.IID := (2293601640, 47920, 17147, (162, 112, 233, 144, 46, 64, 239, 167 ));
   
   type IUserAuthenticationStatusChangeDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access IUserAuthenticationStatusChangeDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserAuthenticationStatusChangingEventArgs : aliased constant Windows.IID := (2349010728, 42769, 19486, (171, 72, 4, 23, 156, 21, 147, 143 ));
   
   type IUserAuthenticationStatusChangingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeferral
   (
      This       : access IUserAuthenticationStatusChangingEventArgs_Interface
      ; RetVal : access Windows.System.IUserAuthenticationStatusChangeDeferral
   )
   return Windows.HRESULT is abstract;
   
   function get_User
   (
      This       : access IUserAuthenticationStatusChangingEventArgs_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   function get_NewStatus
   (
      This       : access IUserAuthenticationStatusChangingEventArgs_Interface
      ; RetVal : access Windows.System.UserAuthenticationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentStatus
   (
      This       : access IUserAuthenticationStatusChangingEventArgs_Interface
      ; RetVal : access Windows.System.UserAuthenticationStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKnownUserPropertiesStatics : aliased constant Windows.IID := (2002096410, 28869, 18661, (182, 55, 91, 163, 68, 30, 78, 228 ));
   
   type IKnownUserPropertiesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DisplayName
   (
      This       : access IKnownUserPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FirstName
   (
      This       : access IKnownUserPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LastName
   (
      This       : access IKnownUserPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ProviderName
   (
      This       : access IKnownUserPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AccountName
   (
      This       : access IKnownUserPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_GuestHost
   (
      This       : access IKnownUserPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PrincipalName
   (
      This       : access IKnownUserPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DomainName
   (
      This       : access IKnownUserPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SessionInitiationProtocolUri
   (
      This       : access IKnownUserPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserPickerStatics : aliased constant Windows.IID := (3727855836, 32371, 19958, (161, 174, 77, 126, 202, 130, 180, 13 ));
   
   type IUserPickerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function IsSupported
   (
      This       : access IUserPickerStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserPicker : aliased constant Windows.IID := (2102689800, 61923, 19052, (141, 220, 169, 187, 15, 72, 138, 237 ));
   
   type IUserPicker_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AllowGuestAccounts
   (
      This       : access IUserPicker_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AllowGuestAccounts
   (
      This       : access IUserPicker_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SuggestedSelectedUser
   (
      This       : access IUserPicker_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   function put_SuggestedSelectedUser
   (
      This       : access IUserPicker_Interface
      ; value : Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   function PickSingleUserAsync
   (
      This       : access IUserPicker_Interface
      ; RetVal : access Windows.System.IAsyncOperation_IUser -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserDeviceAssociationChangedEventArgs : aliased constant Windows.IID := (3172953964, 47965, 19835, (165, 240, 200, 205, 17, 163, 141, 66 ));
   
   type IUserDeviceAssociationChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IUserDeviceAssociationChangedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NewUser
   (
      This       : access IUserDeviceAssociationChangedEventArgs_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   function get_OldUser
   (
      This       : access IUserDeviceAssociationChangedEventArgs_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserDeviceAssociationStatics : aliased constant Windows.IID := (2118721044, 63578, 19463, (141, 169, 127, 227, 208, 84, 35, 67 ));
   
   type IUserDeviceAssociationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FindUserFromDeviceId
   (
      This       : access IUserDeviceAssociationStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   function add_UserDeviceAssociationChanged
   (
      This       : access IUserDeviceAssociationStatics_Interface
      ; handler : Windows.System.EventHandler_IUserDeviceAssociationChangedEventArgs
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_UserDeviceAssociationChanged
   (
      This       : access IUserDeviceAssociationStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppMemoryReport : aliased constant Windows.IID := (1835348891, 19823, 17852, (156, 94, 228, 155, 63, 242, 117, 141 ));
   
   type IAppMemoryReport_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PrivateCommitUsage
   (
      This       : access IAppMemoryReport_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_PeakPrivateCommitUsage
   (
      This       : access IAppMemoryReport_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_TotalCommitUsage
   (
      This       : access IAppMemoryReport_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_TotalCommitLimit
   (
      This       : access IAppMemoryReport_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppMemoryReport2 : aliased constant Windows.IID := (1602172728, 20919, 17116, (183, 237, 121, 186, 70, 210, 136, 87 ));
   
   type IAppMemoryReport2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExpectedTotalCommitLimit
   (
      This       : access IAppMemoryReport2_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProcessMemoryReport : aliased constant Windows.IID := (141755816, 39792, 18306, (135, 65, 58, 152, 43, 108, 229, 228 ));
   
   type IProcessMemoryReport_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PrivateWorkingSetUsage
   (
      This       : access IProcessMemoryReport_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_TotalWorkingSetUsage
   (
      This       : access IProcessMemoryReport_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppMemoryUsageLimitChangingEventArgs : aliased constant Windows.IID := (2046322276, 65226, 19877, (158, 64, 43, 198, 62, 253, 201, 121 ));
   
   type IAppMemoryUsageLimitChangingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OldLimit
   (
      This       : access IAppMemoryUsageLimitChangingEventArgs_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_NewLimit
   (
      This       : access IAppMemoryUsageLimitChangingEventArgs_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMemoryManagerStatics : aliased constant Windows.IID := (1550591900, 55242, 18297, (145, 136, 64, 87, 33, 156, 230, 76 ));
   
   type IMemoryManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppMemoryUsage
   (
      This       : access IMemoryManagerStatics_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_AppMemoryUsageLimit
   (
      This       : access IMemoryManagerStatics_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_AppMemoryUsageLevel
   (
      This       : access IMemoryManagerStatics_Interface
      ; RetVal : access Windows.System.AppMemoryUsageLevel
   )
   return Windows.HRESULT is abstract;
   
   function add_AppMemoryUsageIncreased
   (
      This       : access IMemoryManagerStatics_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AppMemoryUsageIncreased
   (
      This       : access IMemoryManagerStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_AppMemoryUsageDecreased
   (
      This       : access IMemoryManagerStatics_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AppMemoryUsageDecreased
   (
      This       : access IMemoryManagerStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_AppMemoryUsageLimitChanging
   (
      This       : access IMemoryManagerStatics_Interface
      ; handler : Windows.System.EventHandler_IAppMemoryUsageLimitChangingEventArgs
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AppMemoryUsageLimitChanging
   (
      This       : access IMemoryManagerStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMemoryManagerStatics2 : aliased constant Windows.IID := (1861104927, 28002, 16959, (148, 121, 176, 31, 156, 159, 118, 105 ));
   
   type IMemoryManagerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAppMemoryReport
   (
      This       : access IMemoryManagerStatics2_Interface
      ; RetVal : access Windows.System.IAppMemoryReport
   )
   return Windows.HRESULT is abstract;
   
   function GetProcessMemoryReport
   (
      This       : access IMemoryManagerStatics2_Interface
      ; RetVal : access Windows.System.IProcessMemoryReport
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMemoryManagerStatics3 : aliased constant Windows.IID := (345725390, 37549, 20021, (137, 235, 80, 223, 180, 192, 217, 28 ));
   
   type IMemoryManagerStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function TrySetAppMemoryUsageLimit
   (
      This       : access IMemoryManagerStatics3_Interface
      ; value : Windows.UInt64
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMemoryManagerStatics4 : aliased constant Windows.IID := (3316205608, 59470, 18566, (138, 13, 68, 179, 25, 14, 59, 114 ));
   
   type IMemoryManagerStatics4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExpectedAppMemoryUsageLimit
   (
      This       : access IMemoryManagerStatics4_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProtocolForResultsOperation : aliased constant Windows.IID := (3582011706, 28137, 19752, (147, 120, 248, 103, 130, 225, 130, 187 ));
   
   type IProtocolForResultsOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function ReportCompleted
   (
      This       : access IProtocolForResultsOperation_Interface
      ; data : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppDiagnosticInfoStatics : aliased constant Windows.IID := (3462997439, 4298, 16584, (169, 202, 197, 201, 101, 1, 134, 110 ));
   
   type IAppDiagnosticInfoStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestInfoAsync
   (
      This       : access IAppDiagnosticInfoStatics_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppDiagnosticInfoStatics2 : aliased constant Windows.IID := (95570822, 4096, 19600, (187, 159, 114, 53, 7, 28, 80, 254 ));
   
   type IAppDiagnosticInfoStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWatcher
   (
      This       : access IAppDiagnosticInfoStatics2_Interface
      ; RetVal : access Windows.System.IAppDiagnosticInfoWatcher
   )
   return Windows.HRESULT is abstract;
   
   function RequestAccessAsync
   (
      This       : access IAppDiagnosticInfoStatics2_Interface
      ; RetVal : access Windows.System.IAsyncOperation_DiagnosticAccessStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestInfoForPackageAsync
   (
      This       : access IAppDiagnosticInfoStatics2_Interface
      ; packageFamilyName : Windows.String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestInfoForAppAsync
   (
      This       : access IAppDiagnosticInfoStatics2_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestInfoForAppUserModelId
   (
      This       : access IAppDiagnosticInfoStatics2_Interface
      ; appUserModelId : Windows.String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppActivationResult : aliased constant Windows.IID := (1800571136, 62574, 20144, (170, 108, 56, 175, 85, 124, 249, 237 ));
   
   type IAppActivationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExtendedError
   (
      This       : access IAppActivationResult_Interface
      ; RetVal : access Windows.HResult
   )
   return Windows.HRESULT is abstract;
   
   function get_AppResourceGroupInfo
   (
      This       : access IAppActivationResult_Interface
      ; RetVal : access Windows.System.IAppResourceGroupInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppDiagnosticInfo : aliased constant Windows.IID := (3813189274, 34953, 19619, (190, 7, 213, 255, 255, 95, 8, 4 ));
   
   type IAppDiagnosticInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppInfo
   (
      This       : access IAppDiagnosticInfo_Interface
      ; RetVal : access Windows.ApplicationModel.IAppInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppDiagnosticInfo2 : aliased constant Windows.IID := (3745971159, 6426, 17516, (148, 115, 143, 188, 35, 116, 163, 84 ));
   
   type IAppDiagnosticInfo2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetResourceGroups
   (
      This       : access IAppDiagnosticInfo2_Interface
      ; RetVal : access Windows.System.IVector_IAppResourceGroupInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateResourceGroupWatcher
   (
      This       : access IAppDiagnosticInfo2_Interface
      ; RetVal : access Windows.System.IAppResourceGroupInfoWatcher
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppDiagnosticInfo3 : aliased constant Windows.IID := (3365258813, 56673, 19557, (186, 189, 129, 161, 11, 79, 152, 21 ));
   
   type IAppDiagnosticInfo3_Interface is interface and Windows.IInspectable_Interface;
   
   function LaunchAsync
   (
      This       : access IAppDiagnosticInfo3_Interface
      ; RetVal : access Windows.System.IAsyncOperation_IAppActivationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppDiagnosticInfoWatcherEventArgs : aliased constant Windows.IID := (1880606486, 57818, 19557, (153, 223, 4, 109, 255, 91, 231, 26 ));
   
   type IAppDiagnosticInfoWatcherEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppDiagnosticInfo
   (
      This       : access IAppDiagnosticInfoWatcherEventArgs_Interface
      ; RetVal : access Windows.System.IAppDiagnosticInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppDiagnosticInfoWatcher : aliased constant Windows.IID := (1968656496, 467, 18586, (147, 37, 82, 249, 204, 110, 222, 10 ));
   
   type IAppDiagnosticInfoWatcher_Interface is interface and Windows.IInspectable_Interface;
   
   function add_Added
   (
      This       : access IAppDiagnosticInfoWatcher_Interface
      ; handler : TypedEventHandler_IAppDiagnosticInfoWatcher_add_Added
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Added
   (
      This       : access IAppDiagnosticInfoWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Removed
   (
      This       : access IAppDiagnosticInfoWatcher_Interface
      ; handler : TypedEventHandler_IAppDiagnosticInfoWatcher_add_Removed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Removed
   (
      This       : access IAppDiagnosticInfoWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_EnumerationCompleted
   (
      This       : access IAppDiagnosticInfoWatcher_Interface
      ; handler : TypedEventHandler_IAppDiagnosticInfoWatcher_add_EnumerationCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_EnumerationCompleted
   (
      This       : access IAppDiagnosticInfoWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Stopped
   (
      This       : access IAppDiagnosticInfoWatcher_Interface
      ; handler : TypedEventHandler_IAppDiagnosticInfoWatcher_add_Stopped
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Stopped
   (
      This       : access IAppDiagnosticInfoWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IAppDiagnosticInfoWatcher_Interface
      ; RetVal : access Windows.System.AppDiagnosticInfoWatcherStatus
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IAppDiagnosticInfoWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IAppDiagnosticInfoWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppExecutionStateChangeResult : aliased constant Windows.IID := (1862507504, 63771, 19960, (174, 119, 48, 51, 204, 182, 145, 20 ));
   
   type IAppExecutionStateChangeResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExtendedError
   (
      This       : access IAppExecutionStateChangeResult_Interface
      ; RetVal : access Windows.HResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppResourceGroupBackgroundTaskReport : aliased constant Windows.IID := (627500878, 45149, 16578, (157, 193, 26, 79, 3, 158, 161, 32 ));
   
   type IAppResourceGroupBackgroundTaskReport_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TaskId
   (
      This       : access IAppResourceGroupBackgroundTaskReport_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access IAppResourceGroupBackgroundTaskReport_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Trigger
   (
      This       : access IAppResourceGroupBackgroundTaskReport_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EntryPoint
   (
      This       : access IAppResourceGroupBackgroundTaskReport_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppResourceGroupMemoryReport : aliased constant Windows.IID := (747374257, 32177, 19537, (162, 37, 127, 174, 45, 73, 228, 49 ));
   
   type IAppResourceGroupMemoryReport_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CommitUsageLimit
   (
      This       : access IAppResourceGroupMemoryReport_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_CommitUsageLevel
   (
      This       : access IAppResourceGroupMemoryReport_Interface
      ; RetVal : access Windows.System.AppMemoryUsageLevel
   )
   return Windows.HRESULT is abstract;
   
   function get_PrivateCommitUsage
   (
      This       : access IAppResourceGroupMemoryReport_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_TotalCommitUsage
   (
      This       : access IAppResourceGroupMemoryReport_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppResourceGroupInfo : aliased constant Windows.IID := (3105093498, 59399, 18932, (132, 94, 123, 139, 220, 254, 142, 231 ));
   
   type IAppResourceGroupInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InstanceId
   (
      This       : access IAppResourceGroupInfo_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_IsShared
   (
      This       : access IAppResourceGroupInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetBackgroundTaskReports
   (
      This       : access IAppResourceGroupInfo_Interface
      ; RetVal : access Windows.System.IVector_IAppResourceGroupBackgroundTaskReport -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetMemoryReport
   (
      This       : access IAppResourceGroupInfo_Interface
      ; RetVal : access Windows.System.IAppResourceGroupMemoryReport
   )
   return Windows.HRESULT is abstract;
   
   function GetProcessDiagnosticInfos
   (
      This       : access IAppResourceGroupInfo_Interface
      ; RetVal : access Windows.System.Diagnostics.IVector_IProcessDiagnosticInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetStateReport
   (
      This       : access IAppResourceGroupInfo_Interface
      ; RetVal : access Windows.System.IAppResourceGroupStateReport
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppResourceGroupInfo2 : aliased constant Windows.IID := (4003144557, 54021, 19819, (146, 247, 106, 253, 173, 114, 222, 220 ));
   
   type IAppResourceGroupInfo2_Interface is interface and Windows.IInspectable_Interface;
   
   function StartSuspendAsync
   (
      This       : access IAppResourceGroupInfo2_Interface
      ; RetVal : access Windows.System.IAsyncOperation_IAppExecutionStateChangeResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function StartResumeAsync
   (
      This       : access IAppResourceGroupInfo2_Interface
      ; RetVal : access Windows.System.IAsyncOperation_IAppExecutionStateChangeResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function StartTerminateAsync
   (
      This       : access IAppResourceGroupInfo2_Interface
      ; RetVal : access Windows.System.IAsyncOperation_IAppExecutionStateChangeResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppResourceGroupInfoWatcherEventArgs : aliased constant Windows.IID := (2054714935, 25346, 19759, (191, 137, 28, 18, 208, 178, 166, 185 ));
   
   type IAppResourceGroupInfoWatcherEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppDiagnosticInfos
   (
      This       : access IAppResourceGroupInfoWatcherEventArgs_Interface
      ; RetVal : access Windows.System.IVectorView_IAppDiagnosticInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_AppResourceGroupInfo
   (
      This       : access IAppResourceGroupInfoWatcherEventArgs_Interface
      ; RetVal : access Windows.System.IAppResourceGroupInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs : aliased constant Windows.IID := (467398103, 65254, 20436, (152, 221, 233, 42, 44, 194, 153, 243 ));
   
   type IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppDiagnosticInfos
   (
      This       : access IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs_Interface
      ; RetVal : access Windows.System.IVectorView_IAppDiagnosticInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_AppResourceGroupInfo
   (
      This       : access IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs_Interface
      ; RetVal : access Windows.System.IAppResourceGroupInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppResourceGroupInfoWatcher : aliased constant Windows.IID := (3652231421, 28250, 19570, (139, 23, 9, 254, 196, 162, 18, 189 ));
   
   type IAppResourceGroupInfoWatcher_Interface is interface and Windows.IInspectable_Interface;
   
   function add_Added
   (
      This       : access IAppResourceGroupInfoWatcher_Interface
      ; handler : TypedEventHandler_IAppResourceGroupInfoWatcher_add_Added
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Added
   (
      This       : access IAppResourceGroupInfoWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Removed
   (
      This       : access IAppResourceGroupInfoWatcher_Interface
      ; handler : TypedEventHandler_IAppResourceGroupInfoWatcher_add_Removed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Removed
   (
      This       : access IAppResourceGroupInfoWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_EnumerationCompleted
   (
      This       : access IAppResourceGroupInfoWatcher_Interface
      ; handler : TypedEventHandler_IAppResourceGroupInfoWatcher_add_EnumerationCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_EnumerationCompleted
   (
      This       : access IAppResourceGroupInfoWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Stopped
   (
      This       : access IAppResourceGroupInfoWatcher_Interface
      ; handler : TypedEventHandler_IAppResourceGroupInfoWatcher_add_Stopped
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Stopped
   (
      This       : access IAppResourceGroupInfoWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ExecutionStateChanged
   (
      This       : access IAppResourceGroupInfoWatcher_Interface
      ; handler : TypedEventHandler_IAppResourceGroupInfoWatcher_add_ExecutionStateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ExecutionStateChanged
   (
      This       : access IAppResourceGroupInfoWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IAppResourceGroupInfoWatcher_Interface
      ; RetVal : access Windows.System.AppResourceGroupInfoWatcherStatus
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IAppResourceGroupInfoWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IAppResourceGroupInfoWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAppResourceGroupStateReport : aliased constant Windows.IID := (1384423192, 12144, 16950, (171, 64, 208, 77, 176, 199, 185, 49 ));
   
   type IAppResourceGroupStateReport_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExecutionState
   (
      This       : access IAppResourceGroupStateReport_Interface
      ; RetVal : access Windows.System.AppResourceGroupExecutionState
   )
   return Windows.HRESULT is abstract;
   
   function get_EnergyQuotaState
   (
      This       : access IAppResourceGroupStateReport_Interface
      ; RetVal : access Windows.System.AppResourceGroupEnergyQuotaState
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILaunchUriResult : aliased constant Windows.IID := (3962022111, 63189, 17866, (145, 58, 112, 164, 12, 92, 130, 33 ));
   
   type ILaunchUriResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access ILaunchUriResult_Interface
      ; RetVal : access Windows.System.LaunchUriStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Result
   (
      This       : access ILaunchUriResult_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILauncherUIOptions : aliased constant Windows.IID := (455465582, 35494, 16873, (130, 81, 65, 101, 245, 152, 95, 73 ));
   
   type ILauncherUIOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InvocationPoint
   (
      This       : access ILauncherUIOptions_Interface
      ; RetVal : access Windows.Foundation.IReference_Point -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_InvocationPoint
   (
      This       : access ILauncherUIOptions_Interface
      ; value : Windows.Foundation.IReference_Point
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectionRect
   (
      This       : access ILauncherUIOptions_Interface
      ; RetVal : access Windows.Foundation.IReference_Rect -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_SelectionRect
   (
      This       : access ILauncherUIOptions_Interface
      ; value : Windows.Foundation.IReference_Rect
   )
   return Windows.HRESULT is abstract;
   
   function get_PreferredPlacement
   (
      This       : access ILauncherUIOptions_Interface
      ; RetVal : access Windows.UI.Popups.Placement
   )
   return Windows.HRESULT is abstract;
   
   function put_PreferredPlacement
   (
      This       : access ILauncherUIOptions_Interface
      ; value : Windows.UI.Popups.Placement
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILauncherOptions : aliased constant Windows.IID := (3136954840, 45169, 19672, (133, 62, 52, 18, 3, 229, 87, 211 ));
   
   type ILauncherOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TreatAsUntrusted
   (
      This       : access ILauncherOptions_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_TreatAsUntrusted
   (
      This       : access ILauncherOptions_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayApplicationPicker
   (
      This       : access ILauncherOptions_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayApplicationPicker
   (
      This       : access ILauncherOptions_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_UI
   (
      This       : access ILauncherOptions_Interface
      ; RetVal : access Windows.System.ILauncherUIOptions
   )
   return Windows.HRESULT is abstract;
   
   function get_PreferredApplicationPackageFamilyName
   (
      This       : access ILauncherOptions_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_PreferredApplicationPackageFamilyName
   (
      This       : access ILauncherOptions_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PreferredApplicationDisplayName
   (
      This       : access ILauncherOptions_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_PreferredApplicationDisplayName
   (
      This       : access ILauncherOptions_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FallbackUri
   (
      This       : access ILauncherOptions_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_FallbackUri
   (
      This       : access ILauncherOptions_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentType
   (
      This       : access ILauncherOptions_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ContentType
   (
      This       : access ILauncherOptions_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILauncherOptions2 : aliased constant Windows.IID := (1000378036, 28224, 19918, (161, 163, 47, 83, 149, 10, 251, 73 ));
   
   type ILauncherOptions2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TargetApplicationPackageFamilyName
   (
      This       : access ILauncherOptions2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_TargetApplicationPackageFamilyName
   (
      This       : access ILauncherOptions2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NeighboringFilesQuery
   (
      This       : access ILauncherOptions2_Interface
      ; RetVal : access Windows.Storage.Search.IStorageFileQueryResult
   )
   return Windows.HRESULT is abstract;
   
   function put_NeighboringFilesQuery
   (
      This       : access ILauncherOptions2_Interface
      ; value : Windows.Storage.Search.IStorageFileQueryResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILauncherOptions3 : aliased constant Windows.IID := (4034332245, 19299, 20026, (145, 7, 78, 104, 120, 65, 146, 58 ));
   
   type ILauncherOptions3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IgnoreAppUriHandlers
   (
      This       : access ILauncherOptions3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IgnoreAppUriHandlers
   (
      This       : access ILauncherOptions3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILauncherOptions4 : aliased constant Windows.IID := (4017082638, 59131, 18452, (164, 78, 87, 232, 185, 217, 160, 27 ));
   
   type ILauncherOptions4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LimitPickerToCurrentAppAndAppUriHandlers
   (
      This       : access ILauncherOptions4_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_LimitPickerToCurrentAppAndAppUriHandlers
   (
      This       : access ILauncherOptions4_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILauncherViewOptions : aliased constant Windows.IID := (2325424625, 31911, 18910, (155, 211, 60, 91, 113, 132, 246, 22 ));
   
   type ILauncherViewOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DesiredRemainingView
   (
      This       : access ILauncherViewOptions_Interface
      ; RetVal : access Windows.UI.ViewManagement.ViewSizePreference
   )
   return Windows.HRESULT is abstract;
   
   function put_DesiredRemainingView
   (
      This       : access ILauncherViewOptions_Interface
      ; value : Windows.UI.ViewManagement.ViewSizePreference
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRemoteLauncherOptions : aliased constant Windows.IID := (2654611336, 10385, 19679, (162, 214, 157, 255, 125, 2, 230, 147 ));
   
   type IRemoteLauncherOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FallbackUri
   (
      This       : access IRemoteLauncherOptions_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_FallbackUri
   (
      This       : access IRemoteLauncherOptions_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_PreferredAppIds
   (
      This       : access IRemoteLauncherOptions_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFolderLauncherOptions : aliased constant Windows.IID := (3146891901, 27527, 17194, (189, 4, 119, 108, 111, 95, 178, 171 ));
   
   type IFolderLauncherOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ItemsToSelect
   (
      This       : access IFolderLauncherOptions_Interface
      ; RetVal : access Windows.Storage.IVector_IStorageItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILauncherStatics : aliased constant Windows.IID := (661737923, 40510, 17142, (145, 164, 93, 253, 235, 35, 36, 81 ));
   
   type ILauncherStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function LaunchFileAsync
   (
      This       : access ILauncherStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LaunchFileWithOptionsAsync
   (
      This       : access ILauncherStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; options : Windows.System.ILauncherOptions
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LaunchUriAsync
   (
      This       : access ILauncherStatics_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LaunchUriWithOptionsAsync
   (
      This       : access ILauncherStatics_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.System.ILauncherOptions
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILauncherStatics2 : aliased constant Windows.IID := (1505374139, 9419, 19458, (164, 196, 130, 148, 86, 157, 84, 241 ));
   
   type ILauncherStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function LaunchUriForResultsAsync
   (
      This       : access ILauncherStatics2_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.System.ILauncherOptions
      ; RetVal : access Windows.System.IAsyncOperation_ILaunchUriResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LaunchUriForResultsWithDataAsync
   (
      This       : access ILauncherStatics2_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.System.ILauncherOptions
      ; inputData : Windows.Foundation.Collections.IPropertySet
      ; RetVal : access Windows.System.IAsyncOperation_ILaunchUriResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LaunchUriWithDataAsync
   (
      This       : access ILauncherStatics2_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.System.ILauncherOptions
      ; inputData : Windows.Foundation.Collections.IPropertySet
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function QueryUriSupportAsync
   (
      This       : access ILauncherStatics2_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; launchQuerySupportType : Windows.System.LaunchQuerySupportType
      ; RetVal : access Windows.System.IAsyncOperation_LaunchQuerySupportStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function QueryUriSupportWithPackageFamilyNameAsync
   (
      This       : access ILauncherStatics2_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; launchQuerySupportType : Windows.System.LaunchQuerySupportType
      ; packageFamilyName : Windows.String
      ; RetVal : access Windows.System.IAsyncOperation_LaunchQuerySupportStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function QueryFileSupportAsync
   (
      This       : access ILauncherStatics2_Interface
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.System.IAsyncOperation_LaunchQuerySupportStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function QueryFileSupportWithPackageFamilyNameAsync
   (
      This       : access ILauncherStatics2_Interface
      ; file : Windows.Storage.IStorageFile
      ; packageFamilyName : Windows.String
      ; RetVal : access Windows.System.IAsyncOperation_LaunchQuerySupportStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindUriSchemeHandlersAsync
   (
      This       : access ILauncherStatics2_Interface
      ; scheme : Windows.String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindUriSchemeHandlersWithLaunchUriTypeAsync
   (
      This       : access ILauncherStatics2_Interface
      ; scheme : Windows.String
      ; launchQuerySupportType : Windows.System.LaunchQuerySupportType
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindFileHandlersAsync
   (
      This       : access ILauncherStatics2_Interface
      ; extension : Windows.String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILauncherStatics3 : aliased constant Windows.IID := (591552936, 40371, 18051, (170, 66, 220, 111, 81, 211, 56, 71 ));
   
   type ILauncherStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function LaunchFolderAsync
   (
      This       : access ILauncherStatics3_Interface
      ; folder : Windows.Storage.IStorageFolder
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LaunchFolderWithOptionsAsync
   (
      This       : access ILauncherStatics3_Interface
      ; folder : Windows.Storage.IStorageFolder
      ; options : Windows.System.IFolderLauncherOptions
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILauncherStatics4 : aliased constant Windows.IID := (3119284639, 46501, 16838, (179, 179, 221, 27, 49, 120, 188, 242 ));
   
   type ILauncherStatics4_Interface is interface and Windows.IInspectable_Interface;
   
   function QueryAppUriSupportAsync
   (
      This       : access ILauncherStatics4_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.System.IAsyncOperation_LaunchQuerySupportStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function QueryAppUriSupportWithPackageFamilyNameAsync
   (
      This       : access ILauncherStatics4_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; packageFamilyName : Windows.String
      ; RetVal : access Windows.System.IAsyncOperation_LaunchQuerySupportStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAppUriHandlersAsync
   (
      This       : access ILauncherStatics4_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LaunchUriForUserAsync
   (
      This       : access ILauncherStatics4_Interface
      ; user : Windows.System.IUser
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.System.IAsyncOperation_LaunchUriStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LaunchUriWithOptionsForUserAsync
   (
      This       : access ILauncherStatics4_Interface
      ; user : Windows.System.IUser
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.System.ILauncherOptions
      ; RetVal : access Windows.System.IAsyncOperation_LaunchUriStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LaunchUriWithDataForUserAsync
   (
      This       : access ILauncherStatics4_Interface
      ; user : Windows.System.IUser
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.System.ILauncherOptions
      ; inputData : Windows.Foundation.Collections.IPropertySet
      ; RetVal : access Windows.System.IAsyncOperation_LaunchUriStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LaunchUriForResultsForUserAsync
   (
      This       : access ILauncherStatics4_Interface
      ; user : Windows.System.IUser
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.System.ILauncherOptions
      ; RetVal : access Windows.System.IAsyncOperation_ILaunchUriResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LaunchUriForResultsWithDataForUserAsync
   (
      This       : access ILauncherStatics4_Interface
      ; user : Windows.System.IUser
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.System.ILauncherOptions
      ; inputData : Windows.Foundation.Collections.IPropertySet
      ; RetVal : access Windows.System.IAsyncOperation_ILaunchUriResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRemoteLauncherStatics : aliased constant Windows.IID := (3621485203, 41740, 18615, (159, 33, 5, 16, 38, 164, 229, 23 ));
   
   type IRemoteLauncherStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function LaunchUriAsync
   (
      This       : access IRemoteLauncherStatics_Interface
      ; remoteSystemConnectionRequest : Windows.System.RemoteSystems.IRemoteSystemConnectionRequest
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.System.IAsyncOperation_RemoteLaunchUriStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LaunchUriWithOptionsAsync
   (
      This       : access IRemoteLauncherStatics_Interface
      ; remoteSystemConnectionRequest : Windows.System.RemoteSystems.IRemoteSystemConnectionRequest
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.System.IRemoteLauncherOptions
      ; RetVal : access Windows.System.IAsyncOperation_RemoteLaunchUriStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LaunchUriWithDataAsync
   (
      This       : access IRemoteLauncherStatics_Interface
      ; remoteSystemConnectionRequest : Windows.System.RemoteSystems.IRemoteSystemConnectionRequest
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.System.IRemoteLauncherOptions
      ; inputData : Windows.Foundation.Collections.IPropertySet
      ; RetVal : access Windows.System.IAsyncOperation_RemoteLaunchUriStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDateTimeSettingsStatics : aliased constant Windows.IID := (1562464465, 18414, 18603, (165, 43, 159, 25, 84, 39, 141, 130 ));
   
   type IDateTimeSettingsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function SetSystemDateTime
   (
      This       : access IDateTimeSettingsStatics_Interface
      ; utcDateTime : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProcessLauncherOptions : aliased constant Windows.IID := (813742543, 62532, 19075, (190, 175, 165, 73, 160, 243, 34, 156 ));
   
   type IProcessLauncherOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StandardInput
   (
      This       : access IProcessLauncherOptions_Interface
      ; RetVal : access Windows.Storage.Streams.IInputStream
   )
   return Windows.HRESULT is abstract;
   
   function put_StandardInput
   (
      This       : access IProcessLauncherOptions_Interface
      ; value : Windows.Storage.Streams.IInputStream
   )
   return Windows.HRESULT is abstract;
   
   function get_StandardOutput
   (
      This       : access IProcessLauncherOptions_Interface
      ; RetVal : access Windows.Storage.Streams.IOutputStream
   )
   return Windows.HRESULT is abstract;
   
   function put_StandardOutput
   (
      This       : access IProcessLauncherOptions_Interface
      ; value : Windows.Storage.Streams.IOutputStream
   )
   return Windows.HRESULT is abstract;
   
   function get_StandardError
   (
      This       : access IProcessLauncherOptions_Interface
      ; RetVal : access Windows.Storage.Streams.IOutputStream
   )
   return Windows.HRESULT is abstract;
   
   function put_StandardError
   (
      This       : access IProcessLauncherOptions_Interface
      ; value : Windows.Storage.Streams.IOutputStream
   )
   return Windows.HRESULT is abstract;
   
   function get_WorkingDirectory
   (
      This       : access IProcessLauncherOptions_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_WorkingDirectory
   (
      This       : access IProcessLauncherOptions_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProcessLauncherStatics : aliased constant Windows.IID := (866871015, 11534, 17547, (166, 160, 193, 60, 56, 54, 208, 156 ));
   
   type IProcessLauncherStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function RunToCompletionAsync
   (
      This       : access IProcessLauncherStatics_Interface
      ; fileName : Windows.String
      ; args : Windows.String
      ; RetVal : access Windows.System.IAsyncOperation_IProcessLauncherResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RunToCompletionAsyncWithOptions
   (
      This       : access IProcessLauncherStatics_Interface
      ; fileName : Windows.String
      ; args : Windows.String
      ; options : Windows.System.IProcessLauncherOptions
      ; RetVal : access Windows.System.IAsyncOperation_IProcessLauncherResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProcessLauncherResult : aliased constant Windows.IID := (1414302004, 34520, 18833, (142, 117, 236, 232, 164, 59, 107, 109 ));
   
   type IProcessLauncherResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExitCode
   (
      This       : access IProcessLauncherResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IShutdownManagerStatics : aliased constant Windows.IID := (1927432173, 56667, 19820, (177, 208, 197, 122, 123, 187, 95, 148 ));
   
   type IShutdownManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function BeginShutdown
   (
      This       : access IShutdownManagerStatics_Interface
      ; shutdownKind : Windows.System.ShutdownKind
      ; timeout : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function CancelShutdown
   (
      This       : access IShutdownManagerStatics_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IShutdownManagerStatics2 : aliased constant Windows.IID := (258580527, 39988, 17351, (168, 195, 112, 179, 10, 127, 117, 4 ));
   
   type IShutdownManagerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function IsPowerStateSupported
   (
      This       : access IShutdownManagerStatics2_Interface
      ; powerState : Windows.System.PowerState
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function EnterPowerState
   (
      This       : access IShutdownManagerStatics2_Interface
      ; powerState : Windows.System.PowerState
   )
   return Windows.HRESULT is abstract;
   
   function EnterPowerStateWithTimeSpan
   (
      This       : access IShutdownManagerStatics2_Interface
      ; powerState : Windows.System.PowerState
      ; wakeUpAfter : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITimeZoneSettingsStatics : aliased constant Windows.IID := (2604346346, 41217, 16814, (159, 189, 2, 135, 40, 186, 183, 61 ));
   
   type ITimeZoneSettingsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CurrentTimeZoneDisplayName
   (
      This       : access ITimeZoneSettingsStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedTimeZoneDisplayNames
   (
      This       : access ITimeZoneSettingsStatics_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_CanChangeTimeZone
   (
      This       : access ITimeZoneSettingsStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function ChangeTimeZoneByDisplayName
   (
      This       : access ITimeZoneSettingsStatics_Interface
      ; timeZoneDisplayName : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITimeZoneSettingsStatics2 : aliased constant Windows.IID := (1432096184, 14760, 18938, (180, 246, 162, 199, 252, 40, 66, 236 ));
   
   type ITimeZoneSettingsStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function AutoUpdateTimeZoneAsync
   (
      This       : access ITimeZoneSettingsStatics2_Interface
      ; timeout : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.System.IAsyncOperation_AutoUpdateTimeZoneStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IUser : aliased constant Windows.IID := (2828391161, 9113, 20740, (165, 50, 91, 164, 74, 180, 177, 101 ));
   
   type IAsyncOperation_IUser_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IUser_Interface
      ; handler : Windows.System.AsyncOperationCompletedHandler_IUser
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IUser_Interface
      ; RetVal : access Windows.System.AsyncOperationCompletedHandler_IUser
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IUser_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IAppDiagnosticInfo : aliased constant Windows.IID := (406789706, 8740, 24548, (176, 100, 104, 134, 156, 83, 227, 97 ));
   
   type IIterator_IAppDiagnosticInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IAppDiagnosticInfo_Interface
      ; RetVal : access Windows.System.IAppDiagnosticInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IAppDiagnosticInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IAppDiagnosticInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IAppDiagnosticInfo_Interface
      ; items : Windows.System.IAppDiagnosticInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IAppDiagnosticInfo : aliased constant Windows.IID := (2165890703, 15075, 21985, (128, 168, 37, 69, 60, 219, 168, 148 ));
   
   type IIterable_IAppDiagnosticInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IAppDiagnosticInfo_Interface
      ; RetVal : access Windows.System.IIterator_IAppDiagnosticInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IAppDiagnosticInfo : aliased constant Windows.IID := (2965555108, 30906, 20733, (132, 254, 0, 224, 42, 108, 29, 66 ));
   
   type IVectorView_IAppDiagnosticInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IAppDiagnosticInfo_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.System.IAppDiagnosticInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IAppDiagnosticInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IAppDiagnosticInfo_Interface
      ; value : Windows.System.IAppDiagnosticInfo
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IAppDiagnosticInfo_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.System.IAppDiagnosticInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IAppDiagnosticInfo : aliased constant Windows.IID := (2633999043, 32491, 22940, (185, 77, 199, 148, 177, 31, 128, 127 ));
   
   type IVector_IAppDiagnosticInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IAppDiagnosticInfo_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.System.IAppDiagnosticInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IAppDiagnosticInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IAppDiagnosticInfo_Interface
      ; RetVal : access Windows.System.IVectorView_IAppDiagnosticInfo
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IAppDiagnosticInfo_Interface
      ; value : Windows.System.IAppDiagnosticInfo
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IAppDiagnosticInfo_Interface
      ; index : Windows.UInt32
      ; value : Windows.System.IAppDiagnosticInfo
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IAppDiagnosticInfo_Interface
      ; index : Windows.UInt32
      ; value : Windows.System.IAppDiagnosticInfo
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IAppDiagnosticInfo_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IAppDiagnosticInfo_Interface
      ; value : Windows.System.IAppDiagnosticInfo
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IAppDiagnosticInfo_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IAppDiagnosticInfo_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IAppDiagnosticInfo_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.System.IAppDiagnosticInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IAppDiagnosticInfo_Interface
      ; items : Windows.System.IAppDiagnosticInfo_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_DiagnosticAccessStatus : aliased constant Windows.IID := (1640045502, 9752, 22666, (167, 202, 246, 6, 145, 39, 35, 36 ));
   
   type IAsyncOperation_DiagnosticAccessStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_DiagnosticAccessStatus_Interface
      ; handler : Windows.System.AsyncOperationCompletedHandler_DiagnosticAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_DiagnosticAccessStatus_Interface
      ; RetVal : access Windows.System.AsyncOperationCompletedHandler_DiagnosticAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_DiagnosticAccessStatus_Interface
      ; RetVal : access Windows.System.DiagnosticAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IAppResourceGroupInfo : aliased constant Windows.IID := (3830274129, 58556, 20665, (168, 152, 105, 3, 19, 125, 138, 153 ));
   
   type IIterator_IAppResourceGroupInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IAppResourceGroupInfo_Interface
      ; RetVal : access Windows.System.IAppResourceGroupInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IAppResourceGroupInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IAppResourceGroupInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IAppResourceGroupInfo_Interface
      ; items : Windows.System.IAppResourceGroupInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IAppResourceGroupInfo : aliased constant Windows.IID := (2338589000, 49363, 23422, (169, 156, 89, 86, 25, 13, 84, 8 ));
   
   type IIterable_IAppResourceGroupInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IAppResourceGroupInfo_Interface
      ; RetVal : access Windows.System.IIterator_IAppResourceGroupInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IAppResourceGroupInfo : aliased constant Windows.IID := (75499420, 64771, 23011, (171, 163, 150, 249, 249, 32, 96, 112 ));
   
   type IVectorView_IAppResourceGroupInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IAppResourceGroupInfo_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.System.IAppResourceGroupInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IAppResourceGroupInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IAppResourceGroupInfo_Interface
      ; value : Windows.System.IAppResourceGroupInfo
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IAppResourceGroupInfo_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.System.IAppResourceGroupInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IAppResourceGroupInfo : aliased constant Windows.IID := (3179112864, 3415, 20808, (139, 35, 73, 160, 134, 84, 240, 199 ));
   
   type IVector_IAppResourceGroupInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IAppResourceGroupInfo_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.System.IAppResourceGroupInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IAppResourceGroupInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IAppResourceGroupInfo_Interface
      ; RetVal : access Windows.System.IVectorView_IAppResourceGroupInfo
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IAppResourceGroupInfo_Interface
      ; value : Windows.System.IAppResourceGroupInfo
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IAppResourceGroupInfo_Interface
      ; index : Windows.UInt32
      ; value : Windows.System.IAppResourceGroupInfo
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IAppResourceGroupInfo_Interface
      ; index : Windows.UInt32
      ; value : Windows.System.IAppResourceGroupInfo
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IAppResourceGroupInfo_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IAppResourceGroupInfo_Interface
      ; value : Windows.System.IAppResourceGroupInfo
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IAppResourceGroupInfo_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IAppResourceGroupInfo_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IAppResourceGroupInfo_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.System.IAppResourceGroupInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IAppResourceGroupInfo_Interface
      ; items : Windows.System.IAppResourceGroupInfo_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IAppActivationResult : aliased constant Windows.IID := (3069408184, 48461, 20671, (130, 180, 91, 29, 69, 42, 95, 131 ));
   
   type IAsyncOperation_IAppActivationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IAppActivationResult_Interface
      ; handler : Windows.System.AsyncOperationCompletedHandler_IAppActivationResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IAppActivationResult_Interface
      ; RetVal : access Windows.System.AsyncOperationCompletedHandler_IAppActivationResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IAppActivationResult_Interface
      ; RetVal : access Windows.System.IAppActivationResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IAppResourceGroupBackgroundTaskReport : aliased constant Windows.IID := (12720138, 2277, 24301, (160, 141, 86, 163, 86, 204, 0, 79 ));
   
   type IIterator_IAppResourceGroupBackgroundTaskReport_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IAppResourceGroupBackgroundTaskReport_Interface
      ; RetVal : access Windows.System.IAppResourceGroupBackgroundTaskReport
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IAppResourceGroupBackgroundTaskReport_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IAppResourceGroupBackgroundTaskReport_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IAppResourceGroupBackgroundTaskReport_Interface
      ; items : Windows.System.IAppResourceGroupBackgroundTaskReport_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IAppResourceGroupBackgroundTaskReport : aliased constant Windows.IID := (1048431562, 6148, 22130, (173, 59, 88, 217, 68, 187, 4, 76 ));
   
   type IIterable_IAppResourceGroupBackgroundTaskReport_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IAppResourceGroupBackgroundTaskReport_Interface
      ; RetVal : access Windows.System.IIterator_IAppResourceGroupBackgroundTaskReport
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IAppResourceGroupBackgroundTaskReport : aliased constant Windows.IID := (1318157731, 17835, 20931, (185, 225, 231, 212, 231, 161, 180, 229 ));
   
   type IVectorView_IAppResourceGroupBackgroundTaskReport_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IAppResourceGroupBackgroundTaskReport_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.System.IAppResourceGroupBackgroundTaskReport
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IAppResourceGroupBackgroundTaskReport_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IAppResourceGroupBackgroundTaskReport_Interface
      ; value : Windows.System.IAppResourceGroupBackgroundTaskReport
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IAppResourceGroupBackgroundTaskReport_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.System.IAppResourceGroupBackgroundTaskReport_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IAppResourceGroupBackgroundTaskReport : aliased constant Windows.IID := (2163311114, 56066, 23730, (161, 40, 81, 114, 21, 29, 20, 68 ));
   
   type IVector_IAppResourceGroupBackgroundTaskReport_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IAppResourceGroupBackgroundTaskReport_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.System.IAppResourceGroupBackgroundTaskReport
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IAppResourceGroupBackgroundTaskReport_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IAppResourceGroupBackgroundTaskReport_Interface
      ; RetVal : access Windows.System.IVectorView_IAppResourceGroupBackgroundTaskReport
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IAppResourceGroupBackgroundTaskReport_Interface
      ; value : Windows.System.IAppResourceGroupBackgroundTaskReport
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IAppResourceGroupBackgroundTaskReport_Interface
      ; index : Windows.UInt32
      ; value : Windows.System.IAppResourceGroupBackgroundTaskReport
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IAppResourceGroupBackgroundTaskReport_Interface
      ; index : Windows.UInt32
      ; value : Windows.System.IAppResourceGroupBackgroundTaskReport
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IAppResourceGroupBackgroundTaskReport_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IAppResourceGroupBackgroundTaskReport_Interface
      ; value : Windows.System.IAppResourceGroupBackgroundTaskReport
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IAppResourceGroupBackgroundTaskReport_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IAppResourceGroupBackgroundTaskReport_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IAppResourceGroupBackgroundTaskReport_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.System.IAppResourceGroupBackgroundTaskReport_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IAppResourceGroupBackgroundTaskReport_Interface
      ; items : Windows.System.IAppResourceGroupBackgroundTaskReport_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IAppExecutionStateChangeResult : aliased constant Windows.IID := (3260140578, 43945, 22968, (191, 135, 32, 103, 127, 196, 146, 78 ));
   
   type IAsyncOperation_IAppExecutionStateChangeResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IAppExecutionStateChangeResult_Interface
      ; handler : Windows.System.AsyncOperationCompletedHandler_IAppExecutionStateChangeResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IAppExecutionStateChangeResult_Interface
      ; RetVal : access Windows.System.AsyncOperationCompletedHandler_IAppExecutionStateChangeResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IAppExecutionStateChangeResult_Interface
      ; RetVal : access Windows.System.IAppExecutionStateChangeResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ILaunchUriResult : aliased constant Windows.IID := (2140666901, 7382, 21687, (162, 144, 172, 182, 13, 186, 129, 161 ));
   
   type IAsyncOperation_ILaunchUriResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ILaunchUriResult_Interface
      ; handler : Windows.System.AsyncOperationCompletedHandler_ILaunchUriResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ILaunchUriResult_Interface
      ; RetVal : access Windows.System.AsyncOperationCompletedHandler_ILaunchUriResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ILaunchUriResult_Interface
      ; RetVal : access Windows.System.ILaunchUriResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_LaunchQuerySupportStatus : aliased constant Windows.IID := (3881015698, 8736, 23853, (130, 196, 61, 68, 248, 117, 13, 145 ));
   
   type IAsyncOperation_LaunchQuerySupportStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_LaunchQuerySupportStatus_Interface
      ; handler : Windows.System.AsyncOperationCompletedHandler_LaunchQuerySupportStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_LaunchQuerySupportStatus_Interface
      ; RetVal : access Windows.System.AsyncOperationCompletedHandler_LaunchQuerySupportStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_LaunchQuerySupportStatus_Interface
      ; RetVal : access Windows.System.LaunchQuerySupportStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_LaunchUriStatus : aliased constant Windows.IID := (2872930843, 42227, 22625, (176, 52, 3, 11, 21, 35, 60, 82 ));
   
   type IAsyncOperation_LaunchUriStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_LaunchUriStatus_Interface
      ; handler : Windows.System.AsyncOperationCompletedHandler_LaunchUriStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_LaunchUriStatus_Interface
      ; RetVal : access Windows.System.AsyncOperationCompletedHandler_LaunchUriStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_LaunchUriStatus_Interface
      ; RetVal : access Windows.System.LaunchUriStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_RemoteLaunchUriStatus : aliased constant Windows.IID := (3144738253, 25282, 24440, (172, 141, 244, 185, 115, 152, 29, 164 ));
   
   type IAsyncOperation_RemoteLaunchUriStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_RemoteLaunchUriStatus_Interface
      ; handler : Windows.System.AsyncOperationCompletedHandler_RemoteLaunchUriStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_RemoteLaunchUriStatus_Interface
      ; RetVal : access Windows.System.AsyncOperationCompletedHandler_RemoteLaunchUriStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_RemoteLaunchUriStatus_Interface
      ; RetVal : access Windows.System.RemoteLaunchUriStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IProcessLauncherResult : aliased constant Windows.IID := (3867308608, 31373, 20926, (141, 33, 224, 147, 38, 140, 204, 21 ));
   
   type IAsyncOperation_IProcessLauncherResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IProcessLauncherResult_Interface
      ; handler : Windows.System.AsyncOperationCompletedHandler_IProcessLauncherResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IProcessLauncherResult_Interface
      ; RetVal : access Windows.System.AsyncOperationCompletedHandler_IProcessLauncherResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IProcessLauncherResult_Interface
      ; RetVal : access Windows.System.IProcessLauncherResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_AutoUpdateTimeZoneStatus : aliased constant Windows.IID := (3063182764, 42452, 21463, (165, 58, 187, 1, 182, 150, 32, 250 ));
   
   type IAsyncOperation_AutoUpdateTimeZoneStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_AutoUpdateTimeZoneStatus_Interface
      ; handler : Windows.System.AsyncOperationCompletedHandler_AutoUpdateTimeZoneStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_AutoUpdateTimeZoneStatus_Interface
      ; RetVal : access Windows.System.AsyncOperationCompletedHandler_AutoUpdateTimeZoneStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_AutoUpdateTimeZoneStatus_Interface
      ; RetVal : access Windows.System.AutoUpdateTimeZoneStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_DispatcherQueueHandler : aliased constant Windows.IID := (3751992476, 6701, 18711, (152, 242, 147, 154, 241, 214, 224, 200 ));
   
   type DispatcherQueueHandler_Interface(Callback : access procedure) is new Windows.IMulticastDelegate_Interface(IID_DispatcherQueueHandler'access) with null record;
   function Invoke
   (
      This       : access DispatcherQueueHandler_Interface
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDispatcherQueue_add_ShutdownStarting : aliased constant Windows.IID := (3045809700, 57798, 21134, (157, 153, 7, 236, 136, 41, 222, 165 ));
   
   type TypedEventHandler_IDispatcherQueue_add_ShutdownStarting_Interface(Callback : access procedure (sender : Windows.System.IDispatcherQueue ; args : Windows.System.IDispatcherQueueShutdownStartingEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDispatcherQueue_add_ShutdownStarting'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IDispatcherQueue_add_ShutdownStarting_Interface
      ; sender : Windows.System.IDispatcherQueue
      ; args : Windows.System.IDispatcherQueueShutdownStartingEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDispatcherQueue_add_ShutdownCompleted : aliased constant Windows.IID := (4269406293, 12096, 23432, (160, 195, 76, 4, 42, 5, 221, 5 ));
   
   type TypedEventHandler_IDispatcherQueue_add_ShutdownCompleted_Interface(Callback : access procedure (sender : Windows.System.IDispatcherQueue ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDispatcherQueue_add_ShutdownCompleted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IDispatcherQueue_add_ShutdownCompleted_Interface
      ; sender : Windows.System.IDispatcherQueue
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDispatcherQueueTimer_add_Tick : aliased constant Windows.IID := (2337686728, 35671, 20686, (137, 51, 122, 178, 204, 90, 20, 239 ));
   
   type TypedEventHandler_IDispatcherQueueTimer_add_Tick_Interface(Callback : access procedure (sender : Windows.System.IDispatcherQueueTimer ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDispatcherQueueTimer_add_Tick'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IDispatcherQueueTimer_add_Tick_Interface
      ; sender : Windows.System.IDispatcherQueueTimer
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IUserWatcher_add_Added : aliased constant Windows.IID := (3952936020, 9691, 22048, (152, 184, 190, 76, 93, 13, 188, 103 ));
   
   type TypedEventHandler_IUserWatcher_add_Added_Interface(Callback : access procedure (sender : Windows.System.IUserWatcher ; args : Windows.System.IUserChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IUserWatcher_add_Added'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IUserWatcher_add_Added_Interface
      ; sender : Windows.System.IUserWatcher
      ; args : Windows.System.IUserChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IUserWatcher_add_Removed : aliased constant Windows.IID := (3952936020, 9691, 22048, (152, 184, 190, 76, 93, 13, 188, 103 ));
   
   type TypedEventHandler_IUserWatcher_add_Removed_Interface(Callback : access procedure (sender : Windows.System.IUserWatcher ; args : Windows.System.IUserChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IUserWatcher_add_Removed'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IUserWatcher_add_Removed_Interface
      ; sender : Windows.System.IUserWatcher
      ; args : Windows.System.IUserChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IUserWatcher_add_Updated : aliased constant Windows.IID := (3952936020, 9691, 22048, (152, 184, 190, 76, 93, 13, 188, 103 ));
   
   type TypedEventHandler_IUserWatcher_add_Updated_Interface(Callback : access procedure (sender : Windows.System.IUserWatcher ; args : Windows.System.IUserChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IUserWatcher_add_Updated'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IUserWatcher_add_Updated_Interface
      ; sender : Windows.System.IUserWatcher
      ; args : Windows.System.IUserChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IUserWatcher_add_AuthenticationStatusChanged : aliased constant Windows.IID := (3952936020, 9691, 22048, (152, 184, 190, 76, 93, 13, 188, 103 ));
   
   type TypedEventHandler_IUserWatcher_add_AuthenticationStatusChanged_Interface(Callback : access procedure (sender : Windows.System.IUserWatcher ; args : Windows.System.IUserChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IUserWatcher_add_AuthenticationStatusChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IUserWatcher_add_AuthenticationStatusChanged_Interface
      ; sender : Windows.System.IUserWatcher
      ; args : Windows.System.IUserChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IUserWatcher_add_AuthenticationStatusChanging : aliased constant Windows.IID := (2663635413, 46099, 20959, (140, 100, 100, 14, 51, 86, 227, 81 ));
   
   type TypedEventHandler_IUserWatcher_add_AuthenticationStatusChanging_Interface(Callback : access procedure (sender : Windows.System.IUserWatcher ; args : Windows.System.IUserAuthenticationStatusChangingEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IUserWatcher_add_AuthenticationStatusChanging'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IUserWatcher_add_AuthenticationStatusChanging_Interface
      ; sender : Windows.System.IUserWatcher
      ; args : Windows.System.IUserAuthenticationStatusChangingEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IUserWatcher_add_EnumerationCompleted : aliased constant Windows.IID := (4048937215, 56245, 23604, (172, 12, 126, 41, 30, 51, 0, 171 ));
   
   type TypedEventHandler_IUserWatcher_add_EnumerationCompleted_Interface(Callback : access procedure (sender : Windows.System.IUserWatcher ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IUserWatcher_add_EnumerationCompleted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IUserWatcher_add_EnumerationCompleted_Interface
      ; sender : Windows.System.IUserWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IUserWatcher_add_Stopped : aliased constant Windows.IID := (4048937215, 56245, 23604, (172, 12, 126, 41, 30, 51, 0, 171 ));
   
   type TypedEventHandler_IUserWatcher_add_Stopped_Interface(Callback : access procedure (sender : Windows.System.IUserWatcher ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IUserWatcher_add_Stopped'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IUserWatcher_add_Stopped_Interface
      ; sender : Windows.System.IUserWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IUser : aliased constant Windows.IID := (4178830242, 53701, 21256, (190, 207, 76, 45, 129, 103, 130, 74 ));
   
   type AsyncOperationCompletedHandler_IUser_Interface(Callback : access procedure (asyncInfo : Windows.System.IAsyncOperation_IUser ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IUser'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IUser_Interface
      ; asyncInfo : Windows.System.IAsyncOperation_IUser
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_EventHandler_IUserDeviceAssociationChangedEventArgs : aliased constant Windows.IID := (3550729413, 55478, 23054, (136, 237, 165, 73, 156, 55, 123, 227 ));
   
   type EventHandler_IUserDeviceAssociationChangedEventArgs_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.System.IUserDeviceAssociationChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_EventHandler_IUserDeviceAssociationChangedEventArgs'access) with null record;
   function Invoke
   (
      This       : access EventHandler_IUserDeviceAssociationChangedEventArgs_Interface
      ; sender : Windows.Object
      ; args : Windows.System.IUserDeviceAssociationChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_EventHandler_IAppMemoryUsageLimitChangingEventArgs : aliased constant Windows.IID := (1613817795, 63807, 24220, (155, 162, 154, 1, 141, 43, 9, 192 ));
   
   type EventHandler_IAppMemoryUsageLimitChangingEventArgs_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.System.IAppMemoryUsageLimitChangingEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_EventHandler_IAppMemoryUsageLimitChangingEventArgs'access) with null record;
   function Invoke
   (
      This       : access EventHandler_IAppMemoryUsageLimitChangingEventArgs_Interface
      ; sender : Windows.Object
      ; args : Windows.System.IAppMemoryUsageLimitChangingEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_DiagnosticAccessStatus : aliased constant Windows.IID := (1561526999, 21655, 23186, (191, 67, 235, 139, 80, 103, 154, 171 ));
   
   type AsyncOperationCompletedHandler_DiagnosticAccessStatus_Interface(Callback : access procedure (asyncInfo : Windows.System.IAsyncOperation_DiagnosticAccessStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_DiagnosticAccessStatus'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_DiagnosticAccessStatus_Interface
      ; asyncInfo : Windows.System.IAsyncOperation_DiagnosticAccessStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IAppActivationResult : aliased constant Windows.IID := (2523800327, 54569, 20714, (152, 114, 141, 251, 53, 207, 239, 253 ));
   
   type AsyncOperationCompletedHandler_IAppActivationResult_Interface(Callback : access procedure (asyncInfo : Windows.System.IAsyncOperation_IAppActivationResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IAppActivationResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IAppActivationResult_Interface
      ; asyncInfo : Windows.System.IAsyncOperation_IAppActivationResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppDiagnosticInfoWatcher_add_Added : aliased constant Windows.IID := (2089578399, 54975, 21862, (176, 19, 57, 193, 65, 224, 255, 140 ));
   
   type TypedEventHandler_IAppDiagnosticInfoWatcher_add_Added_Interface(Callback : access procedure (sender : Windows.System.IAppDiagnosticInfoWatcher ; args : Windows.System.IAppDiagnosticInfoWatcherEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppDiagnosticInfoWatcher_add_Added'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAppDiagnosticInfoWatcher_add_Added_Interface
      ; sender : Windows.System.IAppDiagnosticInfoWatcher
      ; args : Windows.System.IAppDiagnosticInfoWatcherEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppDiagnosticInfoWatcher_add_Removed : aliased constant Windows.IID := (2089578399, 54975, 21862, (176, 19, 57, 193, 65, 224, 255, 140 ));
   
   type TypedEventHandler_IAppDiagnosticInfoWatcher_add_Removed_Interface(Callback : access procedure (sender : Windows.System.IAppDiagnosticInfoWatcher ; args : Windows.System.IAppDiagnosticInfoWatcherEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppDiagnosticInfoWatcher_add_Removed'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAppDiagnosticInfoWatcher_add_Removed_Interface
      ; sender : Windows.System.IAppDiagnosticInfoWatcher
      ; args : Windows.System.IAppDiagnosticInfoWatcherEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppDiagnosticInfoWatcher_add_EnumerationCompleted : aliased constant Windows.IID := (2304634415, 57586, 21252, (164, 14, 28, 103, 162, 192, 88, 170 ));
   
   type TypedEventHandler_IAppDiagnosticInfoWatcher_add_EnumerationCompleted_Interface(Callback : access procedure (sender : Windows.System.IAppDiagnosticInfoWatcher ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppDiagnosticInfoWatcher_add_EnumerationCompleted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAppDiagnosticInfoWatcher_add_EnumerationCompleted_Interface
      ; sender : Windows.System.IAppDiagnosticInfoWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppDiagnosticInfoWatcher_add_Stopped : aliased constant Windows.IID := (2304634415, 57586, 21252, (164, 14, 28, 103, 162, 192, 88, 170 ));
   
   type TypedEventHandler_IAppDiagnosticInfoWatcher_add_Stopped_Interface(Callback : access procedure (sender : Windows.System.IAppDiagnosticInfoWatcher ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppDiagnosticInfoWatcher_add_Stopped'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAppDiagnosticInfoWatcher_add_Stopped_Interface
      ; sender : Windows.System.IAppDiagnosticInfoWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IAppExecutionStateChangeResult : aliased constant Windows.IID := (3244471706, 48594, 24141, (163, 9, 180, 118, 235, 151, 184, 35 ));
   
   type AsyncOperationCompletedHandler_IAppExecutionStateChangeResult_Interface(Callback : access procedure (asyncInfo : Windows.System.IAsyncOperation_IAppExecutionStateChangeResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IAppExecutionStateChangeResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IAppExecutionStateChangeResult_Interface
      ; asyncInfo : Windows.System.IAsyncOperation_IAppExecutionStateChangeResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppResourceGroupInfoWatcher_add_Added : aliased constant Windows.IID := (2816560046, 51064, 22113, (164, 28, 26, 195, 172, 99, 95, 121 ));
   
   type TypedEventHandler_IAppResourceGroupInfoWatcher_add_Added_Interface(Callback : access procedure (sender : Windows.System.IAppResourceGroupInfoWatcher ; args : Windows.System.IAppResourceGroupInfoWatcherEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppResourceGroupInfoWatcher_add_Added'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAppResourceGroupInfoWatcher_add_Added_Interface
      ; sender : Windows.System.IAppResourceGroupInfoWatcher
      ; args : Windows.System.IAppResourceGroupInfoWatcherEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppResourceGroupInfoWatcher_add_Removed : aliased constant Windows.IID := (2816560046, 51064, 22113, (164, 28, 26, 195, 172, 99, 95, 121 ));
   
   type TypedEventHandler_IAppResourceGroupInfoWatcher_add_Removed_Interface(Callback : access procedure (sender : Windows.System.IAppResourceGroupInfoWatcher ; args : Windows.System.IAppResourceGroupInfoWatcherEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppResourceGroupInfoWatcher_add_Removed'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAppResourceGroupInfoWatcher_add_Removed_Interface
      ; sender : Windows.System.IAppResourceGroupInfoWatcher
      ; args : Windows.System.IAppResourceGroupInfoWatcherEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppResourceGroupInfoWatcher_add_EnumerationCompleted : aliased constant Windows.IID := (3795462401, 6522, 22631, (135, 40, 156, 157, 185, 73, 141, 118 ));
   
   type TypedEventHandler_IAppResourceGroupInfoWatcher_add_EnumerationCompleted_Interface(Callback : access procedure (sender : Windows.System.IAppResourceGroupInfoWatcher ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppResourceGroupInfoWatcher_add_EnumerationCompleted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAppResourceGroupInfoWatcher_add_EnumerationCompleted_Interface
      ; sender : Windows.System.IAppResourceGroupInfoWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppResourceGroupInfoWatcher_add_Stopped : aliased constant Windows.IID := (3795462401, 6522, 22631, (135, 40, 156, 157, 185, 73, 141, 118 ));
   
   type TypedEventHandler_IAppResourceGroupInfoWatcher_add_Stopped_Interface(Callback : access procedure (sender : Windows.System.IAppResourceGroupInfoWatcher ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppResourceGroupInfoWatcher_add_Stopped'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAppResourceGroupInfoWatcher_add_Stopped_Interface
      ; sender : Windows.System.IAppResourceGroupInfoWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppResourceGroupInfoWatcher_add_ExecutionStateChanged : aliased constant Windows.IID := (2482598476, 6136, 24053, (166, 207, 47, 10, 185, 12, 10, 39 ));
   
   type TypedEventHandler_IAppResourceGroupInfoWatcher_add_ExecutionStateChanged_Interface(Callback : access procedure (sender : Windows.System.IAppResourceGroupInfoWatcher ; args : Windows.System.IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppResourceGroupInfoWatcher_add_ExecutionStateChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAppResourceGroupInfoWatcher_add_ExecutionStateChanged_Interface
      ; sender : Windows.System.IAppResourceGroupInfoWatcher
      ; args : Windows.System.IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ILaunchUriResult : aliased constant Windows.IID := (1890155512, 57509, 22971, (145, 116, 129, 42, 19, 29, 133, 160 ));
   
   type AsyncOperationCompletedHandler_ILaunchUriResult_Interface(Callback : access procedure (asyncInfo : Windows.System.IAsyncOperation_ILaunchUriResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ILaunchUriResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ILaunchUriResult_Interface
      ; asyncInfo : Windows.System.IAsyncOperation_ILaunchUriResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_LaunchQuerySupportStatus : aliased constant Windows.IID := (428649554, 43981, 21801, (147, 63, 7, 28, 201, 63, 214, 53 ));
   
   type AsyncOperationCompletedHandler_LaunchQuerySupportStatus_Interface(Callback : access procedure (asyncInfo : Windows.System.IAsyncOperation_LaunchQuerySupportStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_LaunchQuerySupportStatus'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_LaunchQuerySupportStatus_Interface
      ; asyncInfo : Windows.System.IAsyncOperation_LaunchQuerySupportStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_LaunchUriStatus : aliased constant Windows.IID := (1376429454, 16598, 23127, (166, 220, 203, 95, 174, 165, 204, 165 ));
   
   type AsyncOperationCompletedHandler_LaunchUriStatus_Interface(Callback : access procedure (asyncInfo : Windows.System.IAsyncOperation_LaunchUriStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_LaunchUriStatus'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_LaunchUriStatus_Interface
      ; asyncInfo : Windows.System.IAsyncOperation_LaunchUriStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_RemoteLaunchUriStatus : aliased constant Windows.IID := (1066355483, 52564, 21564, (129, 127, 38, 48, 72, 127, 24, 120 ));
   
   type AsyncOperationCompletedHandler_RemoteLaunchUriStatus_Interface(Callback : access procedure (asyncInfo : Windows.System.IAsyncOperation_RemoteLaunchUriStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_RemoteLaunchUriStatus'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_RemoteLaunchUriStatus_Interface
      ; asyncInfo : Windows.System.IAsyncOperation_RemoteLaunchUriStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IProcessLauncherResult : aliased constant Windows.IID := (2373484262, 2020, 24014, (143, 229, 181, 3, 161, 246, 54, 140 ));
   
   type AsyncOperationCompletedHandler_IProcessLauncherResult_Interface(Callback : access procedure (asyncInfo : Windows.System.IAsyncOperation_IProcessLauncherResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IProcessLauncherResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IProcessLauncherResult_Interface
      ; asyncInfo : Windows.System.IAsyncOperation_IProcessLauncherResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_AutoUpdateTimeZoneStatus : aliased constant Windows.IID := (3266798156, 40757, 20596, (128, 33, 6, 51, 24, 72, 153, 167 ));
   
   type AsyncOperationCompletedHandler_AutoUpdateTimeZoneStatus_Interface(Callback : access procedure (asyncInfo : Windows.System.IAsyncOperation_AutoUpdateTimeZoneStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_AutoUpdateTimeZoneStatus'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_AutoUpdateTimeZoneStatus_Interface
      ; asyncInfo : Windows.System.IAsyncOperation_AutoUpdateTimeZoneStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype DispatcherQueueTimer is Windows.System.IDispatcherQueueTimer;
   subtype DispatcherQueue is Windows.System.IDispatcherQueue;
   subtype DispatcherQueueShutdownStartingEventArgs is Windows.System.IDispatcherQueueShutdownStartingEventArgs;
   subtype DispatcherQueueController is Windows.System.IDispatcherQueueController;
   subtype UserWatcher is Windows.System.IUserWatcher;
   subtype User is Windows.System.IUser;
   subtype UserChangedEventArgs is Windows.System.IUserChangedEventArgs;
   subtype UserAuthenticationStatusChangingEventArgs is Windows.System.IUserAuthenticationStatusChangingEventArgs;
   subtype UserAuthenticationStatusChangeDeferral is Windows.System.IUserAuthenticationStatusChangeDeferral;
   subtype UserPicker is Windows.System.IUserPicker;
   function Create return Windows.System.IUserPicker;
   
   subtype UserDeviceAssociationChangedEventArgs is Windows.System.IUserDeviceAssociationChangedEventArgs;
   subtype AppMemoryUsageLimitChangingEventArgs is Windows.System.IAppMemoryUsageLimitChangingEventArgs;
   subtype AppMemoryReport is Windows.System.IAppMemoryReport;
   subtype ProcessMemoryReport is Windows.System.IProcessMemoryReport;
   subtype ProtocolForResultsOperation is Windows.System.IProtocolForResultsOperation;
   subtype AppDiagnosticInfo is Windows.System.IAppDiagnosticInfo;
   subtype AppDiagnosticInfoWatcher is Windows.System.IAppDiagnosticInfoWatcher;
   subtype AppResourceGroupInfo is Windows.System.IAppResourceGroupInfo;
   subtype AppActivationResult is Windows.System.IAppActivationResult;
   subtype AppResourceGroupInfoWatcher is Windows.System.IAppResourceGroupInfoWatcher;
   subtype AppDiagnosticInfoWatcherEventArgs is Windows.System.IAppDiagnosticInfoWatcherEventArgs;
   subtype AppExecutionStateChangeResult is Windows.System.IAppExecutionStateChangeResult;
   subtype AppResourceGroupBackgroundTaskReport is Windows.System.IAppResourceGroupBackgroundTaskReport;
   subtype AppResourceGroupMemoryReport is Windows.System.IAppResourceGroupMemoryReport;
   subtype AppResourceGroupStateReport is Windows.System.IAppResourceGroupStateReport;
   subtype AppResourceGroupInfoWatcherEventArgs is Windows.System.IAppResourceGroupInfoWatcherEventArgs;
   subtype AppResourceGroupInfoWatcherExecutionStateChangedEventArgs is Windows.System.IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs;
   subtype LaunchUriResult is Windows.System.ILaunchUriResult;
   subtype LauncherUIOptions is Windows.System.ILauncherUIOptions;
   subtype LauncherOptions is Windows.System.ILauncherOptions;
   function Create return Windows.System.ILauncherOptions;
   
   subtype RemoteLauncherOptions is Windows.System.IRemoteLauncherOptions;
   function Create return Windows.System.IRemoteLauncherOptions;
   
   subtype FolderLauncherOptions is Windows.System.IFolderLauncherOptions;
   function Create return Windows.System.IFolderLauncherOptions;
   
   subtype ProcessLauncherOptions is Windows.System.IProcessLauncherOptions;
   function Create return Windows.System.IProcessLauncherOptions;
   
   subtype ProcessLauncherResult is Windows.System.IProcessLauncherResult;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetForCurrentThread
   return Windows.System.IDispatcherQueue;
   
   function CreateOnDedicatedThread
   return Windows.System.IDispatcherQueueController;
   
   function CreateWatcher
   return Windows.System.IUserWatcher;
   
   function FindAllAsync
   return Windows.Address;
   
   function FindAllAsyncByType
   (
      type_x : Windows.System.UserType
   )
   return Windows.Address;
   
   function FindAllAsyncByTypeAndStatus
   (
      type_x : Windows.System.UserType
      ; status : Windows.System.UserAuthenticationStatus
   )
   return Windows.Address;
   
   function GetFromId
   (
      nonRoamableId : Windows.String
   )
   return Windows.System.IUser;
   
   function get_DisplayName
   return Windows.String;
   
   function get_FirstName
   return Windows.String;
   
   function get_LastName
   return Windows.String;
   
   function get_ProviderName
   return Windows.String;
   
   function get_AccountName
   return Windows.String;
   
   function get_GuestHost
   return Windows.String;
   
   function get_PrincipalName
   return Windows.String;
   
   function get_DomainName
   return Windows.String;
   
   function get_SessionInitiationProtocolUri
   return Windows.String;
   
   function IsSupported
   return Windows.Boolean;
   
   function FindUserFromDeviceId
   (
      deviceId : Windows.String
   )
   return Windows.System.IUser;
   
   function add_UserDeviceAssociationChanged
   (
      handler : Windows.System.EventHandler_IUserDeviceAssociationChangedEventArgs
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_UserDeviceAssociationChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function get_ExpectedAppMemoryUsageLimit
   return Windows.UInt64;
   
   function get_AppMemoryUsage
   return Windows.UInt64;
   
   function get_AppMemoryUsageLimit
   return Windows.UInt64;
   
   function get_AppMemoryUsageLevel
   return Windows.System.AppMemoryUsageLevel;
   
   function add_AppMemoryUsageIncreased
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_AppMemoryUsageIncreased
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function add_AppMemoryUsageDecreased
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_AppMemoryUsageDecreased
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function add_AppMemoryUsageLimitChanging
   (
      handler : Windows.System.EventHandler_IAppMemoryUsageLimitChangingEventArgs
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_AppMemoryUsageLimitChanging
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function TrySetAppMemoryUsageLimit
   (
      value : Windows.UInt64
   )
   return Windows.Boolean;
   
   function GetAppMemoryReport
   return Windows.System.IAppMemoryReport;
   
   function GetProcessMemoryReport
   return Windows.System.IProcessMemoryReport;
   
   function RequestInfoAsync
   return Windows.Address;
   
   function CreateWatcher
   return Windows.System.IAppDiagnosticInfoWatcher;
   
   function RequestAccessAsync
   return Windows.System.IAsyncOperation_DiagnosticAccessStatus;
   
   function RequestInfoForPackageAsync
   (
      packageFamilyName : Windows.String
   )
   return Windows.Address;
   
   function RequestInfoForAppAsync
   return Windows.Address;
   
   function RequestInfoForAppUserModelId
   (
      appUserModelId : Windows.String
   )
   return Windows.Address;
   
   function LaunchFileAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   function LaunchFileWithOptionsAsync
   (
      file : Windows.Storage.IStorageFile
      ; options : Windows.System.ILauncherOptions
   )
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   function LaunchUriAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   function LaunchUriWithOptionsAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.System.ILauncherOptions
   )
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   function LaunchUriForResultsAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.System.ILauncherOptions
   )
   return Windows.System.IAsyncOperation_ILaunchUriResult;
   
   function LaunchUriForResultsWithDataAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.System.ILauncherOptions
      ; inputData : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.System.IAsyncOperation_ILaunchUriResult;
   
   function LaunchUriWithDataAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.System.ILauncherOptions
      ; inputData : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   function QueryUriSupportAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
      ; launchQuerySupportType : Windows.System.LaunchQuerySupportType
   )
   return Windows.System.IAsyncOperation_LaunchQuerySupportStatus;
   
   function QueryUriSupportWithPackageFamilyNameAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
      ; launchQuerySupportType : Windows.System.LaunchQuerySupportType
      ; packageFamilyName : Windows.String
   )
   return Windows.System.IAsyncOperation_LaunchQuerySupportStatus;
   
   function QueryFileSupportAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.System.IAsyncOperation_LaunchQuerySupportStatus;
   
   function QueryFileSupportWithPackageFamilyNameAsync
   (
      file : Windows.Storage.IStorageFile
      ; packageFamilyName : Windows.String
   )
   return Windows.System.IAsyncOperation_LaunchQuerySupportStatus;
   
   function FindUriSchemeHandlersAsync
   (
      scheme : Windows.String
   )
   return Windows.Address;
   
   function FindUriSchemeHandlersWithLaunchUriTypeAsync
   (
      scheme : Windows.String
      ; launchQuerySupportType : Windows.System.LaunchQuerySupportType
   )
   return Windows.Address;
   
   function FindFileHandlersAsync
   (
      extension : Windows.String
   )
   return Windows.Address;
   
   function QueryAppUriSupportAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.System.IAsyncOperation_LaunchQuerySupportStatus;
   
   function QueryAppUriSupportWithPackageFamilyNameAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
      ; packageFamilyName : Windows.String
   )
   return Windows.System.IAsyncOperation_LaunchQuerySupportStatus;
   
   function FindAppUriHandlersAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Address;
   
   function LaunchUriForUserAsync
   (
      user : Windows.System.IUser
      ; uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.System.IAsyncOperation_LaunchUriStatus;
   
   function LaunchUriWithOptionsForUserAsync
   (
      user : Windows.System.IUser
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.System.ILauncherOptions
   )
   return Windows.System.IAsyncOperation_LaunchUriStatus;
   
   function LaunchUriWithDataForUserAsync
   (
      user : Windows.System.IUser
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.System.ILauncherOptions
      ; inputData : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.System.IAsyncOperation_LaunchUriStatus;
   
   function LaunchUriForResultsForUserAsync
   (
      user : Windows.System.IUser
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.System.ILauncherOptions
   )
   return Windows.System.IAsyncOperation_ILaunchUriResult;
   
   function LaunchUriForResultsWithDataForUserAsync
   (
      user : Windows.System.IUser
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.System.ILauncherOptions
      ; inputData : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.System.IAsyncOperation_ILaunchUriResult;
   
   function LaunchFolderAsync
   (
      folder : Windows.Storage.IStorageFolder
   )
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   function LaunchFolderWithOptionsAsync
   (
      folder : Windows.Storage.IStorageFolder
      ; options : Windows.System.IFolderLauncherOptions
   )
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   function LaunchUriAsync
   (
      remoteSystemConnectionRequest : Windows.System.RemoteSystems.IRemoteSystemConnectionRequest
      ; uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.System.IAsyncOperation_RemoteLaunchUriStatus;
   
   function LaunchUriWithOptionsAsync
   (
      remoteSystemConnectionRequest : Windows.System.RemoteSystems.IRemoteSystemConnectionRequest
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.System.IRemoteLauncherOptions
   )
   return Windows.System.IAsyncOperation_RemoteLaunchUriStatus;
   
   function LaunchUriWithDataAsync
   (
      remoteSystemConnectionRequest : Windows.System.RemoteSystems.IRemoteSystemConnectionRequest
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; options : Windows.System.IRemoteLauncherOptions
      ; inputData : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.System.IAsyncOperation_RemoteLaunchUriStatus;
   
   procedure SetSystemDateTime
   (
      utcDateTime : Windows.Foundation.DateTime
   )
   ;
   
   function RunToCompletionAsync
   (
      fileName : Windows.String
      ; args : Windows.String
   )
   return Windows.System.IAsyncOperation_IProcessLauncherResult;
   
   function RunToCompletionAsyncWithOptions
   (
      fileName : Windows.String
      ; args : Windows.String
      ; options : Windows.System.IProcessLauncherOptions
   )
   return Windows.System.IAsyncOperation_IProcessLauncherResult;
   
   procedure BeginShutdown
   (
      shutdownKind : Windows.System.ShutdownKind
      ; timeout : Windows.Foundation.TimeSpan
   )
   ;
   
   procedure CancelShutdown
   ;
   
   function IsPowerStateSupported
   (
      powerState : Windows.System.PowerState
   )
   return Windows.Boolean;
   
   procedure EnterPowerState
   (
      powerState : Windows.System.PowerState
   )
   ;
   
   procedure EnterPowerStateWithTimeSpan
   (
      powerState : Windows.System.PowerState
      ; wakeUpAfter : Windows.Foundation.TimeSpan
   )
   ;
   
   function get_CurrentTimeZoneDisplayName
   return Windows.String;
   
   function get_SupportedTimeZoneDisplayNames
   return Windows.Foundation.Collections.IVectorView_String;
   
   function get_CanChangeTimeZone
   return Windows.Boolean;
   
   procedure ChangeTimeZoneByDisplayName
   (
      timeZoneDisplayName : Windows.String
   )
   ;
   
   function AutoUpdateTimeZoneAsync
   (
      timeout : Windows.Foundation.TimeSpan
   )
   return Windows.System.IAsyncOperation_AutoUpdateTimeZoneStatus;
   
end;
