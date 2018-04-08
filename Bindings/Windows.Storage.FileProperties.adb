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
with Windows.Devices.Geolocation;
with Windows.Storage;
with Windows.Storage.Streams;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Storage.FileProperties is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMusicProperties_Interface
      ; asyncInfo : Windows.Storage.FileProperties.IAsyncOperation_IMusicProperties
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
      This       : access AsyncOperationCompletedHandler_IVideoProperties_Interface
      ; asyncInfo : Windows.Storage.FileProperties.IAsyncOperation_IVideoProperties
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
      This       : access AsyncOperationCompletedHandler_IImageProperties_Interface
      ; asyncInfo : Windows.Storage.FileProperties.IAsyncOperation_IImageProperties
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
      This       : access AsyncOperationCompletedHandler_IDocumentProperties_Interface
      ; asyncInfo : Windows.Storage.FileProperties.IAsyncOperation_IDocumentProperties
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
      This       : access AsyncOperationCompletedHandler_IBasicProperties_Interface
      ; asyncInfo : Windows.Storage.FileProperties.IAsyncOperation_IBasicProperties
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
   
   
   function GetGeotagAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Devices.Geolocation.IAsyncOperation_IGeopoint is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.FileProperties.GeotagHelper");
      m_Factory     : IGeotagHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Geolocation.IAsyncOperation_IGeopoint;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGeotagHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetGeotagAsync(file, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function SetGeotagFromGeolocatorAsync
   (
      file : Windows.Storage.IStorageFile
      ; geolocator : Windows.Devices.Geolocation.IGeolocator
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.FileProperties.GeotagHelper");
      m_Factory     : IGeotagHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGeotagHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetGeotagFromGeolocatorAsync(file, geolocator, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function SetGeotagAsync
   (
      file : Windows.Storage.IStorageFile
      ; geopoint : Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.FileProperties.GeotagHelper");
      m_Factory     : IGeotagHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGeotagHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetGeotagAsync(file, geopoint, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
