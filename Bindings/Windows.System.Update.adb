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
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.System.Update is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function add_StateChanged
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Update.SystemUpdateManager");
      m_Factory     : ISystemUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_StateChanged(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function BlockAutomaticRebootAsync
   (
      lockId : Windows.String
   )
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Update.SystemUpdateManager");
      m_Factory     : ISystemUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.BlockAutomaticRebootAsync(lockId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AttentionRequiredReason
   return Windows.System.Update.SystemUpdateAttentionRequiredReason is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Update.SystemUpdateManager");
      m_Factory     : ISystemUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Update.SystemUpdateAttentionRequiredReason;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AttentionRequiredReason(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DownloadProgress
   return Windows.Double is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Update.SystemUpdateManager");
      m_Factory     : ISystemUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Double;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DownloadProgress(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ExtendedError
   return Windows.HResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Update.SystemUpdateManager");
      m_Factory     : ISystemUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.HResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ExtendedError(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_InstallProgress
   return Windows.Double is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Update.SystemUpdateManager");
      m_Factory     : ISystemUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Double;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_InstallProgress(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LastErrorInfo
   return Windows.System.Update.ISystemUpdateLastErrorInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Update.SystemUpdateManager");
      m_Factory     : ISystemUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Update.ISystemUpdateLastErrorInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LastErrorInfo(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LastUpdateCheckTime
   return Windows.Foundation.DateTime is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Update.SystemUpdateManager");
      m_Factory     : ISystemUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.DateTime;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LastUpdateCheckTime(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LastUpdateInstallTime
   return Windows.Foundation.DateTime is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Update.SystemUpdateManager");
      m_Factory     : ISystemUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.DateTime;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LastUpdateInstallTime(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_State
   return Windows.System.Update.SystemUpdateManagerState is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Update.SystemUpdateManager");
      m_Factory     : ISystemUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Update.SystemUpdateManagerState;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_State(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_UserActiveHoursEnd
   return Windows.Foundation.TimeSpan is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Update.SystemUpdateManager");
      m_Factory     : ISystemUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.TimeSpan;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_UserActiveHoursEnd(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_UserActiveHoursMax
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Update.SystemUpdateManager");
      m_Factory     : ISystemUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_UserActiveHoursMax(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_UserActiveHoursStart
   return Windows.Foundation.TimeSpan is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Update.SystemUpdateManager");
      m_Factory     : ISystemUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.TimeSpan;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_UserActiveHoursStart(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetAutomaticRebootBlockIds
   return Windows.Foundation.Collections.IVectorView_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Update.SystemUpdateManager");
      m_Factory     : ISystemUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Collections.IVectorView_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetAutomaticRebootBlockIds(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetFlightRing
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Update.SystemUpdateManager");
      m_Factory     : ISystemUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetFlightRing(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetUpdateItems
   return Windows.System.Update.IVectorView_ISystemUpdateItem is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Update.SystemUpdateManager");
      m_Factory     : ISystemUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Update.IVectorView_ISystemUpdateItem;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetUpdateItems(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsSupported
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Update.SystemUpdateManager");
      m_Factory     : ISystemUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsSupported(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure RebootToCompleteInstall
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Update.SystemUpdateManager");
      m_Factory     : ISystemUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RebootToCompleteInstall;
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure remove_StateChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Update.SystemUpdateManager");
      m_Factory     : ISystemUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_StateChanged(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function SetFlightRing
   (
      flightRing : Windows.String
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Update.SystemUpdateManager");
      m_Factory     : ISystemUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetFlightRing(flightRing, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure StartCancelUpdates
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Update.SystemUpdateManager");
      m_Factory     : ISystemUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.StartCancelUpdates;
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure StartInstall
   (
      action : Windows.System.Update.SystemUpdateStartInstallAction
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Update.SystemUpdateManager");
      m_Factory     : ISystemUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.StartInstall(action);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function TrySetUserActiveHours
   (
      start : Windows.Foundation.TimeSpan
      ; end_x : Windows.Foundation.TimeSpan
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Update.SystemUpdateManager");
      m_Factory     : ISystemUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TrySetUserActiveHours(start, end_x, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function UnblockAutomaticRebootAsync
   (
      lockId : Windows.String
   )
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Update.SystemUpdateManager");
      m_Factory     : ISystemUpdateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemUpdateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.UnblockAutomaticRebootAsync(lockId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;