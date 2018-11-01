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
with Windows.UI.Popups;
with Windows.Security.Credentials;
with Windows.System;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.ApplicationSettings is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access WebAccountProviderCommandInvokedHandler_Interface
      ; command : Windows.UI.ApplicationSettings.IWebAccountProviderCommand
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.ApplicationSettings.IWebAccountProviderCommand(command));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access WebAccountCommandInvokedHandler_Interface
      ; command : Windows.UI.ApplicationSettings.IWebAccountCommand
      ; args : Windows.UI.ApplicationSettings.IWebAccountInvokedArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.ApplicationSettings.IWebAccountCommand(command), Windows.UI.ApplicationSettings.IWebAccountInvokedArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access CredentialCommandCredentialDeletedHandler_Interface
      ; command : Windows.UI.ApplicationSettings.ICredentialCommand
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.ApplicationSettings.ICredentialCommand(command));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAccountsSettingsPane_add_AccountCommandsRequested_Interface
      ; sender : Windows.UI.ApplicationSettings.IAccountsSettingsPane
      ; args : Windows.UI.ApplicationSettings.IAccountsSettingsPaneCommandsRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.ApplicationSettings.IAccountsSettingsPane(sender), Windows.UI.ApplicationSettings.IAccountsSettingsPaneCommandsRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISettingsPane_add_CommandsRequested_Interface
      ; sender : Windows.UI.ApplicationSettings.ISettingsPane
      ; args : Windows.UI.ApplicationSettings.ISettingsPaneCommandsRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.ApplicationSettings.ISettingsPane(sender), Windows.UI.ApplicationSettings.ISettingsPaneCommandsRequestedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function CreateSettingsCommand
   (
      settingsCommandId : Windows.Object
      ; label : Windows.String
      ; handler : Windows.UI.Popups.UICommandInvokedHandler
   )
   return Windows.UI.Popups.IUICommand is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ApplicationSettings.SettingsCommand");
      m_Factory     : Windows.UI.ApplicationSettings.ISettingsCommandFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Popups.IUICommand := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISettingsCommandFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateSettingsCommand(settingsCommandId, label, handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWebAccountProviderCommand
   (
      webAccountProvider : Windows.Security.Credentials.IWebAccountProvider
      ; invoked : Windows.UI.ApplicationSettings.WebAccountProviderCommandInvokedHandler
   )
   return Windows.UI.ApplicationSettings.IWebAccountProviderCommand is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ApplicationSettings.WebAccountProviderCommand");
      m_Factory     : Windows.UI.ApplicationSettings.IWebAccountProviderCommandFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.ApplicationSettings.IWebAccountProviderCommand := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAccountProviderCommandFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWebAccountProviderCommand(webAccountProvider, invoked, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWebAccountCommand
   (
      webAccount : Windows.Security.Credentials.IWebAccount
      ; invoked : Windows.UI.ApplicationSettings.WebAccountCommandInvokedHandler
      ; actions : Windows.UI.ApplicationSettings.SupportedWebAccountActions
   )
   return Windows.UI.ApplicationSettings.IWebAccountCommand is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ApplicationSettings.WebAccountCommand");
      m_Factory     : Windows.UI.ApplicationSettings.IWebAccountCommandFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.ApplicationSettings.IWebAccountCommand := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAccountCommandFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWebAccountCommand(webAccount, invoked, actions, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateCredentialCommand
   (
      passwordCredential : Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.UI.ApplicationSettings.ICredentialCommand is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ApplicationSettings.CredentialCommand");
      m_Factory     : Windows.UI.ApplicationSettings.ICredentialCommandFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.ApplicationSettings.ICredentialCommand := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICredentialCommandFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateCredentialCommand(passwordCredential, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateCredentialCommandWithHandler
   (
      passwordCredential : Windows.Security.Credentials.IPasswordCredential
      ; deleted : Windows.UI.ApplicationSettings.CredentialCommandCredentialDeletedHandler
   )
   return Windows.UI.ApplicationSettings.ICredentialCommand is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ApplicationSettings.CredentialCommand");
      m_Factory     : Windows.UI.ApplicationSettings.ICredentialCommandFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.ApplicationSettings.ICredentialCommand := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICredentialCommandFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateCredentialCommandWithHandler(passwordCredential, deleted, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function get_AccountsCommand
   return Windows.UI.Popups.IUICommand is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ApplicationSettings.SettingsCommand");
      m_Factory     : ISettingsCommandStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Popups.IUICommand;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISettingsCommandStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AccountsCommand(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForCurrentView
   return Windows.UI.ApplicationSettings.IAccountsSettingsPane is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ApplicationSettings.AccountsSettingsPane");
      m_Factory     : IAccountsSettingsPaneStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.ApplicationSettings.IAccountsSettingsPane;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAccountsSettingsPaneStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure Show
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ApplicationSettings.AccountsSettingsPane");
      m_Factory     : IAccountsSettingsPaneStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAccountsSettingsPaneStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Show;
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function ShowManageAccountsAsync
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ApplicationSettings.AccountsSettingsPane");
      m_Factory     : IAccountsSettingsPaneStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAccountsSettingsPaneStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowManageAccountsAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ShowAddAccountAsync
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ApplicationSettings.AccountsSettingsPane");
      m_Factory     : IAccountsSettingsPaneStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAccountsSettingsPaneStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowAddAccountAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ShowManageAccountsForUserAsync
   (
      user : Windows.System.IUser
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ApplicationSettings.AccountsSettingsPane");
      m_Factory     : IAccountsSettingsPaneStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAccountsSettingsPaneStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowManageAccountsForUserAsync(user, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ShowAddAccountForUserAsync
   (
      user : Windows.System.IUser
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ApplicationSettings.AccountsSettingsPane");
      m_Factory     : IAccountsSettingsPaneStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAccountsSettingsPaneStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowAddAccountForUserAsync(user, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForCurrentView
   return Windows.UI.ApplicationSettings.ISettingsPane is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ApplicationSettings.SettingsPane");
      m_Factory     : ISettingsPaneStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.ApplicationSettings.ISettingsPane;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISettingsPaneStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure Show_ISettingsPane
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ApplicationSettings.SettingsPane");
      m_Factory     : ISettingsPaneStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISettingsPaneStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Show;
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_Edge
   return Windows.UI.ApplicationSettings.SettingsEdgeLocation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.ApplicationSettings.SettingsPane");
      m_Factory     : ISettingsPaneStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.ApplicationSettings.SettingsEdgeLocation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISettingsPaneStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Edge(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
