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
with Windows.UI;
with Windows.Storage.Streams;
with Windows.Storage;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Data.Pdf is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPdfDocument_Interface
      ; asyncInfo : Windows.Data.Pdf.IAsyncOperation_IPdfDocument
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
   
   
   function CreatePdfPageRenderOptions return Windows.Data.Pdf.IPdfPageRenderOptions is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Pdf.PdfPageRenderOptions");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Data.Pdf.IPdfPageRenderOptions) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Data.Pdf.IID_IPdfPageRenderOptions'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   
   function LoadFromFileAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Data.Pdf.IAsyncOperation_IPdfDocument is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Pdf.PdfDocument");
      m_Factory     : IPdfDocumentStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Pdf.IAsyncOperation_IPdfDocument;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPdfDocumentStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadFromFileAsync(file, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LoadFromFileWithPasswordAsync
   (
      file : Windows.Storage.IStorageFile
      ; password : Windows.String
   )
   return Windows.Data.Pdf.IAsyncOperation_IPdfDocument is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Pdf.PdfDocument");
      m_Factory     : IPdfDocumentStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Pdf.IAsyncOperation_IPdfDocument;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPdfDocumentStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadFromFileWithPasswordAsync(file, password, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LoadFromStreamAsync
   (
      inputStream : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.Data.Pdf.IAsyncOperation_IPdfDocument is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Pdf.PdfDocument");
      m_Factory     : IPdfDocumentStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Pdf.IAsyncOperation_IPdfDocument;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPdfDocumentStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadFromStreamAsync(inputStream, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LoadFromStreamWithPasswordAsync
   (
      inputStream : Windows.Storage.Streams.IRandomAccessStream
      ; password : Windows.String
   )
   return Windows.Data.Pdf.IAsyncOperation_IPdfDocument is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Pdf.PdfDocument");
      m_Factory     : IPdfDocumentStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Pdf.IAsyncOperation_IPdfDocument;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPdfDocumentStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadFromStreamWithPasswordAsync(inputStream, password, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
