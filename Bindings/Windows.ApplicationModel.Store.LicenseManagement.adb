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
with Windows.Storage.Streams;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.ApplicationModel.Store.LicenseManagement is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ILicenseSatisfactionResult_Interface
      ; asyncInfo : Windows.ApplicationModel.Store.LicenseManagement.IAsyncOperation_ILicenseSatisfactionResult
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
   
   function RefreshLicensesAsync
   (
      refreshOption : Windows.ApplicationModel.Store.LicenseManagement.LicenseRefreshOption
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.LicenseManagement.LicenseManager");
      m_Factory     : ILicenseManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILicenseManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RefreshLicensesAsync(refreshOption, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function AddLicenseAsync
   (
      license : Windows.Storage.Streams.IBuffer
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.LicenseManagement.LicenseManager");
      m_Factory     : ILicenseManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILicenseManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.AddLicenseAsync(license, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetSatisfactionInfosAsync
   (
      contentIds : Windows.Foundation.Collections.IIterable_String
      ; keyIds : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.ApplicationModel.Store.LicenseManagement.IAsyncOperation_ILicenseSatisfactionResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Store.LicenseManagement.LicenseManager");
      m_Factory     : ILicenseManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Store.LicenseManagement.IAsyncOperation_ILicenseSatisfactionResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILicenseManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetSatisfactionInfosAsync(contentIds, keyIds, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   

end;
