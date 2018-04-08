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
with Windows.Storage;
with Windows.System;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Storage.Streams is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IRandomAccessStreamWithContentType_Interface
      ; asyncInfo : Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamWithContentType
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
      This       : access AsyncOperationCompletedHandler_IBuffer_Interface
      ; asyncInfo : Windows.Storage.Streams.IAsyncOperation_IBuffer
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
      This       : access AsyncOperationCompletedHandler_IRandomAccessStreamReference_Interface
      ; asyncInfo : Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamReference
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
      This       : access AsyncOperationCompletedHandler_IRandomAccessStream_Interface
      ; asyncInfo : Windows.Storage.Streams.IAsyncOperation_IRandomAccessStream
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
      This       : access AsyncOperationCompletedHandler_IInputStream_Interface
      ; asyncInfo : Windows.Storage.Streams.IAsyncOperation_IInputStream
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
      This       : access AsyncOperationCompletedHandler_IOutputStream_Interface
      ; asyncInfo : Windows.Storage.Streams.IAsyncOperation_IOutputStream
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
   
   
   function CreateDataReader
   (
      inputStream : Windows.Storage.Streams.IInputStream
   )
   return Windows.Storage.Streams.IDataReader is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Streams.DataReader");
      m_Factory     : Windows.Storage.Streams.IDataReaderFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IDataReader := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDataReaderFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateDataReader(inputStream, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateDataWriter return Windows.Storage.Streams.IDataWriter is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Streams.DataWriter");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Storage.Streams.IDataWriter) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Storage.Streams.IID_IDataWriter'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      capacity : Windows.UInt32
   )
   return Windows.Storage.Streams.IBuffer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Streams.Buffer");
      m_Factory     : Windows.Storage.Streams.IBufferFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IBuffer := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBufferFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(capacity, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInMemoryRandomAccessStream return Windows.Storage.Streams.IRandomAccessStream is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Streams.InMemoryRandomAccessStream");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Storage.Streams.IRandomAccessStream) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Storage.Streams.IID_IRandomAccessStream'Access, RetVal'access);
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
   
   
   function FromBuffer
   (
      buffer : Windows.Storage.Streams.IBuffer
   )
   return Windows.Storage.Streams.IDataReader is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Streams.DataReader");
      m_Factory     : IDataReaderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IDataReader;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDataReaderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromBuffer(buffer, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateCopyFromMemoryBuffer
   (
      input : Windows.Foundation.IMemoryBuffer
   )
   return Windows.Storage.Streams.IBuffer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Streams.Buffer");
      m_Factory     : IBufferStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IBuffer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBufferStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateCopyFromMemoryBuffer(input, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMemoryBufferOverIBuffer
   (
      input : Windows.Storage.Streams.IBuffer
   )
   return Windows.Foundation.IMemoryBuffer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Streams.Buffer");
      m_Factory     : IBufferStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IMemoryBuffer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBufferStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateMemoryBufferOverIBuffer(input, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CopyAsync
   (
      source : Windows.Storage.Streams.IInputStream
      ; destination : Windows.Storage.Streams.IOutputStream
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Streams.RandomAccessStream");
      m_Factory     : IRandomAccessStreamStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRandomAccessStreamStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CopyAsync(source, destination, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CopySizeAsync
   (
      source : Windows.Storage.Streams.IInputStream
      ; destination : Windows.Storage.Streams.IOutputStream
      ; bytesToCopy : Windows.UInt64
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Streams.RandomAccessStream");
      m_Factory     : IRandomAccessStreamStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRandomAccessStreamStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CopySizeAsync(source, destination, bytesToCopy, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CopyAndCloseAsync
   (
      source : Windows.Storage.Streams.IInputStream
      ; destination : Windows.Storage.Streams.IOutputStream
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Streams.RandomAccessStream");
      m_Factory     : IRandomAccessStreamStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRandomAccessStreamStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CopyAndCloseAsync(source, destination, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromFile
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Storage.Streams.IRandomAccessStreamReference is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Streams.RandomAccessStreamReference");
      m_Factory     : IRandomAccessStreamReferenceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IRandomAccessStreamReference;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRandomAccessStreamReferenceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromFile(file, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromUri
   (
      uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Storage.Streams.IRandomAccessStreamReference is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Streams.RandomAccessStreamReference");
      m_Factory     : IRandomAccessStreamReferenceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IRandomAccessStreamReference;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRandomAccessStreamReferenceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromUri(uri, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromStream
   (
      stream : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.Storage.Streams.IRandomAccessStreamReference is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Streams.RandomAccessStreamReference");
      m_Factory     : IRandomAccessStreamReferenceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IRandomAccessStreamReference;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRandomAccessStreamReferenceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromStream(stream, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function OpenAsync
   (
      filePath : Windows.String
      ; accessMode : Windows.Storage.FileAccessMode
   )
   return Windows.Storage.Streams.IAsyncOperation_IRandomAccessStream is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Streams.FileRandomAccessStream");
      m_Factory     : IFileRandomAccessStreamStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IAsyncOperation_IRandomAccessStream;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileRandomAccessStreamStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.OpenAsync(filePath, accessMode, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function OpenWithOptionsAsync
   (
      filePath : Windows.String
      ; accessMode : Windows.Storage.FileAccessMode
      ; sharingOptions : Windows.Storage.StorageOpenOptions
      ; openDisposition : Windows.Storage.Streams.FileOpenDisposition
   )
   return Windows.Storage.Streams.IAsyncOperation_IRandomAccessStream is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Streams.FileRandomAccessStream");
      m_Factory     : IFileRandomAccessStreamStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IAsyncOperation_IRandomAccessStream;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileRandomAccessStreamStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.OpenWithOptionsAsync(filePath, accessMode, sharingOptions, openDisposition, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function OpenTransactedWriteAsync
   (
      filePath : Windows.String
   )
   return Windows.Storage.IAsyncOperation_IStorageStreamTransaction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Streams.FileRandomAccessStream");
      m_Factory     : IFileRandomAccessStreamStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IAsyncOperation_IStorageStreamTransaction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileRandomAccessStreamStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.OpenTransactedWriteAsync(filePath, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function OpenTransactedWriteWithOptionsAsync
   (
      filePath : Windows.String
      ; openOptions : Windows.Storage.StorageOpenOptions
      ; openDisposition : Windows.Storage.Streams.FileOpenDisposition
   )
   return Windows.Storage.IAsyncOperation_IStorageStreamTransaction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Streams.FileRandomAccessStream");
      m_Factory     : IFileRandomAccessStreamStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IAsyncOperation_IStorageStreamTransaction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileRandomAccessStreamStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.OpenTransactedWriteWithOptionsAsync(filePath, openOptions, openDisposition, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function OpenForUserAsync
   (
      user : Windows.System.IUser
      ; filePath : Windows.String
      ; accessMode : Windows.Storage.FileAccessMode
   )
   return Windows.Storage.Streams.IAsyncOperation_IRandomAccessStream is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Streams.FileRandomAccessStream");
      m_Factory     : IFileRandomAccessStreamStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IAsyncOperation_IRandomAccessStream;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileRandomAccessStreamStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.OpenForUserAsync(user, filePath, accessMode, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function OpenForUserWithOptionsAsync
   (
      user : Windows.System.IUser
      ; filePath : Windows.String
      ; accessMode : Windows.Storage.FileAccessMode
      ; sharingOptions : Windows.Storage.StorageOpenOptions
      ; openDisposition : Windows.Storage.Streams.FileOpenDisposition
   )
   return Windows.Storage.Streams.IAsyncOperation_IRandomAccessStream is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Streams.FileRandomAccessStream");
      m_Factory     : IFileRandomAccessStreamStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IAsyncOperation_IRandomAccessStream;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileRandomAccessStreamStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.OpenForUserWithOptionsAsync(user, filePath, accessMode, sharingOptions, openDisposition, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function OpenTransactedWriteForUserAsync
   (
      user : Windows.System.IUser
      ; filePath : Windows.String
   )
   return Windows.Storage.IAsyncOperation_IStorageStreamTransaction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Streams.FileRandomAccessStream");
      m_Factory     : IFileRandomAccessStreamStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IAsyncOperation_IStorageStreamTransaction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileRandomAccessStreamStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.OpenTransactedWriteForUserAsync(user, filePath, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function OpenTransactedWriteForUserWithOptionsAsync
   (
      user : Windows.System.IUser
      ; filePath : Windows.String
      ; openOptions : Windows.Storage.StorageOpenOptions
      ; openDisposition : Windows.Storage.Streams.FileOpenDisposition
   )
   return Windows.Storage.IAsyncOperation_IStorageStreamTransaction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.Streams.FileRandomAccessStream");
      m_Factory     : IFileRandomAccessStreamStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IAsyncOperation_IStorageStreamTransaction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileRandomAccessStreamStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.OpenTransactedWriteForUserWithOptionsAsync(user, filePath, openOptions, openDisposition, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
