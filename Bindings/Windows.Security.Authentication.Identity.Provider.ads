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
--------------------------------------------------------------------------------
package Windows.Security.Authentication.Identity.Provider is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type SecondaryAuthenticationFactorDeviceCapabilities is (
      None,
      SecureStorage,
      StoreKeys,
      ConfirmUserIntentToAuthenticate,
      SupportSecureUserPresenceCheck,
      TransmittedDataIsEncrypted,
      HMacSha256,
      CloseRangeDataTransmission
   );
   for SecondaryAuthenticationFactorDeviceCapabilities use (
      None => 0,
      SecureStorage => 1,
      StoreKeys => 2,
      ConfirmUserIntentToAuthenticate => 4,
      SupportSecureUserPresenceCheck => 8,
      TransmittedDataIsEncrypted => 16,
      HMacSha256 => 32,
      CloseRangeDataTransmission => 64
   );
   for SecondaryAuthenticationFactorDeviceCapabilities'Size use 32;
   
   type SecondaryAuthenticationFactorDeviceCapabilities_Ptr is access SecondaryAuthenticationFactorDeviceCapabilities;
   
   type SecondaryAuthenticationFactorDeviceFindScope is (
      User,
      AllUsers
   );
   for SecondaryAuthenticationFactorDeviceFindScope use (
      User => 0,
      AllUsers => 1
   );
   for SecondaryAuthenticationFactorDeviceFindScope'Size use 32;
   
   type SecondaryAuthenticationFactorDeviceFindScope_Ptr is access SecondaryAuthenticationFactorDeviceFindScope;
   
   type SecondaryAuthenticationFactorAuthenticationStage is (
      NotStarted,
      WaitingForUserConfirmation,
      CollectingCredential,
      SuspendingAuthentication,
      CredentialCollected,
      CredentialAuthenticated,
      StoppingAuthentication,
      ReadyForLock,
      CheckingDevicePresence
   );
   for SecondaryAuthenticationFactorAuthenticationStage use (
      NotStarted => 0,
      WaitingForUserConfirmation => 1,
      CollectingCredential => 2,
      SuspendingAuthentication => 3,
      CredentialCollected => 4,
      CredentialAuthenticated => 5,
      StoppingAuthentication => 6,
      ReadyForLock => 7,
      CheckingDevicePresence => 8
   );
   for SecondaryAuthenticationFactorAuthenticationStage'Size use 32;
   
   type SecondaryAuthenticationFactorAuthenticationStage_Ptr is access SecondaryAuthenticationFactorAuthenticationStage;
   
   type SecondaryAuthenticationFactorRegistrationStatus is (
      Failed,
      Started,
      CanceledByUser,
      PinSetupRequired,
      DisabledByPolicy
   );
   for SecondaryAuthenticationFactorRegistrationStatus use (
      Failed => 0,
      Started => 1,
      CanceledByUser => 2,
      PinSetupRequired => 3,
      DisabledByPolicy => 4
   );
   for SecondaryAuthenticationFactorRegistrationStatus'Size use 32;
   
   type SecondaryAuthenticationFactorRegistrationStatus_Ptr is access SecondaryAuthenticationFactorRegistrationStatus;
   
   type SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus is (
      Unsupported,
      Succeeded,
      DisabledByPolicy
   );
   for SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus use (
      Unsupported => 0,
      Succeeded => 1,
      DisabledByPolicy => 2
   );
   for SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus'Size use 32;
   
   type SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus_Ptr is access SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus;
   
   type SecondaryAuthenticationFactorAuthenticationStatus is (
      Failed,
      Started,
      UnknownDevice,
      DisabledByPolicy,
      InvalidAuthenticationStage
   );
   for SecondaryAuthenticationFactorAuthenticationStatus use (
      Failed => 0,
      Started => 1,
      UnknownDevice => 2,
      DisabledByPolicy => 3,
      InvalidAuthenticationStage => 4
   );
   for SecondaryAuthenticationFactorAuthenticationStatus'Size use 32;
   
   type SecondaryAuthenticationFactorAuthenticationStatus_Ptr is access SecondaryAuthenticationFactorAuthenticationStatus;
   
   type SecondaryAuthenticationFactorFinishAuthenticationStatus is (
      Failed,
      Completed,
      NonceExpired
   );
   for SecondaryAuthenticationFactorFinishAuthenticationStatus use (
      Failed => 0,
      Completed => 1,
      NonceExpired => 2
   );
   for SecondaryAuthenticationFactorFinishAuthenticationStatus'Size use 32;
   
   type SecondaryAuthenticationFactorFinishAuthenticationStatus_Ptr is access SecondaryAuthenticationFactorFinishAuthenticationStatus;
   
   type SecondaryAuthenticationFactorAuthenticationScenario is (
      SignIn,
      CredentialPrompt
   );
   for SecondaryAuthenticationFactorAuthenticationScenario use (
      SignIn => 0,
      CredentialPrompt => 1
   );
   for SecondaryAuthenticationFactorAuthenticationScenario'Size use 32;
   
   type SecondaryAuthenticationFactorAuthenticationScenario_Ptr is access SecondaryAuthenticationFactorAuthenticationScenario;
   
   type SecondaryAuthenticationFactorAuthenticationMessage is (
      Invalid,
      SwipeUpWelcome,
      TapWelcome,
      DeviceNeedsAttention,
      LookingForDevice,
      LookingForDevicePluggedin,
      BluetoothIsDisabled,
      NfcIsDisabled,
      WiFiIsDisabled,
      ExtraTapIsRequired,
      DisabledByPolicy,
      TapOnDeviceRequired,
      HoldFinger,
      ScanFinger,
      UnauthorizedUser,
      ReregisterRequired,
      TryAgain,
      SayPassphrase,
      ReadyToSignIn,
      UseAnotherSignInOption
   );
   for SecondaryAuthenticationFactorAuthenticationMessage use (
      Invalid => 0,
      SwipeUpWelcome => 1,
      TapWelcome => 2,
      DeviceNeedsAttention => 3,
      LookingForDevice => 4,
      LookingForDevicePluggedin => 5,
      BluetoothIsDisabled => 6,
      NfcIsDisabled => 7,
      WiFiIsDisabled => 8,
      ExtraTapIsRequired => 9,
      DisabledByPolicy => 10,
      TapOnDeviceRequired => 11,
      HoldFinger => 12,
      ScanFinger => 13,
      UnauthorizedUser => 14,
      ReregisterRequired => 15,
      TryAgain => 16,
      SayPassphrase => 17,
      ReadyToSignIn => 18,
      UseAnotherSignInOption => 19
   );
   for SecondaryAuthenticationFactorAuthenticationMessage'Size use 32;
   
   type SecondaryAuthenticationFactorAuthenticationMessage_Ptr is access SecondaryAuthenticationFactorAuthenticationMessage;
   
   type SecondaryAuthenticationFactorDevicePresence is (
      Absent,
      Present
   );
   for SecondaryAuthenticationFactorDevicePresence use (
      Absent => 0,
      Present => 1
   );
   for SecondaryAuthenticationFactorDevicePresence'Size use 32;
   
   type SecondaryAuthenticationFactorDevicePresence_Ptr is access SecondaryAuthenticationFactorDevicePresence;
   
   type SecondaryAuthenticationFactorDevicePresenceMonitoringMode is (
      Unsupported,
      AppManaged,
      SystemManaged
   );
   for SecondaryAuthenticationFactorDevicePresenceMonitoringMode use (
      Unsupported => 0,
      AppManaged => 1,
      SystemManaged => 2
   );
   for SecondaryAuthenticationFactorDevicePresenceMonitoringMode'Size use 32;
   
   type SecondaryAuthenticationFactorDevicePresenceMonitoringMode_Ptr is access SecondaryAuthenticationFactorDevicePresenceMonitoringMode;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorRegistrationResult_Interface;
   type AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorRegistrationResult is access all AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorRegistrationResult_Interface'Class;
   type AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorRegistrationResult_Ptr is access all AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorRegistrationResult;
   type AsyncOperationCompletedHandler_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus_Interface;
   type AsyncOperationCompletedHandler_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus is access all AsyncOperationCompletedHandler_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus_Interface'Class;
   type AsyncOperationCompletedHandler_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus_Ptr is access all AsyncOperationCompletedHandler_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus;
   type AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorAuthenticationResult_Interface;
   type AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorAuthenticationResult is access all AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorAuthenticationResult_Interface'Class;
   type AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorAuthenticationResult_Ptr is access all AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorAuthenticationResult;
   type EventHandler_ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs_Interface;
   type EventHandler_ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs is access all EventHandler_ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs_Interface'Class;
   type EventHandler_ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs_Ptr is access all EventHandler_ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs;
   type AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorAuthenticationStageInfo_Interface;
   type AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorAuthenticationStageInfo is access all AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorAuthenticationStageInfo_Interface'Class;
   type AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorAuthenticationStageInfo_Ptr is access all AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorAuthenticationStageInfo;
   type AsyncOperationCompletedHandler_SecondaryAuthenticationFactorFinishAuthenticationStatus_Interface;
   type AsyncOperationCompletedHandler_SecondaryAuthenticationFactorFinishAuthenticationStatus is access all AsyncOperationCompletedHandler_SecondaryAuthenticationFactorFinishAuthenticationStatus_Interface'Class;
   type AsyncOperationCompletedHandler_SecondaryAuthenticationFactorFinishAuthenticationStatus_Ptr is access all AsyncOperationCompletedHandler_SecondaryAuthenticationFactorFinishAuthenticationStatus;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ISecondaryAuthenticationFactorRegistrationResult_Interface;
   type ISecondaryAuthenticationFactorRegistrationResult is access all ISecondaryAuthenticationFactorRegistrationResult_Interface'Class;
   type ISecondaryAuthenticationFactorRegistrationResult_Ptr is access all ISecondaryAuthenticationFactorRegistrationResult;
   type ISecondaryAuthenticationFactorAuthenticationResult_Interface;
   type ISecondaryAuthenticationFactorAuthenticationResult is access all ISecondaryAuthenticationFactorAuthenticationResult_Interface'Class;
   type ISecondaryAuthenticationFactorAuthenticationResult_Ptr is access all ISecondaryAuthenticationFactorAuthenticationResult;
   type ISecondaryAuthenticationFactorRegistrationStatics_Interface;
   type ISecondaryAuthenticationFactorRegistrationStatics is access all ISecondaryAuthenticationFactorRegistrationStatics_Interface'Class;
   type ISecondaryAuthenticationFactorRegistrationStatics_Ptr is access all ISecondaryAuthenticationFactorRegistrationStatics;
   type ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics_Interface;
   type ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics is access all ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics_Interface'Class;
   type ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics_Ptr is access all ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics;
   type ISecondaryAuthenticationFactorRegistration_Interface;
   type ISecondaryAuthenticationFactorRegistration is access all ISecondaryAuthenticationFactorRegistration_Interface'Class;
   type ISecondaryAuthenticationFactorRegistration_Ptr is access all ISecondaryAuthenticationFactorRegistration;
   type ISecondaryAuthenticationFactorAuthenticationStatics_Interface;
   type ISecondaryAuthenticationFactorAuthenticationStatics is access all ISecondaryAuthenticationFactorAuthenticationStatics_Interface'Class;
   type ISecondaryAuthenticationFactorAuthenticationStatics_Ptr is access all ISecondaryAuthenticationFactorAuthenticationStatics;
   type ISecondaryAuthenticationFactorAuthentication_Interface;
   type ISecondaryAuthenticationFactorAuthentication is access all ISecondaryAuthenticationFactorAuthentication_Interface'Class;
   type ISecondaryAuthenticationFactorAuthentication_Ptr is access all ISecondaryAuthenticationFactorAuthentication;
   type ISecondaryAuthenticationFactorInfo_Interface;
   type ISecondaryAuthenticationFactorInfo is access all ISecondaryAuthenticationFactorInfo_Interface'Class;
   type ISecondaryAuthenticationFactorInfo_Ptr is access all ISecondaryAuthenticationFactorInfo;
   type ISecondaryAuthenticationFactorInfo2_Interface;
   type ISecondaryAuthenticationFactorInfo2 is access all ISecondaryAuthenticationFactorInfo2_Interface'Class;
   type ISecondaryAuthenticationFactorInfo2_Ptr is access all ISecondaryAuthenticationFactorInfo2;
   type ISecondaryAuthenticationFactorAuthenticationStageInfo_Interface;
   type ISecondaryAuthenticationFactorAuthenticationStageInfo is access all ISecondaryAuthenticationFactorAuthenticationStageInfo_Interface'Class;
   type ISecondaryAuthenticationFactorAuthenticationStageInfo_Ptr is access all ISecondaryAuthenticationFactorAuthenticationStageInfo;
   type ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs_Interface;
   type ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs is access all ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs_Interface'Class;
   type ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs_Ptr is access all ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs;
   type IAsyncOperation_ISecondaryAuthenticationFactorRegistrationResult_Interface;
   type IAsyncOperation_ISecondaryAuthenticationFactorRegistrationResult is access all IAsyncOperation_ISecondaryAuthenticationFactorRegistrationResult_Interface'Class;
   type IAsyncOperation_ISecondaryAuthenticationFactorRegistrationResult_Ptr is access all IAsyncOperation_ISecondaryAuthenticationFactorRegistrationResult;
   type IAsyncOperation_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus_Interface;
   type IAsyncOperation_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus is access all IAsyncOperation_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus_Interface'Class;
   type IAsyncOperation_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus_Ptr is access all IAsyncOperation_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus;
   type IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationResult_Interface;
   type IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationResult is access all IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationResult_Interface'Class;
   type IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationResult_Ptr is access all IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationResult;
   type IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationStageInfo_Interface;
   type IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationStageInfo is access all IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationStageInfo_Interface'Class;
   type IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationStageInfo_Ptr is access all IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationStageInfo;
   type IAsyncOperation_SecondaryAuthenticationFactorFinishAuthenticationStatus_Interface;
   type IAsyncOperation_SecondaryAuthenticationFactorFinishAuthenticationStatus is access all IAsyncOperation_SecondaryAuthenticationFactorFinishAuthenticationStatus_Interface'Class;
   type IAsyncOperation_SecondaryAuthenticationFactorFinishAuthenticationStatus_Ptr is access all IAsyncOperation_SecondaryAuthenticationFactorFinishAuthenticationStatus;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ISecondaryAuthenticationFactorRegistrationResult : aliased constant Windows.IID := (2768123376, 44515, 18817, (175, 107, 236, 25, 89, 33, 104, 42 ));
   
   type ISecondaryAuthenticationFactorRegistrationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access ISecondaryAuthenticationFactorRegistrationResult_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorRegistrationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Registration
   (
      This       : access ISecondaryAuthenticationFactorRegistrationResult_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Provider.ISecondaryAuthenticationFactorRegistration
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISecondaryAuthenticationFactorAuthenticationResult : aliased constant Windows.IID := (2629523847, 61293, 19394, (191, 73, 70, 23, 81, 90, 15, 154 ));
   
   type ISecondaryAuthenticationFactorAuthenticationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access ISecondaryAuthenticationFactorAuthenticationResult_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorAuthenticationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Authentication
   (
      This       : access ISecondaryAuthenticationFactorAuthenticationResult_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Provider.ISecondaryAuthenticationFactorAuthentication
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISecondaryAuthenticationFactorRegistrationStatics : aliased constant Windows.IID := (450826085, 58295, 16725, (153, 127, 183, 86, 239, 101, 190, 186 ));
   
   type ISecondaryAuthenticationFactorRegistrationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestStartRegisteringDeviceAsync
   (
      This       : access ISecondaryAuthenticationFactorRegistrationStatics_Interface
      ; deviceId : Windows.String
      ; capabilities : Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorDeviceCapabilities
      ; deviceFriendlyName : Windows.String
      ; deviceModelNumber : Windows.String
      ; deviceKey : Windows.Storage.Streams.IBuffer
      ; mutualAuthenticationKey : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Security.Authentication.Identity.Provider.IAsyncOperation_ISecondaryAuthenticationFactorRegistrationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAllRegisteredDeviceInfoAsync
   (
      This       : access ISecondaryAuthenticationFactorRegistrationStatics_Interface
      ; queryType : Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorDeviceFindScope
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function UnregisterDeviceAsync
   (
      This       : access ISecondaryAuthenticationFactorRegistrationStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function UpdateDeviceConfigurationDataAsync
   (
      This       : access ISecondaryAuthenticationFactorRegistrationStatics_Interface
      ; deviceId : Windows.String
      ; deviceConfigurationData : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics : aliased constant Windows.IID := (2420742681, 32498, 17699, (149, 28, 164, 23, 162, 74, 207, 147 ));
   
   type ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function RegisterDevicePresenceMonitoringAsync
   (
      This       : access ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics_Interface
      ; deviceId : Windows.String
      ; deviceInstancePath : Windows.String
      ; monitoringMode : Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorDevicePresenceMonitoringMode
      ; RetVal : access Windows.Security.Authentication.Identity.Provider.IAsyncOperation_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RegisterDevicePresenceMonitoringWithNewDeviceAsync
   (
      This       : access ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics_Interface
      ; deviceId : Windows.String
      ; deviceInstancePath : Windows.String
      ; monitoringMode : Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorDevicePresenceMonitoringMode
      ; deviceFriendlyName : Windows.String
      ; deviceModelNumber : Windows.String
      ; deviceConfigurationData : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Security.Authentication.Identity.Provider.IAsyncOperation_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function UnregisterDevicePresenceMonitoringAsync
   (
      This       : access ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function IsDevicePresenceMonitoringSupported
   (
      This       : access ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISecondaryAuthenticationFactorRegistration : aliased constant Windows.IID := (2672606132, 36026, 18608, (132, 13, 219, 178, 42, 84, 198, 120 ));
   
   type ISecondaryAuthenticationFactorRegistration_Interface is interface and Windows.IInspectable_Interface;
   
   function FinishRegisteringDeviceAsync
   (
      This       : access ISecondaryAuthenticationFactorRegistration_Interface
      ; deviceConfigurationData : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function AbortRegisteringDeviceAsync
   (
      This       : access ISecondaryAuthenticationFactorRegistration_Interface
      ; errorLogMessage : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISecondaryAuthenticationFactorAuthenticationStatics : aliased constant Windows.IID := (1062741590, 10488, 19983, (174, 140, 88, 152, 185, 174, 36, 105 ));
   
   type ISecondaryAuthenticationFactorAuthenticationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function ShowNotificationMessageAsync
   (
      This       : access ISecondaryAuthenticationFactorAuthenticationStatics_Interface
      ; deviceName : Windows.String
      ; message : Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorAuthenticationMessage
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function StartAuthenticationAsync
   (
      This       : access ISecondaryAuthenticationFactorAuthenticationStatics_Interface
      ; deviceId : Windows.String
      ; serviceAuthenticationNonce : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Security.Authentication.Identity.Provider.IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_AuthenticationStageChanged
   (
      This       : access ISecondaryAuthenticationFactorAuthenticationStatics_Interface
      ; handler : Windows.Security.Authentication.Identity.Provider.EventHandler_ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AuthenticationStageChanged
   (
      This       : access ISecondaryAuthenticationFactorAuthenticationStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function GetAuthenticationStageInfoAsync
   (
      This       : access ISecondaryAuthenticationFactorAuthenticationStatics_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Provider.IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationStageInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISecondaryAuthenticationFactorAuthentication : aliased constant Windows.IID := (34215653, 27173, 16547, (140, 0, 80, 160, 35, 246, 25, 209 ));
   
   type ISecondaryAuthenticationFactorAuthentication_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ServiceAuthenticationHmac
   (
      This       : access ISecondaryAuthenticationFactorAuthentication_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_SessionNonce
   (
      This       : access ISecondaryAuthenticationFactorAuthentication_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceNonce
   (
      This       : access ISecondaryAuthenticationFactorAuthentication_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceConfigurationData
   (
      This       : access ISecondaryAuthenticationFactorAuthentication_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function FinishAuthenticationAsync
   (
      This       : access ISecondaryAuthenticationFactorAuthentication_Interface
      ; deviceHmac : Windows.Storage.Streams.IBuffer
      ; sessionHmac : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Security.Authentication.Identity.Provider.IAsyncOperation_SecondaryAuthenticationFactorFinishAuthenticationStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function AbortAuthenticationAsync
   (
      This       : access ISecondaryAuthenticationFactorAuthentication_Interface
      ; errorLogMessage : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISecondaryAuthenticationFactorInfo : aliased constant Windows.IID := (506177633, 34099, 20430, (131, 155, 236, 183, 36, 16, 172, 20 ));
   
   type ISecondaryAuthenticationFactorInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access ISecondaryAuthenticationFactorInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceFriendlyName
   (
      This       : access ISecondaryAuthenticationFactorInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceModelNumber
   (
      This       : access ISecondaryAuthenticationFactorInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceConfigurationData
   (
      This       : access ISecondaryAuthenticationFactorInfo_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISecondaryAuthenticationFactorInfo2 : aliased constant Windows.IID := (349798819, 64550, 20471, (171, 195, 72, 232, 42, 81, 42, 10 ));
   
   type ISecondaryAuthenticationFactorInfo2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PresenceMonitoringMode
   (
      This       : access ISecondaryAuthenticationFactorInfo2_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorDevicePresenceMonitoringMode
   )
   return Windows.HRESULT is abstract;
   
   function UpdateDevicePresenceAsync
   (
      This       : access ISecondaryAuthenticationFactorInfo2_Interface
      ; presenceState : Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorDevicePresence
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function get_IsAuthenticationSupported
   (
      This       : access ISecondaryAuthenticationFactorInfo2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISecondaryAuthenticationFactorAuthenticationStageInfo : aliased constant Windows.IID := (1459536523, 59562, 19471, (142, 76, 165, 89, 231, 58, 221, 136 ));
   
   type ISecondaryAuthenticationFactorAuthenticationStageInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Stage
   (
      This       : access ISecondaryAuthenticationFactorAuthenticationStageInfo_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorAuthenticationStage
   )
   return Windows.HRESULT is abstract;
   
   function get_Scenario
   (
      This       : access ISecondaryAuthenticationFactorAuthenticationStageInfo_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorAuthenticationScenario
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceId
   (
      This       : access ISecondaryAuthenticationFactorAuthenticationStageInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs : aliased constant Windows.IID := (3567644246, 29329, 16499, (188, 31, 204, 184, 245, 175, 223, 150 ));
   
   type ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StageInfo
   (
      This       : access ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Provider.ISecondaryAuthenticationFactorAuthenticationStageInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ISecondaryAuthenticationFactorRegistrationResult : aliased constant Windows.IID := (98193932, 43940, 22604, (188, 8, 25, 197, 56, 154, 112, 226 ));
   
   type IAsyncOperation_ISecondaryAuthenticationFactorRegistrationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ISecondaryAuthenticationFactorRegistrationResult_Interface
      ; handler : Windows.Security.Authentication.Identity.Provider.AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorRegistrationResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ISecondaryAuthenticationFactorRegistrationResult_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Provider.AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorRegistrationResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ISecondaryAuthenticationFactorRegistrationResult_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Provider.ISecondaryAuthenticationFactorRegistrationResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus : aliased constant Windows.IID := (2134371562, 58344, 21500, (176, 229, 122, 164, 113, 151, 14, 221 ));
   
   type IAsyncOperation_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus_Interface
      ; handler : Windows.Security.Authentication.Identity.Provider.AsyncOperationCompletedHandler_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Provider.AsyncOperationCompletedHandler_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationResult : aliased constant Windows.IID := (414230332, 56153, 21113, (167, 109, 2, 65, 107, 45, 144, 182 ));
   
   type IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationResult_Interface
      ; handler : Windows.Security.Authentication.Identity.Provider.AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorAuthenticationResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationResult_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Provider.AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorAuthenticationResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationResult_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Provider.ISecondaryAuthenticationFactorAuthenticationResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationStageInfo : aliased constant Windows.IID := (2253005591, 46144, 24222, (174, 85, 69, 80, 187, 99, 7, 223 ));
   
   type IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationStageInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationStageInfo_Interface
      ; handler : Windows.Security.Authentication.Identity.Provider.AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorAuthenticationStageInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationStageInfo_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Provider.AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorAuthenticationStageInfo
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationStageInfo_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Provider.ISecondaryAuthenticationFactorAuthenticationStageInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_SecondaryAuthenticationFactorFinishAuthenticationStatus : aliased constant Windows.IID := (2438546298, 17303, 21614, (190, 97, 46, 241, 97, 113, 126, 6 ));
   
   type IAsyncOperation_SecondaryAuthenticationFactorFinishAuthenticationStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_SecondaryAuthenticationFactorFinishAuthenticationStatus_Interface
      ; handler : Windows.Security.Authentication.Identity.Provider.AsyncOperationCompletedHandler_SecondaryAuthenticationFactorFinishAuthenticationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_SecondaryAuthenticationFactorFinishAuthenticationStatus_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Provider.AsyncOperationCompletedHandler_SecondaryAuthenticationFactorFinishAuthenticationStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_SecondaryAuthenticationFactorFinishAuthenticationStatus_Interface
      ; RetVal : access Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorFinishAuthenticationStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorRegistrationResult : aliased constant Windows.IID := (2689139432, 63536, 20714, (137, 234, 150, 226, 166, 251, 148, 83 ));
   
   type AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorRegistrationResult_Interface(Callback : access procedure (asyncInfo : Windows.Security.Authentication.Identity.Provider.IAsyncOperation_ISecondaryAuthenticationFactorRegistrationResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorRegistrationResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorRegistrationResult_Interface
      ; asyncInfo : Windows.Security.Authentication.Identity.Provider.IAsyncOperation_ISecondaryAuthenticationFactorRegistrationResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus : aliased constant Windows.IID := (580166162, 36961, 24217, (162, 38, 164, 74, 200, 248, 244, 221 ));
   
   type AsyncOperationCompletedHandler_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus_Interface(Callback : access procedure (asyncInfo : Windows.Security.Authentication.Identity.Provider.IAsyncOperation_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus_Interface
      ; asyncInfo : Windows.Security.Authentication.Identity.Provider.IAsyncOperation_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorAuthenticationResult : aliased constant Windows.IID := (625424189, 38532, 24155, (169, 184, 166, 249, 12, 230, 50, 173 ));
   
   type AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorAuthenticationResult_Interface(Callback : access procedure (asyncInfo : Windows.Security.Authentication.Identity.Provider.IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorAuthenticationResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorAuthenticationResult_Interface
      ; asyncInfo : Windows.Security.Authentication.Identity.Provider.IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_EventHandler_ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs : aliased constant Windows.IID := (272669500, 17124, 22639, (132, 193, 128, 61, 162, 55, 101, 175 ));
   
   type EventHandler_ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.Security.Authentication.Identity.Provider.ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_EventHandler_ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs'access) with null record;
   function Invoke
   (
      This       : access EventHandler_ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs_Interface
      ; sender : Windows.Object
      ; args : Windows.Security.Authentication.Identity.Provider.ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorAuthenticationStageInfo : aliased constant Windows.IID := (2014434180, 11960, 22769, (175, 237, 75, 75, 136, 143, 67, 87 ));
   
   type AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorAuthenticationStageInfo_Interface(Callback : access procedure (asyncInfo : Windows.Security.Authentication.Identity.Provider.IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationStageInfo ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorAuthenticationStageInfo'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISecondaryAuthenticationFactorAuthenticationStageInfo_Interface
      ; asyncInfo : Windows.Security.Authentication.Identity.Provider.IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationStageInfo
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_SecondaryAuthenticationFactorFinishAuthenticationStatus : aliased constant Windows.IID := (2921165126, 15761, 20707, (143, 19, 97, 60, 242, 128, 18, 7 ));
   
   type AsyncOperationCompletedHandler_SecondaryAuthenticationFactorFinishAuthenticationStatus_Interface(Callback : access procedure (asyncInfo : Windows.Security.Authentication.Identity.Provider.IAsyncOperation_SecondaryAuthenticationFactorFinishAuthenticationStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_SecondaryAuthenticationFactorFinishAuthenticationStatus'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_SecondaryAuthenticationFactorFinishAuthenticationStatus_Interface
      ; asyncInfo : Windows.Security.Authentication.Identity.Provider.IAsyncOperation_SecondaryAuthenticationFactorFinishAuthenticationStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype SecondaryAuthenticationFactorRegistration is Windows.Security.Authentication.Identity.Provider.ISecondaryAuthenticationFactorRegistration;
   subtype SecondaryAuthenticationFactorRegistrationResult is Windows.Security.Authentication.Identity.Provider.ISecondaryAuthenticationFactorRegistrationResult;
   subtype SecondaryAuthenticationFactorAuthentication is Windows.Security.Authentication.Identity.Provider.ISecondaryAuthenticationFactorAuthentication;
   subtype SecondaryAuthenticationFactorAuthenticationResult is Windows.Security.Authentication.Identity.Provider.ISecondaryAuthenticationFactorAuthenticationResult;
   subtype SecondaryAuthenticationFactorInfo is Windows.Security.Authentication.Identity.Provider.ISecondaryAuthenticationFactorInfo;
   subtype SecondaryAuthenticationFactorAuthenticationStageChangedEventArgs is Windows.Security.Authentication.Identity.Provider.ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs;
   subtype SecondaryAuthenticationFactorAuthenticationStageInfo is Windows.Security.Authentication.Identity.Provider.ISecondaryAuthenticationFactorAuthenticationStageInfo;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function RegisterDevicePresenceMonitoringAsync
   (
      deviceId : Windows.String
      ; deviceInstancePath : Windows.String
      ; monitoringMode : Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorDevicePresenceMonitoringMode
   )
   return Windows.Security.Authentication.Identity.Provider.IAsyncOperation_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus;
   
   function RegisterDevicePresenceMonitoringWithNewDeviceAsync
   (
      deviceId : Windows.String
      ; deviceInstancePath : Windows.String
      ; monitoringMode : Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorDevicePresenceMonitoringMode
      ; deviceFriendlyName : Windows.String
      ; deviceModelNumber : Windows.String
      ; deviceConfigurationData : Windows.Storage.Streams.IBuffer
   )
   return Windows.Security.Authentication.Identity.Provider.IAsyncOperation_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus;
   
   function UnregisterDevicePresenceMonitoringAsync
   (
      deviceId : Windows.String
   )
   return Windows.Foundation.IAsyncAction;
   
   function IsDevicePresenceMonitoringSupported
   return Windows.Boolean;
   
   function RequestStartRegisteringDeviceAsync
   (
      deviceId : Windows.String
      ; capabilities : Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorDeviceCapabilities
      ; deviceFriendlyName : Windows.String
      ; deviceModelNumber : Windows.String
      ; deviceKey : Windows.Storage.Streams.IBuffer
      ; mutualAuthenticationKey : Windows.Storage.Streams.IBuffer
   )
   return Windows.Security.Authentication.Identity.Provider.IAsyncOperation_ISecondaryAuthenticationFactorRegistrationResult;
   
   function FindAllRegisteredDeviceInfoAsync
   (
      queryType : Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorDeviceFindScope
   )
   return Windows.Address;
   
   function UnregisterDeviceAsync
   (
      deviceId : Windows.String
   )
   return Windows.Foundation.IAsyncAction;
   
   function UpdateDeviceConfigurationDataAsync
   (
      deviceId : Windows.String
      ; deviceConfigurationData : Windows.Storage.Streams.IBuffer
   )
   return Windows.Foundation.IAsyncAction;
   
   function ShowNotificationMessageAsync
   (
      deviceName : Windows.String
      ; message : Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorAuthenticationMessage
   )
   return Windows.Foundation.IAsyncAction;
   
   function StartAuthenticationAsync
   (
      deviceId : Windows.String
      ; serviceAuthenticationNonce : Windows.Storage.Streams.IBuffer
   )
   return Windows.Security.Authentication.Identity.Provider.IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationResult;
   
   function add_AuthenticationStageChanged
   (
      handler : Windows.Security.Authentication.Identity.Provider.EventHandler_ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_AuthenticationStageChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function GetAuthenticationStageInfoAsync
   return Windows.Security.Authentication.Identity.Provider.IAsyncOperation_ISecondaryAuthenticationFactorAuthenticationStageInfo;
   
end;
