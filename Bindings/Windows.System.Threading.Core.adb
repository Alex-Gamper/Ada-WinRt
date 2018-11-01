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
with Windows.System.Threading;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.System.Threading.Core is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access SignalHandler_Interface
      ; signalNotifier : Windows.System.Threading.Core.ISignalNotifier
      ; timedOut : Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.System.Threading.Core.ISignalNotifier(signalNotifier), timedOut);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function CreateWorkItem
   (
      handler : Windows.System.Threading.WorkItemHandler
   )
   return Windows.System.Threading.Core.IPreallocatedWorkItem is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Threading.Core.PreallocatedWorkItem");
      m_Factory     : Windows.System.Threading.Core.IPreallocatedWorkItemFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Threading.Core.IPreallocatedWorkItem := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPreallocatedWorkItemFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWorkItem(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWorkItemWithPriority
   (
      handler : Windows.System.Threading.WorkItemHandler
      ; priority : Windows.System.Threading.WorkItemPriority
   )
   return Windows.System.Threading.Core.IPreallocatedWorkItem is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Threading.Core.PreallocatedWorkItem");
      m_Factory     : Windows.System.Threading.Core.IPreallocatedWorkItemFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Threading.Core.IPreallocatedWorkItem := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPreallocatedWorkItemFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWorkItemWithPriority(handler, priority, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWorkItemWithPriorityAndOptions
   (
      handler : Windows.System.Threading.WorkItemHandler
      ; priority : Windows.System.Threading.WorkItemPriority
      ; options : Windows.System.Threading.WorkItemOptions
   )
   return Windows.System.Threading.Core.IPreallocatedWorkItem is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Threading.Core.PreallocatedWorkItem");
      m_Factory     : Windows.System.Threading.Core.IPreallocatedWorkItemFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Threading.Core.IPreallocatedWorkItem := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPreallocatedWorkItemFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWorkItemWithPriorityAndOptions(handler, priority, options, RetVal'Access);
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
   
   function AttachToEvent
   (
      name : Windows.String
      ; handler : Windows.System.Threading.Core.SignalHandler
   )
   return Windows.System.Threading.Core.ISignalNotifier is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Threading.Core.SignalNotifier");
      m_Factory     : ISignalNotifierStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Threading.Core.ISignalNotifier;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISignalNotifierStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.AttachToEvent(name, handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function AttachToEventWithTimeout
   (
      name : Windows.String
      ; handler : Windows.System.Threading.Core.SignalHandler
      ; timeout : Windows.Foundation.TimeSpan
   )
   return Windows.System.Threading.Core.ISignalNotifier is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Threading.Core.SignalNotifier");
      m_Factory     : ISignalNotifierStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Threading.Core.ISignalNotifier;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISignalNotifierStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.AttachToEventWithTimeout(name, handler, timeout, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function AttachToSemaphore
   (
      name : Windows.String
      ; handler : Windows.System.Threading.Core.SignalHandler
   )
   return Windows.System.Threading.Core.ISignalNotifier is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Threading.Core.SignalNotifier");
      m_Factory     : ISignalNotifierStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Threading.Core.ISignalNotifier;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISignalNotifierStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.AttachToSemaphore(name, handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function AttachToSemaphoreWithTimeout
   (
      name : Windows.String
      ; handler : Windows.System.Threading.Core.SignalHandler
      ; timeout : Windows.Foundation.TimeSpan
   )
   return Windows.System.Threading.Core.ISignalNotifier is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Threading.Core.SignalNotifier");
      m_Factory     : ISignalNotifierStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Threading.Core.ISignalNotifier;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISignalNotifierStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.AttachToSemaphoreWithTimeout(name, handler, timeout, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
