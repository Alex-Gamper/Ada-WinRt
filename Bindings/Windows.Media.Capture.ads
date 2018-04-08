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
limited with Windows.Storage;
limited with Windows.Media.MediaProperties;
limited with Windows.Storage.Streams;
with Windows.Foundation.Collections;
with Windows; use Windows;
limited with Windows.Media.Devices;
limited with Windows.Media.Capture.Core;
limited with Windows.Media.Effects;
limited with Windows.Media.Capture.Frames;
limited with Windows.Graphics.Imaging;
limited with Windows.Media.Core;
limited with Windows.Security.Authentication.Web;
limited with Windows.System;
--------------------------------------------------------------------------------
package Windows.Media.Capture is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type CameraCaptureUIMode is (
      PhotoOrVideo,
      Photo,
      Video
   );
   for CameraCaptureUIMode use (
      PhotoOrVideo => 0,
      Photo => 1,
      Video => 2
   );
   for CameraCaptureUIMode'Size use 32;
   
   type CameraCaptureUIMode_Ptr is access CameraCaptureUIMode;
   
   type CameraCaptureUIPhotoFormat is (
      Jpeg,
      Png,
      JpegXR
   );
   for CameraCaptureUIPhotoFormat use (
      Jpeg => 0,
      Png => 1,
      JpegXR => 2
   );
   for CameraCaptureUIPhotoFormat'Size use 32;
   
   type CameraCaptureUIPhotoFormat_Ptr is access CameraCaptureUIPhotoFormat;
   
   type CameraCaptureUIVideoFormat is (
      Mp4,
      Wmv
   );
   for CameraCaptureUIVideoFormat use (
      Mp4 => 0,
      Wmv => 1
   );
   for CameraCaptureUIVideoFormat'Size use 32;
   
   type CameraCaptureUIVideoFormat_Ptr is access CameraCaptureUIVideoFormat;
   
   type CameraCaptureUIMaxVideoResolution is (
      HighestAvailable,
      LowDefinition,
      StandardDefinition,
      HighDefinition
   );
   for CameraCaptureUIMaxVideoResolution use (
      HighestAvailable => 0,
      LowDefinition => 1,
      StandardDefinition => 2,
      HighDefinition => 3
   );
   for CameraCaptureUIMaxVideoResolution'Size use 32;
   
   type CameraCaptureUIMaxVideoResolution_Ptr is access CameraCaptureUIMaxVideoResolution;
   
   type CameraCaptureUIMaxPhotoResolution is (
      HighestAvailable,
      VerySmallQvga,
      SmallVga,
      MediumXga,
      Large3M,
      VeryLarge5M
   );
   for CameraCaptureUIMaxPhotoResolution use (
      HighestAvailable => 0,
      VerySmallQvga => 1,
      SmallVga => 2,
      MediumXga => 3,
      Large3M => 4,
      VeryLarge5M => 5
   );
   for CameraCaptureUIMaxPhotoResolution'Size use 32;
   
   type CameraCaptureUIMaxPhotoResolution_Ptr is access CameraCaptureUIMaxPhotoResolution;
   
   type MediaCategory is (
      Other,
      Communications,
      Media,
      GameChat,
      Speech
   );
   for MediaCategory use (
      Other => 0,
      Communications => 1,
      Media => 2,
      GameChat => 3,
      Speech => 4
   );
   for MediaCategory'Size use 32;
   
   type MediaCategory_Ptr is access MediaCategory;
   
   type StreamingCaptureMode is (
      AudioAndVideo,
      Audio,
      Video
   );
   for StreamingCaptureMode use (
      AudioAndVideo => 0,
      Audio => 1,
      Video => 2
   );
   for StreamingCaptureMode'Size use 32;
   
   type StreamingCaptureMode_Ptr is access StreamingCaptureMode;
   
   type VideoRotation is (
      None,
      Clockwise90Degrees,
      Clockwise180Degrees,
      Clockwise270Degrees
   );
   for VideoRotation use (
      None => 0,
      Clockwise90Degrees => 1,
      Clockwise180Degrees => 2,
      Clockwise270Degrees => 3
   );
   for VideoRotation'Size use 32;
   
   type VideoRotation_Ptr is access VideoRotation;
   
   type PhotoCaptureSource is (
      Auto,
      VideoPreview,
      Photo
   );
   for PhotoCaptureSource use (
      Auto => 0,
      VideoPreview => 1,
      Photo => 2
   );
   for PhotoCaptureSource'Size use 32;
   
   type PhotoCaptureSource_Ptr is access PhotoCaptureSource;
   
   type VideoDeviceCharacteristic is (
      AllStreamsIndependent,
      PreviewRecordStreamsIdentical,
      PreviewPhotoStreamsIdentical,
      RecordPhotoStreamsIdentical,
      AllStreamsIdentical
   );
   for VideoDeviceCharacteristic use (
      AllStreamsIndependent => 0,
      PreviewRecordStreamsIdentical => 1,
      PreviewPhotoStreamsIdentical => 2,
      RecordPhotoStreamsIdentical => 3,
      AllStreamsIdentical => 4
   );
   for VideoDeviceCharacteristic'Size use 32;
   
   type VideoDeviceCharacteristic_Ptr is access VideoDeviceCharacteristic;
   
   type MediaCaptureThermalStatus is (
      Normal,
      Overheated
   );
   for MediaCaptureThermalStatus use (
      Normal => 0,
      Overheated => 1
   );
   for MediaCaptureThermalStatus'Size use 32;
   
   type MediaCaptureThermalStatus_Ptr is access MediaCaptureThermalStatus;
   
   type MediaCaptureDeviceExclusiveControlStatus is (
      ExclusiveControlAvailable,
      SharedReadOnlyAvailable
   );
   for MediaCaptureDeviceExclusiveControlStatus use (
      ExclusiveControlAvailable => 0,
      SharedReadOnlyAvailable => 1
   );
   for MediaCaptureDeviceExclusiveControlStatus'Size use 32;
   
   type MediaCaptureDeviceExclusiveControlStatus_Ptr is access MediaCaptureDeviceExclusiveControlStatus;
   
   type KnownVideoProfile is (
      VideoRecording,
      HighQualityPhoto,
      BalancedVideoAndPhoto,
      VideoConferencing,
      PhotoSequence
   );
   for KnownVideoProfile use (
      VideoRecording => 0,
      HighQualityPhoto => 1,
      BalancedVideoAndPhoto => 2,
      VideoConferencing => 3,
      PhotoSequence => 4
   );
   for KnownVideoProfile'Size use 32;
   
   type KnownVideoProfile_Ptr is access KnownVideoProfile;
   
   type MediaCaptureMemoryPreference is (
      Auto,
      Cpu
   );
   for MediaCaptureMemoryPreference use (
      Auto => 0,
      Cpu => 1
   );
   for MediaCaptureMemoryPreference'Size use 32;
   
   type MediaCaptureMemoryPreference_Ptr is access MediaCaptureMemoryPreference;
   
   type MediaCaptureSharingMode is (
      ExclusiveControl,
      SharedReadOnly
   );
   for MediaCaptureSharingMode use (
      ExclusiveControl => 0,
      SharedReadOnly => 1
   );
   for MediaCaptureSharingMode'Size use 32;
   
   type MediaCaptureSharingMode_Ptr is access MediaCaptureSharingMode;
   
   type MediaStreamType is (
      VideoPreview,
      VideoRecord,
      Audio,
      Photo
   );
   for MediaStreamType use (
      VideoPreview => 0,
      VideoRecord => 1,
      Audio => 2,
      Photo => 3
   );
   for MediaStreamType'Size use 32;
   
   type MediaStreamType_Ptr is access MediaStreamType;
   
   type PowerlineFrequency is (
      Disabled,
      FiftyHertz,
      SixtyHertz,
      Auto
   );
   for PowerlineFrequency use (
      Disabled => 0,
      FiftyHertz => 1,
      SixtyHertz => 2,
      Auto => 3
   );
   for PowerlineFrequency'Size use 32;
   
   type PowerlineFrequency_Ptr is access PowerlineFrequency;
   
   type AppBroadcastCameraOverlayLocation is (
      TopLeft,
      TopCenter,
      TopRight,
      MiddleLeft,
      MiddleCenter,
      MiddleRight,
      BottomLeft,
      BottomCenter,
      BottomRight
   );
   for AppBroadcastCameraOverlayLocation use (
      TopLeft => 0,
      TopCenter => 1,
      TopRight => 2,
      MiddleLeft => 3,
      MiddleCenter => 4,
      MiddleRight => 5,
      BottomLeft => 6,
      BottomCenter => 7,
      BottomRight => 8
   );
   for AppBroadcastCameraOverlayLocation'Size use 32;
   
   type AppBroadcastCameraOverlayLocation_Ptr is access AppBroadcastCameraOverlayLocation;
   
   type AppBroadcastCameraOverlaySize is (
      Small,
      Medium,
      Large
   );
   for AppBroadcastCameraOverlaySize use (
      Small => 0,
      Medium => 1,
      Large => 2
   );
   for AppBroadcastCameraOverlaySize'Size use 32;
   
   type AppBroadcastCameraOverlaySize_Ptr is access AppBroadcastCameraOverlaySize;
   
   type AppBroadcastVideoEncodingBitrateMode is (
      Custom,
      Auto
   );
   for AppBroadcastVideoEncodingBitrateMode use (
      Custom => 0,
      Auto => 1
   );
   for AppBroadcastVideoEncodingBitrateMode'Size use 32;
   
   type AppBroadcastVideoEncodingBitrateMode_Ptr is access AppBroadcastVideoEncodingBitrateMode;
   
   type AppBroadcastVideoEncodingResolutionMode is (
      Custom,
      Auto
   );
   for AppBroadcastVideoEncodingResolutionMode use (
      Custom => 0,
      Auto => 1
   );
   for AppBroadcastVideoEncodingResolutionMode'Size use 32;
   
   type AppBroadcastVideoEncodingResolutionMode_Ptr is access AppBroadcastVideoEncodingResolutionMode;
   
   type AppBroadcastPlugInState is (
      Unknown,
      Initialized,
      MicrosoftSignInRequired,
      OAuthSignInRequired,
      ProviderSignInRequired,
      InBandwidthTest,
      ReadyToBroadcast
   );
   for AppBroadcastPlugInState use (
      Unknown => 0,
      Initialized => 1,
      MicrosoftSignInRequired => 2,
      OAuthSignInRequired => 3,
      ProviderSignInRequired => 4,
      InBandwidthTest => 5,
      ReadyToBroadcast => 6
   );
   for AppBroadcastPlugInState'Size use 32;
   
   type AppBroadcastPlugInState_Ptr is access AppBroadcastPlugInState;
   
   type AppBroadcastStreamState is (
      Initializing,
      StreamReady,
      Started,
      Paused,
      Terminated
   );
   for AppBroadcastStreamState use (
      Initializing => 0,
      StreamReady => 1,
      Started => 2,
      Paused => 3,
      Terminated => 4
   );
   for AppBroadcastStreamState'Size use 32;
   
   type AppBroadcastStreamState_Ptr is access AppBroadcastStreamState;
   
   type AppBroadcastSignInState is (
      NotSignedIn,
      MicrosoftSignInInProgress,
      MicrosoftSignInComplete,
      OAuthSignInInProgress,
      OAuthSignInComplete
   );
   for AppBroadcastSignInState use (
      NotSignedIn => 0,
      MicrosoftSignInInProgress => 1,
      MicrosoftSignInComplete => 2,
      OAuthSignInInProgress => 3,
      OAuthSignInComplete => 4
   );
   for AppBroadcastSignInState'Size use 32;
   
   type AppBroadcastSignInState_Ptr is access AppBroadcastSignInState;
   
   type AppBroadcastTerminationReason is (
      NormalTermination,
      LostConnectionToService,
      NoNetworkConnectivity,
      ServiceAbort,
      ServiceError,
      ServiceUnavailable,
      InternalError,
      UnsupportedFormat,
      BackgroundTaskTerminated,
      BackgroundTaskUnresponsive
   );
   for AppBroadcastTerminationReason use (
      NormalTermination => 0,
      LostConnectionToService => 1,
      NoNetworkConnectivity => 2,
      ServiceAbort => 3,
      ServiceError => 4,
      ServiceUnavailable => 5,
      InternalError => 6,
      UnsupportedFormat => 7,
      BackgroundTaskTerminated => 8,
      BackgroundTaskUnresponsive => 9
   );
   for AppBroadcastTerminationReason'Size use 32;
   
   type AppBroadcastTerminationReason_Ptr is access AppBroadcastTerminationReason;
   
   type AppBroadcastSignInResult is (
      Success,
      AuthenticationFailed,
      Unauthorized,
      ServiceUnavailable,
      Unknown
   );
   for AppBroadcastSignInResult use (
      Success => 0,
      AuthenticationFailed => 1,
      Unauthorized => 2,
      ServiceUnavailable => 3,
      Unknown => 4
   );
   for AppBroadcastSignInResult'Size use 32;
   
   type AppBroadcastSignInResult_Ptr is access AppBroadcastSignInResult;
   
   type ForegroundActivationArgument is (
      SignInRequired,
      MoreSettings
   );
   for ForegroundActivationArgument use (
      SignInRequired => 0,
      MoreSettings => 1
   );
   for ForegroundActivationArgument'Size use 32;
   
   type ForegroundActivationArgument_Ptr is access ForegroundActivationArgument;
   
   type AppBroadcastMicrophoneCaptureState is (
      Stopped,
      Started,
      Failed
   );
   for AppBroadcastMicrophoneCaptureState use (
      Stopped => 0,
      Started => 1,
      Failed => 2
   );
   for AppBroadcastMicrophoneCaptureState'Size use 32;
   
   type AppBroadcastMicrophoneCaptureState_Ptr is access AppBroadcastMicrophoneCaptureState;
   
   type AppBroadcastCameraCaptureState is (
      Stopped,
      Started,
      Failed
   );
   for AppBroadcastCameraCaptureState use (
      Stopped => 0,
      Started => 1,
      Failed => 2
   );
   for AppBroadcastCameraCaptureState'Size use 32;
   
   type AppBroadcastCameraCaptureState_Ptr is access AppBroadcastCameraCaptureState;
   
   type AppBroadcastExitBroadcastModeReason is (
      NormalExit,
      UserCanceled,
      AuthorizationFail,
      ForegroundAppActivated
   );
   for AppBroadcastExitBroadcastModeReason use (
      NormalExit => 0,
      UserCanceled => 1,
      AuthorizationFail => 2,
      ForegroundAppActivated => 3
   );
   for AppBroadcastExitBroadcastModeReason'Size use 32;
   
   type AppBroadcastExitBroadcastModeReason_Ptr is access AppBroadcastExitBroadcastModeReason;
   
   type AppBroadcastPreviewState is (
      Started,
      Stopped,
      Failed
   );
   for AppBroadcastPreviewState use (
      Started => 0,
      Stopped => 1,
      Failed => 2
   );
   for AppBroadcastPreviewState'Size use 32;
   
   type AppBroadcastPreviewState_Ptr is access AppBroadcastPreviewState;
   
   type AppBroadcastCaptureTargetType is (
      AppView,
      EntireDisplay
   );
   for AppBroadcastCaptureTargetType use (
      AppView => 0,
      EntireDisplay => 1
   );
   for AppBroadcastCaptureTargetType'Size use 32;
   
   type AppBroadcastCaptureTargetType_Ptr is access AppBroadcastCaptureTargetType;
   
   type GameBarServicesDisplayMode is (
      Windowed,
      FullScreenExclusive
   );
   for GameBarServicesDisplayMode use (
      Windowed => 0,
      FullScreenExclusive => 1
   );
   for GameBarServicesDisplayMode'Size use 32;
   
   type GameBarServicesDisplayMode_Ptr is access GameBarServicesDisplayMode;
   
   type AppCaptureVideoEncodingBitrateMode is (
      Custom,
      High,
      Standard_x
   );
   for AppCaptureVideoEncodingBitrateMode use (
      Custom => 0,
      High => 1,
      Standard_x => 2
   );
   for AppCaptureVideoEncodingBitrateMode'Size use 32;
   
   type AppCaptureVideoEncodingBitrateMode_Ptr is access AppCaptureVideoEncodingBitrateMode;
   
   type AppCaptureVideoEncodingResolutionMode is (
      Custom,
      High,
      Standard_x
   );
   for AppCaptureVideoEncodingResolutionMode use (
      Custom => 0,
      High => 1,
      Standard_x => 2
   );
   for AppCaptureVideoEncodingResolutionMode'Size use 32;
   
   type AppCaptureVideoEncodingResolutionMode_Ptr is access AppCaptureVideoEncodingResolutionMode;
   
   type AppCaptureVideoEncodingFrameRateMode is (
      Standard_x,
      High
   );
   for AppCaptureVideoEncodingFrameRateMode use (
      Standard_x => 0,
      High => 1
   );
   for AppCaptureVideoEncodingFrameRateMode'Size use 32;
   
   type AppCaptureVideoEncodingFrameRateMode_Ptr is access AppCaptureVideoEncodingFrameRateMode;
   
   type AppCaptureHistoricalBufferLengthUnit is (
      Megabytes,
      Seconds
   );
   for AppCaptureHistoricalBufferLengthUnit use (
      Megabytes => 0,
      Seconds => 1
   );
   for AppCaptureHistoricalBufferLengthUnit'Size use 32;
   
   type AppCaptureHistoricalBufferLengthUnit_Ptr is access AppCaptureHistoricalBufferLengthUnit;
   
   type AppCaptureMicrophoneCaptureState is (
      Stopped,
      Started,
      Failed
   );
   for AppCaptureMicrophoneCaptureState use (
      Stopped => 0,
      Started => 1,
      Failed => 2
   );
   for AppCaptureMicrophoneCaptureState'Size use 32;
   
   type AppCaptureMicrophoneCaptureState_Ptr is access AppCaptureMicrophoneCaptureState;
   
   type AppCaptureRecordingState is (
      InProgress,
      Completed,
      Failed
   );
   for AppCaptureRecordingState use (
      InProgress => 0,
      Completed => 1,
      Failed => 2
   );
   for AppCaptureRecordingState'Size use 32;
   
   type AppCaptureRecordingState_Ptr is access AppCaptureRecordingState;
   
   type AppCaptureMetadataPriority is (
      Informational,
      Important
   );
   for AppCaptureMetadataPriority use (
      Informational => 0,
      Important => 1
   );
   for AppCaptureMetadataPriority'Size use 32;
   
   type AppCaptureMetadataPriority_Ptr is access AppCaptureMetadataPriority;
   
   type GameBarCommand is (
      OpenGameBar,
      RecordHistoricalBuffer,
      ToggleStartStopRecord,
      StartRecord,
      StopRecord,
      TakeScreenshot,
      StartBroadcast,
      StopBroadcast,
      PauseBroadcast,
      ResumeBroadcast,
      ToggleStartStopBroadcast,
      ToggleMicrophoneCapture,
      ToggleCameraCapture,
      ToggleRecordingIndicator
   );
   for GameBarCommand use (
      OpenGameBar => 0,
      RecordHistoricalBuffer => 1,
      ToggleStartStopRecord => 2,
      StartRecord => 3,
      StopRecord => 4,
      TakeScreenshot => 5,
      StartBroadcast => 6,
      StopBroadcast => 7,
      PauseBroadcast => 8,
      ResumeBroadcast => 9,
      ToggleStartStopBroadcast => 10,
      ToggleMicrophoneCapture => 11,
      ToggleCameraCapture => 12,
      ToggleRecordingIndicator => 13
   );
   for GameBarCommand'Size use 32;
   
   type GameBarCommand_Ptr is access GameBarCommand;
   
   type GameBarCommandOrigin is (
      ShortcutKey,
      Cortana,
      AppCommand
   );
   for GameBarCommandOrigin use (
      ShortcutKey => 0,
      Cortana => 1,
      AppCommand => 2
   );
   for GameBarCommandOrigin'Size use 32;
   
   type GameBarCommandOrigin_Ptr is access GameBarCommandOrigin;
   
   type GameBarTargetCapturePolicy is (
      EnabledBySystem,
      EnabledByUser,
      NotEnabled,
      ProhibitedBySystem,
      ProhibitedByPublisher
   );
   for GameBarTargetCapturePolicy use (
      EnabledBySystem => 0,
      EnabledByUser => 1,
      NotEnabled => 2,
      ProhibitedBySystem => 3,
      ProhibitedByPublisher => 4
   );
   for GameBarTargetCapturePolicy'Size use 32;
   
   type GameBarTargetCapturePolicy_Ptr is access GameBarTargetCapturePolicy;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type WhiteBalanceGain is record
      R : Windows.Double;
      G : Windows.Double;
      B : Windows.Double;
   end record;
   pragma Convention (C_Pass_By_Copy , WhiteBalanceGain);
   
   type WhiteBalanceGain_Ptr is access WhiteBalanceGain;
   
   type AppBroadcastContract is null record;
   pragma Convention (C_Pass_By_Copy , AppBroadcastContract);
   
   type AppBroadcastContract_Ptr is access AppBroadcastContract;
   
   type AppCaptureContract is null record;
   pragma Convention (C_Pass_By_Copy , AppCaptureContract);
   
   type AppCaptureContract_Ptr is access AppCaptureContract;
   
   type AppCaptureMetadataContract is null record;
   pragma Convention (C_Pass_By_Copy , AppCaptureMetadataContract);
   
   type AppCaptureMetadataContract_Ptr is access AppCaptureMetadataContract;
   
   type CameraCaptureUIContract is null record;
   pragma Convention (C_Pass_By_Copy , CameraCaptureUIContract);
   
   type CameraCaptureUIContract_Ptr is access CameraCaptureUIContract;
   
   type GameBarContract is null record;
   pragma Convention (C_Pass_By_Copy , GameBarContract);
   
   type GameBarContract_Ptr is access GameBarContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type MediaCaptureFailedEventHandler_Interface;
   type MediaCaptureFailedEventHandler is access all MediaCaptureFailedEventHandler_Interface'Class;
   type MediaCaptureFailedEventHandler_Ptr is access all MediaCaptureFailedEventHandler;
   type RecordLimitationExceededEventHandler_Interface;
   type RecordLimitationExceededEventHandler is access all RecordLimitationExceededEventHandler_Interface'Class;
   type RecordLimitationExceededEventHandler_Ptr is access all RecordLimitationExceededEventHandler;
   type TypedEventHandler_IAppCapture_add_CapturingChanged_Interface;
   type TypedEventHandler_IAppCapture_add_CapturingChanged is access all TypedEventHandler_IAppCapture_add_CapturingChanged_Interface'Class;
   type TypedEventHandler_IAppCapture_add_CapturingChanged_Ptr is access all TypedEventHandler_IAppCapture_add_CapturingChanged;
   type AsyncOperationCompletedHandler_ILowLagMediaRecording_Interface;
   type AsyncOperationCompletedHandler_ILowLagMediaRecording is access all AsyncOperationCompletedHandler_ILowLagMediaRecording_Interface'Class;
   type AsyncOperationCompletedHandler_ILowLagMediaRecording_Ptr is access all AsyncOperationCompletedHandler_ILowLagMediaRecording;
   type AsyncOperationCompletedHandler_ILowLagPhotoCapture_Interface;
   type AsyncOperationCompletedHandler_ILowLagPhotoCapture is access all AsyncOperationCompletedHandler_ILowLagPhotoCapture_Interface'Class;
   type AsyncOperationCompletedHandler_ILowLagPhotoCapture_Ptr is access all AsyncOperationCompletedHandler_ILowLagPhotoCapture;
   type AsyncOperationCompletedHandler_ILowLagPhotoSequenceCapture_Interface;
   type AsyncOperationCompletedHandler_ILowLagPhotoSequenceCapture is access all AsyncOperationCompletedHandler_ILowLagPhotoSequenceCapture_Interface'Class;
   type AsyncOperationCompletedHandler_ILowLagPhotoSequenceCapture_Ptr is access all AsyncOperationCompletedHandler_ILowLagPhotoSequenceCapture;
   type TypedEventHandler_IMediaCapture3_add_FocusChanged_Interface;
   type TypedEventHandler_IMediaCapture3_add_FocusChanged is access all TypedEventHandler_IMediaCapture3_add_FocusChanged_Interface'Class;
   type TypedEventHandler_IMediaCapture3_add_FocusChanged_Ptr is access all TypedEventHandler_IMediaCapture3_add_FocusChanged;
   type TypedEventHandler_IMediaCapture3_add_PhotoConfirmationCaptured_Interface;
   type TypedEventHandler_IMediaCapture3_add_PhotoConfirmationCaptured is access all TypedEventHandler_IMediaCapture3_add_PhotoConfirmationCaptured_Interface'Class;
   type TypedEventHandler_IMediaCapture3_add_PhotoConfirmationCaptured_Ptr is access all TypedEventHandler_IMediaCapture3_add_PhotoConfirmationCaptured;
   type TypedEventHandler_IMediaCapture4_add_CameraStreamStateChanged_Interface;
   type TypedEventHandler_IMediaCapture4_add_CameraStreamStateChanged is access all TypedEventHandler_IMediaCapture4_add_CameraStreamStateChanged_Interface'Class;
   type TypedEventHandler_IMediaCapture4_add_CameraStreamStateChanged_Ptr is access all TypedEventHandler_IMediaCapture4_add_CameraStreamStateChanged;
   type TypedEventHandler_IMediaCapture4_add_ThermalStatusChanged_Interface;
   type TypedEventHandler_IMediaCapture4_add_ThermalStatusChanged is access all TypedEventHandler_IMediaCapture4_add_ThermalStatusChanged_Interface'Class;
   type TypedEventHandler_IMediaCapture4_add_ThermalStatusChanged_Ptr is access all TypedEventHandler_IMediaCapture4_add_ThermalStatusChanged;
   type AsyncOperationCompletedHandler_IAdvancedPhotoCapture_Interface;
   type AsyncOperationCompletedHandler_IAdvancedPhotoCapture is access all AsyncOperationCompletedHandler_IAdvancedPhotoCapture_Interface'Class;
   type AsyncOperationCompletedHandler_IAdvancedPhotoCapture_Ptr is access all AsyncOperationCompletedHandler_IAdvancedPhotoCapture;
   type AsyncOperationCompletedHandler_IMediaCapturePauseResult_Interface;
   type AsyncOperationCompletedHandler_IMediaCapturePauseResult is access all AsyncOperationCompletedHandler_IMediaCapturePauseResult_Interface'Class;
   type AsyncOperationCompletedHandler_IMediaCapturePauseResult_Ptr is access all AsyncOperationCompletedHandler_IMediaCapturePauseResult;
   type AsyncOperationCompletedHandler_IMediaCaptureStopResult_Interface;
   type AsyncOperationCompletedHandler_IMediaCaptureStopResult is access all AsyncOperationCompletedHandler_IMediaCaptureStopResult_Interface'Class;
   type AsyncOperationCompletedHandler_IMediaCaptureStopResult_Ptr is access all AsyncOperationCompletedHandler_IMediaCaptureStopResult;
   type TypedEventHandler_IMediaCapture6_add_CaptureDeviceExclusiveControlStatusChanged_Interface;
   type TypedEventHandler_IMediaCapture6_add_CaptureDeviceExclusiveControlStatusChanged is access all TypedEventHandler_IMediaCapture6_add_CaptureDeviceExclusiveControlStatusChanged_Interface'Class;
   type TypedEventHandler_IMediaCapture6_add_CaptureDeviceExclusiveControlStatusChanged_Ptr is access all TypedEventHandler_IMediaCapture6_add_CaptureDeviceExclusiveControlStatusChanged;
   type AsyncOperationCompletedHandler_ICapturedPhoto_Interface;
   type AsyncOperationCompletedHandler_ICapturedPhoto is access all AsyncOperationCompletedHandler_ICapturedPhoto_Interface'Class;
   type AsyncOperationCompletedHandler_ICapturedPhoto_Ptr is access all AsyncOperationCompletedHandler_ICapturedPhoto;
   type AsyncOperationCompletedHandler_IAdvancedCapturedPhoto_Interface;
   type AsyncOperationCompletedHandler_IAdvancedCapturedPhoto is access all AsyncOperationCompletedHandler_IAdvancedCapturedPhoto_Interface'Class;
   type AsyncOperationCompletedHandler_IAdvancedCapturedPhoto_Ptr is access all AsyncOperationCompletedHandler_IAdvancedCapturedPhoto;
   type TypedEventHandler_IAdvancedPhotoCapture_add_OptionalReferencePhotoCaptured_Interface;
   type TypedEventHandler_IAdvancedPhotoCapture_add_OptionalReferencePhotoCaptured is access all TypedEventHandler_IAdvancedPhotoCapture_add_OptionalReferencePhotoCaptured_Interface'Class;
   type TypedEventHandler_IAdvancedPhotoCapture_add_OptionalReferencePhotoCaptured_Ptr is access all TypedEventHandler_IAdvancedPhotoCapture_add_OptionalReferencePhotoCaptured;
   type TypedEventHandler_IAdvancedPhotoCapture_add_AllPhotosCaptured_Interface;
   type TypedEventHandler_IAdvancedPhotoCapture_add_AllPhotosCaptured is access all TypedEventHandler_IAdvancedPhotoCapture_add_AllPhotosCaptured_Interface'Class;
   type TypedEventHandler_IAdvancedPhotoCapture_add_AllPhotosCaptured_Ptr is access all TypedEventHandler_IAdvancedPhotoCapture_add_AllPhotosCaptured;
   type TypedEventHandler_ILowLagPhotoSequenceCapture_add_PhotoCaptured_Interface;
   type TypedEventHandler_ILowLagPhotoSequenceCapture_add_PhotoCaptured is access all TypedEventHandler_ILowLagPhotoSequenceCapture_add_PhotoCaptured_Interface'Class;
   type TypedEventHandler_ILowLagPhotoSequenceCapture_add_PhotoCaptured_Ptr is access all TypedEventHandler_ILowLagPhotoSequenceCapture_add_PhotoCaptured;
   type TypedEventHandler_IAppBroadcastBackgroundServiceSignInInfo_add_SignInStateChanged_Interface;
   type TypedEventHandler_IAppBroadcastBackgroundServiceSignInInfo_add_SignInStateChanged is access all TypedEventHandler_IAppBroadcastBackgroundServiceSignInInfo_add_SignInStateChanged_Interface'Class;
   type TypedEventHandler_IAppBroadcastBackgroundServiceSignInInfo_add_SignInStateChanged_Ptr is access all TypedEventHandler_IAppBroadcastBackgroundServiceSignInInfo_add_SignInStateChanged;
   type TypedEventHandler_IAppBroadcastBackgroundServiceSignInInfo2_add_UserNameChanged_Interface;
   type TypedEventHandler_IAppBroadcastBackgroundServiceSignInInfo2_add_UserNameChanged is access all TypedEventHandler_IAppBroadcastBackgroundServiceSignInInfo2_add_UserNameChanged_Interface'Class;
   type TypedEventHandler_IAppBroadcastBackgroundServiceSignInInfo2_add_UserNameChanged_Ptr is access all TypedEventHandler_IAppBroadcastBackgroundServiceSignInInfo2_add_UserNameChanged;
   type TypedEventHandler_IAppBroadcastBackgroundServiceStreamInfo_add_StreamStateChanged_Interface;
   type TypedEventHandler_IAppBroadcastBackgroundServiceStreamInfo_add_StreamStateChanged is access all TypedEventHandler_IAppBroadcastBackgroundServiceStreamInfo_add_StreamStateChanged_Interface'Class;
   type TypedEventHandler_IAppBroadcastBackgroundServiceStreamInfo_add_StreamStateChanged_Ptr is access all TypedEventHandler_IAppBroadcastBackgroundServiceStreamInfo_add_StreamStateChanged;
   type TypedEventHandler_IAppBroadcastBackgroundServiceStreamInfo_add_VideoEncodingResolutionChanged_Interface;
   type TypedEventHandler_IAppBroadcastBackgroundServiceStreamInfo_add_VideoEncodingResolutionChanged is access all TypedEventHandler_IAppBroadcastBackgroundServiceStreamInfo_add_VideoEncodingResolutionChanged_Interface'Class;
   type TypedEventHandler_IAppBroadcastBackgroundServiceStreamInfo_add_VideoEncodingResolutionChanged_Ptr is access all TypedEventHandler_IAppBroadcastBackgroundServiceStreamInfo_add_VideoEncodingResolutionChanged;
   type TypedEventHandler_IAppBroadcastBackgroundServiceStreamInfo_add_VideoEncodingBitrateChanged_Interface;
   type TypedEventHandler_IAppBroadcastBackgroundServiceStreamInfo_add_VideoEncodingBitrateChanged is access all TypedEventHandler_IAppBroadcastBackgroundServiceStreamInfo_add_VideoEncodingBitrateChanged_Interface'Class;
   type TypedEventHandler_IAppBroadcastBackgroundServiceStreamInfo_add_VideoEncodingBitrateChanged_Ptr is access all TypedEventHandler_IAppBroadcastBackgroundServiceStreamInfo_add_VideoEncodingBitrateChanged;
   type TypedEventHandler_IAppBroadcastBackgroundService_add_HeartbeatRequested_Interface;
   type TypedEventHandler_IAppBroadcastBackgroundService_add_HeartbeatRequested is access all TypedEventHandler_IAppBroadcastBackgroundService_add_HeartbeatRequested_Interface'Class;
   type TypedEventHandler_IAppBroadcastBackgroundService_add_HeartbeatRequested_Ptr is access all TypedEventHandler_IAppBroadcastBackgroundService_add_HeartbeatRequested;
   type TypedEventHandler_IAppBroadcastBackgroundService2_add_BroadcastTitleChanged_Interface;
   type TypedEventHandler_IAppBroadcastBackgroundService2_add_BroadcastTitleChanged is access all TypedEventHandler_IAppBroadcastBackgroundService2_add_BroadcastTitleChanged_Interface'Class;
   type TypedEventHandler_IAppBroadcastBackgroundService2_add_BroadcastTitleChanged_Ptr is access all TypedEventHandler_IAppBroadcastBackgroundService2_add_BroadcastTitleChanged;
   type TypedEventHandler_IAppBroadcastBackgroundService2_add_BroadcastLanguageChanged_Interface;
   type TypedEventHandler_IAppBroadcastBackgroundService2_add_BroadcastLanguageChanged is access all TypedEventHandler_IAppBroadcastBackgroundService2_add_BroadcastLanguageChanged_Interface'Class;
   type TypedEventHandler_IAppBroadcastBackgroundService2_add_BroadcastLanguageChanged_Ptr is access all TypedEventHandler_IAppBroadcastBackgroundService2_add_BroadcastLanguageChanged;
   type TypedEventHandler_IAppBroadcastBackgroundService2_add_BroadcastChannelChanged_Interface;
   type TypedEventHandler_IAppBroadcastBackgroundService2_add_BroadcastChannelChanged is access all TypedEventHandler_IAppBroadcastBackgroundService2_add_BroadcastChannelChanged_Interface'Class;
   type TypedEventHandler_IAppBroadcastBackgroundService2_add_BroadcastChannelChanged_Ptr is access all TypedEventHandler_IAppBroadcastBackgroundService2_add_BroadcastChannelChanged;
   type TypedEventHandler_IAppBroadcastStreamReader_add_AudioFrameArrived_Interface;
   type TypedEventHandler_IAppBroadcastStreamReader_add_AudioFrameArrived is access all TypedEventHandler_IAppBroadcastStreamReader_add_AudioFrameArrived_Interface'Class;
   type TypedEventHandler_IAppBroadcastStreamReader_add_AudioFrameArrived_Ptr is access all TypedEventHandler_IAppBroadcastStreamReader_add_AudioFrameArrived;
   type TypedEventHandler_IAppBroadcastStreamReader_add_VideoFrameArrived_Interface;
   type TypedEventHandler_IAppBroadcastStreamReader_add_VideoFrameArrived is access all TypedEventHandler_IAppBroadcastStreamReader_add_VideoFrameArrived_Interface'Class;
   type TypedEventHandler_IAppBroadcastStreamReader_add_VideoFrameArrived_Ptr is access all TypedEventHandler_IAppBroadcastStreamReader_add_VideoFrameArrived;
   type TypedEventHandler_IAppBroadcastState_add_ViewerCountChanged_Interface;
   type TypedEventHandler_IAppBroadcastState_add_ViewerCountChanged is access all TypedEventHandler_IAppBroadcastState_add_ViewerCountChanged_Interface'Class;
   type TypedEventHandler_IAppBroadcastState_add_ViewerCountChanged_Ptr is access all TypedEventHandler_IAppBroadcastState_add_ViewerCountChanged;
   type TypedEventHandler_IAppBroadcastState_add_MicrophoneCaptureStateChanged_Interface;
   type TypedEventHandler_IAppBroadcastState_add_MicrophoneCaptureStateChanged is access all TypedEventHandler_IAppBroadcastState_add_MicrophoneCaptureStateChanged_Interface'Class;
   type TypedEventHandler_IAppBroadcastState_add_MicrophoneCaptureStateChanged_Ptr is access all TypedEventHandler_IAppBroadcastState_add_MicrophoneCaptureStateChanged;
   type TypedEventHandler_IAppBroadcastState_add_CameraCaptureStateChanged_Interface;
   type TypedEventHandler_IAppBroadcastState_add_CameraCaptureStateChanged is access all TypedEventHandler_IAppBroadcastState_add_CameraCaptureStateChanged_Interface'Class;
   type TypedEventHandler_IAppBroadcastState_add_CameraCaptureStateChanged_Ptr is access all TypedEventHandler_IAppBroadcastState_add_CameraCaptureStateChanged;
   type TypedEventHandler_IAppBroadcastState_add_PlugInStateChanged_Interface;
   type TypedEventHandler_IAppBroadcastState_add_PlugInStateChanged is access all TypedEventHandler_IAppBroadcastState_add_PlugInStateChanged_Interface'Class;
   type TypedEventHandler_IAppBroadcastState_add_PlugInStateChanged_Ptr is access all TypedEventHandler_IAppBroadcastState_add_PlugInStateChanged;
   type TypedEventHandler_IAppBroadcastState_add_StreamStateChanged_Interface;
   type TypedEventHandler_IAppBroadcastState_add_StreamStateChanged is access all TypedEventHandler_IAppBroadcastState_add_StreamStateChanged_Interface'Class;
   type TypedEventHandler_IAppBroadcastState_add_StreamStateChanged_Ptr is access all TypedEventHandler_IAppBroadcastState_add_StreamStateChanged;
   type TypedEventHandler_IAppBroadcastState_add_CaptureTargetClosed_Interface;
   type TypedEventHandler_IAppBroadcastState_add_CaptureTargetClosed is access all TypedEventHandler_IAppBroadcastState_add_CaptureTargetClosed_Interface'Class;
   type TypedEventHandler_IAppBroadcastState_add_CaptureTargetClosed_Ptr is access all TypedEventHandler_IAppBroadcastState_add_CaptureTargetClosed;
   type TypedEventHandler_IAppBroadcastPreview_add_PreviewStateChanged_Interface;
   type TypedEventHandler_IAppBroadcastPreview_add_PreviewStateChanged is access all TypedEventHandler_IAppBroadcastPreview_add_PreviewStateChanged_Interface'Class;
   type TypedEventHandler_IAppBroadcastPreview_add_PreviewStateChanged_Ptr is access all TypedEventHandler_IAppBroadcastPreview_add_PreviewStateChanged;
   type TypedEventHandler_IAppBroadcastPreviewStreamReader_add_VideoFrameArrived_Interface;
   type TypedEventHandler_IAppBroadcastPreviewStreamReader_add_VideoFrameArrived is access all TypedEventHandler_IAppBroadcastPreviewStreamReader_add_VideoFrameArrived_Interface'Class;
   type TypedEventHandler_IAppBroadcastPreviewStreamReader_add_VideoFrameArrived_Ptr is access all TypedEventHandler_IAppBroadcastPreviewStreamReader_add_VideoFrameArrived;
   type TypedEventHandler_IAppCaptureState_add_MicrophoneCaptureStateChanged_Interface;
   type TypedEventHandler_IAppCaptureState_add_MicrophoneCaptureStateChanged is access all TypedEventHandler_IAppCaptureState_add_MicrophoneCaptureStateChanged_Interface'Class;
   type TypedEventHandler_IAppCaptureState_add_MicrophoneCaptureStateChanged_Ptr is access all TypedEventHandler_IAppCaptureState_add_MicrophoneCaptureStateChanged;
   type TypedEventHandler_IAppCaptureState_add_CaptureTargetClosed_Interface;
   type TypedEventHandler_IAppCaptureState_add_CaptureTargetClosed is access all TypedEventHandler_IAppCaptureState_add_CaptureTargetClosed_Interface'Class;
   type TypedEventHandler_IAppCaptureState_add_CaptureTargetClosed_Ptr is access all TypedEventHandler_IAppCaptureState_add_CaptureTargetClosed;
   type TypedEventHandler_IAppCaptureRecordOperation_add_StateChanged_Interface;
   type TypedEventHandler_IAppCaptureRecordOperation_add_StateChanged is access all TypedEventHandler_IAppCaptureRecordOperation_add_StateChanged_Interface'Class;
   type TypedEventHandler_IAppCaptureRecordOperation_add_StateChanged_Ptr is access all TypedEventHandler_IAppCaptureRecordOperation_add_StateChanged;
   type TypedEventHandler_IAppCaptureRecordOperation_add_DurationGenerated_Interface;
   type TypedEventHandler_IAppCaptureRecordOperation_add_DurationGenerated is access all TypedEventHandler_IAppCaptureRecordOperation_add_DurationGenerated_Interface'Class;
   type TypedEventHandler_IAppCaptureRecordOperation_add_DurationGenerated_Ptr is access all TypedEventHandler_IAppCaptureRecordOperation_add_DurationGenerated;
   type TypedEventHandler_IAppCaptureRecordOperation_add_FileGenerated_Interface;
   type TypedEventHandler_IAppCaptureRecordOperation_add_FileGenerated is access all TypedEventHandler_IAppCaptureRecordOperation_add_FileGenerated_Interface'Class;
   type TypedEventHandler_IAppCaptureRecordOperation_add_FileGenerated_Ptr is access all TypedEventHandler_IAppCaptureRecordOperation_add_FileGenerated;
   type TypedEventHandler_IAppCaptureMetadataWriter_add_MetadataPurged_Interface;
   type TypedEventHandler_IAppCaptureMetadataWriter_add_MetadataPurged is access all TypedEventHandler_IAppCaptureMetadataWriter_add_MetadataPurged_Interface'Class;
   type TypedEventHandler_IAppCaptureMetadataWriter_add_MetadataPurged_Ptr is access all TypedEventHandler_IAppCaptureMetadataWriter_add_MetadataPurged;
   type TypedEventHandler_IGameBarServicesManager_add_GameBarServicesCreated_Interface;
   type TypedEventHandler_IGameBarServicesManager_add_GameBarServicesCreated is access all TypedEventHandler_IGameBarServicesManager_add_GameBarServicesCreated_Interface'Class;
   type TypedEventHandler_IGameBarServicesManager_add_GameBarServicesCreated_Ptr is access all TypedEventHandler_IGameBarServicesManager_add_GameBarServicesCreated;
   type TypedEventHandler_IGameBarServices_add_CommandReceived_Interface;
   type TypedEventHandler_IGameBarServices_add_CommandReceived is access all TypedEventHandler_IGameBarServices_add_CommandReceived_Interface'Class;
   type TypedEventHandler_IGameBarServices_add_CommandReceived_Ptr is access all TypedEventHandler_IGameBarServices_add_CommandReceived;
   type TypedEventHandler_IScreenCapture_add_SourceSuspensionChanged_Interface;
   type TypedEventHandler_IScreenCapture_add_SourceSuspensionChanged is access all TypedEventHandler_IScreenCapture_add_SourceSuspensionChanged_Interface'Class;
   type TypedEventHandler_IScreenCapture_add_SourceSuspensionChanged_Ptr is access all TypedEventHandler_IScreenCapture_add_SourceSuspensionChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IAppCapture_Interface;
   type IAppCapture is access all IAppCapture_Interface'Class;
   type IAppCapture_Ptr is access all IAppCapture;
   type IAppCaptureStatics_Interface;
   type IAppCaptureStatics is access all IAppCaptureStatics_Interface'Class;
   type IAppCaptureStatics_Ptr is access all IAppCaptureStatics;
   type IAppCaptureStatics2_Interface;
   type IAppCaptureStatics2 is access all IAppCaptureStatics2_Interface'Class;
   type IAppCaptureStatics2_Ptr is access all IAppCaptureStatics2;
   type ICameraCaptureUIPhotoCaptureSettings_Interface;
   type ICameraCaptureUIPhotoCaptureSettings is access all ICameraCaptureUIPhotoCaptureSettings_Interface'Class;
   type ICameraCaptureUIPhotoCaptureSettings_Ptr is access all ICameraCaptureUIPhotoCaptureSettings;
   type ICameraCaptureUIVideoCaptureSettings_Interface;
   type ICameraCaptureUIVideoCaptureSettings is access all ICameraCaptureUIVideoCaptureSettings_Interface'Class;
   type ICameraCaptureUIVideoCaptureSettings_Ptr is access all ICameraCaptureUIVideoCaptureSettings;
   type ICameraCaptureUI_Interface;
   type ICameraCaptureUI is access all ICameraCaptureUI_Interface'Class;
   type ICameraCaptureUI_Ptr is access all ICameraCaptureUI;
   type IMediaCaptureFailedEventArgs_Interface;
   type IMediaCaptureFailedEventArgs is access all IMediaCaptureFailedEventArgs_Interface'Class;
   type IMediaCaptureFailedEventArgs_Ptr is access all IMediaCaptureFailedEventArgs;
   type IMediaCaptureVideoProfileMediaDescription_Interface;
   type IMediaCaptureVideoProfileMediaDescription is access all IMediaCaptureVideoProfileMediaDescription_Interface'Class;
   type IMediaCaptureVideoProfileMediaDescription_Ptr is access all IMediaCaptureVideoProfileMediaDescription;
   type IMediaCaptureVideoProfile_Interface;
   type IMediaCaptureVideoProfile is access all IMediaCaptureVideoProfile_Interface'Class;
   type IMediaCaptureVideoProfile_Ptr is access all IMediaCaptureVideoProfile;
   type IMediaCaptureInitializationSettings_Interface;
   type IMediaCaptureInitializationSettings is access all IMediaCaptureInitializationSettings_Interface'Class;
   type IMediaCaptureInitializationSettings_Ptr is access all IMediaCaptureInitializationSettings;
   type IMediaCaptureInitializationSettings2_Interface;
   type IMediaCaptureInitializationSettings2 is access all IMediaCaptureInitializationSettings2_Interface'Class;
   type IMediaCaptureInitializationSettings2_Ptr is access all IMediaCaptureInitializationSettings2;
   type IMediaCaptureInitializationSettings3_Interface;
   type IMediaCaptureInitializationSettings3 is access all IMediaCaptureInitializationSettings3_Interface'Class;
   type IMediaCaptureInitializationSettings3_Ptr is access all IMediaCaptureInitializationSettings3;
   type IMediaCaptureInitializationSettings4_Interface;
   type IMediaCaptureInitializationSettings4 is access all IMediaCaptureInitializationSettings4_Interface'Class;
   type IMediaCaptureInitializationSettings4_Ptr is access all IMediaCaptureInitializationSettings4;
   type IMediaCaptureInitializationSettings5_Interface;
   type IMediaCaptureInitializationSettings5 is access all IMediaCaptureInitializationSettings5_Interface'Class;
   type IMediaCaptureInitializationSettings5_Ptr is access all IMediaCaptureInitializationSettings5;
   type IMediaCaptureInitializationSettings6_Interface;
   type IMediaCaptureInitializationSettings6 is access all IMediaCaptureInitializationSettings6_Interface'Class;
   type IMediaCaptureInitializationSettings6_Ptr is access all IMediaCaptureInitializationSettings6;
   type IMediaCaptureStatics_Interface;
   type IMediaCaptureStatics is access all IMediaCaptureStatics_Interface'Class;
   type IMediaCaptureStatics_Ptr is access all IMediaCaptureStatics;
   type IMediaCapture_Interface;
   type IMediaCapture is access all IMediaCapture_Interface'Class;
   type IMediaCapture_Ptr is access all IMediaCapture;
   type IMediaCapture2_Interface;
   type IMediaCapture2 is access all IMediaCapture2_Interface'Class;
   type IMediaCapture2_Ptr is access all IMediaCapture2;
   type IMediaCapture3_Interface;
   type IMediaCapture3 is access all IMediaCapture3_Interface'Class;
   type IMediaCapture3_Ptr is access all IMediaCapture3;
   type IMediaCapture4_Interface;
   type IMediaCapture4 is access all IMediaCapture4_Interface'Class;
   type IMediaCapture4_Ptr is access all IMediaCapture4;
   type IMediaCapture5_Interface;
   type IMediaCapture5 is access all IMediaCapture5_Interface'Class;
   type IMediaCapture5_Ptr is access all IMediaCapture5;
   type IMediaCapture6_Interface;
   type IMediaCapture6 is access all IMediaCapture6_Interface'Class;
   type IMediaCapture6_Ptr is access all IMediaCapture6;
   type ILowLagPhotoCapture_Interface;
   type ILowLagPhotoCapture is access all ILowLagPhotoCapture_Interface'Class;
   type ILowLagPhotoCapture_Ptr is access all ILowLagPhotoCapture;
   type IAdvancedPhotoCapture_Interface;
   type IAdvancedPhotoCapture is access all IAdvancedPhotoCapture_Interface'Class;
   type IAdvancedPhotoCapture_Ptr is access all IAdvancedPhotoCapture;
   type IAdvancedCapturedPhoto_Interface;
   type IAdvancedCapturedPhoto is access all IAdvancedCapturedPhoto_Interface'Class;
   type IAdvancedCapturedPhoto_Ptr is access all IAdvancedCapturedPhoto;
   type IAdvancedCapturedPhoto2_Interface;
   type IAdvancedCapturedPhoto2 is access all IAdvancedCapturedPhoto2_Interface'Class;
   type IAdvancedCapturedPhoto2_Ptr is access all IAdvancedCapturedPhoto2;
   type IOptionalReferencePhotoCapturedEventArgs_Interface;
   type IOptionalReferencePhotoCapturedEventArgs is access all IOptionalReferencePhotoCapturedEventArgs_Interface'Class;
   type IOptionalReferencePhotoCapturedEventArgs_Ptr is access all IOptionalReferencePhotoCapturedEventArgs;
   type ILowLagMediaRecording_Interface;
   type ILowLagMediaRecording is access all ILowLagMediaRecording_Interface'Class;
   type ILowLagMediaRecording_Ptr is access all ILowLagMediaRecording;
   type ILowLagMediaRecording2_Interface;
   type ILowLagMediaRecording2 is access all ILowLagMediaRecording2_Interface'Class;
   type ILowLagMediaRecording2_Ptr is access all ILowLagMediaRecording2;
   type ILowLagMediaRecording3_Interface;
   type ILowLagMediaRecording3 is access all ILowLagMediaRecording3_Interface'Class;
   type ILowLagMediaRecording3_Ptr is access all ILowLagMediaRecording3;
   type IMediaCapturePauseResult_Interface;
   type IMediaCapturePauseResult is access all IMediaCapturePauseResult_Interface'Class;
   type IMediaCapturePauseResult_Ptr is access all IMediaCapturePauseResult;
   type IMediaCaptureStopResult_Interface;
   type IMediaCaptureStopResult is access all IMediaCaptureStopResult_Interface'Class;
   type IMediaCaptureStopResult_Ptr is access all IMediaCaptureStopResult;
   type ILowLagPhotoSequenceCapture_Interface;
   type ILowLagPhotoSequenceCapture is access all ILowLagPhotoSequenceCapture_Interface'Class;
   type ILowLagPhotoSequenceCapture_Ptr is access all ILowLagPhotoSequenceCapture;
   type ICapturedFrameControlValues_Interface;
   type ICapturedFrameControlValues is access all ICapturedFrameControlValues_Interface'Class;
   type ICapturedFrameControlValues_Ptr is access all ICapturedFrameControlValues;
   type ICapturedFrameControlValues2_Interface;
   type ICapturedFrameControlValues2 is access all ICapturedFrameControlValues2_Interface'Class;
   type ICapturedFrameControlValues2_Ptr is access all ICapturedFrameControlValues2;
   type IPhotoCapturedEventArgs_Interface;
   type IPhotoCapturedEventArgs is access all IPhotoCapturedEventArgs_Interface'Class;
   type IPhotoCapturedEventArgs_Ptr is access all IPhotoCapturedEventArgs;
   type ICapturedPhoto_Interface;
   type ICapturedPhoto is access all ICapturedPhoto_Interface'Class;
   type ICapturedPhoto_Ptr is access all ICapturedPhoto;
   type ICapturedFrame_Interface;
   type ICapturedFrame is access all ICapturedFrame_Interface'Class;
   type ICapturedFrame_Ptr is access all ICapturedFrame;
   type ICapturedFrameWithSoftwareBitmap_Interface;
   type ICapturedFrameWithSoftwareBitmap is access all ICapturedFrameWithSoftwareBitmap_Interface'Class;
   type ICapturedFrameWithSoftwareBitmap_Ptr is access all ICapturedFrameWithSoftwareBitmap;
   type IMediaCaptureVideoPreview_Interface;
   type IMediaCaptureVideoPreview is access all IMediaCaptureVideoPreview_Interface'Class;
   type IMediaCaptureVideoPreview_Ptr is access all IMediaCaptureVideoPreview;
   type IMediaCaptureSettings_Interface;
   type IMediaCaptureSettings is access all IMediaCaptureSettings_Interface'Class;
   type IMediaCaptureSettings_Ptr is access all IMediaCaptureSettings;
   type IMediaCaptureSettings2_Interface;
   type IMediaCaptureSettings2 is access all IMediaCaptureSettings2_Interface'Class;
   type IMediaCaptureSettings2_Ptr is access all IMediaCaptureSettings2;
   type IMediaCaptureFocusChangedEventArgs_Interface;
   type IMediaCaptureFocusChangedEventArgs is access all IMediaCaptureFocusChangedEventArgs_Interface'Class;
   type IMediaCaptureFocusChangedEventArgs_Ptr is access all IMediaCaptureFocusChangedEventArgs;
   type IPhotoConfirmationCapturedEventArgs_Interface;
   type IPhotoConfirmationCapturedEventArgs is access all IPhotoConfirmationCapturedEventArgs_Interface'Class;
   type IPhotoConfirmationCapturedEventArgs_Ptr is access all IPhotoConfirmationCapturedEventArgs;
   type IVideoStreamConfiguration_Interface;
   type IVideoStreamConfiguration is access all IVideoStreamConfiguration_Interface'Class;
   type IVideoStreamConfiguration_Ptr is access all IVideoStreamConfiguration;
   type IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs_Interface;
   type IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs is access all IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs_Interface'Class;
   type IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs_Ptr is access all IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs;
   type IAppBroadcastManagerStatics_Interface;
   type IAppBroadcastManagerStatics is access all IAppBroadcastManagerStatics_Interface'Class;
   type IAppBroadcastManagerStatics_Ptr is access all IAppBroadcastManagerStatics;
   type IAppBroadcastGlobalSettings_Interface;
   type IAppBroadcastGlobalSettings is access all IAppBroadcastGlobalSettings_Interface'Class;
   type IAppBroadcastGlobalSettings_Ptr is access all IAppBroadcastGlobalSettings;
   type IAppBroadcastProviderSettings_Interface;
   type IAppBroadcastProviderSettings is access all IAppBroadcastProviderSettings_Interface'Class;
   type IAppBroadcastProviderSettings_Ptr is access all IAppBroadcastProviderSettings;
   type IAppBroadcastBackgroundServiceSignInInfo_Interface;
   type IAppBroadcastBackgroundServiceSignInInfo is access all IAppBroadcastBackgroundServiceSignInInfo_Interface'Class;
   type IAppBroadcastBackgroundServiceSignInInfo_Ptr is access all IAppBroadcastBackgroundServiceSignInInfo;
   type IAppBroadcastBackgroundServiceSignInInfo2_Interface;
   type IAppBroadcastBackgroundServiceSignInInfo2 is access all IAppBroadcastBackgroundServiceSignInInfo2_Interface'Class;
   type IAppBroadcastBackgroundServiceSignInInfo2_Ptr is access all IAppBroadcastBackgroundServiceSignInInfo2;
   type IAppBroadcastBackgroundServiceStreamInfo_Interface;
   type IAppBroadcastBackgroundServiceStreamInfo is access all IAppBroadcastBackgroundServiceStreamInfo_Interface'Class;
   type IAppBroadcastBackgroundServiceStreamInfo_Ptr is access all IAppBroadcastBackgroundServiceStreamInfo;
   type IAppBroadcastBackgroundServiceStreamInfo2_Interface;
   type IAppBroadcastBackgroundServiceStreamInfo2 is access all IAppBroadcastBackgroundServiceStreamInfo2_Interface'Class;
   type IAppBroadcastBackgroundServiceStreamInfo2_Ptr is access all IAppBroadcastBackgroundServiceStreamInfo2;
   type IAppBroadcastBackgroundService_Interface;
   type IAppBroadcastBackgroundService is access all IAppBroadcastBackgroundService_Interface'Class;
   type IAppBroadcastBackgroundService_Ptr is access all IAppBroadcastBackgroundService;
   type IAppBroadcastBackgroundService2_Interface;
   type IAppBroadcastBackgroundService2 is access all IAppBroadcastBackgroundService2_Interface'Class;
   type IAppBroadcastBackgroundService2_Ptr is access all IAppBroadcastBackgroundService2;
   type IAppBroadcastSignInStateChangedEventArgs_Interface;
   type IAppBroadcastSignInStateChangedEventArgs is access all IAppBroadcastSignInStateChangedEventArgs_Interface'Class;
   type IAppBroadcastSignInStateChangedEventArgs_Ptr is access all IAppBroadcastSignInStateChangedEventArgs;
   type IAppBroadcastStreamStateChangedEventArgs_Interface;
   type IAppBroadcastStreamStateChangedEventArgs is access all IAppBroadcastStreamStateChangedEventArgs_Interface'Class;
   type IAppBroadcastStreamStateChangedEventArgs_Ptr is access all IAppBroadcastStreamStateChangedEventArgs;
   type IAppBroadcastHeartbeatRequestedEventArgs_Interface;
   type IAppBroadcastHeartbeatRequestedEventArgs is access all IAppBroadcastHeartbeatRequestedEventArgs_Interface'Class;
   type IAppBroadcastHeartbeatRequestedEventArgs_Ptr is access all IAppBroadcastHeartbeatRequestedEventArgs;
   type IAppBroadcastStreamReader_Interface;
   type IAppBroadcastStreamReader is access all IAppBroadcastStreamReader_Interface'Class;
   type IAppBroadcastStreamReader_Ptr is access all IAppBroadcastStreamReader;
   type IAppBroadcastStreamVideoFrame_Interface;
   type IAppBroadcastStreamVideoFrame is access all IAppBroadcastStreamVideoFrame_Interface'Class;
   type IAppBroadcastStreamVideoFrame_Ptr is access all IAppBroadcastStreamVideoFrame;
   type IAppBroadcastStreamAudioFrame_Interface;
   type IAppBroadcastStreamAudioFrame is access all IAppBroadcastStreamAudioFrame_Interface'Class;
   type IAppBroadcastStreamAudioFrame_Ptr is access all IAppBroadcastStreamAudioFrame;
   type IAppBroadcastStreamAudioHeader_Interface;
   type IAppBroadcastStreamAudioHeader is access all IAppBroadcastStreamAudioHeader_Interface'Class;
   type IAppBroadcastStreamAudioHeader_Ptr is access all IAppBroadcastStreamAudioHeader;
   type IAppBroadcastStreamVideoHeader_Interface;
   type IAppBroadcastStreamVideoHeader is access all IAppBroadcastStreamVideoHeader_Interface'Class;
   type IAppBroadcastStreamVideoHeader_Ptr is access all IAppBroadcastStreamVideoHeader;
   type IAppBroadcastTriggerDetails_Interface;
   type IAppBroadcastTriggerDetails is access all IAppBroadcastTriggerDetails_Interface'Class;
   type IAppBroadcastTriggerDetails_Ptr is access all IAppBroadcastTriggerDetails;
   type IAppBroadcastPlugInManagerStatics_Interface;
   type IAppBroadcastPlugInManagerStatics is access all IAppBroadcastPlugInManagerStatics_Interface'Class;
   type IAppBroadcastPlugInManagerStatics_Ptr is access all IAppBroadcastPlugInManagerStatics;
   type IAppBroadcastPlugInManager_Interface;
   type IAppBroadcastPlugInManager is access all IAppBroadcastPlugInManager_Interface'Class;
   type IAppBroadcastPlugInManager_Ptr is access all IAppBroadcastPlugInManager;
   type IAppBroadcastPlugIn_Interface;
   type IAppBroadcastPlugIn is access all IAppBroadcastPlugIn_Interface'Class;
   type IAppBroadcastPlugIn_Ptr is access all IAppBroadcastPlugIn;
   type IAppBroadcastServices_Interface;
   type IAppBroadcastServices is access all IAppBroadcastServices_Interface'Class;
   type IAppBroadcastServices_Ptr is access all IAppBroadcastServices;
   type IAppBroadcastState_Interface;
   type IAppBroadcastState is access all IAppBroadcastState_Interface'Class;
   type IAppBroadcastState_Ptr is access all IAppBroadcastState;
   type IAppBroadcastPreview_Interface;
   type IAppBroadcastPreview is access all IAppBroadcastPreview_Interface'Class;
   type IAppBroadcastPreview_Ptr is access all IAppBroadcastPreview;
   type IAppBroadcastPlugInStateChangedEventArgs_Interface;
   type IAppBroadcastPlugInStateChangedEventArgs is access all IAppBroadcastPlugInStateChangedEventArgs_Interface'Class;
   type IAppBroadcastPlugInStateChangedEventArgs_Ptr is access all IAppBroadcastPlugInStateChangedEventArgs;
   type IAppBroadcastPreviewStateChangedEventArgs_Interface;
   type IAppBroadcastPreviewStateChangedEventArgs is access all IAppBroadcastPreviewStateChangedEventArgs_Interface'Class;
   type IAppBroadcastPreviewStateChangedEventArgs_Ptr is access all IAppBroadcastPreviewStateChangedEventArgs;
   type IAppBroadcastPreviewStreamReader_Interface;
   type IAppBroadcastPreviewStreamReader is access all IAppBroadcastPreviewStreamReader_Interface'Class;
   type IAppBroadcastPreviewStreamReader_Ptr is access all IAppBroadcastPreviewStreamReader;
   type IAppBroadcastPreviewStreamVideoFrame_Interface;
   type IAppBroadcastPreviewStreamVideoFrame is access all IAppBroadcastPreviewStreamVideoFrame_Interface'Class;
   type IAppBroadcastPreviewStreamVideoFrame_Ptr is access all IAppBroadcastPreviewStreamVideoFrame;
   type IAppBroadcastPreviewStreamVideoHeader_Interface;
   type IAppBroadcastPreviewStreamVideoHeader is access all IAppBroadcastPreviewStreamVideoHeader_Interface'Class;
   type IAppBroadcastPreviewStreamVideoHeader_Ptr is access all IAppBroadcastPreviewStreamVideoHeader;
   type IAppBroadcastMicrophoneCaptureStateChangedEventArgs_Interface;
   type IAppBroadcastMicrophoneCaptureStateChangedEventArgs is access all IAppBroadcastMicrophoneCaptureStateChangedEventArgs_Interface'Class;
   type IAppBroadcastMicrophoneCaptureStateChangedEventArgs_Ptr is access all IAppBroadcastMicrophoneCaptureStateChangedEventArgs;
   type IAppBroadcastCameraCaptureStateChangedEventArgs_Interface;
   type IAppBroadcastCameraCaptureStateChangedEventArgs is access all IAppBroadcastCameraCaptureStateChangedEventArgs_Interface'Class;
   type IAppBroadcastCameraCaptureStateChangedEventArgs_Ptr is access all IAppBroadcastCameraCaptureStateChangedEventArgs;
   type IAppBroadcastViewerCountChangedEventArgs_Interface;
   type IAppBroadcastViewerCountChangedEventArgs is access all IAppBroadcastViewerCountChangedEventArgs_Interface'Class;
   type IAppBroadcastViewerCountChangedEventArgs_Ptr is access all IAppBroadcastViewerCountChangedEventArgs;
   type IAppCaptureManagerStatics_Interface;
   type IAppCaptureManagerStatics is access all IAppCaptureManagerStatics_Interface'Class;
   type IAppCaptureManagerStatics_Ptr is access all IAppCaptureManagerStatics;
   type IAppCaptureAlternateShortcutKeys_Interface;
   type IAppCaptureAlternateShortcutKeys is access all IAppCaptureAlternateShortcutKeys_Interface'Class;
   type IAppCaptureAlternateShortcutKeys_Ptr is access all IAppCaptureAlternateShortcutKeys;
   type IAppCaptureAlternateShortcutKeys2_Interface;
   type IAppCaptureAlternateShortcutKeys2 is access all IAppCaptureAlternateShortcutKeys2_Interface'Class;
   type IAppCaptureAlternateShortcutKeys2_Ptr is access all IAppCaptureAlternateShortcutKeys2;
   type IAppCaptureAlternateShortcutKeys3_Interface;
   type IAppCaptureAlternateShortcutKeys3 is access all IAppCaptureAlternateShortcutKeys3_Interface'Class;
   type IAppCaptureAlternateShortcutKeys3_Ptr is access all IAppCaptureAlternateShortcutKeys3;
   type IAppCaptureSettings_Interface;
   type IAppCaptureSettings is access all IAppCaptureSettings_Interface'Class;
   type IAppCaptureSettings_Ptr is access all IAppCaptureSettings;
   type IAppCaptureSettings2_Interface;
   type IAppCaptureSettings2 is access all IAppCaptureSettings2_Interface'Class;
   type IAppCaptureSettings2_Ptr is access all IAppCaptureSettings2;
   type IAppCaptureSettings3_Interface;
   type IAppCaptureSettings3 is access all IAppCaptureSettings3_Interface'Class;
   type IAppCaptureSettings3_Ptr is access all IAppCaptureSettings3;
   type IAppCaptureSettings4_Interface;
   type IAppCaptureSettings4 is access all IAppCaptureSettings4_Interface'Class;
   type IAppCaptureSettings4_Ptr is access all IAppCaptureSettings4;
   type IAppCaptureSettings5_Interface;
   type IAppCaptureSettings5 is access all IAppCaptureSettings5_Interface'Class;
   type IAppCaptureSettings5_Ptr is access all IAppCaptureSettings5;
   type IAppCaptureServices_Interface;
   type IAppCaptureServices is access all IAppCaptureServices_Interface'Class;
   type IAppCaptureServices_Ptr is access all IAppCaptureServices;
   type IAppCaptureState_Interface;
   type IAppCaptureState is access all IAppCaptureState_Interface'Class;
   type IAppCaptureState_Ptr is access all IAppCaptureState;
   type IAppCaptureMicrophoneCaptureStateChangedEventArgs_Interface;
   type IAppCaptureMicrophoneCaptureStateChangedEventArgs is access all IAppCaptureMicrophoneCaptureStateChangedEventArgs_Interface'Class;
   type IAppCaptureMicrophoneCaptureStateChangedEventArgs_Ptr is access all IAppCaptureMicrophoneCaptureStateChangedEventArgs;
   type IAppCaptureRecordOperation_Interface;
   type IAppCaptureRecordOperation is access all IAppCaptureRecordOperation_Interface'Class;
   type IAppCaptureRecordOperation_Ptr is access all IAppCaptureRecordOperation;
   type IAppCaptureRecordingStateChangedEventArgs_Interface;
   type IAppCaptureRecordingStateChangedEventArgs is access all IAppCaptureRecordingStateChangedEventArgs_Interface'Class;
   type IAppCaptureRecordingStateChangedEventArgs_Ptr is access all IAppCaptureRecordingStateChangedEventArgs;
   type IAppCaptureDurationGeneratedEventArgs_Interface;
   type IAppCaptureDurationGeneratedEventArgs is access all IAppCaptureDurationGeneratedEventArgs_Interface'Class;
   type IAppCaptureDurationGeneratedEventArgs_Ptr is access all IAppCaptureDurationGeneratedEventArgs;
   type IAppCaptureFileGeneratedEventArgs_Interface;
   type IAppCaptureFileGeneratedEventArgs is access all IAppCaptureFileGeneratedEventArgs_Interface'Class;
   type IAppCaptureFileGeneratedEventArgs_Ptr is access all IAppCaptureFileGeneratedEventArgs;
   type IAppCaptureMetadataWriter_Interface;
   type IAppCaptureMetadataWriter is access all IAppCaptureMetadataWriter_Interface'Class;
   type IAppCaptureMetadataWriter_Ptr is access all IAppCaptureMetadataWriter;
   type ICameraOptionsUIStatics_Interface;
   type ICameraOptionsUIStatics is access all ICameraOptionsUIStatics_Interface'Class;
   type ICameraOptionsUIStatics_Ptr is access all ICameraOptionsUIStatics;
   type IGameBarServicesManagerStatics_Interface;
   type IGameBarServicesManagerStatics is access all IGameBarServicesManagerStatics_Interface'Class;
   type IGameBarServicesManagerStatics_Ptr is access all IGameBarServicesManagerStatics;
   type IGameBarServicesManager_Interface;
   type IGameBarServicesManager is access all IGameBarServicesManager_Interface'Class;
   type IGameBarServicesManager_Ptr is access all IGameBarServicesManager;
   type IGameBarServicesManagerGameBarServicesCreatedEventArgs_Interface;
   type IGameBarServicesManagerGameBarServicesCreatedEventArgs is access all IGameBarServicesManagerGameBarServicesCreatedEventArgs_Interface'Class;
   type IGameBarServicesManagerGameBarServicesCreatedEventArgs_Ptr is access all IGameBarServicesManagerGameBarServicesCreatedEventArgs;
   type IGameBarServices_Interface;
   type IGameBarServices is access all IGameBarServices_Interface'Class;
   type IGameBarServices_Ptr is access all IGameBarServices;
   type IGameBarServicesTargetInfo_Interface;
   type IGameBarServicesTargetInfo is access all IGameBarServicesTargetInfo_Interface'Class;
   type IGameBarServicesTargetInfo_Ptr is access all IGameBarServicesTargetInfo;
   type IGameBarServicesCommandEventArgs_Interface;
   type IGameBarServicesCommandEventArgs is access all IGameBarServicesCommandEventArgs_Interface'Class;
   type IGameBarServicesCommandEventArgs_Ptr is access all IGameBarServicesCommandEventArgs;
   type ISourceSuspensionChangedEventArgs_Interface;
   type ISourceSuspensionChangedEventArgs is access all ISourceSuspensionChangedEventArgs_Interface'Class;
   type ISourceSuspensionChangedEventArgs_Ptr is access all ISourceSuspensionChangedEventArgs;
   type IScreenCapture_Interface;
   type IScreenCapture is access all IScreenCapture_Interface'Class;
   type IScreenCapture_Ptr is access all IScreenCapture;
   type IScreenCaptureStatics_Interface;
   type IScreenCaptureStatics is access all IScreenCaptureStatics_Interface'Class;
   type IScreenCaptureStatics_Ptr is access all IScreenCaptureStatics;
   type IRandomAccessStreamWithContentType_Imported_Interface;
   type IRandomAccessStreamWithContentType_Imported is access all IRandomAccessStreamWithContentType_Imported_Interface'Class;
   type IRandomAccessStreamWithContentType_Imported_Ptr is access all IRandomAccessStreamWithContentType_Imported;
   type IContentTypeProvider_Imported_Interface;
   type IContentTypeProvider_Imported is access all IContentTypeProvider_Imported_Interface'Class;
   type IContentTypeProvider_Imported_Ptr is access all IContentTypeProvider_Imported;
   type IRandomAccessStream_Imported_Interface;
   type IRandomAccessStream_Imported is access all IRandomAccessStream_Imported_Interface'Class;
   type IRandomAccessStream_Imported_Ptr is access all IRandomAccessStream_Imported;
   type IOutputStream_Imported_Interface;
   type IOutputStream_Imported is access all IOutputStream_Imported_Interface'Class;
   type IOutputStream_Imported_Ptr is access all IOutputStream_Imported;
   type IInputStream_Imported_Interface;
   type IInputStream_Imported is access all IInputStream_Imported_Interface'Class;
   type IInputStream_Imported_Ptr is access all IInputStream_Imported;
   type IIterator_IMediaCaptureVideoProfileMediaDescription_Interface;
   type IIterator_IMediaCaptureVideoProfileMediaDescription is access all IIterator_IMediaCaptureVideoProfileMediaDescription_Interface'Class;
   type IIterator_IMediaCaptureVideoProfileMediaDescription_Ptr is access all IIterator_IMediaCaptureVideoProfileMediaDescription;
   type IIterable_IMediaCaptureVideoProfileMediaDescription_Interface;
   type IIterable_IMediaCaptureVideoProfileMediaDescription is access all IIterable_IMediaCaptureVideoProfileMediaDescription_Interface'Class;
   type IIterable_IMediaCaptureVideoProfileMediaDescription_Ptr is access all IIterable_IMediaCaptureVideoProfileMediaDescription;
   type IVectorView_IMediaCaptureVideoProfileMediaDescription_Interface;
   type IVectorView_IMediaCaptureVideoProfileMediaDescription is access all IVectorView_IMediaCaptureVideoProfileMediaDescription_Interface'Class;
   type IVectorView_IMediaCaptureVideoProfileMediaDescription_Ptr is access all IVectorView_IMediaCaptureVideoProfileMediaDescription;
   type IIterator_IMediaCaptureVideoProfile_Interface;
   type IIterator_IMediaCaptureVideoProfile is access all IIterator_IMediaCaptureVideoProfile_Interface'Class;
   type IIterator_IMediaCaptureVideoProfile_Ptr is access all IIterator_IMediaCaptureVideoProfile;
   type IIterable_IMediaCaptureVideoProfile_Interface;
   type IIterable_IMediaCaptureVideoProfile is access all IIterable_IMediaCaptureVideoProfile_Interface'Class;
   type IIterable_IMediaCaptureVideoProfile_Ptr is access all IIterable_IMediaCaptureVideoProfile;
   type IVectorView_IMediaCaptureVideoProfile_Interface;
   type IVectorView_IMediaCaptureVideoProfile is access all IVectorView_IMediaCaptureVideoProfile_Interface'Class;
   type IVectorView_IMediaCaptureVideoProfile_Ptr is access all IVectorView_IMediaCaptureVideoProfile;
   type IAsyncOperation_ILowLagMediaRecording_Interface;
   type IAsyncOperation_ILowLagMediaRecording is access all IAsyncOperation_ILowLagMediaRecording_Interface'Class;
   type IAsyncOperation_ILowLagMediaRecording_Ptr is access all IAsyncOperation_ILowLagMediaRecording;
   type IAsyncOperation_ILowLagPhotoCapture_Interface;
   type IAsyncOperation_ILowLagPhotoCapture is access all IAsyncOperation_ILowLagPhotoCapture_Interface'Class;
   type IAsyncOperation_ILowLagPhotoCapture_Ptr is access all IAsyncOperation_ILowLagPhotoCapture;
   type IAsyncOperation_ILowLagPhotoSequenceCapture_Interface;
   type IAsyncOperation_ILowLagPhotoSequenceCapture is access all IAsyncOperation_ILowLagPhotoSequenceCapture_Interface'Class;
   type IAsyncOperation_ILowLagPhotoSequenceCapture_Ptr is access all IAsyncOperation_ILowLagPhotoSequenceCapture;
   type IAsyncOperation_IAdvancedPhotoCapture_Interface;
   type IAsyncOperation_IAdvancedPhotoCapture is access all IAsyncOperation_IAdvancedPhotoCapture_Interface'Class;
   type IAsyncOperation_IAdvancedPhotoCapture_Ptr is access all IAsyncOperation_IAdvancedPhotoCapture;
   type IAsyncOperation_IMediaCapturePauseResult_Interface;
   type IAsyncOperation_IMediaCapturePauseResult is access all IAsyncOperation_IMediaCapturePauseResult_Interface'Class;
   type IAsyncOperation_IMediaCapturePauseResult_Ptr is access all IAsyncOperation_IMediaCapturePauseResult;
   type IAsyncOperation_IMediaCaptureStopResult_Interface;
   type IAsyncOperation_IMediaCaptureStopResult is access all IAsyncOperation_IMediaCaptureStopResult_Interface'Class;
   type IAsyncOperation_IMediaCaptureStopResult_Ptr is access all IAsyncOperation_IMediaCaptureStopResult;
   type IAsyncOperation_ICapturedPhoto_Interface;
   type IAsyncOperation_ICapturedPhoto is access all IAsyncOperation_ICapturedPhoto_Interface'Class;
   type IAsyncOperation_ICapturedPhoto_Ptr is access all IAsyncOperation_ICapturedPhoto;
   type IAsyncOperation_IAdvancedCapturedPhoto_Interface;
   type IAsyncOperation_IAdvancedCapturedPhoto is access all IAsyncOperation_IAdvancedCapturedPhoto_Interface'Class;
   type IAsyncOperation_IAdvancedCapturedPhoto_Ptr is access all IAsyncOperation_IAdvancedCapturedPhoto;
   type IReference_WhiteBalanceGain_Interface;
   type IReference_WhiteBalanceGain is access all IReference_WhiteBalanceGain_Interface'Class;
   type IReference_WhiteBalanceGain_Ptr is access all IReference_WhiteBalanceGain;
   type IIterator_IAppBroadcastPlugIn_Interface;
   type IIterator_IAppBroadcastPlugIn is access all IIterator_IAppBroadcastPlugIn_Interface'Class;
   type IIterator_IAppBroadcastPlugIn_Ptr is access all IIterator_IAppBroadcastPlugIn;
   type IIterable_IAppBroadcastPlugIn_Interface;
   type IIterable_IAppBroadcastPlugIn is access all IIterable_IAppBroadcastPlugIn_Interface'Class;
   type IIterable_IAppBroadcastPlugIn_Ptr is access all IIterable_IAppBroadcastPlugIn;
   type IVectorView_IAppBroadcastPlugIn_Interface;
   type IVectorView_IAppBroadcastPlugIn is access all IVectorView_IAppBroadcastPlugIn_Interface'Class;
   type IVectorView_IAppBroadcastPlugIn_Ptr is access all IVectorView_IAppBroadcastPlugIn;
   
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
   
   IID_IAppCapture : aliased constant Windows.IID := (2538198099, 41626, 17901, (143, 41, 34, 208, 153, 66, 207, 247 ));
   
   type IAppCapture_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsCapturingAudio
   (
      This       : access IAppCapture_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCapturingVideo
   (
      This       : access IAppCapture_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_CapturingChanged
   (
      This       : access IAppCapture_Interface
      ; handler : TypedEventHandler_IAppCapture_add_CapturingChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CapturingChanged
   (
      This       : access IAppCapture_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppCaptureStatics : aliased constant Windows.IID := (4179811692, 2686, 20084, (139, 32, 156, 31, 144, 45, 8, 161 ));
   
   type IAppCaptureStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access IAppCaptureStatics_Interface
      ; RetVal : access Windows.Media.Capture.IAppCapture
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppCaptureStatics2 : aliased constant Windows.IID := (3000533460, 33644, 19876, (175, 215, 250, 204, 4, 30, 28, 243 ));
   
   type IAppCaptureStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function SetAllowedAsync
   (
      This       : access IAppCaptureStatics2_Interface
      ; allowed : Windows.Boolean
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICameraCaptureUIPhotoCaptureSettings : aliased constant Windows.IID := (3119890071, 13426, 18088, (138, 158, 4, 206, 66, 204, 201, 125 ));
   
   type ICameraCaptureUIPhotoCaptureSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Format
   (
      This       : access ICameraCaptureUIPhotoCaptureSettings_Interface
      ; RetVal : access Windows.Media.Capture.CameraCaptureUIPhotoFormat
   )
   return Windows.HRESULT is abstract;
   
   function put_Format
   (
      This       : access ICameraCaptureUIPhotoCaptureSettings_Interface
      ; value : Windows.Media.Capture.CameraCaptureUIPhotoFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxResolution
   (
      This       : access ICameraCaptureUIPhotoCaptureSettings_Interface
      ; RetVal : access Windows.Media.Capture.CameraCaptureUIMaxPhotoResolution
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxResolution
   (
      This       : access ICameraCaptureUIPhotoCaptureSettings_Interface
      ; value : Windows.Media.Capture.CameraCaptureUIMaxPhotoResolution
   )
   return Windows.HRESULT is abstract;
   
   function get_CroppedSizeInPixels
   (
      This       : access ICameraCaptureUIPhotoCaptureSettings_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function put_CroppedSizeInPixels
   (
      This       : access ICameraCaptureUIPhotoCaptureSettings_Interface
      ; value : Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_CroppedAspectRatio
   (
      This       : access ICameraCaptureUIPhotoCaptureSettings_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function put_CroppedAspectRatio
   (
      This       : access ICameraCaptureUIPhotoCaptureSettings_Interface
      ; value : Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowCropping
   (
      This       : access ICameraCaptureUIPhotoCaptureSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AllowCropping
   (
      This       : access ICameraCaptureUIPhotoCaptureSettings_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICameraCaptureUIVideoCaptureSettings : aliased constant Windows.IID := (1693003039, 41613, 16986, (184, 79, 229, 104, 51, 95, 242, 78 ));
   
   type ICameraCaptureUIVideoCaptureSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Format
   (
      This       : access ICameraCaptureUIVideoCaptureSettings_Interface
      ; RetVal : access Windows.Media.Capture.CameraCaptureUIVideoFormat
   )
   return Windows.HRESULT is abstract;
   
   function put_Format
   (
      This       : access ICameraCaptureUIVideoCaptureSettings_Interface
      ; value : Windows.Media.Capture.CameraCaptureUIVideoFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxResolution
   (
      This       : access ICameraCaptureUIVideoCaptureSettings_Interface
      ; RetVal : access Windows.Media.Capture.CameraCaptureUIMaxVideoResolution
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxResolution
   (
      This       : access ICameraCaptureUIVideoCaptureSettings_Interface
      ; value : Windows.Media.Capture.CameraCaptureUIMaxVideoResolution
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxDurationInSeconds
   (
      This       : access ICameraCaptureUIVideoCaptureSettings_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxDurationInSeconds
   (
      This       : access ICameraCaptureUIVideoCaptureSettings_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_AllowTrimming
   (
      This       : access ICameraCaptureUIVideoCaptureSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AllowTrimming
   (
      This       : access ICameraCaptureUIVideoCaptureSettings_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICameraCaptureUI : aliased constant Windows.IID := (1213756736, 28563, 19380, (184, 243, 232, 158, 72, 148, 140, 145 ));
   
   type ICameraCaptureUI_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PhotoSettings
   (
      This       : access ICameraCaptureUI_Interface
      ; RetVal : access Windows.Media.Capture.ICameraCaptureUIPhotoCaptureSettings
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoSettings
   (
      This       : access ICameraCaptureUI_Interface
      ; RetVal : access Windows.Media.Capture.ICameraCaptureUIVideoCaptureSettings
   )
   return Windows.HRESULT is abstract;
   
   function CaptureFileAsync
   (
      This       : access ICameraCaptureUI_Interface
      ; mode : Windows.Media.Capture.CameraCaptureUIMode
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMediaCaptureFailedEventArgs : aliased constant Windows.IID := (2164122612, 21700, 17088, (141, 25, 206, 161, 168, 124, 161, 139 ));
   
   type IMediaCaptureFailedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Message
   (
      This       : access IMediaCaptureFailedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Code
   (
      This       : access IMediaCaptureFailedEventArgs_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMediaCaptureVideoProfileMediaDescription : aliased constant Windows.IID := (2148708335, 46737, 18943, (131, 242, 193, 231, 110, 170, 234, 27 ));
   
   type IMediaCaptureVideoProfileMediaDescription_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Width
   (
      This       : access IMediaCaptureVideoProfileMediaDescription_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Height
   (
      This       : access IMediaCaptureVideoProfileMediaDescription_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_FrameRate
   (
      This       : access IMediaCaptureVideoProfileMediaDescription_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_IsVariablePhotoSequenceSupported
   (
      This       : access IMediaCaptureVideoProfileMediaDescription_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsHdrVideoSupported
   (
      This       : access IMediaCaptureVideoProfileMediaDescription_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMediaCaptureVideoProfile : aliased constant Windows.IID := (564163519, 41966, 20175, (158, 246, 80, 176, 188, 78, 19, 5 ));
   
   type IMediaCaptureVideoProfile_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IMediaCaptureVideoProfile_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoDeviceId
   (
      This       : access IMediaCaptureVideoProfile_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedPreviewMediaDescription
   (
      This       : access IMediaCaptureVideoProfile_Interface
      ; RetVal : access Windows.Media.Capture.IVectorView_IMediaCaptureVideoProfileMediaDescription -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedRecordMediaDescription
   (
      This       : access IMediaCaptureVideoProfile_Interface
      ; RetVal : access Windows.Media.Capture.IVectorView_IMediaCaptureVideoProfileMediaDescription -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedPhotoMediaDescription
   (
      This       : access IMediaCaptureVideoProfile_Interface
      ; RetVal : access Windows.Media.Capture.IVectorView_IMediaCaptureVideoProfileMediaDescription -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetConcurrency
   (
      This       : access IMediaCaptureVideoProfile_Interface
      ; RetVal : access Windows.Media.Capture.IVectorView_IMediaCaptureVideoProfile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMediaCaptureInitializationSettings : aliased constant Windows.IID := (2541927024, 60005, 18688, (147, 86, 140, 168, 135, 114, 104, 132 ));
   
   type IMediaCaptureInitializationSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function put_AudioDeviceId
   (
      This       : access IMediaCaptureInitializationSettings_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioDeviceId
   (
      This       : access IMediaCaptureInitializationSettings_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_VideoDeviceId
   (
      This       : access IMediaCaptureInitializationSettings_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoDeviceId
   (
      This       : access IMediaCaptureInitializationSettings_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_StreamingCaptureMode
   (
      This       : access IMediaCaptureInitializationSettings_Interface
      ; value : Windows.Media.Capture.StreamingCaptureMode
   )
   return Windows.HRESULT is abstract;
   
   function get_StreamingCaptureMode
   (
      This       : access IMediaCaptureInitializationSettings_Interface
      ; RetVal : access Windows.Media.Capture.StreamingCaptureMode
   )
   return Windows.HRESULT is abstract;
   
   function put_PhotoCaptureSource
   (
      This       : access IMediaCaptureInitializationSettings_Interface
      ; value : Windows.Media.Capture.PhotoCaptureSource
   )
   return Windows.HRESULT is abstract;
   
   function get_PhotoCaptureSource
   (
      This       : access IMediaCaptureInitializationSettings_Interface
      ; RetVal : access Windows.Media.Capture.PhotoCaptureSource
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMediaCaptureInitializationSettings2 : aliased constant Windows.IID := (1078855206, 51676, 17385, (174, 228, 230, 191, 27, 87, 180, 76 ));
   
   type IMediaCaptureInitializationSettings2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_MediaCategory
   (
      This       : access IMediaCaptureInitializationSettings2_Interface
      ; value : Windows.Media.Capture.MediaCategory
   )
   return Windows.HRESULT is abstract;
   
   function get_MediaCategory
   (
      This       : access IMediaCaptureInitializationSettings2_Interface
      ; RetVal : access Windows.Media.Capture.MediaCategory
   )
   return Windows.HRESULT is abstract;
   
   function put_AudioProcessing
   (
      This       : access IMediaCaptureInitializationSettings2_Interface
      ; value : Windows.Media.AudioProcessing
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioProcessing
   (
      This       : access IMediaCaptureInitializationSettings2_Interface
      ; RetVal : access Windows.Media.AudioProcessing
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMediaCaptureInitializationSettings3 : aliased constant Windows.IID := (1096831389, 48712, 18224, (129, 4, 12, 246, 233, 233, 121, 72 ));
   
   type IMediaCaptureInitializationSettings3_Interface is interface and Windows.IInspectable_Interface;
   
   function put_AudioSource
   (
      This       : access IMediaCaptureInitializationSettings3_Interface
      ; value : Windows.Media.Core.IMediaSource
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioSource
   (
      This       : access IMediaCaptureInitializationSettings3_Interface
      ; RetVal : access Windows.Media.Core.IMediaSource
   )
   return Windows.HRESULT is abstract;
   
   function put_VideoSource
   (
      This       : access IMediaCaptureInitializationSettings3_Interface
      ; value : Windows.Media.Core.IMediaSource
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoSource
   (
      This       : access IMediaCaptureInitializationSettings3_Interface
      ; RetVal : access Windows.Media.Core.IMediaSource
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMediaCaptureInitializationSettings4 : aliased constant Windows.IID := (4110591287, 19639, 19752, (149, 237, 79, 159, 1, 46, 5, 24 ));
   
   type IMediaCaptureInitializationSettings4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_VideoProfile
   (
      This       : access IMediaCaptureInitializationSettings4_Interface
      ; RetVal : access Windows.Media.Capture.IMediaCaptureVideoProfile
   )
   return Windows.HRESULT is abstract;
   
   function put_VideoProfile
   (
      This       : access IMediaCaptureInitializationSettings4_Interface
      ; value : Windows.Media.Capture.IMediaCaptureVideoProfile
   )
   return Windows.HRESULT is abstract;
   
   function get_PreviewMediaDescription
   (
      This       : access IMediaCaptureInitializationSettings4_Interface
      ; RetVal : access Windows.Media.Capture.IMediaCaptureVideoProfileMediaDescription
   )
   return Windows.HRESULT is abstract;
   
   function put_PreviewMediaDescription
   (
      This       : access IMediaCaptureInitializationSettings4_Interface
      ; value : Windows.Media.Capture.IMediaCaptureVideoProfileMediaDescription
   )
   return Windows.HRESULT is abstract;
   
   function get_RecordMediaDescription
   (
      This       : access IMediaCaptureInitializationSettings4_Interface
      ; RetVal : access Windows.Media.Capture.IMediaCaptureVideoProfileMediaDescription
   )
   return Windows.HRESULT is abstract;
   
   function put_RecordMediaDescription
   (
      This       : access IMediaCaptureInitializationSettings4_Interface
      ; value : Windows.Media.Capture.IMediaCaptureVideoProfileMediaDescription
   )
   return Windows.HRESULT is abstract;
   
   function get_PhotoMediaDescription
   (
      This       : access IMediaCaptureInitializationSettings4_Interface
      ; RetVal : access Windows.Media.Capture.IMediaCaptureVideoProfileMediaDescription
   )
   return Windows.HRESULT is abstract;
   
   function put_PhotoMediaDescription
   (
      This       : access IMediaCaptureInitializationSettings4_Interface
      ; value : Windows.Media.Capture.IMediaCaptureVideoProfileMediaDescription
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMediaCaptureInitializationSettings5 : aliased constant Windows.IID := (3584222136, 9766, 20116, (183, 179, 83, 8, 160, 246, 75, 26 ));
   
   type IMediaCaptureInitializationSettings5_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SourceGroup
   (
      This       : access IMediaCaptureInitializationSettings5_Interface
      ; RetVal : access Windows.Media.Capture.Frames.IMediaFrameSourceGroup
   )
   return Windows.HRESULT is abstract;
   
   function put_SourceGroup
   (
      This       : access IMediaCaptureInitializationSettings5_Interface
      ; value : Windows.Media.Capture.Frames.IMediaFrameSourceGroup
   )
   return Windows.HRESULT is abstract;
   
   function get_SharingMode
   (
      This       : access IMediaCaptureInitializationSettings5_Interface
      ; RetVal : access Windows.Media.Capture.MediaCaptureSharingMode
   )
   return Windows.HRESULT is abstract;
   
   function put_SharingMode
   (
      This       : access IMediaCaptureInitializationSettings5_Interface
      ; value : Windows.Media.Capture.MediaCaptureSharingMode
   )
   return Windows.HRESULT is abstract;
   
   function get_MemoryPreference
   (
      This       : access IMediaCaptureInitializationSettings5_Interface
      ; RetVal : access Windows.Media.Capture.MediaCaptureMemoryPreference
   )
   return Windows.HRESULT is abstract;
   
   function put_MemoryPreference
   (
      This       : access IMediaCaptureInitializationSettings5_Interface
      ; value : Windows.Media.Capture.MediaCaptureMemoryPreference
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMediaCaptureInitializationSettings6 : aliased constant Windows.IID := (3001183047, 15793, 19763, (171, 99, 15, 250, 9, 5, 101, 133 ));
   
   type IMediaCaptureInitializationSettings6_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AlwaysPlaySystemShutterSound
   (
      This       : access IMediaCaptureInitializationSettings6_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AlwaysPlaySystemShutterSound
   (
      This       : access IMediaCaptureInitializationSettings6_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMediaCaptureStatics : aliased constant Windows.IID := (2901377535, 39405, 17989, (150, 94, 25, 37, 207, 198, 56, 52 ));
   
   type IMediaCaptureStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function IsVideoProfileSupported
   (
      This       : access IMediaCaptureStatics_Interface
      ; videoDeviceId : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function FindAllVideoProfiles
   (
      This       : access IMediaCaptureStatics_Interface
      ; videoDeviceId : Windows.String
      ; RetVal : access Windows.Media.Capture.IVectorView_IMediaCaptureVideoProfile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindConcurrentProfiles
   (
      This       : access IMediaCaptureStatics_Interface
      ; videoDeviceId : Windows.String
      ; RetVal : access Windows.Media.Capture.IVectorView_IMediaCaptureVideoProfile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindKnownVideoProfiles
   (
      This       : access IMediaCaptureStatics_Interface
      ; videoDeviceId : Windows.String
      ; name : Windows.Media.Capture.KnownVideoProfile
      ; RetVal : access Windows.Media.Capture.IVectorView_IMediaCaptureVideoProfile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMediaCapture : aliased constant Windows.IID := (3323657140, 64272, 18996, (172, 24, 202, 128, 217, 200, 231, 238 ));
   
   type IMediaCapture_Interface is interface and Windows.IInspectable_Interface;
   
   function InitializeAsync
   (
      This       : access IMediaCapture_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function InitializeWithSettingsAsync
   (
      This       : access IMediaCapture_Interface
      ; mediaCaptureInitializationSettings : Windows.Media.Capture.IMediaCaptureInitializationSettings
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function StartRecordToStorageFileAsync
   (
      This       : access IMediaCapture_Interface
      ; encodingProfile : Windows.Media.MediaProperties.IMediaEncodingProfile
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function StartRecordToStreamAsync
   (
      This       : access IMediaCapture_Interface
      ; encodingProfile : Windows.Media.MediaProperties.IMediaEncodingProfile
      ; stream : Windows.Storage.Streams.IRandomAccessStream
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function StartRecordToCustomSinkAsync
   (
      This       : access IMediaCapture_Interface
      ; encodingProfile : Windows.Media.MediaProperties.IMediaEncodingProfile
      ; customMediaSink : Windows.Media.IMediaExtension
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function StartRecordToCustomSinkIdAsync
   (
      This       : access IMediaCapture_Interface
      ; encodingProfile : Windows.Media.MediaProperties.IMediaEncodingProfile
      ; customSinkActivationId : Windows.String
      ; customSinkSettings : Windows.Foundation.Collections.IPropertySet
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function StopRecordAsync
   (
      This       : access IMediaCapture_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function CapturePhotoToStorageFileAsync
   (
      This       : access IMediaCapture_Interface
      ; type_x : Windows.Media.MediaProperties.IImageEncodingProperties
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function CapturePhotoToStreamAsync
   (
      This       : access IMediaCapture_Interface
      ; type_x : Windows.Media.MediaProperties.IImageEncodingProperties
      ; stream : Windows.Storage.Streams.IRandomAccessStream
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function AddEffectAsync
   (
      This       : access IMediaCapture_Interface
      ; mediaStreamType : Windows.Media.Capture.MediaStreamType
      ; effectActivationID : Windows.String
      ; effectSettings : Windows.Foundation.Collections.IPropertySet
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ClearEffectsAsync
   (
      This       : access IMediaCapture_Interface
      ; mediaStreamType : Windows.Media.Capture.MediaStreamType
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function SetEncoderProperty
   (
      This       : access IMediaCapture_Interface
      ; mediaStreamType : Windows.Media.Capture.MediaStreamType
      ; propertyId : Windows.Guid
      ; propertyValue : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function GetEncoderProperty
   (
      This       : access IMediaCapture_Interface
      ; mediaStreamType : Windows.Media.Capture.MediaStreamType
      ; propertyId : Windows.Guid
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function add_Failed
   (
      This       : access IMediaCapture_Interface
      ; errorEventHandler : Windows.Media.Capture.MediaCaptureFailedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Failed
   (
      This       : access IMediaCapture_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_RecordLimitationExceeded
   (
      This       : access IMediaCapture_Interface
      ; recordLimitationExceededEventHandler : Windows.Media.Capture.RecordLimitationExceededEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RecordLimitationExceeded
   (
      This       : access IMediaCapture_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_MediaCaptureSettings
   (
      This       : access IMediaCapture_Interface
      ; RetVal : access Windows.Media.Capture.IMediaCaptureSettings
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioDeviceController
   (
      This       : access IMediaCapture_Interface
      ; RetVal : access Windows.Media.Devices.IAudioDeviceController
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoDeviceController
   (
      This       : access IMediaCapture_Interface
      ; RetVal : access Windows.Media.Devices.IVideoDeviceController
   )
   return Windows.HRESULT is abstract;
   
   function SetPreviewMirroring
   (
      This       : access IMediaCapture_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetPreviewMirroring
   (
      This       : access IMediaCapture_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetPreviewRotation
   (
      This       : access IMediaCapture_Interface
      ; value : Windows.Media.Capture.VideoRotation
   )
   return Windows.HRESULT is abstract;
   
   function GetPreviewRotation
   (
      This       : access IMediaCapture_Interface
      ; RetVal : access Windows.Media.Capture.VideoRotation
   )
   return Windows.HRESULT is abstract;
   
   function SetRecordRotation
   (
      This       : access IMediaCapture_Interface
      ; value : Windows.Media.Capture.VideoRotation
   )
   return Windows.HRESULT is abstract;
   
   function GetRecordRotation
   (
      This       : access IMediaCapture_Interface
      ; RetVal : access Windows.Media.Capture.VideoRotation
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMediaCapture2 : aliased constant Windows.IID := (2630255200, 32161, 16451, (182, 82, 33, 184, 135, 141, 175, 249 ));
   
   type IMediaCapture2_Interface is interface and Windows.IInspectable_Interface;
   
   function PrepareLowLagRecordToStorageFileAsync
   (
      This       : access IMediaCapture2_Interface
      ; encodingProfile : Windows.Media.MediaProperties.IMediaEncodingProfile
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Media.Capture.IAsyncOperation_ILowLagMediaRecording -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function PrepareLowLagRecordToStreamAsync
   (
      This       : access IMediaCapture2_Interface
      ; encodingProfile : Windows.Media.MediaProperties.IMediaEncodingProfile
      ; stream : Windows.Storage.Streams.IRandomAccessStream
      ; RetVal : access Windows.Media.Capture.IAsyncOperation_ILowLagMediaRecording -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function PrepareLowLagRecordToCustomSinkAsync
   (
      This       : access IMediaCapture2_Interface
      ; encodingProfile : Windows.Media.MediaProperties.IMediaEncodingProfile
      ; customMediaSink : Windows.Media.IMediaExtension
      ; RetVal : access Windows.Media.Capture.IAsyncOperation_ILowLagMediaRecording -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function PrepareLowLagRecordToCustomSinkIdAsync
   (
      This       : access IMediaCapture2_Interface
      ; encodingProfile : Windows.Media.MediaProperties.IMediaEncodingProfile
      ; customSinkActivationId : Windows.String
      ; customSinkSettings : Windows.Foundation.Collections.IPropertySet
      ; RetVal : access Windows.Media.Capture.IAsyncOperation_ILowLagMediaRecording -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function PrepareLowLagPhotoCaptureAsync
   (
      This       : access IMediaCapture2_Interface
      ; type_x : Windows.Media.MediaProperties.IImageEncodingProperties
      ; RetVal : access Windows.Media.Capture.IAsyncOperation_ILowLagPhotoCapture -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function PrepareLowLagPhotoSequenceCaptureAsync
   (
      This       : access IMediaCapture2_Interface
      ; type_x : Windows.Media.MediaProperties.IImageEncodingProperties
      ; RetVal : access Windows.Media.Capture.IAsyncOperation_ILowLagPhotoSequenceCapture -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SetEncodingPropertiesAsync
   (
      This       : access IMediaCapture2_Interface
      ; mediaStreamType : Windows.Media.Capture.MediaStreamType
      ; mediaEncodingProperties : Windows.Media.MediaProperties.IMediaEncodingProperties
      ; encoderProperties : Windows.Media.MediaProperties.IMap_Guid_Object
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMediaCapture3 : aliased constant Windows.IID := (3558043440, 5476, 18030, (188, 10, 175, 148, 224, 42, 176, 22 ));
   
   type IMediaCapture3_Interface is interface and Windows.IInspectable_Interface;
   
   function PrepareVariablePhotoSequenceCaptureAsync
   (
      This       : access IMediaCapture3_Interface
      ; type_x : Windows.Media.MediaProperties.IImageEncodingProperties
      ; RetVal : access Windows.Media.Capture.Core.IAsyncOperation_IVariablePhotoSequenceCapture -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_FocusChanged
   (
      This       : access IMediaCapture3_Interface
      ; handler : TypedEventHandler_IMediaCapture3_add_FocusChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_FocusChanged
   (
      This       : access IMediaCapture3_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PhotoConfirmationCaptured
   (
      This       : access IMediaCapture3_Interface
      ; handler : TypedEventHandler_IMediaCapture3_add_PhotoConfirmationCaptured
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PhotoConfirmationCaptured
   (
      This       : access IMediaCapture3_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMediaCapture4 : aliased constant Windows.IID := (3134025686, 64264, 18759, (174, 162, 206, 20, 239, 240, 206, 19 ));
   
   type IMediaCapture4_Interface is interface and Windows.IInspectable_Interface;
   
   function AddAudioEffectAsync
   (
      This       : access IMediaCapture4_Interface
      ; definition : Windows.Media.Effects.IAudioEffectDefinition
      ; RetVal : access Windows.Media.IAsyncOperation_IMediaExtension -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function AddVideoEffectAsync
   (
      This       : access IMediaCapture4_Interface
      ; definition : Windows.Media.Effects.IVideoEffectDefinition
      ; mediaStreamType : Windows.Media.Capture.MediaStreamType
      ; RetVal : access Windows.Media.IAsyncOperation_IMediaExtension -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function PauseRecordAsync
   (
      This       : access IMediaCapture4_Interface
      ; behavior : Windows.Media.Devices.MediaCapturePauseBehavior
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ResumeRecordAsync
   (
      This       : access IMediaCapture4_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function add_CameraStreamStateChanged
   (
      This       : access IMediaCapture4_Interface
      ; handler : TypedEventHandler_IMediaCapture4_add_CameraStreamStateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CameraStreamStateChanged
   (
      This       : access IMediaCapture4_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_CameraStreamState
   (
      This       : access IMediaCapture4_Interface
      ; RetVal : access Windows.Media.Devices.CameraStreamState
   )
   return Windows.HRESULT is abstract;
   
   function GetPreviewFrameAsync
   (
      This       : access IMediaCapture4_Interface
      ; RetVal : access Windows.Media.IAsyncOperation_IVideoFrame -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetPreviewFrameCopyAsync
   (
      This       : access IMediaCapture4_Interface
      ; destination : Windows.Media.IVideoFrame
      ; RetVal : access Windows.Media.IAsyncOperation_IVideoFrame -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_ThermalStatusChanged
   (
      This       : access IMediaCapture4_Interface
      ; handler : TypedEventHandler_IMediaCapture4_add_ThermalStatusChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ThermalStatusChanged
   (
      This       : access IMediaCapture4_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_ThermalStatus
   (
      This       : access IMediaCapture4_Interface
      ; RetVal : access Windows.Media.Capture.MediaCaptureThermalStatus
   )
   return Windows.HRESULT is abstract;
   
   function PrepareAdvancedPhotoCaptureAsync
   (
      This       : access IMediaCapture4_Interface
      ; encodingProperties : Windows.Media.MediaProperties.IImageEncodingProperties
      ; RetVal : access Windows.Media.Capture.IAsyncOperation_IAdvancedPhotoCapture -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMediaCapture5 : aliased constant Windows.IID := (3665329186, 15003, 18208, (167, 30, 151, 144, 10, 49, 110, 90 ));
   
   type IMediaCapture5_Interface is interface and Windows.IInspectable_Interface;
   
   function RemoveEffectAsync
   (
      This       : access IMediaCapture5_Interface
      ; effect : Windows.Media.IMediaExtension
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function PauseRecordWithResultAsync
   (
      This       : access IMediaCapture5_Interface
      ; behavior : Windows.Media.Devices.MediaCapturePauseBehavior
      ; RetVal : access Windows.Media.Capture.IAsyncOperation_IMediaCapturePauseResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function StopRecordWithResultAsync
   (
      This       : access IMediaCapture5_Interface
      ; RetVal : access Windows.Media.Capture.IAsyncOperation_IMediaCaptureStopResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_FrameSources
   (
      This       : access IMediaCapture5_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateFrameReaderAsync
   (
      This       : access IMediaCapture5_Interface
      ; inputSource : Windows.Media.Capture.Frames.IMediaFrameSource
      ; RetVal : access Windows.Media.Capture.Frames.IAsyncOperation_IMediaFrameReader -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateFrameReaderWithSubtypeAsync
   (
      This       : access IMediaCapture5_Interface
      ; inputSource : Windows.Media.Capture.Frames.IMediaFrameSource
      ; outputSubtype : Windows.String
      ; RetVal : access Windows.Media.Capture.Frames.IAsyncOperation_IMediaFrameReader -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateFrameReaderWithSubtypeAndSizeAsync
   (
      This       : access IMediaCapture5_Interface
      ; inputSource : Windows.Media.Capture.Frames.IMediaFrameSource
      ; outputSubtype : Windows.String
      ; outputSize : Windows.Graphics.Imaging.BitmapSize
      ; RetVal : access Windows.Media.Capture.Frames.IAsyncOperation_IMediaFrameReader -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMediaCapture6 : aliased constant Windows.IID := (579422397, 19232, 19377, (159, 214, 165, 131, 33, 42, 16, 18 ));
   
   type IMediaCapture6_Interface is interface and Windows.IInspectable_Interface;
   
   function add_CaptureDeviceExclusiveControlStatusChanged
   (
      This       : access IMediaCapture6_Interface
      ; handler : TypedEventHandler_IMediaCapture6_add_CaptureDeviceExclusiveControlStatusChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CaptureDeviceExclusiveControlStatusChanged
   (
      This       : access IMediaCapture6_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function CreateMultiSourceFrameReaderAsync
   (
      This       : access IMediaCapture6_Interface
      ; inputSources : Windows.Media.Capture.Frames.IIterable_IMediaFrameSource
      ; RetVal : access Windows.Media.Capture.Frames.IAsyncOperation_IMultiSourceMediaFrameReader -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ILowLagPhotoCapture : aliased constant Windows.IID := (2742178231, 27460, 18237, (143, 36, 247, 3, 214, 192, 236, 68 ));
   
   type ILowLagPhotoCapture_Interface is interface and Windows.IInspectable_Interface;
   
   function CaptureAsync
   (
      This       : access ILowLagPhotoCapture_Interface
      ; RetVal : access Windows.Media.Capture.IAsyncOperation_ICapturedPhoto -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FinishAsync
   (
      This       : access ILowLagPhotoCapture_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAdvancedPhotoCapture : aliased constant Windows.IID := (2214570746, 26215, 17628, (151, 60, 166, 188, 229, 150, 170, 15 ));
   
   type IAdvancedPhotoCapture_Interface is interface and Windows.IInspectable_Interface;
   
   function CaptureAsync
   (
      This       : access IAdvancedPhotoCapture_Interface
      ; RetVal : access Windows.Media.Capture.IAsyncOperation_IAdvancedCapturedPhoto -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CaptureWithContextAsync
   (
      This       : access IAdvancedPhotoCapture_Interface
      ; context : Windows.Object
      ; RetVal : access Windows.Media.Capture.IAsyncOperation_IAdvancedCapturedPhoto -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_OptionalReferencePhotoCaptured
   (
      This       : access IAdvancedPhotoCapture_Interface
      ; handler : TypedEventHandler_IAdvancedPhotoCapture_add_OptionalReferencePhotoCaptured
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_OptionalReferencePhotoCaptured
   (
      This       : access IAdvancedPhotoCapture_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_AllPhotosCaptured
   (
      This       : access IAdvancedPhotoCapture_Interface
      ; handler : TypedEventHandler_IAdvancedPhotoCapture_add_AllPhotosCaptured
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AllPhotosCaptured
   (
      This       : access IAdvancedPhotoCapture_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function FinishAsync
   (
      This       : access IAdvancedPhotoCapture_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAdvancedCapturedPhoto : aliased constant Windows.IID := (4034032267, 45714, 17553, (157, 65, 153, 128, 122, 85, 11, 191 ));
   
   type IAdvancedCapturedPhoto_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Frame
   (
      This       : access IAdvancedCapturedPhoto_Interface
      ; RetVal : access Windows.Media.Capture.ICapturedFrame
   )
   return Windows.HRESULT is abstract;
   
   function get_Mode
   (
      This       : access IAdvancedCapturedPhoto_Interface
      ; RetVal : access Windows.Media.Devices.AdvancedPhotoMode
   )
   return Windows.HRESULT is abstract;
   
   function get_Context
   (
      This       : access IAdvancedCapturedPhoto_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAdvancedCapturedPhoto2 : aliased constant Windows.IID := (416247000, 53246, 17112, (129, 4, 1, 123, 179, 24, 244, 161 ));
   
   type IAdvancedCapturedPhoto2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FrameBoundsRelativeToReferencePhoto
   (
      This       : access IAdvancedCapturedPhoto2_Interface
      ; RetVal : access Windows.Foundation.IReference_Rect -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IOptionalReferencePhotoCapturedEventArgs : aliased constant Windows.IID := (1192200371, 7789, 16465, (156, 139, 241, 216, 90, 240, 71, 183 ));
   
   type IOptionalReferencePhotoCapturedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Frame
   (
      This       : access IOptionalReferencePhotoCapturedEventArgs_Interface
      ; RetVal : access Windows.Media.Capture.ICapturedFrame
   )
   return Windows.HRESULT is abstract;
   
   function get_Context
   (
      This       : access IOptionalReferencePhotoCapturedEventArgs_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ILowLagMediaRecording : aliased constant Windows.IID := (1103674103, 65343, 18928, (164, 119, 241, 149, 227, 206, 81, 8 ));
   
   type ILowLagMediaRecording_Interface is interface and Windows.IInspectable_Interface;
   
   function StartAsync
   (
      This       : access ILowLagMediaRecording_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function StopAsync
   (
      This       : access ILowLagMediaRecording_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function FinishAsync
   (
      This       : access ILowLagMediaRecording_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ILowLagMediaRecording2 : aliased constant Windows.IID := (1667876696, 22084, 16866, (151, 175, 142, 245, 106, 37, 226, 37 ));
   
   type ILowLagMediaRecording2_Interface is interface and Windows.IInspectable_Interface;
   
   function PauseAsync
   (
      This       : access ILowLagMediaRecording2_Interface
      ; behavior : Windows.Media.Devices.MediaCapturePauseBehavior
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ResumeAsync
   (
      This       : access ILowLagMediaRecording2_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ILowLagMediaRecording3 : aliased constant Windows.IID := (1546890002, 18679, 18394, (180, 30, 144, 136, 10, 95, 224, 236 ));
   
   type ILowLagMediaRecording3_Interface is interface and Windows.IInspectable_Interface;
   
   function PauseWithResultAsync
   (
      This       : access ILowLagMediaRecording3_Interface
      ; behavior : Windows.Media.Devices.MediaCapturePauseBehavior
      ; RetVal : access Windows.Media.Capture.IAsyncOperation_IMediaCapturePauseResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function StopWithResultAsync
   (
      This       : access ILowLagMediaRecording3_Interface
      ; RetVal : access Windows.Media.Capture.IAsyncOperation_IMediaCaptureStopResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMediaCapturePauseResult : aliased constant Windows.IID := (2932112547, 17527, 19204, (160, 111, 44, 28, 81, 130, 254, 157 ));
   
   type IMediaCapturePauseResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LastFrame
   (
      This       : access IMediaCapturePauseResult_Interface
      ; RetVal : access Windows.Media.IVideoFrame
   )
   return Windows.HRESULT is abstract;
   
   function get_RecordDuration
   (
      This       : access IMediaCapturePauseResult_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMediaCaptureStopResult : aliased constant Windows.IID := (4191906346, 41106, 19153, (151, 212, 242, 1, 249, 208, 130, 219 ));
   
   type IMediaCaptureStopResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LastFrame
   (
      This       : access IMediaCaptureStopResult_Interface
      ; RetVal : access Windows.Media.IVideoFrame
   )
   return Windows.HRESULT is abstract;
   
   function get_RecordDuration
   (
      This       : access IMediaCaptureStopResult_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ILowLagPhotoSequenceCapture : aliased constant Windows.IID := (2093172411, 47529, 19601, (143, 250, 40, 126, 156, 102, 134, 105 ));
   
   type ILowLagPhotoSequenceCapture_Interface is interface and Windows.IInspectable_Interface;
   
   function StartAsync
   (
      This       : access ILowLagPhotoSequenceCapture_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function StopAsync
   (
      This       : access ILowLagPhotoSequenceCapture_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function FinishAsync
   (
      This       : access ILowLagPhotoSequenceCapture_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function add_PhotoCaptured
   (
      This       : access ILowLagPhotoSequenceCapture_Interface
      ; handler : TypedEventHandler_ILowLagPhotoSequenceCapture_add_PhotoCaptured
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PhotoCaptured
   (
      This       : access ILowLagPhotoSequenceCapture_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICapturedFrameControlValues : aliased constant Windows.IID := (2428918655, 19981, 19620, (136, 45, 122, 20, 79, 237, 10, 144 ));
   
   type ICapturedFrameControlValues_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Exposure
   (
      This       : access ICapturedFrameControlValues_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ExposureCompensation
   (
      This       : access ICapturedFrameControlValues_Interface
      ; RetVal : access Windows.Foundation.IReference_Single -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_IsoSpeed
   (
      This       : access ICapturedFrameControlValues_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Focus
   (
      This       : access ICapturedFrameControlValues_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SceneMode
   (
      This       : access ICapturedFrameControlValues_Interface
      ; RetVal : access Windows.Media.Devices.IReference_CaptureSceneMode -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Flashed
   (
      This       : access ICapturedFrameControlValues_Interface
      ; RetVal : access Windows.Foundation.IReference_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_FlashPowerPercent
   (
      This       : access ICapturedFrameControlValues_Interface
      ; RetVal : access Windows.Foundation.IReference_Single -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_WhiteBalance
   (
      This       : access ICapturedFrameControlValues_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ZoomFactor
   (
      This       : access ICapturedFrameControlValues_Interface
      ; RetVal : access Windows.Foundation.IReference_Single -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICapturedFrameControlValues2 : aliased constant Windows.IID := (1342909320, 1746, 19111, (167, 219, 211, 122, 247, 51, 33, 216 ));
   
   type ICapturedFrameControlValues2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FocusState
   (
      This       : access ICapturedFrameControlValues2_Interface
      ; RetVal : access Windows.Media.Devices.IReference_MediaCaptureFocusState -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_IsoDigitalGain
   (
      This       : access ICapturedFrameControlValues2_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_IsoAnalogGain
   (
      This       : access ICapturedFrameControlValues2_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SensorFrameRate
   (
      This       : access ICapturedFrameControlValues2_Interface
      ; RetVal : access Windows.Media.MediaProperties.IMediaRatio
   )
   return Windows.HRESULT is abstract;
   
   function get_WhiteBalanceGain
   (
      This       : access ICapturedFrameControlValues2_Interface
      ; RetVal : access Windows.Media.Capture.IReference_WhiteBalanceGain -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IPhotoCapturedEventArgs : aliased constant Windows.IID := (926677953, 38990, 20464, (191, 133, 28, 0, 170, 188, 90, 69 ));
   
   type IPhotoCapturedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Frame
   (
      This       : access IPhotoCapturedEventArgs_Interface
      ; RetVal : access Windows.Media.Capture.ICapturedFrame
   )
   return Windows.HRESULT is abstract;
   
   function get_Thumbnail
   (
      This       : access IPhotoCapturedEventArgs_Interface
      ; RetVal : access Windows.Media.Capture.ICapturedFrame
   )
   return Windows.HRESULT is abstract;
   
   function get_CaptureTimeOffset
   (
      This       : access IPhotoCapturedEventArgs_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICapturedPhoto : aliased constant Windows.IID := (2966322778, 53196, 19820, (138, 209, 8, 105, 32, 138, 202, 22 ));
   
   type ICapturedPhoto_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Frame
   (
      This       : access ICapturedPhoto_Interface
      ; RetVal : access Windows.Media.Capture.ICapturedFrame
   )
   return Windows.HRESULT is abstract;
   
   function get_Thumbnail
   (
      This       : access ICapturedPhoto_Interface
      ; RetVal : access Windows.Media.Capture.ICapturedFrame
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICapturedFrame : aliased constant Windows.IID := (500358687, 22299, 17624, (142, 128, 160, 138, 21, 120, 118, 110 ));
   
   type ICapturedFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Width
   (
      This       : access ICapturedFrame_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Height
   (
      This       : access ICapturedFrame_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICapturedFrameWithSoftwareBitmap : aliased constant Windows.IID := (3046017902, 34051, 18869, (158, 134, 137, 125, 38, 163, 255, 61 ));
   
   type ICapturedFrameWithSoftwareBitmap_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SoftwareBitmap
   (
      This       : access ICapturedFrameWithSoftwareBitmap_Interface
      ; RetVal : access Windows.Graphics.Imaging.ISoftwareBitmap
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMediaCaptureVideoPreview : aliased constant Windows.IID := (661811315, 21662, 17535, (162, 10, 79, 3, 196, 121, 216, 192 ));
   
   type IMediaCaptureVideoPreview_Interface is interface and Windows.IInspectable_Interface;
   
   function StartPreviewAsync
   (
      This       : access IMediaCaptureVideoPreview_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function StartPreviewToCustomSinkAsync
   (
      This       : access IMediaCaptureVideoPreview_Interface
      ; encodingProfile : Windows.Media.MediaProperties.IMediaEncodingProfile
      ; customMediaSink : Windows.Media.IMediaExtension
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function StartPreviewToCustomSinkIdAsync
   (
      This       : access IMediaCaptureVideoPreview_Interface
      ; encodingProfile : Windows.Media.MediaProperties.IMediaEncodingProfile
      ; customSinkActivationId : Windows.String
      ; customSinkSettings : Windows.Foundation.Collections.IPropertySet
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function StopPreviewAsync
   (
      This       : access IMediaCaptureVideoPreview_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMediaCaptureSettings : aliased constant Windows.IID := (495168254, 27973, 17527, (141, 196, 172, 91, 192, 28, 64, 145 ));
   
   type IMediaCaptureSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AudioDeviceId
   (
      This       : access IMediaCaptureSettings_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoDeviceId
   (
      This       : access IMediaCaptureSettings_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_StreamingCaptureMode
   (
      This       : access IMediaCaptureSettings_Interface
      ; RetVal : access Windows.Media.Capture.StreamingCaptureMode
   )
   return Windows.HRESULT is abstract;
   
   function get_PhotoCaptureSource
   (
      This       : access IMediaCaptureSettings_Interface
      ; RetVal : access Windows.Media.Capture.PhotoCaptureSource
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoDeviceCharacteristic
   (
      This       : access IMediaCaptureSettings_Interface
      ; RetVal : access Windows.Media.Capture.VideoDeviceCharacteristic
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMediaCaptureSettings2 : aliased constant Windows.IID := (1872657659, 64159, 19219, (156, 190, 90, 185, 79, 31, 52, 147 ));
   
   type IMediaCaptureSettings2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ConcurrentRecordAndPhotoSupported
   (
      This       : access IMediaCaptureSettings2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ConcurrentRecordAndPhotoSequenceSupported
   (
      This       : access IMediaCaptureSettings2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CameraSoundRequiredForRegion
   (
      This       : access IMediaCaptureSettings2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Horizontal35mmEquivalentFocalLength
   (
      This       : access IMediaCaptureSettings2_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_PitchOffsetDegrees
   (
      This       : access IMediaCaptureSettings2_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Vertical35mmEquivalentFocalLength
   (
      This       : access IMediaCaptureSettings2_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_MediaCategory
   (
      This       : access IMediaCaptureSettings2_Interface
      ; RetVal : access Windows.Media.Capture.MediaCategory
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioProcessing
   (
      This       : access IMediaCaptureSettings2_Interface
      ; RetVal : access Windows.Media.AudioProcessing
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMediaCaptureFocusChangedEventArgs : aliased constant Windows.IID := (2179054719, 8823, 18750, (171, 238, 211, 244, 79, 249, 140, 4 ));
   
   type IMediaCaptureFocusChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FocusState
   (
      This       : access IMediaCaptureFocusChangedEventArgs_Interface
      ; RetVal : access Windows.Media.Devices.MediaCaptureFocusState
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IPhotoConfirmationCapturedEventArgs : aliased constant Windows.IID := (2873570930, 49802, 18471, (143, 141, 54, 54, 211, 190, 181, 30 ));
   
   type IPhotoConfirmationCapturedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Frame
   (
      This       : access IPhotoConfirmationCapturedEventArgs_Interface
      ; RetVal : access Windows.Media.Capture.ICapturedFrame
   )
   return Windows.HRESULT is abstract;
   
   function get_CaptureTimeOffset
   (
      This       : access IPhotoConfirmationCapturedEventArgs_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVideoStreamConfiguration : aliased constant Windows.IID := (3631680111, 17296, 19294, (173, 62, 15, 138, 240, 150, 52, 144 ));
   
   type IVideoStreamConfiguration_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InputProperties
   (
      This       : access IVideoStreamConfiguration_Interface
      ; RetVal : access Windows.Media.MediaProperties.IVideoEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_OutputProperties
   (
      This       : access IVideoStreamConfiguration_Interface
      ; RetVal : access Windows.Media.MediaProperties.IVideoEncodingProperties
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs : aliased constant Windows.IID := (2637140493, 42376, 17350, (137, 214, 90, 211, 34, 175, 0, 106 ));
   
   type IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs_Interface
      ; RetVal : access Windows.Media.Capture.MediaCaptureDeviceExclusiveControlStatus
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastManagerStatics : aliased constant Windows.IID := (911081867, 7758, 16671, (171, 62, 146, 149, 152, 68, 193, 86 ));
   
   type IAppBroadcastManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetGlobalSettings
   (
      This       : access IAppBroadcastManagerStatics_Interface
      ; RetVal : access Windows.Media.Capture.IAppBroadcastGlobalSettings
   )
   return Windows.HRESULT is abstract;
   
   function ApplyGlobalSettings
   (
      This       : access IAppBroadcastManagerStatics_Interface
      ; value : Windows.Media.Capture.IAppBroadcastGlobalSettings
   )
   return Windows.HRESULT is abstract;
   
   function GetProviderSettings
   (
      This       : access IAppBroadcastManagerStatics_Interface
      ; RetVal : access Windows.Media.Capture.IAppBroadcastProviderSettings
   )
   return Windows.HRESULT is abstract;
   
   function ApplyProviderSettings
   (
      This       : access IAppBroadcastManagerStatics_Interface
      ; value : Windows.Media.Capture.IAppBroadcastProviderSettings
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastGlobalSettings : aliased constant Windows.IID := (2999658405, 28924, 19991, (128, 189, 107, 160, 253, 63, 243, 160 ));
   
   type IAppBroadcastGlobalSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsBroadcastEnabled
   (
      This       : access IAppBroadcastGlobalSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDisabledByPolicy
   (
      This       : access IAppBroadcastGlobalSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsGpuConstrained
   (
      This       : access IAppBroadcastGlobalSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_HasHardwareEncoder
   (
      This       : access IAppBroadcastGlobalSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsAudioCaptureEnabled
   (
      This       : access IAppBroadcastGlobalSettings_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsAudioCaptureEnabled
   (
      This       : access IAppBroadcastGlobalSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsMicrophoneCaptureEnabledByDefault
   (
      This       : access IAppBroadcastGlobalSettings_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsMicrophoneCaptureEnabledByDefault
   (
      This       : access IAppBroadcastGlobalSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsEchoCancellationEnabled
   (
      This       : access IAppBroadcastGlobalSettings_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsEchoCancellationEnabled
   (
      This       : access IAppBroadcastGlobalSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_SystemAudioGain
   (
      This       : access IAppBroadcastGlobalSettings_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_SystemAudioGain
   (
      This       : access IAppBroadcastGlobalSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_MicrophoneGain
   (
      This       : access IAppBroadcastGlobalSettings_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_MicrophoneGain
   (
      This       : access IAppBroadcastGlobalSettings_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_IsCameraCaptureEnabledByDefault
   (
      This       : access IAppBroadcastGlobalSettings_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCameraCaptureEnabledByDefault
   (
      This       : access IAppBroadcastGlobalSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_SelectedCameraId
   (
      This       : access IAppBroadcastGlobalSettings_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectedCameraId
   (
      This       : access IAppBroadcastGlobalSettings_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_CameraOverlayLocation
   (
      This       : access IAppBroadcastGlobalSettings_Interface
      ; value : Windows.Media.Capture.AppBroadcastCameraOverlayLocation
   )
   return Windows.HRESULT is abstract;
   
   function get_CameraOverlayLocation
   (
      This       : access IAppBroadcastGlobalSettings_Interface
      ; RetVal : access Windows.Media.Capture.AppBroadcastCameraOverlayLocation
   )
   return Windows.HRESULT is abstract;
   
   function put_CameraOverlaySize
   (
      This       : access IAppBroadcastGlobalSettings_Interface
      ; value : Windows.Media.Capture.AppBroadcastCameraOverlaySize
   )
   return Windows.HRESULT is abstract;
   
   function get_CameraOverlaySize
   (
      This       : access IAppBroadcastGlobalSettings_Interface
      ; RetVal : access Windows.Media.Capture.AppBroadcastCameraOverlaySize
   )
   return Windows.HRESULT is abstract;
   
   function put_IsCursorImageCaptureEnabled
   (
      This       : access IAppBroadcastGlobalSettings_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCursorImageCaptureEnabled
   (
      This       : access IAppBroadcastGlobalSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastProviderSettings : aliased constant Windows.IID := (3272335202, 39240, 17807, (173, 80, 170, 6, 236, 3, 218, 8 ));
   
   type IAppBroadcastProviderSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function put_DefaultBroadcastTitle
   (
      This       : access IAppBroadcastProviderSettings_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DefaultBroadcastTitle
   (
      This       : access IAppBroadcastProviderSettings_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_AudioEncodingBitrate
   (
      This       : access IAppBroadcastProviderSettings_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioEncodingBitrate
   (
      This       : access IAppBroadcastProviderSettings_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_CustomVideoEncodingBitrate
   (
      This       : access IAppBroadcastProviderSettings_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_CustomVideoEncodingBitrate
   (
      This       : access IAppBroadcastProviderSettings_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_CustomVideoEncodingHeight
   (
      This       : access IAppBroadcastProviderSettings_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_CustomVideoEncodingHeight
   (
      This       : access IAppBroadcastProviderSettings_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_CustomVideoEncodingWidth
   (
      This       : access IAppBroadcastProviderSettings_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_CustomVideoEncodingWidth
   (
      This       : access IAppBroadcastProviderSettings_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_VideoEncodingBitrateMode
   (
      This       : access IAppBroadcastProviderSettings_Interface
      ; value : Windows.Media.Capture.AppBroadcastVideoEncodingBitrateMode
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoEncodingBitrateMode
   (
      This       : access IAppBroadcastProviderSettings_Interface
      ; RetVal : access Windows.Media.Capture.AppBroadcastVideoEncodingBitrateMode
   )
   return Windows.HRESULT is abstract;
   
   function put_VideoEncodingResolutionMode
   (
      This       : access IAppBroadcastProviderSettings_Interface
      ; value : Windows.Media.Capture.AppBroadcastVideoEncodingResolutionMode
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoEncodingResolutionMode
   (
      This       : access IAppBroadcastProviderSettings_Interface
      ; RetVal : access Windows.Media.Capture.AppBroadcastVideoEncodingResolutionMode
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastBackgroundServiceSignInInfo : aliased constant Windows.IID := (1584616053, 35016, 20170, (137, 186, 72, 37, 152, 93, 184, 128 ));
   
   type IAppBroadcastBackgroundServiceSignInInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SignInState
   (
      This       : access IAppBroadcastBackgroundServiceSignInInfo_Interface
      ; RetVal : access Windows.Media.Capture.AppBroadcastSignInState
   )
   return Windows.HRESULT is abstract;
   
   function put_OAuthRequestUri
   (
      This       : access IAppBroadcastBackgroundServiceSignInInfo_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_OAuthRequestUri
   (
      This       : access IAppBroadcastBackgroundServiceSignInInfo_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_OAuthCallbackUri
   (
      This       : access IAppBroadcastBackgroundServiceSignInInfo_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_OAuthCallbackUri
   (
      This       : access IAppBroadcastBackgroundServiceSignInInfo_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_AuthenticationResult
   (
      This       : access IAppBroadcastBackgroundServiceSignInInfo_Interface
      ; RetVal : access Windows.Security.Authentication.Web.IWebAuthenticationResult
   )
   return Windows.HRESULT is abstract;
   
   function put_UserName
   (
      This       : access IAppBroadcastBackgroundServiceSignInInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_UserName
   (
      This       : access IAppBroadcastBackgroundServiceSignInInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function add_SignInStateChanged
   (
      This       : access IAppBroadcastBackgroundServiceSignInInfo_Interface
      ; handler : TypedEventHandler_IAppBroadcastBackgroundServiceSignInInfo_add_SignInStateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SignInStateChanged
   (
      This       : access IAppBroadcastBackgroundServiceSignInInfo_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastBackgroundServiceSignInInfo2 : aliased constant Windows.IID := (2432968796, 25295, 19004, (167, 238, 174, 181, 7, 64, 70, 69 ));
   
   type IAppBroadcastBackgroundServiceSignInInfo2_Interface is interface and Windows.IInspectable_Interface;
   
   function add_UserNameChanged
   (
      This       : access IAppBroadcastBackgroundServiceSignInInfo2_Interface
      ; handler : TypedEventHandler_IAppBroadcastBackgroundServiceSignInInfo2_add_UserNameChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_UserNameChanged
   (
      This       : access IAppBroadcastBackgroundServiceSignInInfo2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastBackgroundServiceStreamInfo : aliased constant Windows.IID := (836502204, 39178, 18692, (170, 150, 254, 54, 67, 129, 241, 54 ));
   
   type IAppBroadcastBackgroundServiceStreamInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StreamState
   (
      This       : access IAppBroadcastBackgroundServiceStreamInfo_Interface
      ; RetVal : access Windows.Media.Capture.AppBroadcastStreamState
   )
   return Windows.HRESULT is abstract;
   
   function put_DesiredVideoEncodingBitrate
   (
      This       : access IAppBroadcastBackgroundServiceStreamInfo_Interface
      ; value : Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_DesiredVideoEncodingBitrate
   (
      This       : access IAppBroadcastBackgroundServiceStreamInfo_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function put_BandwidthTestBitrate
   (
      This       : access IAppBroadcastBackgroundServiceStreamInfo_Interface
      ; value : Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_BandwidthTestBitrate
   (
      This       : access IAppBroadcastBackgroundServiceStreamInfo_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function put_AudioCodec
   (
      This       : access IAppBroadcastBackgroundServiceStreamInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioCodec
   (
      This       : access IAppBroadcastBackgroundServiceStreamInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BroadcastStreamReader
   (
      This       : access IAppBroadcastBackgroundServiceStreamInfo_Interface
      ; RetVal : access Windows.Media.Capture.IAppBroadcastStreamReader
   )
   return Windows.HRESULT is abstract;
   
   function add_StreamStateChanged
   (
      This       : access IAppBroadcastBackgroundServiceStreamInfo_Interface
      ; handler : TypedEventHandler_IAppBroadcastBackgroundServiceStreamInfo_add_StreamStateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StreamStateChanged
   (
      This       : access IAppBroadcastBackgroundServiceStreamInfo_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_VideoEncodingResolutionChanged
   (
      This       : access IAppBroadcastBackgroundServiceStreamInfo_Interface
      ; handler : TypedEventHandler_IAppBroadcastBackgroundServiceStreamInfo_add_VideoEncodingResolutionChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_VideoEncodingResolutionChanged
   (
      This       : access IAppBroadcastBackgroundServiceStreamInfo_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_VideoEncodingBitrateChanged
   (
      This       : access IAppBroadcastBackgroundServiceStreamInfo_Interface
      ; handler : TypedEventHandler_IAppBroadcastBackgroundServiceStreamInfo_add_VideoEncodingBitrateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_VideoEncodingBitrateChanged
   (
      This       : access IAppBroadcastBackgroundServiceStreamInfo_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastBackgroundServiceStreamInfo2 : aliased constant Windows.IID := (3172900717, 38108, 20430, (149, 65, 169, 241, 41, 89, 99, 52 ));
   
   type IAppBroadcastBackgroundServiceStreamInfo2_Interface is interface and Windows.IInspectable_Interface;
   
   function ReportProblemWithStream
   (
      This       : access IAppBroadcastBackgroundServiceStreamInfo2_Interface
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastBackgroundService : aliased constant Windows.IID := (3134318378, 64148, 18169, (149, 252, 215, 21, 17, 205, 167, 11 ));
   
   type IAppBroadcastBackgroundService_Interface is interface and Windows.IInspectable_Interface;
   
   function put_PlugInState
   (
      This       : access IAppBroadcastBackgroundService_Interface
      ; value : Windows.Media.Capture.AppBroadcastPlugInState
   )
   return Windows.HRESULT is abstract;
   
   function get_PlugInState
   (
      This       : access IAppBroadcastBackgroundService_Interface
      ; RetVal : access Windows.Media.Capture.AppBroadcastPlugInState
   )
   return Windows.HRESULT is abstract;
   
   function put_SignInInfo
   (
      This       : access IAppBroadcastBackgroundService_Interface
      ; value : Windows.Media.Capture.IAppBroadcastBackgroundServiceSignInInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_SignInInfo
   (
      This       : access IAppBroadcastBackgroundService_Interface
      ; RetVal : access Windows.Media.Capture.IAppBroadcastBackgroundServiceSignInInfo
   )
   return Windows.HRESULT is abstract;
   
   function put_StreamInfo
   (
      This       : access IAppBroadcastBackgroundService_Interface
      ; value : Windows.Media.Capture.IAppBroadcastBackgroundServiceStreamInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_StreamInfo
   (
      This       : access IAppBroadcastBackgroundService_Interface
      ; RetVal : access Windows.Media.Capture.IAppBroadcastBackgroundServiceStreamInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_AppId
   (
      This       : access IAppBroadcastBackgroundService_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BroadcastTitle
   (
      This       : access IAppBroadcastBackgroundService_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ViewerCount
   (
      This       : access IAppBroadcastBackgroundService_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ViewerCount
   (
      This       : access IAppBroadcastBackgroundService_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function TerminateBroadcast
   (
      This       : access IAppBroadcastBackgroundService_Interface
      ; reason : Windows.Media.Capture.AppBroadcastTerminationReason
      ; providerSpecificReason : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function add_HeartbeatRequested
   (
      This       : access IAppBroadcastBackgroundService_Interface
      ; handler : TypedEventHandler_IAppBroadcastBackgroundService_add_HeartbeatRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_HeartbeatRequested
   (
      This       : access IAppBroadcastBackgroundService_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_TitleId
   (
      This       : access IAppBroadcastBackgroundService_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastBackgroundService2 : aliased constant Windows.IID := (4237085631, 21833, 19335, (149, 159, 35, 202, 64, 31, 212, 115 ));
   
   type IAppBroadcastBackgroundService2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_BroadcastTitle
   (
      This       : access IAppBroadcastBackgroundService2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BroadcastLanguage
   (
      This       : access IAppBroadcastBackgroundService2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_BroadcastLanguage
   (
      This       : access IAppBroadcastBackgroundService2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BroadcastChannel
   (
      This       : access IAppBroadcastBackgroundService2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_BroadcastChannel
   (
      This       : access IAppBroadcastBackgroundService2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function add_BroadcastTitleChanged
   (
      This       : access IAppBroadcastBackgroundService2_Interface
      ; handler : TypedEventHandler_IAppBroadcastBackgroundService2_add_BroadcastTitleChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_BroadcastTitleChanged
   (
      This       : access IAppBroadcastBackgroundService2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_BroadcastLanguageChanged
   (
      This       : access IAppBroadcastBackgroundService2_Interface
      ; handler : TypedEventHandler_IAppBroadcastBackgroundService2_add_BroadcastLanguageChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_BroadcastLanguageChanged
   (
      This       : access IAppBroadcastBackgroundService2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_BroadcastChannelChanged
   (
      This       : access IAppBroadcastBackgroundService2_Interface
      ; handler : TypedEventHandler_IAppBroadcastBackgroundService2_add_BroadcastChannelChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_BroadcastChannelChanged
   (
      This       : access IAppBroadcastBackgroundService2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastSignInStateChangedEventArgs : aliased constant Windows.IID := (45519524, 22809, 19102, (141, 94, 201, 187, 13, 211, 55, 122 ));
   
   type IAppBroadcastSignInStateChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SignInState
   (
      This       : access IAppBroadcastSignInStateChangedEventArgs_Interface
      ; RetVal : access Windows.Media.Capture.AppBroadcastSignInState
   )
   return Windows.HRESULT is abstract;
   
   function get_Result
   (
      This       : access IAppBroadcastSignInStateChangedEventArgs_Interface
      ; RetVal : access Windows.Media.Capture.AppBroadcastSignInResult
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastStreamStateChangedEventArgs : aliased constant Windows.IID := (1359521587, 53256, 19081, (147, 190, 88, 174, 217, 97, 55, 78 ));
   
   type IAppBroadcastStreamStateChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StreamState
   (
      This       : access IAppBroadcastStreamStateChangedEventArgs_Interface
      ; RetVal : access Windows.Media.Capture.AppBroadcastStreamState
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastHeartbeatRequestedEventArgs : aliased constant Windows.IID := (3466936963, 61009, 19903, (148, 114, 121, 169, 237, 78, 33, 101 ));
   
   type IAppBroadcastHeartbeatRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Handled
   (
      This       : access IAppBroadcastHeartbeatRequestedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Handled
   (
      This       : access IAppBroadcastHeartbeatRequestedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastStreamReader : aliased constant Windows.IID := (3006840057, 13156, 17504, (181, 241, 60, 194, 121, 106, 138, 162 ));
   
   type IAppBroadcastStreamReader_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AudioChannels
   (
      This       : access IAppBroadcastStreamReader_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioSampleRate
   (
      This       : access IAppBroadcastStreamReader_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioAacSequence
   (
      This       : access IAppBroadcastStreamReader_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioBitrate
   (
      This       : access IAppBroadcastStreamReader_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function TryGetNextAudioFrame
   (
      This       : access IAppBroadcastStreamReader_Interface
      ; RetVal : access Windows.Media.Capture.IAppBroadcastStreamAudioFrame
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoWidth
   (
      This       : access IAppBroadcastStreamReader_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoHeight
   (
      This       : access IAppBroadcastStreamReader_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoBitrate
   (
      This       : access IAppBroadcastStreamReader_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function TryGetNextVideoFrame
   (
      This       : access IAppBroadcastStreamReader_Interface
      ; RetVal : access Windows.Media.Capture.IAppBroadcastStreamVideoFrame
   )
   return Windows.HRESULT is abstract;
   
   function add_AudioFrameArrived
   (
      This       : access IAppBroadcastStreamReader_Interface
      ; value : TypedEventHandler_IAppBroadcastStreamReader_add_AudioFrameArrived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AudioFrameArrived
   (
      This       : access IAppBroadcastStreamReader_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_VideoFrameArrived
   (
      This       : access IAppBroadcastStreamReader_Interface
      ; value : TypedEventHandler_IAppBroadcastStreamReader_add_VideoFrameArrived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_VideoFrameArrived
   (
      This       : access IAppBroadcastStreamReader_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastStreamVideoFrame : aliased constant Windows.IID := (261607211, 51684, 20104, (129, 148, 216, 20, 203, 213, 133, 216 ));
   
   type IAppBroadcastStreamVideoFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function get_VideoHeader
   (
      This       : access IAppBroadcastStreamVideoFrame_Interface
      ; RetVal : access Windows.Media.Capture.IAppBroadcastStreamVideoHeader
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoBuffer
   (
      This       : access IAppBroadcastStreamVideoFrame_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastStreamAudioFrame : aliased constant Windows.IID := (4020980424, 8634, 17727, (139, 183, 94, 147, 138, 46, 154, 116 ));
   
   type IAppBroadcastStreamAudioFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AudioHeader
   (
      This       : access IAppBroadcastStreamAudioFrame_Interface
      ; RetVal : access Windows.Media.Capture.IAppBroadcastStreamAudioHeader
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioBuffer
   (
      This       : access IAppBroadcastStreamAudioFrame_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastStreamAudioHeader : aliased constant Windows.IID := (3206653296, 27512, 16918, (159, 7, 90, 255, 82, 86, 241, 183 ));
   
   type IAppBroadcastStreamAudioHeader_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AbsoluteTimestamp
   (
      This       : access IAppBroadcastStreamAudioHeader_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_RelativeTimestamp
   (
      This       : access IAppBroadcastStreamAudioHeader_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Duration
   (
      This       : access IAppBroadcastStreamAudioHeader_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_HasDiscontinuity
   (
      This       : access IAppBroadcastStreamAudioHeader_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_FrameId
   (
      This       : access IAppBroadcastStreamAudioHeader_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastStreamVideoHeader : aliased constant Windows.IID := (194952910, 32306, 17197, (140, 162, 54, 191, 16, 185, 244, 98 ));
   
   type IAppBroadcastStreamVideoHeader_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AbsoluteTimestamp
   (
      This       : access IAppBroadcastStreamVideoHeader_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_RelativeTimestamp
   (
      This       : access IAppBroadcastStreamVideoHeader_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Duration
   (
      This       : access IAppBroadcastStreamVideoHeader_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_IsKeyFrame
   (
      This       : access IAppBroadcastStreamVideoHeader_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_HasDiscontinuity
   (
      This       : access IAppBroadcastStreamVideoHeader_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_FrameId
   (
      This       : access IAppBroadcastStreamVideoHeader_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastTriggerDetails : aliased constant Windows.IID := (3739986741, 60510, 19855, (177, 192, 93, 166, 232, 199, 86, 56 ));
   
   type IAppBroadcastTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BackgroundService
   (
      This       : access IAppBroadcastTriggerDetails_Interface
      ; RetVal : access Windows.Media.Capture.IAppBroadcastBackgroundService
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastPlugInManagerStatics : aliased constant Windows.IID := (4066663456, 23670, 19676, (147, 100, 130, 254, 158, 182, 83, 77 ));
   
   type IAppBroadcastPlugInManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access IAppBroadcastPlugInManagerStatics_Interface
      ; RetVal : access Windows.Media.Capture.IAppBroadcastPlugInManager
   )
   return Windows.HRESULT is abstract;
   
   function GetForUser
   (
      This       : access IAppBroadcastPlugInManagerStatics_Interface
      ; user : Windows.System.IUser
      ; RetVal : access Windows.Media.Capture.IAppBroadcastPlugInManager
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastPlugInManager : aliased constant Windows.IID := (3847281017, 10145, 18855, (187, 244, 215, 169, 233, 208, 118, 104 ));
   
   type IAppBroadcastPlugInManager_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsBroadcastProviderAvailable
   (
      This       : access IAppBroadcastPlugInManager_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_PlugInList
   (
      This       : access IAppBroadcastPlugInManager_Interface
      ; RetVal : access Windows.Media.Capture.IVectorView_IAppBroadcastPlugIn -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_DefaultPlugIn
   (
      This       : access IAppBroadcastPlugInManager_Interface
      ; RetVal : access Windows.Media.Capture.IAppBroadcastPlugIn
   )
   return Windows.HRESULT is abstract;
   
   function put_DefaultPlugIn
   (
      This       : access IAppBroadcastPlugInManager_Interface
      ; value : Windows.Media.Capture.IAppBroadcastPlugIn
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastPlugIn : aliased constant Windows.IID := (1376525926, 25875, 17780, (172, 84, 35, 183, 151, 41, 97, 91 ));
   
   type IAppBroadcastPlugIn_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppId
   (
      This       : access IAppBroadcastPlugIn_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ProviderSettings
   (
      This       : access IAppBroadcastPlugIn_Interface
      ; RetVal : access Windows.Media.Capture.IAppBroadcastProviderSettings
   )
   return Windows.HRESULT is abstract;
   
   function get_Logo
   (
      This       : access IAppBroadcastPlugIn_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IAppBroadcastPlugIn_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastServices : aliased constant Windows.IID := (2254484694, 38555, 20028, (172, 58, 139, 4, 46, 228, 238, 99 ));
   
   type IAppBroadcastServices_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CaptureTargetType
   (
      This       : access IAppBroadcastServices_Interface
      ; RetVal : access Windows.Media.Capture.AppBroadcastCaptureTargetType
   )
   return Windows.HRESULT is abstract;
   
   function put_CaptureTargetType
   (
      This       : access IAppBroadcastServices_Interface
      ; value : Windows.Media.Capture.AppBroadcastCaptureTargetType
   )
   return Windows.HRESULT is abstract;
   
   function get_BroadcastTitle
   (
      This       : access IAppBroadcastServices_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_BroadcastTitle
   (
      This       : access IAppBroadcastServices_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BroadcastLanguage
   (
      This       : access IAppBroadcastServices_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_BroadcastLanguage
   (
      This       : access IAppBroadcastServices_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_UserName
   (
      This       : access IAppBroadcastServices_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CanCapture
   (
      This       : access IAppBroadcastServices_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function EnterBroadcastModeAsync
   (
      This       : access IAppBroadcastServices_Interface
      ; plugIn : Windows.Media.Capture.IAppBroadcastPlugIn
      ; RetVal : access Windows.Foundation.IAsyncOperation_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ExitBroadcastMode
   (
      This       : access IAppBroadcastServices_Interface
      ; reason : Windows.Media.Capture.AppBroadcastExitBroadcastModeReason
   )
   return Windows.HRESULT is abstract;
   
   function StartBroadcast
   (
      This       : access IAppBroadcastServices_Interface
   )
   return Windows.HRESULT is abstract;
   
   function PauseBroadcast
   (
      This       : access IAppBroadcastServices_Interface
   )
   return Windows.HRESULT is abstract;
   
   function ResumeBroadcast
   (
      This       : access IAppBroadcastServices_Interface
   )
   return Windows.HRESULT is abstract;
   
   function StartPreview
   (
      This       : access IAppBroadcastServices_Interface
      ; desiredSize : Windows.Foundation.Size
      ; RetVal : access Windows.Media.Capture.IAppBroadcastPreview
   )
   return Windows.HRESULT is abstract;
   
   function get_State
   (
      This       : access IAppBroadcastServices_Interface
      ; RetVal : access Windows.Media.Capture.IAppBroadcastState
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastState : aliased constant Windows.IID := (3993503085, 32921, 19933, (146, 46, 197, 109, 172, 88, 171, 251 ));
   
   type IAppBroadcastState_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsCaptureTargetRunning
   (
      This       : access IAppBroadcastState_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ViewerCount
   (
      This       : access IAppBroadcastState_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ShouldCaptureMicrophone
   (
      This       : access IAppBroadcastState_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ShouldCaptureMicrophone
   (
      This       : access IAppBroadcastState_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function RestartMicrophoneCapture
   (
      This       : access IAppBroadcastState_Interface
   )
   return Windows.HRESULT is abstract;
   
   function get_ShouldCaptureCamera
   (
      This       : access IAppBroadcastState_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ShouldCaptureCamera
   (
      This       : access IAppBroadcastState_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function RestartCameraCapture
   (
      This       : access IAppBroadcastState_Interface
   )
   return Windows.HRESULT is abstract;
   
   function get_EncodedVideoSize
   (
      This       : access IAppBroadcastState_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_MicrophoneCaptureState
   (
      This       : access IAppBroadcastState_Interface
      ; RetVal : access Windows.Media.Capture.AppBroadcastMicrophoneCaptureState
   )
   return Windows.HRESULT is abstract;
   
   function get_MicrophoneCaptureError
   (
      This       : access IAppBroadcastState_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_CameraCaptureState
   (
      This       : access IAppBroadcastState_Interface
      ; RetVal : access Windows.Media.Capture.AppBroadcastCameraCaptureState
   )
   return Windows.HRESULT is abstract;
   
   function get_CameraCaptureError
   (
      This       : access IAppBroadcastState_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_StreamState
   (
      This       : access IAppBroadcastState_Interface
      ; RetVal : access Windows.Media.Capture.AppBroadcastStreamState
   )
   return Windows.HRESULT is abstract;
   
   function get_PlugInState
   (
      This       : access IAppBroadcastState_Interface
      ; RetVal : access Windows.Media.Capture.AppBroadcastPlugInState
   )
   return Windows.HRESULT is abstract;
   
   function get_OAuthRequestUri
   (
      This       : access IAppBroadcastState_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_OAuthCallbackUri
   (
      This       : access IAppBroadcastState_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_AuthenticationResult
   (
      This       : access IAppBroadcastState_Interface
      ; RetVal : access Windows.Security.Authentication.Web.IWebAuthenticationResult
   )
   return Windows.HRESULT is abstract;
   
   function put_AuthenticationResult
   (
      This       : access IAppBroadcastState_Interface
      ; value : Windows.Security.Authentication.Web.IWebAuthenticationResult
   )
   return Windows.HRESULT is abstract;
   
   function put_SignInState
   (
      This       : access IAppBroadcastState_Interface
      ; value : Windows.Media.Capture.AppBroadcastSignInState
   )
   return Windows.HRESULT is abstract;
   
   function get_SignInState
   (
      This       : access IAppBroadcastState_Interface
      ; RetVal : access Windows.Media.Capture.AppBroadcastSignInState
   )
   return Windows.HRESULT is abstract;
   
   function get_TerminationReason
   (
      This       : access IAppBroadcastState_Interface
      ; RetVal : access Windows.Media.Capture.AppBroadcastTerminationReason
   )
   return Windows.HRESULT is abstract;
   
   function get_TerminationReasonPlugInSpecific
   (
      This       : access IAppBroadcastState_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function add_ViewerCountChanged
   (
      This       : access IAppBroadcastState_Interface
      ; value : TypedEventHandler_IAppBroadcastState_add_ViewerCountChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ViewerCountChanged
   (
      This       : access IAppBroadcastState_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_MicrophoneCaptureStateChanged
   (
      This       : access IAppBroadcastState_Interface
      ; value : TypedEventHandler_IAppBroadcastState_add_MicrophoneCaptureStateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MicrophoneCaptureStateChanged
   (
      This       : access IAppBroadcastState_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_CameraCaptureStateChanged
   (
      This       : access IAppBroadcastState_Interface
      ; value : TypedEventHandler_IAppBroadcastState_add_CameraCaptureStateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CameraCaptureStateChanged
   (
      This       : access IAppBroadcastState_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PlugInStateChanged
   (
      This       : access IAppBroadcastState_Interface
      ; handler : TypedEventHandler_IAppBroadcastState_add_PlugInStateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PlugInStateChanged
   (
      This       : access IAppBroadcastState_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_StreamStateChanged
   (
      This       : access IAppBroadcastState_Interface
      ; handler : TypedEventHandler_IAppBroadcastState_add_StreamStateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StreamStateChanged
   (
      This       : access IAppBroadcastState_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_CaptureTargetClosed
   (
      This       : access IAppBroadcastState_Interface
      ; value : TypedEventHandler_IAppBroadcastState_add_CaptureTargetClosed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CaptureTargetClosed
   (
      This       : access IAppBroadcastState_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastPreview : aliased constant Windows.IID := (347475802, 28234, 19328, (161, 79, 103, 238, 119, 209, 83, 231 ));
   
   type IAppBroadcastPreview_Interface is interface and Windows.IInspectable_Interface;
   
   function StopPreview
   (
      This       : access IAppBroadcastPreview_Interface
   )
   return Windows.HRESULT is abstract;
   
   function get_PreviewState
   (
      This       : access IAppBroadcastPreview_Interface
      ; RetVal : access Windows.Media.Capture.AppBroadcastPreviewState
   )
   return Windows.HRESULT is abstract;
   
   function get_ErrorCode
   (
      This       : access IAppBroadcastPreview_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_PreviewStateChanged
   (
      This       : access IAppBroadcastPreview_Interface
      ; value : TypedEventHandler_IAppBroadcastPreview_add_PreviewStateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PreviewStateChanged
   (
      This       : access IAppBroadcastPreview_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_PreviewStreamReader
   (
      This       : access IAppBroadcastPreview_Interface
      ; RetVal : access Windows.Media.Capture.IAppBroadcastPreviewStreamReader
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastPlugInStateChangedEventArgs : aliased constant Windows.IID := (1216467186, 43973, 20422, (132, 176, 137, 55, 11, 180, 114, 18 ));
   
   type IAppBroadcastPlugInStateChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PlugInState
   (
      This       : access IAppBroadcastPlugInStateChangedEventArgs_Interface
      ; RetVal : access Windows.Media.Capture.AppBroadcastPlugInState
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastPreviewStateChangedEventArgs : aliased constant Windows.IID := (1515713246, 36330, 20102, (144, 173, 3, 252, 38, 185, 101, 60 ));
   
   type IAppBroadcastPreviewStateChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PreviewState
   (
      This       : access IAppBroadcastPreviewStateChangedEventArgs_Interface
      ; RetVal : access Windows.Media.Capture.AppBroadcastPreviewState
   )
   return Windows.HRESULT is abstract;
   
   function get_ErrorCode
   (
      This       : access IAppBroadcastPreviewStateChangedEventArgs_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastPreviewStreamReader : aliased constant Windows.IID := (2451737936, 56127, 16552, (140, 212, 244, 227, 113, 221, 171, 55 ));
   
   type IAppBroadcastPreviewStreamReader_Interface is interface and Windows.IInspectable_Interface;
   
   function get_VideoWidth
   (
      This       : access IAppBroadcastPreviewStreamReader_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoHeight
   (
      This       : access IAppBroadcastPreviewStreamReader_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoStride
   (
      This       : access IAppBroadcastPreviewStreamReader_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoBitmapPixelFormat
   (
      This       : access IAppBroadcastPreviewStreamReader_Interface
      ; RetVal : access Windows.Graphics.Imaging.BitmapPixelFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoBitmapAlphaMode
   (
      This       : access IAppBroadcastPreviewStreamReader_Interface
      ; RetVal : access Windows.Graphics.Imaging.BitmapAlphaMode
   )
   return Windows.HRESULT is abstract;
   
   function TryGetNextVideoFrame
   (
      This       : access IAppBroadcastPreviewStreamReader_Interface
      ; RetVal : access Windows.Media.Capture.IAppBroadcastPreviewStreamVideoFrame
   )
   return Windows.HRESULT is abstract;
   
   function add_VideoFrameArrived
   (
      This       : access IAppBroadcastPreviewStreamReader_Interface
      ; value : TypedEventHandler_IAppBroadcastPreviewStreamReader_add_VideoFrameArrived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_VideoFrameArrived
   (
      This       : access IAppBroadcastPreviewStreamReader_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastPreviewStreamVideoFrame : aliased constant Windows.IID := (17809057, 38142, 17561, (184, 192, 141, 36, 66, 121, 251, 18 ));
   
   type IAppBroadcastPreviewStreamVideoFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function get_VideoHeader
   (
      This       : access IAppBroadcastPreviewStreamVideoFrame_Interface
      ; RetVal : access Windows.Media.Capture.IAppBroadcastPreviewStreamVideoHeader
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoBuffer
   (
      This       : access IAppBroadcastPreviewStreamVideoFrame_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastPreviewStreamVideoHeader : aliased constant Windows.IID := (2347720979, 55940, 17561, (167, 171, 135, 17, 140, 180, 161, 87 ));
   
   type IAppBroadcastPreviewStreamVideoHeader_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AbsoluteTimestamp
   (
      This       : access IAppBroadcastPreviewStreamVideoHeader_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_RelativeTimestamp
   (
      This       : access IAppBroadcastPreviewStreamVideoHeader_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Duration
   (
      This       : access IAppBroadcastPreviewStreamVideoHeader_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_FrameId
   (
      This       : access IAppBroadcastPreviewStreamVideoHeader_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastMicrophoneCaptureStateChangedEventArgs : aliased constant Windows.IID := (2825573865, 37952, 18696, (157, 9, 101, 183, 227, 21, 215, 149 ));
   
   type IAppBroadcastMicrophoneCaptureStateChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_State
   (
      This       : access IAppBroadcastMicrophoneCaptureStateChangedEventArgs_Interface
      ; RetVal : access Windows.Media.Capture.AppBroadcastMicrophoneCaptureState
   )
   return Windows.HRESULT is abstract;
   
   function get_ErrorCode
   (
      This       : access IAppBroadcastMicrophoneCaptureStateChangedEventArgs_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastCameraCaptureStateChangedEventArgs : aliased constant Windows.IID := (506678480, 47234, 19336, (134, 146, 5, 153, 154, 206, 183, 15 ));
   
   type IAppBroadcastCameraCaptureStateChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_State
   (
      This       : access IAppBroadcastCameraCaptureStateChangedEventArgs_Interface
      ; RetVal : access Windows.Media.Capture.AppBroadcastCameraCaptureState
   )
   return Windows.HRESULT is abstract;
   
   function get_ErrorCode
   (
      This       : access IAppBroadcastCameraCaptureStateChangedEventArgs_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppBroadcastViewerCountChangedEventArgs : aliased constant Windows.IID := (3873511461, 21505, 19166, (139, 210, 193, 78, 206, 230, 128, 125 ));
   
   type IAppBroadcastViewerCountChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ViewerCount
   (
      This       : access IAppBroadcastViewerCountChangedEventArgs_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppCaptureManagerStatics : aliased constant Windows.IID := (2107522727, 25218, 18229, (141, 78, 170, 69, 249, 15, 103, 35 ));
   
   type IAppCaptureManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCurrentSettings
   (
      This       : access IAppCaptureManagerStatics_Interface
      ; RetVal : access Windows.Media.Capture.IAppCaptureSettings
   )
   return Windows.HRESULT is abstract;
   
   function ApplySettings
   (
      This       : access IAppCaptureManagerStatics_Interface
      ; appCaptureSettings : Windows.Media.Capture.IAppCaptureSettings
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppCaptureAlternateShortcutKeys : aliased constant Windows.IID := (434692335, 9068, 16633, (179, 143, 155, 125, 214, 93, 28, 204 ));
   
   type IAppCaptureAlternateShortcutKeys_Interface is interface and Windows.IInspectable_Interface;
   
   function put_ToggleGameBarKey
   (
      This       : access IAppCaptureAlternateShortcutKeys_Interface
      ; value : Windows.System.VirtualKey
   )
   return Windows.HRESULT is abstract;
   
   function get_ToggleGameBarKey
   (
      This       : access IAppCaptureAlternateShortcutKeys_Interface
      ; RetVal : access Windows.System.VirtualKey
   )
   return Windows.HRESULT is abstract;
   
   function put_ToggleGameBarKeyModifiers
   (
      This       : access IAppCaptureAlternateShortcutKeys_Interface
      ; value : Windows.System.VirtualKeyModifiers
   )
   return Windows.HRESULT is abstract;
   
   function get_ToggleGameBarKeyModifiers
   (
      This       : access IAppCaptureAlternateShortcutKeys_Interface
      ; RetVal : access Windows.System.VirtualKeyModifiers
   )
   return Windows.HRESULT is abstract;
   
   function put_SaveHistoricalVideoKey
   (
      This       : access IAppCaptureAlternateShortcutKeys_Interface
      ; value : Windows.System.VirtualKey
   )
   return Windows.HRESULT is abstract;
   
   function get_SaveHistoricalVideoKey
   (
      This       : access IAppCaptureAlternateShortcutKeys_Interface
      ; RetVal : access Windows.System.VirtualKey
   )
   return Windows.HRESULT is abstract;
   
   function put_SaveHistoricalVideoKeyModifiers
   (
      This       : access IAppCaptureAlternateShortcutKeys_Interface
      ; value : Windows.System.VirtualKeyModifiers
   )
   return Windows.HRESULT is abstract;
   
   function get_SaveHistoricalVideoKeyModifiers
   (
      This       : access IAppCaptureAlternateShortcutKeys_Interface
      ; RetVal : access Windows.System.VirtualKeyModifiers
   )
   return Windows.HRESULT is abstract;
   
   function put_ToggleRecordingKey
   (
      This       : access IAppCaptureAlternateShortcutKeys_Interface
      ; value : Windows.System.VirtualKey
   )
   return Windows.HRESULT is abstract;
   
   function get_ToggleRecordingKey
   (
      This       : access IAppCaptureAlternateShortcutKeys_Interface
      ; RetVal : access Windows.System.VirtualKey
   )
   return Windows.HRESULT is abstract;
   
   function put_ToggleRecordingKeyModifiers
   (
      This       : access IAppCaptureAlternateShortcutKeys_Interface
      ; value : Windows.System.VirtualKeyModifiers
   )
   return Windows.HRESULT is abstract;
   
   function get_ToggleRecordingKeyModifiers
   (
      This       : access IAppCaptureAlternateShortcutKeys_Interface
      ; RetVal : access Windows.System.VirtualKeyModifiers
   )
   return Windows.HRESULT is abstract;
   
   function put_TakeScreenshotKey
   (
      This       : access IAppCaptureAlternateShortcutKeys_Interface
      ; value : Windows.System.VirtualKey
   )
   return Windows.HRESULT is abstract;
   
   function get_TakeScreenshotKey
   (
      This       : access IAppCaptureAlternateShortcutKeys_Interface
      ; RetVal : access Windows.System.VirtualKey
   )
   return Windows.HRESULT is abstract;
   
   function put_TakeScreenshotKeyModifiers
   (
      This       : access IAppCaptureAlternateShortcutKeys_Interface
      ; value : Windows.System.VirtualKeyModifiers
   )
   return Windows.HRESULT is abstract;
   
   function get_TakeScreenshotKeyModifiers
   (
      This       : access IAppCaptureAlternateShortcutKeys_Interface
      ; RetVal : access Windows.System.VirtualKeyModifiers
   )
   return Windows.HRESULT is abstract;
   
   function put_ToggleRecordingIndicatorKey
   (
      This       : access IAppCaptureAlternateShortcutKeys_Interface
      ; value : Windows.System.VirtualKey
   )
   return Windows.HRESULT is abstract;
   
   function get_ToggleRecordingIndicatorKey
   (
      This       : access IAppCaptureAlternateShortcutKeys_Interface
      ; RetVal : access Windows.System.VirtualKey
   )
   return Windows.HRESULT is abstract;
   
   function put_ToggleRecordingIndicatorKeyModifiers
   (
      This       : access IAppCaptureAlternateShortcutKeys_Interface
      ; value : Windows.System.VirtualKeyModifiers
   )
   return Windows.HRESULT is abstract;
   
   function get_ToggleRecordingIndicatorKeyModifiers
   (
      This       : access IAppCaptureAlternateShortcutKeys_Interface
      ; RetVal : access Windows.System.VirtualKeyModifiers
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppCaptureAlternateShortcutKeys2 : aliased constant Windows.IID := (3278278800, 56599, 18416, (149, 229, 206, 66, 40, 108, 243, 56 ));
   
   type IAppCaptureAlternateShortcutKeys2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_ToggleMicrophoneCaptureKey
   (
      This       : access IAppCaptureAlternateShortcutKeys2_Interface
      ; value : Windows.System.VirtualKey
   )
   return Windows.HRESULT is abstract;
   
   function get_ToggleMicrophoneCaptureKey
   (
      This       : access IAppCaptureAlternateShortcutKeys2_Interface
      ; RetVal : access Windows.System.VirtualKey
   )
   return Windows.HRESULT is abstract;
   
   function put_ToggleMicrophoneCaptureKeyModifiers
   (
      This       : access IAppCaptureAlternateShortcutKeys2_Interface
      ; value : Windows.System.VirtualKeyModifiers
   )
   return Windows.HRESULT is abstract;
   
   function get_ToggleMicrophoneCaptureKeyModifiers
   (
      This       : access IAppCaptureAlternateShortcutKeys2_Interface
      ; RetVal : access Windows.System.VirtualKeyModifiers
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppCaptureAlternateShortcutKeys3 : aliased constant Windows.IID := (2072069260, 16782, 18076, (164, 154, 69, 181, 151, 200, 38, 182 ));
   
   type IAppCaptureAlternateShortcutKeys3_Interface is interface and Windows.IInspectable_Interface;
   
   function put_ToggleCameraCaptureKey
   (
      This       : access IAppCaptureAlternateShortcutKeys3_Interface
      ; value : Windows.System.VirtualKey
   )
   return Windows.HRESULT is abstract;
   
   function get_ToggleCameraCaptureKey
   (
      This       : access IAppCaptureAlternateShortcutKeys3_Interface
      ; RetVal : access Windows.System.VirtualKey
   )
   return Windows.HRESULT is abstract;
   
   function put_ToggleCameraCaptureKeyModifiers
   (
      This       : access IAppCaptureAlternateShortcutKeys3_Interface
      ; value : Windows.System.VirtualKeyModifiers
   )
   return Windows.HRESULT is abstract;
   
   function get_ToggleCameraCaptureKeyModifiers
   (
      This       : access IAppCaptureAlternateShortcutKeys3_Interface
      ; RetVal : access Windows.System.VirtualKeyModifiers
   )
   return Windows.HRESULT is abstract;
   
   function put_ToggleBroadcastKey
   (
      This       : access IAppCaptureAlternateShortcutKeys3_Interface
      ; value : Windows.System.VirtualKey
   )
   return Windows.HRESULT is abstract;
   
   function get_ToggleBroadcastKey
   (
      This       : access IAppCaptureAlternateShortcutKeys3_Interface
      ; RetVal : access Windows.System.VirtualKey
   )
   return Windows.HRESULT is abstract;
   
   function put_ToggleBroadcastKeyModifiers
   (
      This       : access IAppCaptureAlternateShortcutKeys3_Interface
      ; value : Windows.System.VirtualKeyModifiers
   )
   return Windows.HRESULT is abstract;
   
   function get_ToggleBroadcastKeyModifiers
   (
      This       : access IAppCaptureAlternateShortcutKeys3_Interface
      ; RetVal : access Windows.System.VirtualKeyModifiers
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppCaptureSettings : aliased constant Windows.IID := (342375046, 34823, 18643, (136, 58, 151, 14, 228, 83, 42, 57 ));
   
   type IAppCaptureSettings_Interface is interface and Windows.IInspectable_Interface;
   
   function put_AppCaptureDestinationFolder
   (
      This       : access IAppCaptureSettings_Interface
      ; value : Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function get_AppCaptureDestinationFolder
   (
      This       : access IAppCaptureSettings_Interface
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function put_AudioEncodingBitrate
   (
      This       : access IAppCaptureSettings_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioEncodingBitrate
   (
      This       : access IAppCaptureSettings_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_IsAudioCaptureEnabled
   (
      This       : access IAppCaptureSettings_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsAudioCaptureEnabled
   (
      This       : access IAppCaptureSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CustomVideoEncodingBitrate
   (
      This       : access IAppCaptureSettings_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_CustomVideoEncodingBitrate
   (
      This       : access IAppCaptureSettings_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_CustomVideoEncodingHeight
   (
      This       : access IAppCaptureSettings_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_CustomVideoEncodingHeight
   (
      This       : access IAppCaptureSettings_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_CustomVideoEncodingWidth
   (
      This       : access IAppCaptureSettings_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_CustomVideoEncodingWidth
   (
      This       : access IAppCaptureSettings_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_HistoricalBufferLength
   (
      This       : access IAppCaptureSettings_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_HistoricalBufferLength
   (
      This       : access IAppCaptureSettings_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_HistoricalBufferLengthUnit
   (
      This       : access IAppCaptureSettings_Interface
      ; value : Windows.Media.Capture.AppCaptureHistoricalBufferLengthUnit
   )
   return Windows.HRESULT is abstract;
   
   function get_HistoricalBufferLengthUnit
   (
      This       : access IAppCaptureSettings_Interface
      ; RetVal : access Windows.Media.Capture.AppCaptureHistoricalBufferLengthUnit
   )
   return Windows.HRESULT is abstract;
   
   function put_IsHistoricalCaptureEnabled
   (
      This       : access IAppCaptureSettings_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsHistoricalCaptureEnabled
   (
      This       : access IAppCaptureSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsHistoricalCaptureOnBatteryAllowed
   (
      This       : access IAppCaptureSettings_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsHistoricalCaptureOnBatteryAllowed
   (
      This       : access IAppCaptureSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsHistoricalCaptureOnWirelessDisplayAllowed
   (
      This       : access IAppCaptureSettings_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsHistoricalCaptureOnWirelessDisplayAllowed
   (
      This       : access IAppCaptureSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_MaximumRecordLength
   (
      This       : access IAppCaptureSettings_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_MaximumRecordLength
   (
      This       : access IAppCaptureSettings_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_ScreenshotDestinationFolder
   (
      This       : access IAppCaptureSettings_Interface
      ; value : Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function get_ScreenshotDestinationFolder
   (
      This       : access IAppCaptureSettings_Interface
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function put_VideoEncodingBitrateMode
   (
      This       : access IAppCaptureSettings_Interface
      ; value : Windows.Media.Capture.AppCaptureVideoEncodingBitrateMode
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoEncodingBitrateMode
   (
      This       : access IAppCaptureSettings_Interface
      ; RetVal : access Windows.Media.Capture.AppCaptureVideoEncodingBitrateMode
   )
   return Windows.HRESULT is abstract;
   
   function put_VideoEncodingResolutionMode
   (
      This       : access IAppCaptureSettings_Interface
      ; value : Windows.Media.Capture.AppCaptureVideoEncodingResolutionMode
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoEncodingResolutionMode
   (
      This       : access IAppCaptureSettings_Interface
      ; RetVal : access Windows.Media.Capture.AppCaptureVideoEncodingResolutionMode
   )
   return Windows.HRESULT is abstract;
   
   function put_IsAppCaptureEnabled
   (
      This       : access IAppCaptureSettings_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsAppCaptureEnabled
   (
      This       : access IAppCaptureSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCpuConstrained
   (
      This       : access IAppCaptureSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDisabledByPolicy
   (
      This       : access IAppCaptureSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsMemoryConstrained
   (
      This       : access IAppCaptureSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_HasHardwareEncoder
   (
      This       : access IAppCaptureSettings_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppCaptureSettings2 : aliased constant Windows.IID := (4239970023, 57963, 18287, (155, 26, 236, 52, 45, 42, 143, 222 ));
   
   type IAppCaptureSettings2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsGpuConstrained
   (
      This       : access IAppCaptureSettings2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AlternateShortcutKeys
   (
      This       : access IAppCaptureSettings2_Interface
      ; RetVal : access Windows.Media.Capture.IAppCaptureAlternateShortcutKeys
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppCaptureSettings3 : aliased constant Windows.IID := (2838823678, 35010, 17110, (170, 170, 64, 254, 255, 215, 90, 236 ));
   
   type IAppCaptureSettings3_Interface is interface and Windows.IInspectable_Interface;
   
   function put_IsMicrophoneCaptureEnabled
   (
      This       : access IAppCaptureSettings3_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsMicrophoneCaptureEnabled
   (
      This       : access IAppCaptureSettings3_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppCaptureSettings4 : aliased constant Windows.IID := (130185036, 6785, 18479, (162, 68, 4, 157, 149, 242, 91, 11 ));
   
   type IAppCaptureSettings4_Interface is interface and Windows.IInspectable_Interface;
   
   function put_IsMicrophoneCaptureEnabledByDefault
   (
      This       : access IAppCaptureSettings4_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsMicrophoneCaptureEnabledByDefault
   (
      This       : access IAppCaptureSettings4_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_SystemAudioGain
   (
      This       : access IAppCaptureSettings4_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_SystemAudioGain
   (
      This       : access IAppCaptureSettings4_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_MicrophoneGain
   (
      This       : access IAppCaptureSettings4_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_MicrophoneGain
   (
      This       : access IAppCaptureSettings4_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_VideoEncodingFrameRateMode
   (
      This       : access IAppCaptureSettings4_Interface
      ; value : Windows.Media.Capture.AppCaptureVideoEncodingFrameRateMode
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoEncodingFrameRateMode
   (
      This       : access IAppCaptureSettings4_Interface
      ; RetVal : access Windows.Media.Capture.AppCaptureVideoEncodingFrameRateMode
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppCaptureSettings5 : aliased constant Windows.IID := (411649314, 45288, 19360, (143, 19, 62, 170, 95, 164, 1, 59 ));
   
   type IAppCaptureSettings5_Interface is interface and Windows.IInspectable_Interface;
   
   function put_IsEchoCancellationEnabled
   (
      This       : access IAppCaptureSettings5_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsEchoCancellationEnabled
   (
      This       : access IAppCaptureSettings5_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsCursorImageCaptureEnabled
   (
      This       : access IAppCaptureSettings5_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCursorImageCaptureEnabled
   (
      This       : access IAppCaptureSettings5_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppCaptureServices : aliased constant Windows.IID := (1157546165, 13557, 20248, (174, 140, 185, 18, 58, 187, 252, 13 ));
   
   type IAppCaptureServices_Interface is interface and Windows.IInspectable_Interface;
   
   function Record_x
   (
      This       : access IAppCaptureServices_Interface
      ; RetVal : access Windows.Media.Capture.IAppCaptureRecordOperation
   )
   return Windows.HRESULT is abstract;
   
   function RecordTimeSpan
   (
      This       : access IAppCaptureServices_Interface
      ; startTime : Windows.Foundation.DateTime
      ; duration : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.Media.Capture.IAppCaptureRecordOperation
   )
   return Windows.HRESULT is abstract;
   
   function get_CanCapture
   (
      This       : access IAppCaptureServices_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_State
   (
      This       : access IAppCaptureServices_Interface
      ; RetVal : access Windows.Media.Capture.IAppCaptureState
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppCaptureState : aliased constant Windows.IID := (1930642290, 54507, 17614, (149, 56, 70, 95, 80, 106, 196, 234 ));
   
   type IAppCaptureState_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsTargetRunning
   (
      This       : access IAppCaptureState_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsHistoricalCaptureEnabled
   (
      This       : access IAppCaptureState_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ShouldCaptureMicrophone
   (
      This       : access IAppCaptureState_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ShouldCaptureMicrophone
   (
      This       : access IAppCaptureState_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function RestartMicrophoneCapture
   (
      This       : access IAppCaptureState_Interface
   )
   return Windows.HRESULT is abstract;
   
   function get_MicrophoneCaptureState
   (
      This       : access IAppCaptureState_Interface
      ; RetVal : access Windows.Media.Capture.AppCaptureMicrophoneCaptureState
   )
   return Windows.HRESULT is abstract;
   
   function get_MicrophoneCaptureError
   (
      This       : access IAppCaptureState_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function add_MicrophoneCaptureStateChanged
   (
      This       : access IAppCaptureState_Interface
      ; value : TypedEventHandler_IAppCaptureState_add_MicrophoneCaptureStateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MicrophoneCaptureStateChanged
   (
      This       : access IAppCaptureState_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_CaptureTargetClosed
   (
      This       : access IAppCaptureState_Interface
      ; value : TypedEventHandler_IAppCaptureState_add_CaptureTargetClosed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CaptureTargetClosed
   (
      This       : access IAppCaptureState_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppCaptureMicrophoneCaptureStateChangedEventArgs : aliased constant Windows.IID := (843916446, 17852, 19509, (188, 53, 228, 105, 252, 122, 105, 224 ));
   
   type IAppCaptureMicrophoneCaptureStateChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_State
   (
      This       : access IAppCaptureMicrophoneCaptureStateChangedEventArgs_Interface
      ; RetVal : access Windows.Media.Capture.AppCaptureMicrophoneCaptureState
   )
   return Windows.HRESULT is abstract;
   
   function get_ErrorCode
   (
      This       : access IAppCaptureMicrophoneCaptureStateChangedEventArgs_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppCaptureRecordOperation : aliased constant Windows.IID := (3328188585, 5432, 18780, (155, 187, 43, 168, 112, 236, 88, 97 ));
   
   type IAppCaptureRecordOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function StopRecording
   (
      This       : access IAppCaptureRecordOperation_Interface
   )
   return Windows.HRESULT is abstract;
   
   function get_State
   (
      This       : access IAppCaptureRecordOperation_Interface
      ; RetVal : access Windows.Media.Capture.AppCaptureRecordingState
   )
   return Windows.HRESULT is abstract;
   
   function get_ErrorCode
   (
      This       : access IAppCaptureRecordOperation_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Duration
   (
      This       : access IAppCaptureRecordOperation_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_File
   (
      This       : access IAppCaptureRecordOperation_Interface
      ; RetVal : access Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   function get_IsFileTruncated
   (
      This       : access IAppCaptureRecordOperation_Interface
      ; RetVal : access Windows.Foundation.IReference_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_StateChanged
   (
      This       : access IAppCaptureRecordOperation_Interface
      ; value : TypedEventHandler_IAppCaptureRecordOperation_add_StateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StateChanged
   (
      This       : access IAppCaptureRecordOperation_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_DurationGenerated
   (
      This       : access IAppCaptureRecordOperation_Interface
      ; value : TypedEventHandler_IAppCaptureRecordOperation_add_DurationGenerated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DurationGenerated
   (
      This       : access IAppCaptureRecordOperation_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_FileGenerated
   (
      This       : access IAppCaptureRecordOperation_Interface
      ; value : TypedEventHandler_IAppCaptureRecordOperation_add_FileGenerated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_FileGenerated
   (
      This       : access IAppCaptureRecordOperation_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppCaptureRecordingStateChangedEventArgs : aliased constant Windows.IID := (620529426, 58117, 18701, (180, 21, 107, 28, 144, 73, 115, 107 ));
   
   type IAppCaptureRecordingStateChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_State
   (
      This       : access IAppCaptureRecordingStateChangedEventArgs_Interface
      ; RetVal : access Windows.Media.Capture.AppCaptureRecordingState
   )
   return Windows.HRESULT is abstract;
   
   function get_ErrorCode
   (
      This       : access IAppCaptureRecordingStateChangedEventArgs_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppCaptureDurationGeneratedEventArgs : aliased constant Windows.IID := (3254081083, 65441, 17609, (151, 95, 39, 251, 235, 85, 59, 53 ));
   
   type IAppCaptureDurationGeneratedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Duration
   (
      This       : access IAppCaptureDurationGeneratedEventArgs_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppCaptureFileGeneratedEventArgs : aliased constant Windows.IID := (1099561972, 18014, 17855, (144, 127, 22, 91, 63, 178, 55, 88 ));
   
   type IAppCaptureFileGeneratedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_File
   (
      This       : access IAppCaptureFileGeneratedEventArgs_Interface
      ; RetVal : access Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAppCaptureMetadataWriter : aliased constant Windows.IID := (3771615351, 39599, 18100, (173, 49, 106, 96, 180, 65, 199, 128 ));
   
   type IAppCaptureMetadataWriter_Interface is interface and Windows.IInspectable_Interface;
   
   function AddStringEvent
   (
      This       : access IAppCaptureMetadataWriter_Interface
      ; name : Windows.String
      ; value : Windows.String
      ; priority : Windows.Media.Capture.AppCaptureMetadataPriority
   )
   return Windows.HRESULT is abstract;
   
   function AddInt32Event
   (
      This       : access IAppCaptureMetadataWriter_Interface
      ; name : Windows.String
      ; value : Windows.Int32
      ; priority : Windows.Media.Capture.AppCaptureMetadataPriority
   )
   return Windows.HRESULT is abstract;
   
   function AddDoubleEvent
   (
      This       : access IAppCaptureMetadataWriter_Interface
      ; name : Windows.String
      ; value : Windows.Double
      ; priority : Windows.Media.Capture.AppCaptureMetadataPriority
   )
   return Windows.HRESULT is abstract;
   
   function StartStringState
   (
      This       : access IAppCaptureMetadataWriter_Interface
      ; name : Windows.String
      ; value : Windows.String
      ; priority : Windows.Media.Capture.AppCaptureMetadataPriority
   )
   return Windows.HRESULT is abstract;
   
   function StartInt32State
   (
      This       : access IAppCaptureMetadataWriter_Interface
      ; name : Windows.String
      ; value : Windows.Int32
      ; priority : Windows.Media.Capture.AppCaptureMetadataPriority
   )
   return Windows.HRESULT is abstract;
   
   function StartDoubleState
   (
      This       : access IAppCaptureMetadataWriter_Interface
      ; name : Windows.String
      ; value : Windows.Double
      ; priority : Windows.Media.Capture.AppCaptureMetadataPriority
   )
   return Windows.HRESULT is abstract;
   
   function StopState
   (
      This       : access IAppCaptureMetadataWriter_Interface
      ; name : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function StopAllStates
   (
      This       : access IAppCaptureMetadataWriter_Interface
   )
   return Windows.HRESULT is abstract;
   
   function get_RemainingStorageBytesAvailable
   (
      This       : access IAppCaptureMetadataWriter_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function add_MetadataPurged
   (
      This       : access IAppCaptureMetadataWriter_Interface
      ; handler : TypedEventHandler_IAppCaptureMetadataWriter_add_MetadataPurged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MetadataPurged
   (
      This       : access IAppCaptureMetadataWriter_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ICameraOptionsUIStatics : aliased constant Windows.IID := (990731828, 14598, 19325, (148, 108, 123, 222, 132, 68, 153, 174 ));
   
   type ICameraOptionsUIStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Show
   (
      This       : access ICameraOptionsUIStatics_Interface
      ; mediaCapture : Windows.Media.Capture.IMediaCapture
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IGameBarServicesManagerStatics : aliased constant Windows.IID := (885110294, 65317, 18322, (152, 242, 211, 117, 63, 21, 172, 19 ));
   
   type IGameBarServicesManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access IGameBarServicesManagerStatics_Interface
      ; RetVal : access Windows.Media.Capture.IGameBarServicesManager
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IGameBarServicesManager : aliased constant Windows.IID := (978033914, 32651, 19552, (157, 187, 11, 205, 38, 45, 255, 198 ));
   
   type IGameBarServicesManager_Interface is interface and Windows.IInspectable_Interface;
   
   function add_GameBarServicesCreated
   (
      This       : access IGameBarServicesManager_Interface
      ; value : TypedEventHandler_IGameBarServicesManager_add_GameBarServicesCreated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_GameBarServicesCreated
   (
      This       : access IGameBarServicesManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IGameBarServicesManagerGameBarServicesCreatedEventArgs : aliased constant Windows.IID := (3991780764, 5182, 18851, (165, 234, 11, 25, 149, 200, 212, 110 ));
   
   type IGameBarServicesManagerGameBarServicesCreatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_GameBarServices
   (
      This       : access IGameBarServicesManagerGameBarServicesCreatedEventArgs_Interface
      ; RetVal : access Windows.Media.Capture.IGameBarServices
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IGameBarServices : aliased constant Windows.IID := (767470935, 20646, 18846, (140, 108, 211, 48, 167, 49, 23, 150 ));
   
   type IGameBarServices_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TargetCapturePolicy
   (
      This       : access IGameBarServices_Interface
      ; RetVal : access Windows.Media.Capture.GameBarTargetCapturePolicy
   )
   return Windows.HRESULT is abstract;
   
   function EnableCapture
   (
      This       : access IGameBarServices_Interface
   )
   return Windows.HRESULT is abstract;
   
   function DisableCapture
   (
      This       : access IGameBarServices_Interface
   )
   return Windows.HRESULT is abstract;
   
   function get_TargetInfo
   (
      This       : access IGameBarServices_Interface
      ; RetVal : access Windows.Media.Capture.IGameBarServicesTargetInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_SessionId
   (
      This       : access IGameBarServices_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AppBroadcastServices
   (
      This       : access IGameBarServices_Interface
      ; RetVal : access Windows.Media.Capture.IAppBroadcastServices
   )
   return Windows.HRESULT is abstract;
   
   function get_AppCaptureServices
   (
      This       : access IGameBarServices_Interface
      ; RetVal : access Windows.Media.Capture.IAppCaptureServices
   )
   return Windows.HRESULT is abstract;
   
   function add_CommandReceived
   (
      This       : access IGameBarServices_Interface
      ; value : TypedEventHandler_IGameBarServices_add_CommandReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CommandReceived
   (
      This       : access IGameBarServices_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IGameBarServicesTargetInfo : aliased constant Windows.IID := (3022008210, 5649, 19973, (182, 239, 223, 215, 55, 174, 51, 176 ));
   
   type IGameBarServicesTargetInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DisplayName
   (
      This       : access IGameBarServicesTargetInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AppId
   (
      This       : access IGameBarServicesTargetInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TitleId
   (
      This       : access IGameBarServicesTargetInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayMode
   (
      This       : access IGameBarServicesTargetInfo_Interface
      ; RetVal : access Windows.Media.Capture.GameBarServicesDisplayMode
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IGameBarServicesCommandEventArgs : aliased constant Windows.IID := (2806130354, 61814, 20431, (143, 187, 207, 105, 139, 46, 184, 224 ));
   
   type IGameBarServicesCommandEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Command
   (
      This       : access IGameBarServicesCommandEventArgs_Interface
      ; RetVal : access Windows.Media.Capture.GameBarCommand
   )
   return Windows.HRESULT is abstract;
   
   function get_Origin
   (
      This       : access IGameBarServicesCommandEventArgs_Interface
      ; RetVal : access Windows.Media.Capture.GameBarCommandOrigin
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_ISourceSuspensionChangedEventArgs : aliased constant Windows.IID := (785283934, 54427, 17300, (188, 50, 249, 125, 108, 237, 236, 28 ));
   
   type ISourceSuspensionChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsAudioSuspended
   (
      This       : access ISourceSuspensionChangedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsVideoSuspended
   (
      This       : access ISourceSuspensionChangedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IScreenCapture : aliased constant Windows.IID := (2300026615, 52498, 19982, (166, 212, 91, 61, 233, 139, 46, 155 ));
   
   type IScreenCapture_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AudioSource
   (
      This       : access IScreenCapture_Interface
      ; RetVal : access Windows.Media.Core.IMediaSource
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoSource
   (
      This       : access IScreenCapture_Interface
      ; RetVal : access Windows.Media.Core.IMediaSource
   )
   return Windows.HRESULT is abstract;
   
   function get_IsAudioSuspended
   (
      This       : access IScreenCapture_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsVideoSuspended
   (
      This       : access IScreenCapture_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_SourceSuspensionChanged
   (
      This       : access IScreenCapture_Interface
      ; handler : TypedEventHandler_IScreenCapture_add_SourceSuspensionChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SourceSuspensionChanged
   (
      This       : access IScreenCapture_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IScreenCaptureStatics : aliased constant Windows.IID := (3365454768, 51365, 4578, (139, 139, 8, 0, 32, 12, 154, 102 ));
   
   type IScreenCaptureStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access IScreenCaptureStatics_Interface
      ; RetVal : access Windows.Media.Capture.IScreenCapture
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   type IRandomAccessStreamWithContentType_Imported_Interface is interface and Windows.IInspectable_Interface;
   ------------------------------------------------------------------------
   
   type IContentTypeProvider_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContentType
   (
      This       : access IContentTypeProvider_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   type IRandomAccessStream_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Size
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function put_Size
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; value : Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function GetInputStreamAt
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; position : Windows.UInt64
      ; RetVal : access Windows.Storage.Streams.IInputStream
   )
   return Windows.HRESULT is abstract;
   
   function GetOutputStreamAt
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; position : Windows.UInt64
      ; RetVal : access Windows.Storage.Streams.IOutputStream
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function Seek
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; position : Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function CloneStream
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function get_CanRead
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanWrite
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   type IOutputStream_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function WriteAsync
   (
      This       : access IOutputStream_Imported_Interface
      ; buffer : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FlushAsync
   (
      This       : access IOutputStream_Imported_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   type IInputStream_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function ReadAsync
   (
      This       : access IInputStream_Imported_Interface
      ; buffer : Windows.Storage.Streams.IBuffer
      ; count : Windows.UInt32
      ; options : Windows.Storage.Streams.InputStreamOptions
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_IMediaCaptureVideoProfileMediaDescription : aliased constant Windows.IID := (3018340239, 28940, 20774, (166, 201, 143, 72, 159, 99, 225, 94 ));
   
   type IIterator_IMediaCaptureVideoProfileMediaDescription_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMediaCaptureVideoProfileMediaDescription_Interface
      ; RetVal : access Windows.Media.Capture.IMediaCaptureVideoProfileMediaDescription
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMediaCaptureVideoProfileMediaDescription_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMediaCaptureVideoProfileMediaDescription_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMediaCaptureVideoProfileMediaDescription_Interface
      ; items : Windows.Media.Capture.IMediaCaptureVideoProfileMediaDescription_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_IMediaCaptureVideoProfileMediaDescription : aliased constant Windows.IID := (144041325, 65055, 21348, (171, 103, 197, 151, 216, 151, 11, 137 ));
   
   type IIterable_IMediaCaptureVideoProfileMediaDescription_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMediaCaptureVideoProfileMediaDescription_Interface
      ; RetVal : access Windows.Media.Capture.IIterator_IMediaCaptureVideoProfileMediaDescription
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_IMediaCaptureVideoProfileMediaDescription : aliased constant Windows.IID := (1919712396, 30878, 24523, (179, 31, 249, 217, 212, 163, 172, 66 ));
   
   type IVectorView_IMediaCaptureVideoProfileMediaDescription_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMediaCaptureVideoProfileMediaDescription_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Capture.IMediaCaptureVideoProfileMediaDescription
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMediaCaptureVideoProfileMediaDescription_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMediaCaptureVideoProfileMediaDescription_Interface
      ; value : Windows.Media.Capture.IMediaCaptureVideoProfileMediaDescription
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMediaCaptureVideoProfileMediaDescription_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Capture.IMediaCaptureVideoProfileMediaDescription_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_IMediaCaptureVideoProfile : aliased constant Windows.IID := (2847708664, 46528, 20744, (185, 237, 169, 2, 51, 147, 102, 233 ));
   
   type IIterator_IMediaCaptureVideoProfile_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMediaCaptureVideoProfile_Interface
      ; RetVal : access Windows.Media.Capture.IMediaCaptureVideoProfile
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMediaCaptureVideoProfile_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMediaCaptureVideoProfile_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMediaCaptureVideoProfile_Interface
      ; items : Windows.Media.Capture.IMediaCaptureVideoProfile_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_IMediaCaptureVideoProfile : aliased constant Windows.IID := (3688144241, 57467, 24081, (130, 74, 98, 172, 232, 189, 252, 62 ));
   
   type IIterable_IMediaCaptureVideoProfile_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMediaCaptureVideoProfile_Interface
      ; RetVal : access Windows.Media.Capture.IIterator_IMediaCaptureVideoProfile
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_IMediaCaptureVideoProfile : aliased constant Windows.IID := (1969384697, 8089, 24080, (189, 3, 242, 150, 30, 133, 175, 31 ));
   
   type IVectorView_IMediaCaptureVideoProfile_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMediaCaptureVideoProfile_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Capture.IMediaCaptureVideoProfile
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMediaCaptureVideoProfile_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMediaCaptureVideoProfile_Interface
      ; value : Windows.Media.Capture.IMediaCaptureVideoProfile
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMediaCaptureVideoProfile_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Capture.IMediaCaptureVideoProfile_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ILowLagMediaRecording : aliased constant Windows.IID := (1340862412, 48832, 21555, (167, 186, 118, 3, 209, 237, 199, 185 ));
   
   type IAsyncOperation_ILowLagMediaRecording_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ILowLagMediaRecording_Interface
      ; handler : Windows.Media.Capture.AsyncOperationCompletedHandler_ILowLagMediaRecording
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ILowLagMediaRecording_Interface
      ; RetVal : access Windows.Media.Capture.AsyncOperationCompletedHandler_ILowLagMediaRecording
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ILowLagMediaRecording_Interface
      ; RetVal : access Windows.Media.Capture.ILowLagMediaRecording
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ILowLagPhotoCapture : aliased constant Windows.IID := (2938388555, 32269, 24574, (187, 200, 170, 246, 255, 226, 8, 252 ));
   
   type IAsyncOperation_ILowLagPhotoCapture_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ILowLagPhotoCapture_Interface
      ; handler : Windows.Media.Capture.AsyncOperationCompletedHandler_ILowLagPhotoCapture
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ILowLagPhotoCapture_Interface
      ; RetVal : access Windows.Media.Capture.AsyncOperationCompletedHandler_ILowLagPhotoCapture
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ILowLagPhotoCapture_Interface
      ; RetVal : access Windows.Media.Capture.ILowLagPhotoCapture
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ILowLagPhotoSequenceCapture : aliased constant Windows.IID := (2896102496, 40212, 23280, (177, 123, 55, 234, 45, 118, 168, 13 ));
   
   type IAsyncOperation_ILowLagPhotoSequenceCapture_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ILowLagPhotoSequenceCapture_Interface
      ; handler : Windows.Media.Capture.AsyncOperationCompletedHandler_ILowLagPhotoSequenceCapture
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ILowLagPhotoSequenceCapture_Interface
      ; RetVal : access Windows.Media.Capture.AsyncOperationCompletedHandler_ILowLagPhotoSequenceCapture
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ILowLagPhotoSequenceCapture_Interface
      ; RetVal : access Windows.Media.Capture.ILowLagPhotoSequenceCapture
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IAdvancedPhotoCapture : aliased constant Windows.IID := (2393986777, 11492, 24269, (129, 244, 160, 135, 49, 251, 116, 207 ));
   
   type IAsyncOperation_IAdvancedPhotoCapture_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IAdvancedPhotoCapture_Interface
      ; handler : Windows.Media.Capture.AsyncOperationCompletedHandler_IAdvancedPhotoCapture
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IAdvancedPhotoCapture_Interface
      ; RetVal : access Windows.Media.Capture.AsyncOperationCompletedHandler_IAdvancedPhotoCapture
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IAdvancedPhotoCapture_Interface
      ; RetVal : access Windows.Media.Capture.IAdvancedPhotoCapture
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IMediaCapturePauseResult : aliased constant Windows.IID := (539633176, 21624, 24250, (155, 211, 157, 131, 244, 98, 116, 126 ));
   
   type IAsyncOperation_IMediaCapturePauseResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IMediaCapturePauseResult_Interface
      ; handler : Windows.Media.Capture.AsyncOperationCompletedHandler_IMediaCapturePauseResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IMediaCapturePauseResult_Interface
      ; RetVal : access Windows.Media.Capture.AsyncOperationCompletedHandler_IMediaCapturePauseResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IMediaCapturePauseResult_Interface
      ; RetVal : access Windows.Media.Capture.IMediaCapturePauseResult
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IMediaCaptureStopResult : aliased constant Windows.IID := (3950610471, 42153, 21306, (158, 131, 15, 176, 133, 178, 173, 54 ));
   
   type IAsyncOperation_IMediaCaptureStopResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IMediaCaptureStopResult_Interface
      ; handler : Windows.Media.Capture.AsyncOperationCompletedHandler_IMediaCaptureStopResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IMediaCaptureStopResult_Interface
      ; RetVal : access Windows.Media.Capture.AsyncOperationCompletedHandler_IMediaCaptureStopResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IMediaCaptureStopResult_Interface
      ; RetVal : access Windows.Media.Capture.IMediaCaptureStopResult
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ICapturedPhoto : aliased constant Windows.IID := (2941400497, 18296, 21985, (180, 159, 96, 128, 72, 234, 155, 217 ));
   
   type IAsyncOperation_ICapturedPhoto_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ICapturedPhoto_Interface
      ; handler : Windows.Media.Capture.AsyncOperationCompletedHandler_ICapturedPhoto
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ICapturedPhoto_Interface
      ; RetVal : access Windows.Media.Capture.AsyncOperationCompletedHandler_ICapturedPhoto
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ICapturedPhoto_Interface
      ; RetVal : access Windows.Media.Capture.ICapturedPhoto
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IAdvancedCapturedPhoto : aliased constant Windows.IID := (2406593047, 25068, 22699, (166, 70, 238, 222, 1, 66, 213, 104 ));
   
   type IAsyncOperation_IAdvancedCapturedPhoto_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IAdvancedCapturedPhoto_Interface
      ; handler : Windows.Media.Capture.AsyncOperationCompletedHandler_IAdvancedCapturedPhoto
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IAdvancedCapturedPhoto_Interface
      ; RetVal : access Windows.Media.Capture.AsyncOperationCompletedHandler_IAdvancedCapturedPhoto
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IAdvancedCapturedPhoto_Interface
      ; RetVal : access Windows.Media.Capture.IAdvancedCapturedPhoto
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IReference_WhiteBalanceGain : aliased constant Windows.IID := (2043118474, 14818, 21127, (172, 59, 177, 24, 219, 37, 16, 2 ));
   
   type IReference_WhiteBalanceGain_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_WhiteBalanceGain_Interface
      ; RetVal : access Windows.Media.Capture.WhiteBalanceGain
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterator_IAppBroadcastPlugIn : aliased constant Windows.IID := (3479599898, 15289, 22478, (163, 139, 30, 129, 71, 31, 140, 248 ));
   
   type IIterator_IAppBroadcastPlugIn_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IAppBroadcastPlugIn_Interface
      ; RetVal : access Windows.Media.Capture.IAppBroadcastPlugIn
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IAppBroadcastPlugIn_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IAppBroadcastPlugIn_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IAppBroadcastPlugIn_Interface
      ; items : Windows.Media.Capture.IAppBroadcastPlugIn_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IIterable_IAppBroadcastPlugIn : aliased constant Windows.IID := (3308373424, 547, 23710, (168, 251, 32, 245, 46, 165, 141, 117 ));
   
   type IIterable_IAppBroadcastPlugIn_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IAppBroadcastPlugIn_Interface
      ; RetVal : access Windows.Media.Capture.IIterator_IAppBroadcastPlugIn
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   
   IID_IVectorView_IAppBroadcastPlugIn : aliased constant Windows.IID := (95415812, 4456, 22135, (160, 94, 152, 84, 180, 107, 49, 155 ));
   
   type IVectorView_IAppBroadcastPlugIn_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IAppBroadcastPlugIn_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Capture.IAppBroadcastPlugIn
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IAppBroadcastPlugIn_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IAppBroadcastPlugIn_Interface
      ; value : Windows.Media.Capture.IAppBroadcastPlugIn
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IAppBroadcastPlugIn_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Capture.IAppBroadcastPlugIn_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_MediaCaptureFailedEventHandler : aliased constant Windows.IID := (538243067, 23768, 20232, (163, 20, 13, 54, 13, 165, 159, 20 ));
   
   type MediaCaptureFailedEventHandler_Interface(Callback : access procedure (sender : Windows.Media.Capture.IMediaCapture ; errorEventArgs : Windows.Media.Capture.IMediaCaptureFailedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_MediaCaptureFailedEventHandler'access) with null record;
   
   function Invoke
   (
      This       : access MediaCaptureFailedEventHandler_Interface
      ; sender : Windows.Media.Capture.IMediaCapture
      ; errorEventArgs : Windows.Media.Capture.IMediaCaptureFailedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_RecordLimitationExceededEventHandler : aliased constant Windows.IID := (1068404526, 20449, 20477, (170, 186, 225, 241, 51, 125, 78, 83 ));
   
   type RecordLimitationExceededEventHandler_Interface(Callback : access procedure (sender : Windows.Media.Capture.IMediaCapture)) is new Windows.IMulticastDelegate_Interface(IID_RecordLimitationExceededEventHandler'access) with null record;
   
   function Invoke
   (
      This       : access RecordLimitationExceededEventHandler_Interface
      ; sender : Windows.Media.Capture.IMediaCapture
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppCapture_add_CapturingChanged : aliased constant Windows.IID := (4123731125, 65280, 22751, (180, 96, 23, 187, 242, 205, 100, 211 ));
   
   type TypedEventHandler_IAppCapture_add_CapturingChanged_Interface(Callback : access procedure (sender : Windows.Media.Capture.IAppCapture ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppCapture_add_CapturingChanged'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppCapture_add_CapturingChanged_Interface
      ; sender : Windows.Media.Capture.IAppCapture
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ILowLagMediaRecording : aliased constant Windows.IID := (1688795148, 58950, 21179, (143, 75, 42, 29, 107, 11, 130, 25 ));
   
   type AsyncOperationCompletedHandler_ILowLagMediaRecording_Interface(Callback : access procedure (asyncInfo : Windows.Media.Capture.IAsyncOperation_ILowLagMediaRecording ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ILowLagMediaRecording'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ILowLagMediaRecording_Interface
      ; asyncInfo : Windows.Media.Capture.IAsyncOperation_ILowLagMediaRecording
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ILowLagPhotoCapture : aliased constant Windows.IID := (1827386216, 20100, 20490, (154, 95, 123, 154, 26, 222, 31, 68 ));
   
   type AsyncOperationCompletedHandler_ILowLagPhotoCapture_Interface(Callback : access procedure (asyncInfo : Windows.Media.Capture.IAsyncOperation_ILowLagPhotoCapture ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ILowLagPhotoCapture'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ILowLagPhotoCapture_Interface
      ; asyncInfo : Windows.Media.Capture.IAsyncOperation_ILowLagPhotoCapture
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ILowLagPhotoSequenceCapture : aliased constant Windows.IID := (1987973084, 38243, 22317, (132, 225, 156, 170, 176, 222, 182, 63 ));
   
   type AsyncOperationCompletedHandler_ILowLagPhotoSequenceCapture_Interface(Callback : access procedure (asyncInfo : Windows.Media.Capture.IAsyncOperation_ILowLagPhotoSequenceCapture ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ILowLagPhotoSequenceCapture'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ILowLagPhotoSequenceCapture_Interface
      ; asyncInfo : Windows.Media.Capture.IAsyncOperation_ILowLagPhotoSequenceCapture
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMediaCapture3_add_FocusChanged : aliased constant Windows.IID := (90298856, 656, 21298, (177, 94, 176, 213, 26, 190, 115, 124 ));
   
   type TypedEventHandler_IMediaCapture3_add_FocusChanged_Interface(Callback : access procedure (sender : Windows.Media.Capture.IMediaCapture ; args : Windows.Media.Capture.IMediaCaptureFocusChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMediaCapture3_add_FocusChanged'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaCapture3_add_FocusChanged_Interface
      ; sender : Windows.Media.Capture.IMediaCapture
      ; args : Windows.Media.Capture.IMediaCaptureFocusChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMediaCapture3_add_PhotoConfirmationCaptured : aliased constant Windows.IID := (937179923, 45206, 24387, (129, 4, 240, 220, 67, 2, 226, 181 ));
   
   type TypedEventHandler_IMediaCapture3_add_PhotoConfirmationCaptured_Interface(Callback : access procedure (sender : Windows.Media.Capture.IMediaCapture ; args : Windows.Media.Capture.IPhotoConfirmationCapturedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMediaCapture3_add_PhotoConfirmationCaptured'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaCapture3_add_PhotoConfirmationCaptured_Interface
      ; sender : Windows.Media.Capture.IMediaCapture
      ; args : Windows.Media.Capture.IPhotoConfirmationCapturedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMediaCapture4_add_CameraStreamStateChanged : aliased constant Windows.IID := (1153796337, 7095, 24082, (132, 19, 60, 240, 55, 60, 11, 200 ));
   
   type TypedEventHandler_IMediaCapture4_add_CameraStreamStateChanged_Interface(Callback : access procedure (sender : Windows.Media.Capture.IMediaCapture ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMediaCapture4_add_CameraStreamStateChanged'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaCapture4_add_CameraStreamStateChanged_Interface
      ; sender : Windows.Media.Capture.IMediaCapture
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMediaCapture4_add_ThermalStatusChanged : aliased constant Windows.IID := (1153796337, 7095, 24082, (132, 19, 60, 240, 55, 60, 11, 200 ));
   
   type TypedEventHandler_IMediaCapture4_add_ThermalStatusChanged_Interface(Callback : access procedure (sender : Windows.Media.Capture.IMediaCapture ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMediaCapture4_add_ThermalStatusChanged'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaCapture4_add_ThermalStatusChanged_Interface
      ; sender : Windows.Media.Capture.IMediaCapture
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IAdvancedPhotoCapture : aliased constant Windows.IID := (3521097416, 61139, 23779, (152, 50, 24, 52, 76, 152, 250, 113 ));
   
   type AsyncOperationCompletedHandler_IAdvancedPhotoCapture_Interface(Callback : access procedure (asyncInfo : Windows.Media.Capture.IAsyncOperation_IAdvancedPhotoCapture ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IAdvancedPhotoCapture'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IAdvancedPhotoCapture_Interface
      ; asyncInfo : Windows.Media.Capture.IAsyncOperation_IAdvancedPhotoCapture
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IMediaCapturePauseResult : aliased constant Windows.IID := (4268909329, 9919, 20941, (189, 235, 244, 15, 143, 70, 157, 10 ));
   
   type AsyncOperationCompletedHandler_IMediaCapturePauseResult_Interface(Callback : access procedure (asyncInfo : Windows.Media.Capture.IAsyncOperation_IMediaCapturePauseResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IMediaCapturePauseResult'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMediaCapturePauseResult_Interface
      ; asyncInfo : Windows.Media.Capture.IAsyncOperation_IMediaCapturePauseResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IMediaCaptureStopResult : aliased constant Windows.IID := (1565394548, 7668, 21286, (186, 120, 114, 246, 101, 93, 42, 118 ));
   
   type AsyncOperationCompletedHandler_IMediaCaptureStopResult_Interface(Callback : access procedure (asyncInfo : Windows.Media.Capture.IAsyncOperation_IMediaCaptureStopResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IMediaCaptureStopResult'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMediaCaptureStopResult_Interface
      ; asyncInfo : Windows.Media.Capture.IAsyncOperation_IMediaCaptureStopResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMediaCapture6_add_CaptureDeviceExclusiveControlStatusChanged : aliased constant Windows.IID := (1553070266, 45945, 21503, (162, 136, 36, 231, 136, 59, 245, 146 ));
   
   type TypedEventHandler_IMediaCapture6_add_CaptureDeviceExclusiveControlStatusChanged_Interface(Callback : access procedure (sender : Windows.Media.Capture.IMediaCapture ; args : Windows.Media.Capture.IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMediaCapture6_add_CaptureDeviceExclusiveControlStatusChanged'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaCapture6_add_CaptureDeviceExclusiveControlStatusChanged_Interface
      ; sender : Windows.Media.Capture.IMediaCapture
      ; args : Windows.Media.Capture.IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ICapturedPhoto : aliased constant Windows.IID := (4256213624, 1249, 22195, (182, 252, 244, 222, 121, 205, 65, 160 ));
   
   type AsyncOperationCompletedHandler_ICapturedPhoto_Interface(Callback : access procedure (asyncInfo : Windows.Media.Capture.IAsyncOperation_ICapturedPhoto ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ICapturedPhoto'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ICapturedPhoto_Interface
      ; asyncInfo : Windows.Media.Capture.IAsyncOperation_ICapturedPhoto
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IAdvancedCapturedPhoto : aliased constant Windows.IID := (3992143148, 55576, 23701, (142, 58, 36, 80, 68, 221, 112, 223 ));
   
   type AsyncOperationCompletedHandler_IAdvancedCapturedPhoto_Interface(Callback : access procedure (asyncInfo : Windows.Media.Capture.IAsyncOperation_IAdvancedCapturedPhoto ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IAdvancedCapturedPhoto'access) with null record;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IAdvancedCapturedPhoto_Interface
      ; asyncInfo : Windows.Media.Capture.IAsyncOperation_IAdvancedCapturedPhoto
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAdvancedPhotoCapture_add_OptionalReferencePhotoCaptured : aliased constant Windows.IID := (2218682810, 22274, 23959, (171, 129, 239, 7, 141, 227, 249, 177 ));
   
   type TypedEventHandler_IAdvancedPhotoCapture_add_OptionalReferencePhotoCaptured_Interface(Callback : access procedure (sender : Windows.Media.Capture.IAdvancedPhotoCapture ; args : Windows.Media.Capture.IOptionalReferencePhotoCapturedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAdvancedPhotoCapture_add_OptionalReferencePhotoCaptured'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAdvancedPhotoCapture_add_OptionalReferencePhotoCaptured_Interface
      ; sender : Windows.Media.Capture.IAdvancedPhotoCapture
      ; args : Windows.Media.Capture.IOptionalReferencePhotoCapturedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAdvancedPhotoCapture_add_AllPhotosCaptured : aliased constant Windows.IID := (1555343759, 44017, 21784, (144, 148, 38, 219, 50, 106, 95, 78 ));
   
   type TypedEventHandler_IAdvancedPhotoCapture_add_AllPhotosCaptured_Interface(Callback : access procedure (sender : Windows.Media.Capture.IAdvancedPhotoCapture ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAdvancedPhotoCapture_add_AllPhotosCaptured'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAdvancedPhotoCapture_add_AllPhotosCaptured_Interface
      ; sender : Windows.Media.Capture.IAdvancedPhotoCapture
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ILowLagPhotoSequenceCapture_add_PhotoCaptured : aliased constant Windows.IID := (3112872762, 65152, 23335, (136, 195, 231, 127, 245, 133, 169, 107 ));
   
   type TypedEventHandler_ILowLagPhotoSequenceCapture_add_PhotoCaptured_Interface(Callback : access procedure (sender : Windows.Media.Capture.ILowLagPhotoSequenceCapture ; args : Windows.Media.Capture.IPhotoCapturedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ILowLagPhotoSequenceCapture_add_PhotoCaptured'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_ILowLagPhotoSequenceCapture_add_PhotoCaptured_Interface
      ; sender : Windows.Media.Capture.ILowLagPhotoSequenceCapture
      ; args : Windows.Media.Capture.IPhotoCapturedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppBroadcastBackgroundServiceSignInInfo_add_SignInStateChanged : aliased constant Windows.IID := (3798412314, 41945, 22259, (138, 119, 32, 211, 8, 115, 206, 135 ));
   
   type TypedEventHandler_IAppBroadcastBackgroundServiceSignInInfo_add_SignInStateChanged_Interface(Callback : access procedure (sender : Windows.Media.Capture.IAppBroadcastBackgroundServiceSignInInfo ; args : Windows.Media.Capture.IAppBroadcastSignInStateChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppBroadcastBackgroundServiceSignInInfo_add_SignInStateChanged'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastBackgroundServiceSignInInfo_add_SignInStateChanged_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastBackgroundServiceSignInInfo
      ; args : Windows.Media.Capture.IAppBroadcastSignInStateChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppBroadcastBackgroundServiceSignInInfo2_add_UserNameChanged : aliased constant Windows.IID := (4168176008, 61383, 22364, (173, 157, 105, 94, 178, 4, 69, 36 ));
   
   type TypedEventHandler_IAppBroadcastBackgroundServiceSignInInfo2_add_UserNameChanged_Interface(Callback : access procedure (sender : Windows.Media.Capture.IAppBroadcastBackgroundServiceSignInInfo ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppBroadcastBackgroundServiceSignInInfo2_add_UserNameChanged'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastBackgroundServiceSignInInfo2_add_UserNameChanged_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastBackgroundServiceSignInInfo
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppBroadcastBackgroundServiceStreamInfo_add_StreamStateChanged : aliased constant Windows.IID := (202443960, 45194, 23559, (178, 149, 34, 144, 73, 164, 108, 34 ));
   
   type TypedEventHandler_IAppBroadcastBackgroundServiceStreamInfo_add_StreamStateChanged_Interface(Callback : access procedure (sender : Windows.Media.Capture.IAppBroadcastBackgroundServiceStreamInfo ; args : Windows.Media.Capture.IAppBroadcastStreamStateChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppBroadcastBackgroundServiceStreamInfo_add_StreamStateChanged'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastBackgroundServiceStreamInfo_add_StreamStateChanged_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastBackgroundServiceStreamInfo
      ; args : Windows.Media.Capture.IAppBroadcastStreamStateChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppBroadcastBackgroundServiceStreamInfo_add_VideoEncodingResolutionChanged : aliased constant Windows.IID := (1942547531, 61700, 21814, (184, 180, 77, 154, 173, 97, 201, 180 ));
   
   type TypedEventHandler_IAppBroadcastBackgroundServiceStreamInfo_add_VideoEncodingResolutionChanged_Interface(Callback : access procedure (sender : Windows.Media.Capture.IAppBroadcastBackgroundServiceStreamInfo ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppBroadcastBackgroundServiceStreamInfo_add_VideoEncodingResolutionChanged'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastBackgroundServiceStreamInfo_add_VideoEncodingResolutionChanged_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastBackgroundServiceStreamInfo
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppBroadcastBackgroundServiceStreamInfo_add_VideoEncodingBitrateChanged : aliased constant Windows.IID := (1942547531, 61700, 21814, (184, 180, 77, 154, 173, 97, 201, 180 ));
   
   type TypedEventHandler_IAppBroadcastBackgroundServiceStreamInfo_add_VideoEncodingBitrateChanged_Interface(Callback : access procedure (sender : Windows.Media.Capture.IAppBroadcastBackgroundServiceStreamInfo ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppBroadcastBackgroundServiceStreamInfo_add_VideoEncodingBitrateChanged'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastBackgroundServiceStreamInfo_add_VideoEncodingBitrateChanged_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastBackgroundServiceStreamInfo
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppBroadcastBackgroundService_add_HeartbeatRequested : aliased constant Windows.IID := (1664913866, 20446, 20832, (146, 9, 63, 211, 164, 3, 169, 23 ));
   
   type TypedEventHandler_IAppBroadcastBackgroundService_add_HeartbeatRequested_Interface(Callback : access procedure (sender : Windows.Media.Capture.IAppBroadcastBackgroundService ; args : Windows.Media.Capture.IAppBroadcastHeartbeatRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppBroadcastBackgroundService_add_HeartbeatRequested'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastBackgroundService_add_HeartbeatRequested_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastBackgroundService
      ; args : Windows.Media.Capture.IAppBroadcastHeartbeatRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppBroadcastBackgroundService2_add_BroadcastTitleChanged : aliased constant Windows.IID := (1854017280, 57824, 23667, (175, 216, 164, 123, 155, 28, 27, 237 ));
   
   type TypedEventHandler_IAppBroadcastBackgroundService2_add_BroadcastTitleChanged_Interface(Callback : access procedure (sender : Windows.Media.Capture.IAppBroadcastBackgroundService ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppBroadcastBackgroundService2_add_BroadcastTitleChanged'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastBackgroundService2_add_BroadcastTitleChanged_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastBackgroundService
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppBroadcastBackgroundService2_add_BroadcastLanguageChanged : aliased constant Windows.IID := (1854017280, 57824, 23667, (175, 216, 164, 123, 155, 28, 27, 237 ));
   
   type TypedEventHandler_IAppBroadcastBackgroundService2_add_BroadcastLanguageChanged_Interface(Callback : access procedure (sender : Windows.Media.Capture.IAppBroadcastBackgroundService ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppBroadcastBackgroundService2_add_BroadcastLanguageChanged'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastBackgroundService2_add_BroadcastLanguageChanged_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastBackgroundService
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppBroadcastBackgroundService2_add_BroadcastChannelChanged : aliased constant Windows.IID := (1854017280, 57824, 23667, (175, 216, 164, 123, 155, 28, 27, 237 ));
   
   type TypedEventHandler_IAppBroadcastBackgroundService2_add_BroadcastChannelChanged_Interface(Callback : access procedure (sender : Windows.Media.Capture.IAppBroadcastBackgroundService ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppBroadcastBackgroundService2_add_BroadcastChannelChanged'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastBackgroundService2_add_BroadcastChannelChanged_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastBackgroundService
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppBroadcastStreamReader_add_AudioFrameArrived : aliased constant Windows.IID := (1724987275, 3588, 22529, (139, 221, 254, 177, 8, 27, 190, 203 ));
   
   type TypedEventHandler_IAppBroadcastStreamReader_add_AudioFrameArrived_Interface(Callback : access procedure (sender : Windows.Media.Capture.IAppBroadcastStreamReader ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppBroadcastStreamReader_add_AudioFrameArrived'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastStreamReader_add_AudioFrameArrived_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastStreamReader
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppBroadcastStreamReader_add_VideoFrameArrived : aliased constant Windows.IID := (1724987275, 3588, 22529, (139, 221, 254, 177, 8, 27, 190, 203 ));
   
   type TypedEventHandler_IAppBroadcastStreamReader_add_VideoFrameArrived_Interface(Callback : access procedure (sender : Windows.Media.Capture.IAppBroadcastStreamReader ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppBroadcastStreamReader_add_VideoFrameArrived'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastStreamReader_add_VideoFrameArrived_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastStreamReader
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppBroadcastState_add_ViewerCountChanged : aliased constant Windows.IID := (379726375, 25026, 22210, (147, 229, 24, 214, 104, 28, 238, 180 ));
   
   type TypedEventHandler_IAppBroadcastState_add_ViewerCountChanged_Interface(Callback : access procedure (sender : Windows.Media.Capture.IAppBroadcastState ; args : Windows.Media.Capture.IAppBroadcastViewerCountChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppBroadcastState_add_ViewerCountChanged'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastState_add_ViewerCountChanged_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastState
      ; args : Windows.Media.Capture.IAppBroadcastViewerCountChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppBroadcastState_add_MicrophoneCaptureStateChanged : aliased constant Windows.IID := (4132280682, 14425, 20852, (151, 177, 227, 61, 86, 223, 202, 58 ));
   
   type TypedEventHandler_IAppBroadcastState_add_MicrophoneCaptureStateChanged_Interface(Callback : access procedure (sender : Windows.Media.Capture.IAppBroadcastState ; args : Windows.Media.Capture.IAppBroadcastMicrophoneCaptureStateChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppBroadcastState_add_MicrophoneCaptureStateChanged'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastState_add_MicrophoneCaptureStateChanged_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastState
      ; args : Windows.Media.Capture.IAppBroadcastMicrophoneCaptureStateChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppBroadcastState_add_CameraCaptureStateChanged : aliased constant Windows.IID := (3046811285, 45860, 23363, (129, 91, 143, 253, 166, 1, 56, 22 ));
   
   type TypedEventHandler_IAppBroadcastState_add_CameraCaptureStateChanged_Interface(Callback : access procedure (sender : Windows.Media.Capture.IAppBroadcastState ; args : Windows.Media.Capture.IAppBroadcastCameraCaptureStateChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppBroadcastState_add_CameraCaptureStateChanged'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastState_add_CameraCaptureStateChanged_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastState
      ; args : Windows.Media.Capture.IAppBroadcastCameraCaptureStateChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppBroadcastState_add_PlugInStateChanged : aliased constant Windows.IID := (926778638, 1115, 21157, (146, 218, 194, 47, 146, 75, 121, 251 ));
   
   type TypedEventHandler_IAppBroadcastState_add_PlugInStateChanged_Interface(Callback : access procedure (sender : Windows.Media.Capture.IAppBroadcastState ; args : Windows.Media.Capture.IAppBroadcastPlugInStateChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppBroadcastState_add_PlugInStateChanged'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastState_add_PlugInStateChanged_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastState
      ; args : Windows.Media.Capture.IAppBroadcastPlugInStateChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppBroadcastState_add_StreamStateChanged : aliased constant Windows.IID := (625343442, 16310, 20484, (164, 117, 86, 192, 89, 243, 215, 90 ));
   
   type TypedEventHandler_IAppBroadcastState_add_StreamStateChanged_Interface(Callback : access procedure (sender : Windows.Media.Capture.IAppBroadcastState ; args : Windows.Media.Capture.IAppBroadcastStreamStateChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppBroadcastState_add_StreamStateChanged'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastState_add_StreamStateChanged_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastState
      ; args : Windows.Media.Capture.IAppBroadcastStreamStateChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppBroadcastState_add_CaptureTargetClosed : aliased constant Windows.IID := (2846904636, 54840, 23647, (128, 81, 121, 29, 122, 162, 213, 102 ));
   
   type TypedEventHandler_IAppBroadcastState_add_CaptureTargetClosed_Interface(Callback : access procedure (sender : Windows.Media.Capture.IAppBroadcastState ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppBroadcastState_add_CaptureTargetClosed'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastState_add_CaptureTargetClosed_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastState
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppBroadcastPreview_add_PreviewStateChanged : aliased constant Windows.IID := (1104722145, 56551, 24252, (148, 15, 222, 125, 210, 166, 42, 181 ));
   
   type TypedEventHandler_IAppBroadcastPreview_add_PreviewStateChanged_Interface(Callback : access procedure (sender : Windows.Media.Capture.IAppBroadcastPreview ; args : Windows.Media.Capture.IAppBroadcastPreviewStateChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppBroadcastPreview_add_PreviewStateChanged'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastPreview_add_PreviewStateChanged_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastPreview
      ; args : Windows.Media.Capture.IAppBroadcastPreviewStateChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppBroadcastPreviewStreamReader_add_VideoFrameArrived : aliased constant Windows.IID := (2031678252, 6271, 24335, (184, 14, 111, 202, 170, 94, 20, 185 ));
   
   type TypedEventHandler_IAppBroadcastPreviewStreamReader_add_VideoFrameArrived_Interface(Callback : access procedure (sender : Windows.Media.Capture.IAppBroadcastPreviewStreamReader ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppBroadcastPreviewStreamReader_add_VideoFrameArrived'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppBroadcastPreviewStreamReader_add_VideoFrameArrived_Interface
      ; sender : Windows.Media.Capture.IAppBroadcastPreviewStreamReader
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppCaptureState_add_MicrophoneCaptureStateChanged : aliased constant Windows.IID := (187212195, 14126, 20713, (166, 19, 55, 185, 124, 253, 122, 104 ));
   
   type TypedEventHandler_IAppCaptureState_add_MicrophoneCaptureStateChanged_Interface(Callback : access procedure (sender : Windows.Media.Capture.IAppCaptureState ; args : Windows.Media.Capture.IAppCaptureMicrophoneCaptureStateChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppCaptureState_add_MicrophoneCaptureStateChanged'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppCaptureState_add_MicrophoneCaptureStateChanged_Interface
      ; sender : Windows.Media.Capture.IAppCaptureState
      ; args : Windows.Media.Capture.IAppCaptureMicrophoneCaptureStateChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppCaptureState_add_CaptureTargetClosed : aliased constant Windows.IID := (3075138689, 30587, 23497, (131, 218, 86, 45, 144, 90, 67, 241 ));
   
   type TypedEventHandler_IAppCaptureState_add_CaptureTargetClosed_Interface(Callback : access procedure (sender : Windows.Media.Capture.IAppCaptureState ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppCaptureState_add_CaptureTargetClosed'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppCaptureState_add_CaptureTargetClosed_Interface
      ; sender : Windows.Media.Capture.IAppCaptureState
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppCaptureRecordOperation_add_StateChanged : aliased constant Windows.IID := (578600706, 11771, 21541, (133, 177, 13, 98, 206, 93, 18, 67 ));
   
   type TypedEventHandler_IAppCaptureRecordOperation_add_StateChanged_Interface(Callback : access procedure (sender : Windows.Media.Capture.IAppCaptureRecordOperation ; args : Windows.Media.Capture.IAppCaptureRecordingStateChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppCaptureRecordOperation_add_StateChanged'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppCaptureRecordOperation_add_StateChanged_Interface
      ; sender : Windows.Media.Capture.IAppCaptureRecordOperation
      ; args : Windows.Media.Capture.IAppCaptureRecordingStateChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppCaptureRecordOperation_add_DurationGenerated : aliased constant Windows.IID := (2875464117, 39191, 21109, (152, 118, 158, 70, 185, 171, 173, 167 ));
   
   type TypedEventHandler_IAppCaptureRecordOperation_add_DurationGenerated_Interface(Callback : access procedure (sender : Windows.Media.Capture.IAppCaptureRecordOperation ; args : Windows.Media.Capture.IAppCaptureDurationGeneratedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppCaptureRecordOperation_add_DurationGenerated'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppCaptureRecordOperation_add_DurationGenerated_Interface
      ; sender : Windows.Media.Capture.IAppCaptureRecordOperation
      ; args : Windows.Media.Capture.IAppCaptureDurationGeneratedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppCaptureRecordOperation_add_FileGenerated : aliased constant Windows.IID := (4027541989, 40678, 20761, (156, 57, 242, 121, 249, 255, 217, 8 ));
   
   type TypedEventHandler_IAppCaptureRecordOperation_add_FileGenerated_Interface(Callback : access procedure (sender : Windows.Media.Capture.IAppCaptureRecordOperation ; args : Windows.Media.Capture.IAppCaptureFileGeneratedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppCaptureRecordOperation_add_FileGenerated'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppCaptureRecordOperation_add_FileGenerated_Interface
      ; sender : Windows.Media.Capture.IAppCaptureRecordOperation
      ; args : Windows.Media.Capture.IAppCaptureFileGeneratedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAppCaptureMetadataWriter_add_MetadataPurged : aliased constant Windows.IID := (447666252, 60807, 24376, (169, 209, 53, 83, 18, 141, 74, 98 ));
   
   type TypedEventHandler_IAppCaptureMetadataWriter_add_MetadataPurged_Interface(Callback : access procedure (sender : Windows.Media.Capture.IAppCaptureMetadataWriter ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAppCaptureMetadataWriter_add_MetadataPurged'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAppCaptureMetadataWriter_add_MetadataPurged_Interface
      ; sender : Windows.Media.Capture.IAppCaptureMetadataWriter
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IGameBarServicesManager_add_GameBarServicesCreated : aliased constant Windows.IID := (797292553, 32139, 23524, (154, 105, 129, 56, 109, 135, 76, 127 ));
   
   type TypedEventHandler_IGameBarServicesManager_add_GameBarServicesCreated_Interface(Callback : access procedure (sender : Windows.Media.Capture.IGameBarServicesManager ; args : Windows.Media.Capture.IGameBarServicesManagerGameBarServicesCreatedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IGameBarServicesManager_add_GameBarServicesCreated'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGameBarServicesManager_add_GameBarServicesCreated_Interface
      ; sender : Windows.Media.Capture.IGameBarServicesManager
      ; args : Windows.Media.Capture.IGameBarServicesManagerGameBarServicesCreatedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IGameBarServices_add_CommandReceived : aliased constant Windows.IID := (229330814, 49132, 23009, (130, 207, 235, 246, 75, 29, 180, 243 ));
   
   type TypedEventHandler_IGameBarServices_add_CommandReceived_Interface(Callback : access procedure (sender : Windows.Media.Capture.IGameBarServices ; args : Windows.Media.Capture.IGameBarServicesCommandEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IGameBarServices_add_CommandReceived'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGameBarServices_add_CommandReceived_Interface
      ; sender : Windows.Media.Capture.IGameBarServices
      ; args : Windows.Media.Capture.IGameBarServicesCommandEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IScreenCapture_add_SourceSuspensionChanged : aliased constant Windows.IID := (2212238669, 47983, 22926, (168, 135, 65, 186, 24, 1, 240, 25 ));
   
   type TypedEventHandler_IScreenCapture_add_SourceSuspensionChanged_Interface(Callback : access procedure (sender : Windows.Media.Capture.IScreenCapture ; args : Windows.Media.Capture.ISourceSuspensionChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IScreenCapture_add_SourceSuspensionChanged'access) with null record;
   
   function Invoke
   (
      This       : access TypedEventHandler_IScreenCapture_add_SourceSuspensionChanged_Interface
      ; sender : Windows.Media.Capture.IScreenCapture
      ; args : Windows.Media.Capture.ISourceSuspensionChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype AppCapture is Windows.Media.Capture.IAppCapture;
   subtype CameraCaptureUIPhotoCaptureSettings is Windows.Media.Capture.ICameraCaptureUIPhotoCaptureSettings;
   subtype CameraCaptureUIVideoCaptureSettings is Windows.Media.Capture.ICameraCaptureUIVideoCaptureSettings;
   subtype CameraCaptureUI is Windows.Media.Capture.ICameraCaptureUI;
   
   function CreateCameraCaptureUI return Windows.Media.Capture.ICameraCaptureUI;
   
   subtype MediaCaptureFailedEventArgs is Windows.Media.Capture.IMediaCaptureFailedEventArgs;
   subtype MediaCapture is Windows.Media.Capture.IMediaCapture;
   
   function CreateMediaCapture return Windows.Media.Capture.IMediaCapture;
   
   subtype MediaCaptureVideoProfileMediaDescription is Windows.Media.Capture.IMediaCaptureVideoProfileMediaDescription;
   subtype MediaCaptureVideoProfile is Windows.Media.Capture.IMediaCaptureVideoProfile;
   subtype MediaCaptureInitializationSettings is Windows.Media.Capture.IMediaCaptureInitializationSettings;
   
   function CreateMediaCaptureInitializationSettings return Windows.Media.Capture.IMediaCaptureInitializationSettings;
   
   subtype MediaCaptureSettings is Windows.Media.Capture.IMediaCaptureSettings;
   subtype LowLagMediaRecording is Windows.Media.Capture.ILowLagMediaRecording;
   subtype LowLagPhotoCapture is Windows.Media.Capture.ILowLagPhotoCapture;
   subtype LowLagPhotoSequenceCapture is Windows.Media.Capture.ILowLagPhotoSequenceCapture;
   subtype MediaCaptureFocusChangedEventArgs is Windows.Media.Capture.IMediaCaptureFocusChangedEventArgs;
   subtype PhotoConfirmationCapturedEventArgs is Windows.Media.Capture.IPhotoConfirmationCapturedEventArgs;
   subtype AdvancedPhotoCapture is Windows.Media.Capture.IAdvancedPhotoCapture;
   subtype MediaCapturePauseResult is Windows.Media.Capture.IMediaCapturePauseResult;
   subtype MediaCaptureStopResult is Windows.Media.Capture.IMediaCaptureStopResult;
   subtype MediaCaptureDeviceExclusiveControlStatusChangedEventArgs is Windows.Media.Capture.IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs;
   subtype CapturedPhoto is Windows.Media.Capture.ICapturedPhoto;
   subtype AdvancedCapturedPhoto is Windows.Media.Capture.IAdvancedCapturedPhoto;
   subtype OptionalReferencePhotoCapturedEventArgs is Windows.Media.Capture.IOptionalReferencePhotoCapturedEventArgs;
   subtype CapturedFrame is Windows.Media.Capture.ICapturedFrame;
   subtype PhotoCapturedEventArgs is Windows.Media.Capture.IPhotoCapturedEventArgs;
   subtype CapturedFrameControlValues is Windows.Media.Capture.ICapturedFrameControlValues;
   subtype VideoStreamConfiguration is Windows.Media.Capture.IVideoStreamConfiguration;
   subtype AppBroadcastGlobalSettings is Windows.Media.Capture.IAppBroadcastGlobalSettings;
   subtype AppBroadcastProviderSettings is Windows.Media.Capture.IAppBroadcastProviderSettings;
   subtype AppBroadcastBackgroundServiceSignInInfo is Windows.Media.Capture.IAppBroadcastBackgroundServiceSignInInfo;
   subtype AppBroadcastSignInStateChangedEventArgs is Windows.Media.Capture.IAppBroadcastSignInStateChangedEventArgs;
   subtype AppBroadcastStreamReader is Windows.Media.Capture.IAppBroadcastStreamReader;
   subtype AppBroadcastBackgroundServiceStreamInfo is Windows.Media.Capture.IAppBroadcastBackgroundServiceStreamInfo;
   subtype AppBroadcastStreamStateChangedEventArgs is Windows.Media.Capture.IAppBroadcastStreamStateChangedEventArgs;
   subtype AppBroadcastBackgroundService is Windows.Media.Capture.IAppBroadcastBackgroundService;
   subtype AppBroadcastHeartbeatRequestedEventArgs is Windows.Media.Capture.IAppBroadcastHeartbeatRequestedEventArgs;
   subtype AppBroadcastStreamAudioFrame is Windows.Media.Capture.IAppBroadcastStreamAudioFrame;
   subtype AppBroadcastStreamVideoFrame is Windows.Media.Capture.IAppBroadcastStreamVideoFrame;
   subtype AppBroadcastStreamVideoHeader is Windows.Media.Capture.IAppBroadcastStreamVideoHeader;
   subtype AppBroadcastStreamAudioHeader is Windows.Media.Capture.IAppBroadcastStreamAudioHeader;
   subtype AppBroadcastTriggerDetails is Windows.Media.Capture.IAppBroadcastTriggerDetails;
   subtype AppBroadcastPlugInManager is Windows.Media.Capture.IAppBroadcastPlugInManager;
   subtype AppBroadcastPlugIn is Windows.Media.Capture.IAppBroadcastPlugIn;
   subtype AppBroadcastPreview is Windows.Media.Capture.IAppBroadcastPreview;
   subtype AppBroadcastState is Windows.Media.Capture.IAppBroadcastState;
   subtype AppBroadcastViewerCountChangedEventArgs is Windows.Media.Capture.IAppBroadcastViewerCountChangedEventArgs;
   subtype AppBroadcastMicrophoneCaptureStateChangedEventArgs is Windows.Media.Capture.IAppBroadcastMicrophoneCaptureStateChangedEventArgs;
   subtype AppBroadcastCameraCaptureStateChangedEventArgs is Windows.Media.Capture.IAppBroadcastCameraCaptureStateChangedEventArgs;
   subtype AppBroadcastPlugInStateChangedEventArgs is Windows.Media.Capture.IAppBroadcastPlugInStateChangedEventArgs;
   subtype AppBroadcastPreviewStateChangedEventArgs is Windows.Media.Capture.IAppBroadcastPreviewStateChangedEventArgs;
   subtype AppBroadcastPreviewStreamReader is Windows.Media.Capture.IAppBroadcastPreviewStreamReader;
   subtype AppBroadcastPreviewStreamVideoFrame is Windows.Media.Capture.IAppBroadcastPreviewStreamVideoFrame;
   subtype AppBroadcastPreviewStreamVideoHeader is Windows.Media.Capture.IAppBroadcastPreviewStreamVideoHeader;
   subtype AppBroadcastServices is Windows.Media.Capture.IAppBroadcastServices;
   subtype AppCaptureSettings is Windows.Media.Capture.IAppCaptureSettings;
   subtype AppCaptureAlternateShortcutKeys is Windows.Media.Capture.IAppCaptureAlternateShortcutKeys;
   subtype AppCaptureRecordOperation is Windows.Media.Capture.IAppCaptureRecordOperation;
   subtype AppCaptureState is Windows.Media.Capture.IAppCaptureState;
   subtype AppCaptureMicrophoneCaptureStateChangedEventArgs is Windows.Media.Capture.IAppCaptureMicrophoneCaptureStateChangedEventArgs;
   subtype AppCaptureRecordingStateChangedEventArgs is Windows.Media.Capture.IAppCaptureRecordingStateChangedEventArgs;
   subtype AppCaptureDurationGeneratedEventArgs is Windows.Media.Capture.IAppCaptureDurationGeneratedEventArgs;
   subtype AppCaptureFileGeneratedEventArgs is Windows.Media.Capture.IAppCaptureFileGeneratedEventArgs;
   subtype AppCaptureServices is Windows.Media.Capture.IAppCaptureServices;
   subtype AppCaptureMetadataWriter is Windows.Media.Capture.IAppCaptureMetadataWriter;
   
   function CreateAppCaptureMetadataWriter return Windows.Media.Capture.IAppCaptureMetadataWriter;
   
   subtype GameBarServicesManager is Windows.Media.Capture.IGameBarServicesManager;
   subtype GameBarServicesManagerGameBarServicesCreatedEventArgs is Windows.Media.Capture.IGameBarServicesManagerGameBarServicesCreatedEventArgs;
   subtype GameBarServices is Windows.Media.Capture.IGameBarServices;
   subtype GameBarServicesTargetInfo is Windows.Media.Capture.IGameBarServicesTargetInfo;
   subtype GameBarServicesCommandEventArgs is Windows.Media.Capture.IGameBarServicesCommandEventArgs;
   subtype ScreenCapture is Windows.Media.Capture.IScreenCapture;
   subtype SourceSuspensionChangedEventArgs is Windows.Media.Capture.ISourceSuspensionChangedEventArgs;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetForCurrentView
   return Windows.Media.Capture.IAppCapture;
   
   function SetAllowedAsync
   (
      allowed : Windows.Boolean
   )
   return Windows.Foundation.IAsyncAction;
   
   function IsVideoProfileSupported
   (
      videoDeviceId : Windows.String
   )
   return Windows.Boolean;
   
   function FindAllVideoProfiles
   (
      videoDeviceId : Windows.String
   )
   return Windows.Media.Capture.IVectorView_IMediaCaptureVideoProfile;
   
   function FindConcurrentProfiles
   (
      videoDeviceId : Windows.String
   )
   return Windows.Media.Capture.IVectorView_IMediaCaptureVideoProfile;
   
   function FindKnownVideoProfiles
   (
      videoDeviceId : Windows.String
      ; name : Windows.Media.Capture.KnownVideoProfile
   )
   return Windows.Media.Capture.IVectorView_IMediaCaptureVideoProfile;
   
   function GetGlobalSettings
   return Windows.Media.Capture.IAppBroadcastGlobalSettings;
   
   procedure ApplyGlobalSettings
   (
      value : Windows.Media.Capture.IAppBroadcastGlobalSettings
   )
   ;
   
   function GetProviderSettings
   return Windows.Media.Capture.IAppBroadcastProviderSettings;
   
   procedure ApplyProviderSettings
   (
      value : Windows.Media.Capture.IAppBroadcastProviderSettings
   )
   ;
   
   function GetDefault
   return Windows.Media.Capture.IAppBroadcastPlugInManager;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.Media.Capture.IAppBroadcastPlugInManager;
   
   function GetCurrentSettings
   return Windows.Media.Capture.IAppCaptureSettings;
   
   procedure ApplySettings
   (
      appCaptureSettings : Windows.Media.Capture.IAppCaptureSettings
   )
   ;
   
   procedure Show
   (
      mediaCapture : Windows.Media.Capture.IMediaCapture
   )
   ;
   
   function GetDefault
   return Windows.Media.Capture.IGameBarServicesManager;
   
   function GetForCurrentView
   return Windows.Media.Capture.IScreenCapture;

end;
