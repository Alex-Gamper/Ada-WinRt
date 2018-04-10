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
with Windows.Web.Http;
with Windows.Storage.Streams;
with Windows.Media.Core;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Media.Streaming.Adaptive is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IAdaptiveMediaSourceCreationResult_Interface
      ; asyncInfo : Windows.Media.Streaming.Adaptive.IAsyncOperation_IAdaptiveMediaSourceCreationResult
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
      This       : access TypedEventHandler_IAdaptiveMediaSource_add_DownloadBitrateChanged_Interface
      ; sender : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource
      ; args : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadBitrateChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource(sender), Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadBitrateChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAdaptiveMediaSource_add_PlaybackBitrateChanged_Interface
      ; sender : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource
      ; args : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource(sender), Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAdaptiveMediaSource_add_DownloadRequested_Interface
      ; sender : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource
      ; args : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource(sender), Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAdaptiveMediaSource_add_DownloadCompleted_Interface
      ; sender : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource
      ; args : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadCompletedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource(sender), Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadCompletedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAdaptiveMediaSource_add_DownloadFailed_Interface
      ; sender : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource
      ; args : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadFailedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource(sender), Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadFailedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAdaptiveMediaSourceDiagnostics_add_DiagnosticAvailable_Interface
      ; sender : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDiagnostics
      ; args : Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDiagnosticAvailableEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDiagnostics(sender), Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDiagnosticAvailableEventArgs(args));
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
   
   function IsContentTypeSupported
   (
      contentType : Windows.String
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Streaming.Adaptive.AdaptiveMediaSource");
      m_Factory     : IAdaptiveMediaSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAdaptiveMediaSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsContentTypeSupported(contentType, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromUriAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Media.Streaming.Adaptive.IAsyncOperation_IAdaptiveMediaSourceCreationResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Streaming.Adaptive.AdaptiveMediaSource");
      m_Factory     : IAdaptiveMediaSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Streaming.Adaptive.IAsyncOperation_IAdaptiveMediaSourceCreationResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAdaptiveMediaSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromUriAsync(uri, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromUriWithDownloaderAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
      ; httpClient : Windows.Web.Http.IHttpClient
   )
   return Windows.Media.Streaming.Adaptive.IAsyncOperation_IAdaptiveMediaSourceCreationResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Streaming.Adaptive.AdaptiveMediaSource");
      m_Factory     : IAdaptiveMediaSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Streaming.Adaptive.IAsyncOperation_IAdaptiveMediaSourceCreationResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAdaptiveMediaSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromUriWithDownloaderAsync(uri, httpClient, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromStreamAsync
   (
      stream : Windows.Storage.Streams.IInputStream
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; contentType : Windows.String
   )
   return Windows.Media.Streaming.Adaptive.IAsyncOperation_IAdaptiveMediaSourceCreationResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Streaming.Adaptive.AdaptiveMediaSource");
      m_Factory     : IAdaptiveMediaSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Streaming.Adaptive.IAsyncOperation_IAdaptiveMediaSourceCreationResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAdaptiveMediaSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromStreamAsync(stream, uri, contentType, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromStreamWithDownloaderAsync
   (
      stream : Windows.Storage.Streams.IInputStream
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; contentType : Windows.String
      ; httpClient : Windows.Web.Http.IHttpClient
   )
   return Windows.Media.Streaming.Adaptive.IAsyncOperation_IAdaptiveMediaSourceCreationResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Streaming.Adaptive.AdaptiveMediaSource");
      m_Factory     : IAdaptiveMediaSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Streaming.Adaptive.IAsyncOperation_IAdaptiveMediaSourceCreationResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAdaptiveMediaSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromStreamWithDownloaderAsync(stream, uri, contentType, httpClient, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   

end;
