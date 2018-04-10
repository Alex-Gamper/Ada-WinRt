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
with Windows.ApplicationModel.Email;
with Windows.Security.Cryptography.Certificates;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.ApplicationModel.Email.DataProvider is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_IEmailDataProviderConnection_add_MailboxSyncRequested_Interface
      ; sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection
      ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxSyncManagerSyncRequestEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection(sender), Windows.ApplicationModel.Email.DataProvider.IEmailMailboxSyncManagerSyncRequestEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEmailDataProviderConnection_add_DownloadMessageRequested_Interface
      ; sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection
      ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxDownloadMessageRequestEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection(sender), Windows.ApplicationModel.Email.DataProvider.IEmailMailboxDownloadMessageRequestEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEmailDataProviderConnection_add_DownloadAttachmentRequested_Interface
      ; sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection
      ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxDownloadAttachmentRequestEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection(sender), Windows.ApplicationModel.Email.DataProvider.IEmailMailboxDownloadAttachmentRequestEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEmailDataProviderConnection_add_CreateFolderRequested_Interface
      ; sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection
      ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxCreateFolderRequestEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection(sender), Windows.ApplicationModel.Email.DataProvider.IEmailMailboxCreateFolderRequestEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEmailDataProviderConnection_add_DeleteFolderRequested_Interface
      ; sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection
      ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxDeleteFolderRequestEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection(sender), Windows.ApplicationModel.Email.DataProvider.IEmailMailboxDeleteFolderRequestEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEmailDataProviderConnection_add_EmptyFolderRequested_Interface
      ; sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection
      ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxEmptyFolderRequestEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection(sender), Windows.ApplicationModel.Email.DataProvider.IEmailMailboxEmptyFolderRequestEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEmailDataProviderConnection_add_MoveFolderRequested_Interface
      ; sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection
      ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxMoveFolderRequestEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection(sender), Windows.ApplicationModel.Email.DataProvider.IEmailMailboxMoveFolderRequestEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEmailDataProviderConnection_add_UpdateMeetingResponseRequested_Interface
      ; sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection
      ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxUpdateMeetingResponseRequestEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection(sender), Windows.ApplicationModel.Email.DataProvider.IEmailMailboxUpdateMeetingResponseRequestEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEmailDataProviderConnection_add_ForwardMeetingRequested_Interface
      ; sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection
      ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxForwardMeetingRequestEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection(sender), Windows.ApplicationModel.Email.DataProvider.IEmailMailboxForwardMeetingRequestEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEmailDataProviderConnection_add_ProposeNewTimeForMeetingRequested_Interface
      ; sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection
      ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxProposeNewTimeForMeetingRequestEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection(sender), Windows.ApplicationModel.Email.DataProvider.IEmailMailboxProposeNewTimeForMeetingRequestEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEmailDataProviderConnection_add_SetAutoReplySettingsRequested_Interface
      ; sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection
      ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxSetAutoReplySettingsRequestEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection(sender), Windows.ApplicationModel.Email.DataProvider.IEmailMailboxSetAutoReplySettingsRequestEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEmailDataProviderConnection_add_GetAutoReplySettingsRequested_Interface
      ; sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection
      ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxGetAutoReplySettingsRequestEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection(sender), Windows.ApplicationModel.Email.DataProvider.IEmailMailboxGetAutoReplySettingsRequestEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEmailDataProviderConnection_add_ResolveRecipientsRequested_Interface
      ; sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection
      ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxResolveRecipientsRequestEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection(sender), Windows.ApplicationModel.Email.DataProvider.IEmailMailboxResolveRecipientsRequestEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEmailDataProviderConnection_add_ValidateCertificatesRequested_Interface
      ; sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection
      ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxValidateCertificatesRequestEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection(sender), Windows.ApplicationModel.Email.DataProvider.IEmailMailboxValidateCertificatesRequestEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IEmailDataProviderConnection_add_ServerSearchReadBatchRequested_Interface
      ; sender : Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection
      ; args : Windows.ApplicationModel.Email.DataProvider.IEmailMailboxServerSearchReadBatchRequestEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Email.DataProvider.IEmailDataProviderConnection(sender), Windows.ApplicationModel.Email.DataProvider.IEmailMailboxServerSearchReadBatchRequestEventArgs(args));
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
   

end;
