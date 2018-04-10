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
with Windows.System;
with Windows.Storage.Streams;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Gaming.XboxLive.Storage is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGameSaveOperationResult_Interface
      ; asyncInfo : Windows.Gaming.XboxLive.Storage.IAsyncOperation_IGameSaveOperationResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGameSaveProviderGetResult_Interface
      ; asyncInfo : Windows.Gaming.XboxLive.Storage.IAsyncOperation_IGameSaveProviderGetResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGameSaveBlobGetResult_Interface
      ; asyncInfo : Windows.Gaming.XboxLive.Storage.IAsyncOperation_IGameSaveBlobGetResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGameSaveContainerInfoGetResult_Interface
      ; asyncInfo : Windows.Gaming.XboxLive.Storage.IAsyncOperation_IGameSaveContainerInfoGetResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGameSaveBlobInfoGetResult_Interface
      ; asyncInfo : Windows.Gaming.XboxLive.Storage.IAsyncOperation_IGameSaveBlobInfoGetResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function GetForUserAsync
   (
      user : Windows.System.IUser
      ; serviceConfigId : Windows.String
   )
   return Windows.Gaming.XboxLive.Storage.IAsyncOperation_IGameSaveProviderGetResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.XboxLive.Storage.GameSaveProvider");
      m_Factory     : IGameSaveProviderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Gaming.XboxLive.Storage.IAsyncOperation_IGameSaveProviderGetResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGameSaveProviderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForUserAsync(user, serviceConfigId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetSyncOnDemandForUserAsync
   (
      user : Windows.System.IUser
      ; serviceConfigId : Windows.String
   )
   return Windows.Gaming.XboxLive.Storage.IAsyncOperation_IGameSaveProviderGetResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.XboxLive.Storage.GameSaveProvider");
      m_Factory     : IGameSaveProviderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Gaming.XboxLive.Storage.IAsyncOperation_IGameSaveProviderGetResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGameSaveProviderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetSyncOnDemandForUserAsync(user, serviceConfigId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   

end;
