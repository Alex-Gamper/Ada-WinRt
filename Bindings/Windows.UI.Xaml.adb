--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.1.0.1                                                     --
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
-- along with this program.If not, see < http://www.gnu.org/licenses/>.       --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.UI.Xaml.Controls;
with Windows.UI.Core;
with Windows.UI.Xaml.Interop;
with Windows.ApplicationModel;
with Windows.UI.Xaml.Media.Imaging;
with Windows.Graphics.Imaging;
with Windows.ApplicationModel.Core;
with Windows.ApplicationModel.DataTransfer;
with Windows.ApplicationModel.DataTransfer.DragDrop;
with Windows.UI.Xaml.Media;
with Windows.UI.Xaml.Media.Animation;
with Windows.UI.Xaml.Input;
with Windows.UI.Xaml.Automation.Peers;
with Windows.UI.Xaml.Media.Media3D;
with Windows.UI.Input;
with Windows.UI.Xaml.Controls.Primitives;
with Windows.UI.Xaml.Data;
with Windows.ApplicationModel.Activation;
with Windows.UI.Composition;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.Xaml is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access ApplicationInitializationCallback_Interface
      ; p : Windows.UI.Xaml.IApplicationInitializationCallbackParams
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.IApplicationInitializationCallbackParams(p));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access CreateDefaultValueCallback_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback.all;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access DependencyPropertyChangedCallback_Interface
      ; sender : Windows.UI.Xaml.IDependencyObject
      ; dp : Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.IDependencyObject(sender), Windows.UI.Xaml.IDependencyProperty(dp));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access DependencyPropertyChangedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.IDependencyPropertyChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Xaml.IDependencyPropertyChangedEventArgs(e));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access DragEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.IDragEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Xaml.IDragEventArgs(e));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access EnteredBackgroundEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.ApplicationModel.IEnteredBackgroundEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.ApplicationModel.IEnteredBackgroundEventArgs(e));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access ExceptionRoutedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.IExceptionRoutedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Xaml.IExceptionRoutedEventArgs(e));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access LeavingBackgroundEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.ApplicationModel.ILeavingBackgroundEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.ApplicationModel.ILeavingBackgroundEventArgs(e));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access PropertyChangedCallback_Interface
      ; d : Windows.UI.Xaml.IDependencyObject
      ; e : Windows.UI.Xaml.IDependencyPropertyChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.IDependencyObject(d), Windows.UI.Xaml.IDependencyPropertyChangedEventArgs(e));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access RoutedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.IRoutedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Xaml.IRoutedEventArgs(e));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access SizeChangedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.ISizeChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Xaml.ISizeChangedEventArgs(e));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access SuspendingEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.ApplicationModel.ISuspendingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.ApplicationModel.ISuspendingEventArgs(e));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access UnhandledExceptionEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.IUnhandledExceptionEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Xaml.IUnhandledExceptionEventArgs(e));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access VisualStateChangedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.IVisualStateChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Xaml.IVisualStateChangedEventArgs(e));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access WindowActivatedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Core.IWindowActivatedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Core.IWindowActivatedEventArgs(e));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access WindowClosedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Core.ICoreWindowEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Core.ICoreWindowEventArgs(e));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access WindowSizeChangedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Core.IWindowSizeChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Core.IWindowSizeChangedEventArgs(e));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access WindowVisibilityChangedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Core.IVisibilityChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Core.IVisibilityChangedEventArgs(e));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access BindingFailedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.IBindingFailedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.UI.Xaml.IBindingFailedEventArgs(e));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IUIElement3_add_DragStarting_Interface
      ; sender : Windows.UI.Xaml.IUIElement
      ; args : Windows.UI.Xaml.IDragStartingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.IUIElement(sender), Windows.UI.Xaml.IDragStartingEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IUIElement3_add_DropCompleted_Interface
      ; sender : Windows.UI.Xaml.IUIElement
      ; args : Windows.UI.Xaml.IDropCompletedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.IUIElement(sender), Windows.UI.Xaml.IDropCompletedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IUIElement4_add_ContextRequested_Interface
      ; sender : Windows.UI.Xaml.IUIElement
      ; args : Windows.UI.Xaml.Input.IContextRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.IUIElement(sender), Windows.UI.Xaml.Input.IContextRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IUIElement4_add_ContextCanceled_Interface
      ; sender : Windows.UI.Xaml.IUIElement
      ; args : Windows.UI.Xaml.IRoutedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.IUIElement(sender), Windows.UI.Xaml.IRoutedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IUIElement4_add_AccessKeyDisplayRequested_Interface
      ; sender : Windows.UI.Xaml.IUIElement
      ; args : Windows.UI.Xaml.Input.IAccessKeyDisplayRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.IUIElement(sender), Windows.UI.Xaml.Input.IAccessKeyDisplayRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IUIElement4_add_AccessKeyDisplayDismissed_Interface
      ; sender : Windows.UI.Xaml.IUIElement
      ; args : Windows.UI.Xaml.Input.IAccessKeyDisplayDismissedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.IUIElement(sender), Windows.UI.Xaml.Input.IAccessKeyDisplayDismissedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IUIElement4_add_AccessKeyInvoked_Interface
      ; sender : Windows.UI.Xaml.IUIElement
      ; args : Windows.UI.Xaml.Input.IAccessKeyInvokedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.IUIElement(sender), Windows.UI.Xaml.Input.IAccessKeyInvokedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IUIElement5_add_GettingFocus_Interface
      ; sender : Windows.UI.Xaml.IUIElement
      ; args : Windows.UI.Xaml.Input.IGettingFocusEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.IUIElement(sender), Windows.UI.Xaml.Input.IGettingFocusEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IUIElement5_add_LosingFocus_Interface
      ; sender : Windows.UI.Xaml.IUIElement
      ; args : Windows.UI.Xaml.Input.ILosingFocusEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.IUIElement(sender), Windows.UI.Xaml.Input.ILosingFocusEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IUIElement5_add_NoFocusCandidateFound_Interface
      ; sender : Windows.UI.Xaml.IUIElement
      ; args : Windows.UI.Xaml.Input.INoFocusCandidateFoundEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.IUIElement(sender), Windows.UI.Xaml.Input.INoFocusCandidateFoundEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IUIElement7_add_CharacterReceived_Interface
      ; sender : Windows.UI.Xaml.IUIElement
      ; args : Windows.UI.Xaml.Input.ICharacterReceivedRoutedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.IUIElement(sender), Windows.UI.Xaml.Input.ICharacterReceivedRoutedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IUIElement7_add_ProcessKeyboardAccelerators_Interface
      ; sender : Windows.UI.Xaml.IUIElement
      ; args : Windows.UI.Xaml.Input.IProcessKeyboardAcceleratorEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.IUIElement(sender), Windows.UI.Xaml.Input.IProcessKeyboardAcceleratorEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IUIElement8_add_BringIntoViewRequested_Interface
      ; sender : Windows.UI.Xaml.IUIElement
      ; args : Windows.UI.Xaml.IBringIntoViewRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.IUIElement(sender), Windows.UI.Xaml.IBringIntoViewRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IFrameworkElement2_add_DataContextChanged_Interface
      ; sender : Windows.UI.Xaml.IFrameworkElement
      ; args : Windows.UI.Xaml.IDataContextChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.IFrameworkElement(sender), Windows.UI.Xaml.IDataContextChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IFrameworkElement3_add_Loading_Interface
      ; sender : Windows.UI.Xaml.IFrameworkElement
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.IFrameworkElement(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IFrameworkElement6_add_ActualThemeChanged_Interface
      ; sender : Windows.UI.Xaml.IFrameworkElement
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.IFrameworkElement(sender), args);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function CreateVisualStateChangedEventArgs return Windows.UI.Xaml.IVisualStateChangedEventArgs is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.VisualStateChangedEventArgs");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.Xaml.IVisualStateChangedEventArgs) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.IID_IVisualStateChangedEventArgs'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateBringIntoViewOptions return Windows.UI.Xaml.IBringIntoViewOptions is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.BringIntoViewOptions");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.Xaml.IBringIntoViewOptions) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.IID_IBringIntoViewOptions'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateFrameworkView return Windows.UI.Xaml.IFrameworkView is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.FrameworkView");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.Xaml.IFrameworkView) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Core.IID_IFrameworkView'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateSetterBaseCollection return Windows.UI.Xaml.ISetterBaseCollection is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.SetterBaseCollection");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.Xaml.ISetterBaseCollection) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.IID_ISetterBaseCollection'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateTargetPropertyPath return Windows.UI.Xaml.ITargetPropertyPath is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.TargetPropertyPath");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.Xaml.ITargetPropertyPath) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.IID_ITargetPropertyPath'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateTriggerActionCollection return Windows.UI.Xaml.IVector_TriggerAction is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.TriggerActionCollection");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.Xaml.IVector_TriggerAction) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.IID_IVector_TriggerAction'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateInstance
   (
      path : Windows.String
   )
   return Windows.UI.Xaml.IPropertyPath is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.PropertyPath");
      m_Factory     : Windows.UI.Xaml.IPropertyPathFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IPropertyPath := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyPathFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(path, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      targetType : Windows.UI.Xaml.Interop.TypeName
   )
   return Windows.UI.Xaml.IStyle is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Style");
      m_Factory     : Windows.UI.Xaml.IStyleFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IStyle := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStyleFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(targetType, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateVisualState return Windows.UI.Xaml.IVisualState is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.VisualState");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.Xaml.IVisualState) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.IID_IVisualState'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateVisualStateGroup return Windows.UI.Xaml.IVisualStateGroup is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.VisualStateGroup");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.Xaml.IVisualStateGroup) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.IID_IVisualStateGroup'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateEventTrigger return Windows.UI.Xaml.IEventTrigger is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.EventTrigger");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.Xaml.IEventTrigger) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.IID_IEventTrigger'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateInstance
   (
      targetProperty : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Object
   )
   return Windows.UI.Xaml.ISetter is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Setter");
      m_Factory     : Windows.UI.Xaml.ISetterFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.ISetter := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISetterFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(targetProperty, value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateStateTrigger return Windows.UI.Xaml.IStateTrigger is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.StateTrigger");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.Xaml.IStateTrigger) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Xaml.IID_IStateTrigger'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateFrameworkViewSource return Windows.UI.Xaml.IFrameworkViewSource is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.FrameworkViewSource");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.Xaml.IFrameworkViewSource) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Core.IID_IFrameworkViewSource'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IDispatcherTimer_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown;
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
      pragma suppress(Accessibility_Check); -- This can be called from Windows
   begin
      if riid.all = IID_IDispatcherTimer or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'access, m_IUnknown'access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'access);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IDispatcherTimer_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      RetVal := This.m_RefCount;   --InterlockedIncrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function Release
   (
      This       : access IDispatcherTimer_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      RetVal := This.m_RefCount;   --InterlockedDecrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function GetIids
   (
      This       : access IDispatcherTimer_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IDispatcherTimer_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.IDispatcherTimer");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IDispatcherTimer_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function get_Interval
   (
      This       : access IDispatcherTimer_Interface_Impl
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_Interval
   (
      This       : access IDispatcherTimer_Interface_Impl
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_IsEnabled
   (
      This       : access IDispatcherTimer_Interface_Impl
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function add_Tick
   (
      This       : access IDispatcherTimer_Interface_Impl
      ; value : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function remove_Tick
   (
      This       : access IDispatcherTimer_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function Start
   (
      This       : access IDispatcherTimer_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function Stop
   (
      This       : access IDispatcherTimer_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IDependencyObject_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown;
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
      pragma suppress(Accessibility_Check); -- This can be called from Windows
   begin
      if riid.all = IID_IDependencyObject or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'access, m_IUnknown'access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'access);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IDependencyObject_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      RetVal := This.m_RefCount;   --InterlockedIncrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function Release
   (
      This       : access IDependencyObject_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      RetVal := This.m_RefCount;   --InterlockedDecrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function GetIids
   (
      This       : access IDependencyObject_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IDependencyObject_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.IDependencyObject");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IDependencyObject_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function GetValue
   (
      This       : access IDependencyObject_Interface_Impl
      ; dp : Windows.UI.Xaml.IDependencyProperty
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function SetValue
   (
      This       : access IDependencyObject_Interface_Impl
      ; dp : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function ClearValue
   (
      This       : access IDependencyObject_Interface_Impl
      ; dp : Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function ReadLocalValue
   (
      This       : access IDependencyObject_Interface_Impl
      ; dp : Windows.UI.Xaml.IDependencyProperty
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function GetAnimationBaseValue
   (
      This       : access IDependencyObject_Interface_Impl
      ; dp : Windows.UI.Xaml.IDependencyProperty
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_Dispatcher
   (
      This       : access IDependencyObject_Interface_Impl
      ; RetVal : access Windows.UI.Core.ICoreDispatcher
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IRoutedEventArgs_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown;
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
      pragma suppress(Accessibility_Check); -- This can be called from Windows
   begin
      if riid.all = IID_IRoutedEventArgs or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'access, m_IUnknown'access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'access);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IRoutedEventArgs_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      RetVal := This.m_RefCount;   --InterlockedIncrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function Release
   (
      This       : access IRoutedEventArgs_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      RetVal := This.m_RefCount;   --InterlockedDecrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function GetIids
   (
      This       : access IRoutedEventArgs_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IRoutedEventArgs_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.IRoutedEventArgs");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IRoutedEventArgs_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function get_OriginalSource
   (
      This       : access IRoutedEventArgs_Interface_Impl
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IDataTemplateKey_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown;
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
      pragma suppress(Accessibility_Check); -- This can be called from Windows
   begin
      if riid.all = IID_IDataTemplateKey or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'access, m_IUnknown'access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'access);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IDataTemplateKey_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      RetVal := This.m_RefCount;   --InterlockedIncrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function Release
   (
      This       : access IDataTemplateKey_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      RetVal := This.m_RefCount;   --InterlockedDecrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function GetIids
   (
      This       : access IDataTemplateKey_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IDataTemplateKey_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.IDataTemplateKey");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IDataTemplateKey_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function get_DataType
   (
      This       : access IDataTemplateKey_Interface_Impl
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_DataType
   (
      This       : access IDataTemplateKey_Interface_Impl
      ; value : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IFrameworkTemplate_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown;
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
      pragma suppress(Accessibility_Check); -- This can be called from Windows
   begin
      if riid.all = IID_IFrameworkTemplate or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'access, m_IUnknown'access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'access);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IFrameworkTemplate_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      RetVal := This.m_RefCount;   --InterlockedIncrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function Release
   (
      This       : access IFrameworkTemplate_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      RetVal := This.m_RefCount;   --InterlockedDecrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function GetIids
   (
      This       : access IFrameworkTemplate_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IFrameworkTemplate_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.IFrameworkTemplate");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IFrameworkTemplate_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IDataTemplate_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown;
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
      pragma suppress(Accessibility_Check); -- This can be called from Windows
   begin
      if riid.all = IID_IDataTemplate or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'access, m_IUnknown'access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'access);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IDataTemplate_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      RetVal := This.m_RefCount;   --InterlockedIncrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function Release
   (
      This       : access IDataTemplate_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      RetVal := This.m_RefCount;   --InterlockedDecrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function GetIids
   (
      This       : access IDataTemplate_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IDataTemplate_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.IDataTemplate");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IDataTemplate_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function LoadContent
   (
      This       : access IDataTemplate_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IResourceDictionary_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown;
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
      pragma suppress(Accessibility_Check); -- This can be called from Windows
   begin
      if riid.all = IID_IResourceDictionary or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'access, m_IUnknown'access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'access);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IResourceDictionary_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      RetVal := This.m_RefCount;   --InterlockedIncrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function Release
   (
      This       : access IResourceDictionary_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      RetVal := This.m_RefCount;   --InterlockedDecrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function GetIids
   (
      This       : access IResourceDictionary_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IResourceDictionary_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.IResourceDictionary");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IResourceDictionary_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function get_Source
   (
      This       : access IResourceDictionary_Interface_Impl
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_Source
   (
      This       : access IResourceDictionary_Interface_Impl
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_MergedDictionaries
   (
      This       : access IResourceDictionary_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.IVector_IResourceDictionary
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_ThemeDictionaries
   (
      This       : access IResourceDictionary_Interface_Impl
      ; RetVal : access Windows.Address
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IStateTriggerBase_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown;
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
      pragma suppress(Accessibility_Check); -- This can be called from Windows
   begin
      if riid.all = IID_IStateTriggerBase or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'access, m_IUnknown'access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'access);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IStateTriggerBase_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      RetVal := This.m_RefCount;   --InterlockedIncrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function Release
   (
      This       : access IStateTriggerBase_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      RetVal := This.m_RefCount;   --InterlockedDecrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function GetIids
   (
      This       : access IStateTriggerBase_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IStateTriggerBase_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.IStateTriggerBase");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IStateTriggerBase_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IVisualTransition_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown;
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
      pragma suppress(Accessibility_Check); -- This can be called from Windows
   begin
      if riid.all = IID_IVisualTransition or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'access, m_IUnknown'access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'access);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IVisualTransition_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      RetVal := This.m_RefCount;   --InterlockedIncrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function Release
   (
      This       : access IVisualTransition_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      RetVal := This.m_RefCount;   --InterlockedDecrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function GetIids
   (
      This       : access IVisualTransition_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IVisualTransition_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.IVisualTransition");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IVisualTransition_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function get_GeneratedDuration
   (
      This       : access IVisualTransition_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Duration
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_GeneratedDuration
   (
      This       : access IVisualTransition_Interface_Impl
      ; value : Windows.UI.Xaml.Duration
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_GeneratedEasingFunction
   (
      This       : access IVisualTransition_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IEasingFunctionBase
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_GeneratedEasingFunction
   (
      This       : access IVisualTransition_Interface_Impl
      ; value : Windows.UI.Xaml.Media.Animation.IEasingFunctionBase
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_To
   (
      This       : access IVisualTransition_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_To
   (
      This       : access IVisualTransition_Interface_Impl
      ; value : Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_From
   (
      This       : access IVisualTransition_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_From
   (
      This       : access IVisualTransition_Interface_Impl
      ; value : Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_Storyboard
   (
      This       : access IVisualTransition_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Media.Animation.IStoryboard
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_Storyboard
   (
      This       : access IVisualTransition_Interface_Impl
      ; value : Windows.UI.Xaml.Media.Animation.IStoryboard
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IAdaptiveTrigger_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown;
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
      pragma suppress(Accessibility_Check); -- This can be called from Windows
   begin
      if riid.all = IID_IAdaptiveTrigger or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'access, m_IUnknown'access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'access);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IAdaptiveTrigger_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      RetVal := This.m_RefCount;   --InterlockedIncrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function Release
   (
      This       : access IAdaptiveTrigger_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      RetVal := This.m_RefCount;   --InterlockedDecrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function GetIids
   (
      This       : access IAdaptiveTrigger_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IAdaptiveTrigger_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.IAdaptiveTrigger");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IAdaptiveTrigger_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function get_MinWindowWidth
   (
      This       : access IAdaptiveTrigger_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_MinWindowWidth
   (
      This       : access IAdaptiveTrigger_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_MinWindowHeight
   (
      This       : access IAdaptiveTrigger_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_MinWindowHeight
   (
      This       : access IAdaptiveTrigger_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IFrameworkElementOverrides_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown;
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IFrameworkElement , Windows.IUnknown); 
      pragma suppress(Accessibility_Check); -- This can be called from Windows
   begin
      if riid.all = IID_IFrameworkElementOverrides or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'access, m_IUnknown'access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'access);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject);
         else
            if riid.all = IID_IFrameworkElement then
               pvObject.all := Convert(This.m_IFrameworkElement);
               Hr := S_OK;
            else
               Hr := E_NOINTERFACE;
            end if;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IFrameworkElementOverrides_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      RetVal := This.m_RefCount;   --InterlockedIncrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function Release
   (
      This       : access IFrameworkElementOverrides_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      RetVal := This.m_RefCount;   --InterlockedDecrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function GetIids
   (
      This       : access IFrameworkElementOverrides_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IFrameworkElementOverrides_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.IFrameworkElementOverrides");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IFrameworkElementOverrides_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function MeasureOverride
   (
      This       : access IFrameworkElementOverrides_Interface_Impl
      ; availableSize : Windows.Foundation.Size
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function ArrangeOverride
   (
      This       : access IFrameworkElementOverrides_Interface_Impl
      ; finalSize : Windows.Foundation.Size
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function OnApplyTemplate
   (
      This       : access IFrameworkElementOverrides_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IFrameworkElementOverrides2_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown;
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IFrameworkElement , Windows.IUnknown); 
      pragma suppress(Accessibility_Check); -- This can be called from Windows
   begin
      if riid.all = IID_IFrameworkElementOverrides2 or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'access, m_IUnknown'access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'access);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject);
         else
            if riid.all = IID_IFrameworkElement then
               pvObject.all := Convert(This.m_IFrameworkElement);
               Hr := S_OK;
            else
               Hr := E_NOINTERFACE;
            end if;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IFrameworkElementOverrides2_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      RetVal := This.m_RefCount;   --InterlockedIncrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function Release
   (
      This       : access IFrameworkElementOverrides2_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      RetVal := This.m_RefCount;   --InterlockedDecrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function GetIids
   (
      This       : access IFrameworkElementOverrides2_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IFrameworkElementOverrides2_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.IFrameworkElementOverrides2");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IFrameworkElementOverrides2_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function GoToElementStateCore
   (
      This       : access IFrameworkElementOverrides2_Interface_Impl
      ; stateName : Windows.String
      ; useTransitions : Windows.Boolean
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IFrameworkElement_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown;
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
      pragma suppress(Accessibility_Check); -- This can be called from Windows
   begin
      if riid.all = IID_IFrameworkElement or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'access, m_IUnknown'access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'access);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IFrameworkElement_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      RetVal := This.m_RefCount;   --InterlockedIncrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function Release
   (
      This       : access IFrameworkElement_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      RetVal := This.m_RefCount;   --InterlockedDecrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function GetIids
   (
      This       : access IFrameworkElement_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IFrameworkElement_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.IFrameworkElement");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IFrameworkElement_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function get_Triggers
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.IVector_TriggerBase
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_Resources
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.IResourceDictionary
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_Resources
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.UI.Xaml.IResourceDictionary
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_Tag
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_Tag
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_Language
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_Language
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_ActualWidth
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_ActualHeight
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_Width
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_Width
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_Height
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_Height
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_MinWidth
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_MinWidth
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_MaxWidth
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_MaxWidth
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_MinHeight
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_MinHeight
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_MaxHeight
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_MaxHeight
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.Double
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_HorizontalAlignment
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.HorizontalAlignment
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_HorizontalAlignment
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.UI.Xaml.HorizontalAlignment
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_VerticalAlignment
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.VerticalAlignment
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_VerticalAlignment
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.UI.Xaml.VerticalAlignment
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_Margin
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_Margin
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.UI.Xaml.Thickness
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_Name
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_Name
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_BaseUri
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_DataContext
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_DataContext
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_Style
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.IStyle
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_Style
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.UI.Xaml.IStyle
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_Parent
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.IDependencyObject
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_FlowDirection
   (
      This       : access IFrameworkElement_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.FlowDirection
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_FlowDirection
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.UI.Xaml.FlowDirection
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function add_Loaded
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.UI.Xaml.RoutedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function remove_Loaded
   (
      This       : access IFrameworkElement_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function add_Unloaded
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.UI.Xaml.RoutedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function remove_Unloaded
   (
      This       : access IFrameworkElement_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function add_SizeChanged
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.UI.Xaml.SizeChangedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function remove_SizeChanged
   (
      This       : access IFrameworkElement_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function add_LayoutUpdated
   (
      This       : access IFrameworkElement_Interface_Impl
      ; value : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function remove_LayoutUpdated
   (
      This       : access IFrameworkElement_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function FindName
   (
      This       : access IFrameworkElement_Interface_Impl
      ; name : Windows.String
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function SetBinding
   (
      This       : access IFrameworkElement_Interface_Impl
      ; dp : Windows.UI.Xaml.IDependencyProperty
      ; binding : Windows.UI.Xaml.Data.IBindingBase
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IApplicationOverrides_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown;
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IApplication , Windows.IUnknown); 
      pragma suppress(Accessibility_Check); -- This can be called from Windows
   begin
      if riid.all = IID_IApplicationOverrides or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'access, m_IUnknown'access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'access);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject);
         else
            if riid.all = IID_IApplication then
               pvObject.all := Convert(This.m_IApplication);
               Hr := S_OK;
            else
               Hr := E_NOINTERFACE;
            end if;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IApplicationOverrides_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      RetVal := This.m_RefCount;   --InterlockedIncrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function Release
   (
      This       : access IApplicationOverrides_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      RetVal := This.m_RefCount;   --InterlockedDecrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function GetIids
   (
      This       : access IApplicationOverrides_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IApplicationOverrides_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.IApplicationOverrides");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IApplicationOverrides_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function OnActivated
   (
      This       : access IApplicationOverrides_Interface_Impl
      ; args : Windows.ApplicationModel.Activation.IActivatedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function OnLaunched
   (
      This       : access IApplicationOverrides_Interface_Impl
      ; args : Windows.ApplicationModel.Activation.ILaunchActivatedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function OnFileActivated
   (
      This       : access IApplicationOverrides_Interface_Impl
      ; args : Windows.ApplicationModel.Activation.IFileActivatedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function OnSearchActivated
   (
      This       : access IApplicationOverrides_Interface_Impl
      ; args : Windows.ApplicationModel.Activation.ISearchActivatedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function OnShareTargetActivated
   (
      This       : access IApplicationOverrides_Interface_Impl
      ; args : Windows.ApplicationModel.Activation.IShareTargetActivatedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function OnFileOpenPickerActivated
   (
      This       : access IApplicationOverrides_Interface_Impl
      ; args : Windows.ApplicationModel.Activation.IFileOpenPickerActivatedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function OnFileSavePickerActivated
   (
      This       : access IApplicationOverrides_Interface_Impl
      ; args : Windows.ApplicationModel.Activation.IFileSavePickerActivatedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function OnCachedFileUpdaterActivated
   (
      This       : access IApplicationOverrides_Interface_Impl
      ; args : Windows.ApplicationModel.Activation.ICachedFileUpdaterActivatedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function OnWindowCreated
   (
      This       : access IApplicationOverrides_Interface_Impl
      ; args : Windows.UI.Xaml.IWindowCreatedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IApplicationOverrides2_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown;
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IApplication , Windows.IUnknown); 
      pragma suppress(Accessibility_Check); -- This can be called from Windows
   begin
      if riid.all = IID_IApplicationOverrides2 or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'access, m_IUnknown'access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'access);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject);
         else
            if riid.all = IID_IApplication then
               pvObject.all := Convert(This.m_IApplication);
               Hr := S_OK;
            else
               Hr := E_NOINTERFACE;
            end if;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IApplicationOverrides2_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      RetVal := This.m_RefCount;   --InterlockedIncrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function Release
   (
      This       : access IApplicationOverrides2_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      RetVal := This.m_RefCount;   --InterlockedDecrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function GetIids
   (
      This       : access IApplicationOverrides2_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IApplicationOverrides2_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.IApplicationOverrides2");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IApplicationOverrides2_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function OnBackgroundActivated
   (
      This       : access IApplicationOverrides2_Interface_Impl
      ; args : Windows.ApplicationModel.Activation.IBackgroundActivatedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IApplication_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown;
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
      pragma suppress(Accessibility_Check); -- This can be called from Windows
   begin
      if riid.all = IID_IApplication or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'access, m_IUnknown'access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'access);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IApplication_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      RetVal := This.m_RefCount;   --InterlockedIncrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function Release
   (
      This       : access IApplication_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      RetVal := This.m_RefCount;   --InterlockedDecrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function GetIids
   (
      This       : access IApplication_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IApplication_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.IApplication");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IApplication_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function get_Resources
   (
      This       : access IApplication_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.IResourceDictionary
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_Resources
   (
      This       : access IApplication_Interface_Impl
      ; value : Windows.UI.Xaml.IResourceDictionary
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_DebugSettings
   (
      This       : access IApplication_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.IDebugSettings
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function get_RequestedTheme
   (
      This       : access IApplication_Interface_Impl
      ; RetVal : access Windows.UI.Xaml.ApplicationTheme
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function put_RequestedTheme
   (
      This       : access IApplication_Interface_Impl
      ; value : Windows.UI.Xaml.ApplicationTheme
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function add_UnhandledException
   (
      This       : access IApplication_Interface_Impl
      ; value : Windows.UI.Xaml.UnhandledExceptionEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function remove_UnhandledException
   (
      This       : access IApplication_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function add_Suspending
   (
      This       : access IApplication_Interface_Impl
      ; value : Windows.UI.Xaml.SuspendingEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function remove_Suspending
   (
      This       : access IApplication_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function add_Resuming
   (
      This       : access IApplication_Interface_Impl
      ; value : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function remove_Resuming
   (
      This       : access IApplication_Interface_Impl
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   function Exit_x
   (
      This       : access IApplication_Interface_Impl
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IVisualStateManagerOverrides_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown;
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IVisualStateManager , Windows.IUnknown); 
      pragma suppress(Accessibility_Check); -- This can be called from Windows
   begin
      if riid.all = IID_IVisualStateManagerOverrides or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'access, m_IUnknown'access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'access);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject);
         else
            if riid.all = IID_IVisualStateManager then
               pvObject.all := Convert(This.m_IVisualStateManager);
               Hr := S_OK;
            else
               Hr := E_NOINTERFACE;
            end if;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IVisualStateManagerOverrides_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      RetVal := This.m_RefCount;   --InterlockedIncrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function Release
   (
      This       : access IVisualStateManagerOverrides_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      RetVal := This.m_RefCount;   --InterlockedDecrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function GetIids
   (
      This       : access IVisualStateManagerOverrides_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IVisualStateManagerOverrides_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.IVisualStateManagerOverrides");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IVisualStateManagerOverrides_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function GoToStateCore
   (
      This       : access IVisualStateManagerOverrides_Interface_Impl
      ; control : Windows.UI.Xaml.Controls.IControl
      ; templateRoot : Windows.UI.Xaml.IFrameworkElement
      ; stateName : Windows.String
      ; group : Windows.UI.Xaml.IVisualStateGroup
      ; state : Windows.UI.Xaml.IVisualState
      ; useTransitions : Windows.Boolean
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IVisualStateManager_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown;
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
      pragma suppress(Accessibility_Check); -- This can be called from Windows
   begin
      if riid.all = IID_IVisualStateManager or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'access, m_IUnknown'access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'access);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access IVisualStateManager_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      RetVal := This.m_RefCount;   --InterlockedIncrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function Release
   (
      This       : access IVisualStateManager_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      RetVal := This.m_RefCount;   --InterlockedDecrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function GetIids
   (
      This       : access IVisualStateManager_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access IVisualStateManager_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.IVisualStateManager");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IVisualStateManager_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IDispatcherTimer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.DispatcherTimer");
      m_Factory     : IDispatcherTimerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDispatcherTimer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDispatcherTimerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromRadii
   (
      topLeft : Windows.Double
      ; topRight : Windows.Double
      ; bottomRight : Windows.Double
      ; bottomLeft : Windows.Double
   )
   return Windows.UI.Xaml.CornerRadius is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.CornerRadiusHelper");
      m_Factory     : ICornerRadiusHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.CornerRadius;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICornerRadiusHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromRadii(topLeft, topRight, bottomRight, bottomLeft, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromUniformRadius
   (
      uniformRadius : Windows.Double
   )
   return Windows.UI.Xaml.CornerRadius is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.CornerRadiusHelper");
      m_Factory     : ICornerRadiusHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.CornerRadius;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICornerRadiusHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromUniformRadius(uniformRadius, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Automatic
   return Windows.UI.Xaml.Duration is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.DurationHelper");
      m_Factory     : IDurationHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Duration;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDurationHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Automatic(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Forever
   return Windows.UI.Xaml.Duration is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.DurationHelper");
      m_Factory     : IDurationHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Duration;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDurationHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Forever(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Compare
   (
      duration1 : Windows.UI.Xaml.Duration
      ; duration2 : Windows.UI.Xaml.Duration
   )
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.DurationHelper");
      m_Factory     : IDurationHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDurationHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Compare(duration1, duration2, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromTimeSpan
   (
      timeSpan : Windows.Foundation.TimeSpan
   )
   return Windows.UI.Xaml.Duration is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.DurationHelper");
      m_Factory     : IDurationHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Duration;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDurationHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromTimeSpan(timeSpan, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetHasTimeSpan
   (
      target : Windows.UI.Xaml.Duration
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.DurationHelper");
      m_Factory     : IDurationHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDurationHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetHasTimeSpan(target, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Add
   (
      target : Windows.UI.Xaml.Duration
      ; duration : Windows.UI.Xaml.Duration
   )
   return Windows.UI.Xaml.Duration is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.DurationHelper");
      m_Factory     : IDurationHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Duration;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDurationHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Add(target, duration, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Equals
   (
      target : Windows.UI.Xaml.Duration
      ; value : Windows.UI.Xaml.Duration
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.DurationHelper");
      m_Factory     : IDurationHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDurationHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Equals(target, value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Subtract
   (
      target : Windows.UI.Xaml.Duration
      ; duration : Windows.UI.Xaml.Duration
   )
   return Windows.UI.Xaml.Duration is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.DurationHelper");
      m_Factory     : IDurationHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Duration;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDurationHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Subtract(target, duration, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromLengths
   (
      left : Windows.Double
      ; top : Windows.Double
      ; right : Windows.Double
      ; bottom : Windows.Double
   )
   return Windows.UI.Xaml.Thickness is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.ThicknessHelper");
      m_Factory     : IThicknessHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Thickness;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IThicknessHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromLengths(left, top, right, bottom, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromUniformLength
   (
      uniformLength : Windows.Double
   )
   return Windows.UI.Xaml.Thickness is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.ThicknessHelper");
      m_Factory     : IThicknessHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Thickness;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IThicknessHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromUniformLength(uniformLength, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IDependencyObject is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.DependencyObject");
      m_Factory     : IDependencyObjectFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyObject;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDependencyObjectFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_UnsetValue
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.DependencyProperty");
      m_Factory     : IDependencyPropertyStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDependencyPropertyStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_UnsetValue(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Register
   (
      name : Windows.String
      ; propertyType : Windows.UI.Xaml.Interop.TypeName
      ; ownerType : Windows.UI.Xaml.Interop.TypeName
      ; typeMetadata : Windows.UI.Xaml.IPropertyMetadata
   )
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.DependencyProperty");
      m_Factory     : IDependencyPropertyStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDependencyPropertyStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Register(name, propertyType, ownerType, typeMetadata, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RegisterAttached
   (
      name : Windows.String
      ; propertyType : Windows.UI.Xaml.Interop.TypeName
      ; ownerType : Windows.UI.Xaml.Interop.TypeName
      ; defaultMetadata : Windows.UI.Xaml.IPropertyMetadata
   )
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.DependencyProperty");
      m_Factory     : IDependencyPropertyStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDependencyPropertyStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RegisterAttached(name, propertyType, ownerType, defaultMetadata, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IRoutedEventArgs is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.RoutedEventArgs");
      m_Factory     : IRoutedEventArgsFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IRoutedEventArgs;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRoutedEventArgsFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IDataTemplateKey is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.DataTemplateKey");
      m_Factory     : IDataTemplateKeyFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDataTemplateKey;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDataTemplateKeyFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithType
   (
      dataType : Windows.Object
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IDataTemplateKey is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.DataTemplateKey");
      m_Factory     : IDataTemplateKeyFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDataTemplateKey;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDataTemplateKeyFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithType(dataType, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithDefaultValue
   (
      defaultValue : Windows.Object
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IPropertyMetadata is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.PropertyMetadata");
      m_Factory     : IPropertyMetadataFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IPropertyMetadata;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyMetadataFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithDefaultValue(defaultValue, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstanceWithDefaultValueAndCallback
   (
      defaultValue : Windows.Object
      ; propertyChangedCallback : Windows.UI.Xaml.PropertyChangedCallback
      ; outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IPropertyMetadata is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.PropertyMetadata");
      m_Factory     : IPropertyMetadataFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IPropertyMetadata;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyMetadataFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstanceWithDefaultValueAndCallback(defaultValue, propertyChangedCallback, outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithDefaultValue
   (
      defaultValue : Windows.Object
   )
   return Windows.UI.Xaml.IPropertyMetadata is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.PropertyMetadata");
      m_Factory     : IPropertyMetadataStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IPropertyMetadata;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyMetadataStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithDefaultValue(defaultValue, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithDefaultValueAndCallback
   (
      defaultValue : Windows.Object
      ; propertyChangedCallback : Windows.UI.Xaml.PropertyChangedCallback
   )
   return Windows.UI.Xaml.IPropertyMetadata is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.PropertyMetadata");
      m_Factory     : IPropertyMetadataStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IPropertyMetadata;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyMetadataStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithDefaultValueAndCallback(defaultValue, propertyChangedCallback, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithFactory
   (
      createDefaultValueCallback : Windows.UI.Xaml.CreateDefaultValueCallback
   )
   return Windows.UI.Xaml.IPropertyMetadata is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.PropertyMetadata");
      m_Factory     : IPropertyMetadataStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IPropertyMetadata;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyMetadataStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithFactory(createDefaultValueCallback, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithFactoryAndCallback
   (
      createDefaultValueCallback : Windows.UI.Xaml.CreateDefaultValueCallback
      ; propertyChangedCallback : Windows.UI.Xaml.PropertyChangedCallback
   )
   return Windows.UI.Xaml.IPropertyMetadata is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.PropertyMetadata");
      m_Factory     : IPropertyMetadataStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IPropertyMetadata;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPropertyMetadataStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithFactoryAndCallback(createDefaultValueCallback, propertyChangedCallback, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IObservableVector_DependencyObject is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.DependencyObjectCollection");
      m_Factory     : IDependencyObjectCollectionFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IObservableVector_DependencyObject;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDependencyObjectCollectionFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IFrameworkTemplate is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.FrameworkTemplate");
      m_Factory     : IFrameworkTemplateFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IFrameworkTemplate;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFrameworkTemplateFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ExtensionInstanceProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.DataTemplate");
      m_Factory     : IDataTemplateStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDataTemplateStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ExtensionInstanceProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetExtensionInstance
   (
      element : Windows.UI.Xaml.IFrameworkElement
   )
   return Windows.UI.Xaml.IDataTemplateExtension is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.DataTemplate");
      m_Factory     : IDataTemplateStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDataTemplateExtension;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDataTemplateStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetExtensionInstance(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetExtensionInstance
   (
      element : Windows.UI.Xaml.IFrameworkElement
      ; value : Windows.UI.Xaml.IDataTemplateExtension
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.DataTemplate");
      m_Factory     : IDataTemplateStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDataTemplateStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetExtensionInstance(element, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IDataTemplate is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.DataTemplate");
      m_Factory     : IDataTemplateFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDataTemplate;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDataTemplateFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IResourceDictionary is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.ResourceDictionary");
      m_Factory     : IResourceDictionaryFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IResourceDictionary;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IResourceDictionaryFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IStateTriggerBase is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.StateTriggerBase");
      m_Factory     : IStateTriggerBaseFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IStateTriggerBase;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStateTriggerBaseFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_KeyDownEvent
   return Windows.UI.Xaml.IRoutedEvent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IRoutedEvent;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_KeyDownEvent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_KeyUpEvent
   return Windows.UI.Xaml.IRoutedEvent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IRoutedEvent;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_KeyUpEvent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PointerEnteredEvent
   return Windows.UI.Xaml.IRoutedEvent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IRoutedEvent;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PointerEnteredEvent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PointerPressedEvent
   return Windows.UI.Xaml.IRoutedEvent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IRoutedEvent;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PointerPressedEvent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PointerMovedEvent
   return Windows.UI.Xaml.IRoutedEvent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IRoutedEvent;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PointerMovedEvent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PointerReleasedEvent
   return Windows.UI.Xaml.IRoutedEvent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IRoutedEvent;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PointerReleasedEvent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PointerExitedEvent
   return Windows.UI.Xaml.IRoutedEvent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IRoutedEvent;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PointerExitedEvent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PointerCaptureLostEvent
   return Windows.UI.Xaml.IRoutedEvent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IRoutedEvent;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PointerCaptureLostEvent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PointerCanceledEvent
   return Windows.UI.Xaml.IRoutedEvent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IRoutedEvent;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PointerCanceledEvent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PointerWheelChangedEvent
   return Windows.UI.Xaml.IRoutedEvent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IRoutedEvent;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PointerWheelChangedEvent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TappedEvent
   return Windows.UI.Xaml.IRoutedEvent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IRoutedEvent;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TappedEvent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DoubleTappedEvent
   return Windows.UI.Xaml.IRoutedEvent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IRoutedEvent;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DoubleTappedEvent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HoldingEvent
   return Windows.UI.Xaml.IRoutedEvent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IRoutedEvent;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HoldingEvent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RightTappedEvent
   return Windows.UI.Xaml.IRoutedEvent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IRoutedEvent;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RightTappedEvent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ManipulationStartingEvent
   return Windows.UI.Xaml.IRoutedEvent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IRoutedEvent;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ManipulationStartingEvent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ManipulationInertiaStartingEvent
   return Windows.UI.Xaml.IRoutedEvent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IRoutedEvent;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ManipulationInertiaStartingEvent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ManipulationStartedEvent
   return Windows.UI.Xaml.IRoutedEvent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IRoutedEvent;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ManipulationStartedEvent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ManipulationDeltaEvent
   return Windows.UI.Xaml.IRoutedEvent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IRoutedEvent;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ManipulationDeltaEvent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ManipulationCompletedEvent
   return Windows.UI.Xaml.IRoutedEvent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IRoutedEvent;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ManipulationCompletedEvent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DragEnterEvent
   return Windows.UI.Xaml.IRoutedEvent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IRoutedEvent;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DragEnterEvent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DragLeaveEvent
   return Windows.UI.Xaml.IRoutedEvent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IRoutedEvent;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DragLeaveEvent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DragOverEvent
   return Windows.UI.Xaml.IRoutedEvent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IRoutedEvent;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DragOverEvent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DropEvent
   return Windows.UI.Xaml.IRoutedEvent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IRoutedEvent;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DropEvent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AllowDropProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AllowDropProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_OpacityProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_OpacityProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ClipProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ClipProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RenderTransformProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RenderTransformProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ProjectionProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ProjectionProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RenderTransformOriginProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RenderTransformOriginProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsHitTestVisibleProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsHitTestVisibleProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VisibilityProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VisibilityProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_UseLayoutRoundingProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_UseLayoutRoundingProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TransitionsProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TransitionsProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CacheModeProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CacheModeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsTapEnabledProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsTapEnabledProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsDoubleTapEnabledProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsDoubleTapEnabledProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsRightTapEnabledProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsRightTapEnabledProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsHoldingEnabledProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsHoldingEnabledProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ManipulationModeProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ManipulationModeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PointerCapturesProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PointerCapturesProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BringIntoViewRequestedEvent
   return Windows.UI.Xaml.IRoutedEvent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics8 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IRoutedEvent;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics8'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BringIntoViewRequestedEvent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ContextRequestedEvent
   return Windows.UI.Xaml.IRoutedEvent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics8 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IRoutedEvent;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics8'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ContextRequestedEvent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_KeyTipTargetProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics8 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics8'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_KeyTipTargetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_KeyboardAcceleratorPlacementTargetProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics8 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics8'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_KeyboardAcceleratorPlacementTargetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_KeyboardAcceleratorPlacementModeProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics8 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics8'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_KeyboardAcceleratorPlacementModeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure RegisterAsScrollPort
   (
      element : Windows.UI.Xaml.IUIElement
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics8 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics8'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RegisterAsScrollPort(element);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_ContextFlyoutProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ContextFlyoutProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ExitDisplayModeOnAccessKeyInvokedProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ExitDisplayModeOnAccessKeyInvokedProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsAccessKeyScopeProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsAccessKeyScopeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AccessKeyScopeOwnerProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AccessKeyScopeOwnerProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AccessKeyProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AccessKeyProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Transform3DProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Transform3DProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CanDragProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CanDragProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryStartDirectManipulation
   (
      value : Windows.UI.Xaml.Input.IPointer
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryStartDirectManipulation(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_GettingFocusEvent
   return Windows.UI.Xaml.IRoutedEvent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics6 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IRoutedEvent;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics6'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_GettingFocusEvent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LosingFocusEvent
   return Windows.UI.Xaml.IRoutedEvent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics6 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IRoutedEvent;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics6'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LosingFocusEvent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_NoFocusCandidateFoundEvent
   return Windows.UI.Xaml.IRoutedEvent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics6 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IRoutedEvent;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics6'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_NoFocusCandidateFoundEvent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LightsProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LightsProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_KeyTipPlacementModeProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_KeyTipPlacementModeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_KeyTipHorizontalOffsetProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_KeyTipHorizontalOffsetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_KeyTipVerticalOffsetProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_KeyTipVerticalOffsetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_XYFocusKeyboardNavigationProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_XYFocusKeyboardNavigationProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_XYFocusUpNavigationStrategyProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_XYFocusUpNavigationStrategyProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_XYFocusDownNavigationStrategyProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_XYFocusDownNavigationStrategyProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_XYFocusLeftNavigationStrategyProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_XYFocusLeftNavigationStrategyProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_XYFocusRightNavigationStrategyProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_XYFocusRightNavigationStrategyProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HighContrastAdjustmentProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HighContrastAdjustmentProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TabFocusNavigationProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TabFocusNavigationProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PreviewKeyDownEvent
   return Windows.UI.Xaml.IRoutedEvent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics7 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IRoutedEvent;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics7'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PreviewKeyDownEvent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CharacterReceivedEvent
   return Windows.UI.Xaml.IRoutedEvent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics7 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IRoutedEvent;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics7'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CharacterReceivedEvent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PreviewKeyUpEvent
   return Windows.UI.Xaml.IRoutedEvent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics7 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IRoutedEvent;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics7'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PreviewKeyUpEvent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CompositeModeProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.UIElement");
      m_Factory     : IUIElementStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUIElementStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CompositeModeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IVisualTransition is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.VisualTransition");
      m_Factory     : IVisualTransitionFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IVisualTransition;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVisualTransitionFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MinWindowWidthProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.AdaptiveTrigger");
      m_Factory     : IAdaptiveTriggerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAdaptiveTriggerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MinWindowWidthProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MinWindowHeightProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.AdaptiveTrigger");
      m_Factory     : IAdaptiveTriggerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAdaptiveTriggerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MinWindowHeightProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IAdaptiveTrigger is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.AdaptiveTrigger");
      m_Factory     : IAdaptiveTriggerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IAdaptiveTrigger;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAdaptiveTriggerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AllowFocusOnInteractionProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.FrameworkElement");
      m_Factory     : IFrameworkElementStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFrameworkElementStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AllowFocusOnInteractionProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FocusVisualMarginProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.FrameworkElement");
      m_Factory     : IFrameworkElementStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFrameworkElementStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FocusVisualMarginProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FocusVisualSecondaryThicknessProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.FrameworkElement");
      m_Factory     : IFrameworkElementStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFrameworkElementStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FocusVisualSecondaryThicknessProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FocusVisualPrimaryThicknessProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.FrameworkElement");
      m_Factory     : IFrameworkElementStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFrameworkElementStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FocusVisualPrimaryThicknessProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FocusVisualSecondaryBrushProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.FrameworkElement");
      m_Factory     : IFrameworkElementStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFrameworkElementStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FocusVisualSecondaryBrushProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FocusVisualPrimaryBrushProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.FrameworkElement");
      m_Factory     : IFrameworkElementStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFrameworkElementStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FocusVisualPrimaryBrushProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AllowFocusWhenDisabledProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.FrameworkElement");
      m_Factory     : IFrameworkElementStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFrameworkElementStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AllowFocusWhenDisabledProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ActualThemeProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.FrameworkElement");
      m_Factory     : IFrameworkElementStatics6 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFrameworkElementStatics6'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ActualThemeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RequestedThemeProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.FrameworkElement");
      m_Factory     : IFrameworkElementStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFrameworkElementStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RequestedThemeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IFrameworkElement is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.FrameworkElement");
      m_Factory     : IFrameworkElementFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IFrameworkElement;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFrameworkElementFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TagProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.FrameworkElement");
      m_Factory     : IFrameworkElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFrameworkElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TagProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LanguageProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.FrameworkElement");
      m_Factory     : IFrameworkElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFrameworkElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LanguageProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ActualWidthProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.FrameworkElement");
      m_Factory     : IFrameworkElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFrameworkElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ActualWidthProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ActualHeightProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.FrameworkElement");
      m_Factory     : IFrameworkElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFrameworkElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ActualHeightProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_WidthProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.FrameworkElement");
      m_Factory     : IFrameworkElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFrameworkElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_WidthProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HeightProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.FrameworkElement");
      m_Factory     : IFrameworkElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFrameworkElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HeightProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MinWidthProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.FrameworkElement");
      m_Factory     : IFrameworkElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFrameworkElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MinWidthProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MaxWidthProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.FrameworkElement");
      m_Factory     : IFrameworkElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFrameworkElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MaxWidthProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MinHeightProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.FrameworkElement");
      m_Factory     : IFrameworkElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFrameworkElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MinHeightProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MaxHeightProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.FrameworkElement");
      m_Factory     : IFrameworkElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFrameworkElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MaxHeightProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HorizontalAlignmentProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.FrameworkElement");
      m_Factory     : IFrameworkElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFrameworkElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HorizontalAlignmentProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VerticalAlignmentProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.FrameworkElement");
      m_Factory     : IFrameworkElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFrameworkElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VerticalAlignmentProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MarginProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.FrameworkElement");
      m_Factory     : IFrameworkElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFrameworkElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MarginProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_NameProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.FrameworkElement");
      m_Factory     : IFrameworkElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFrameworkElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_NameProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DataContextProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.FrameworkElement");
      m_Factory     : IFrameworkElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFrameworkElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DataContextProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_StyleProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.FrameworkElement");
      m_Factory     : IFrameworkElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFrameworkElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_StyleProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FlowDirectionProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.FrameworkElement");
      m_Factory     : IFrameworkElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFrameworkElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FlowDirectionProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure DeferTree
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.FrameworkElement");
      m_Factory     : IFrameworkElementStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFrameworkElementStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.DeferTree(element);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_IsActiveProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.StateTrigger");
      m_Factory     : IStateTriggerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStateTriggerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsActiveProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Auto
   return Windows.UI.Xaml.GridLength is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.GridLengthHelper");
      m_Factory     : IGridLengthHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.GridLength;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGridLengthHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Auto(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromPixels
   (
      pixels : Windows.Double
   )
   return Windows.UI.Xaml.GridLength is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.GridLengthHelper");
      m_Factory     : IGridLengthHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.GridLength;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGridLengthHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromPixels(pixels, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromValueAndType
   (
      value : Windows.Double
      ; type_x : Windows.UI.Xaml.GridUnitType
   )
   return Windows.UI.Xaml.GridLength is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.GridLengthHelper");
      m_Factory     : IGridLengthHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.GridLength;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGridLengthHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromValueAndType(value, type_x, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetIsAbsolute
   (
      target : Windows.UI.Xaml.GridLength
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.GridLengthHelper");
      m_Factory     : IGridLengthHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGridLengthHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetIsAbsolute(target, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetIsAuto
   (
      target : Windows.UI.Xaml.GridLength
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.GridLengthHelper");
      m_Factory     : IGridLengthHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGridLengthHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetIsAuto(target, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetIsStar
   (
      target : Windows.UI.Xaml.GridLength
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.GridLengthHelper");
      m_Factory     : IGridLengthHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGridLengthHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetIsStar(target, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Equals
   (
      target : Windows.UI.Xaml.GridLength
      ; value : Windows.UI.Xaml.GridLength
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.GridLengthHelper");
      m_Factory     : IGridLengthHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGridLengthHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Equals(target, value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SpatialAudioMode
   return Windows.UI.Xaml.ElementSpatialAudioMode is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.ElementSoundPlayer");
      m_Factory     : IElementSoundPlayerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.ElementSpatialAudioMode;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IElementSoundPlayerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SpatialAudioMode(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_SpatialAudioMode
   (
      value : Windows.UI.Xaml.ElementSpatialAudioMode
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.ElementSoundPlayer");
      m_Factory     : IElementSoundPlayerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IElementSoundPlayerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_SpatialAudioMode(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_Volume
   return Windows.Double is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.ElementSoundPlayer");
      m_Factory     : IElementSoundPlayerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Double;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IElementSoundPlayerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Volume(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_Volume
   (
      value : Windows.Double
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.ElementSoundPlayer");
      m_Factory     : IElementSoundPlayerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IElementSoundPlayerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_Volume(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_State
   return Windows.UI.Xaml.ElementSoundPlayerState is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.ElementSoundPlayer");
      m_Factory     : IElementSoundPlayerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.ElementSoundPlayerState;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IElementSoundPlayerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_State(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_State
   (
      value : Windows.UI.Xaml.ElementSoundPlayerState
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.ElementSoundPlayer");
      m_Factory     : IElementSoundPlayerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IElementSoundPlayerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_State(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure Play
   (
      sound : Windows.UI.Xaml.ElementSoundKind
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.ElementSoundPlayer");
      m_Factory     : IElementSoundPlayerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IElementSoundPlayerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Play(sound);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_Current
   return Windows.UI.Xaml.IApplication is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Application");
      m_Factory     : IApplicationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IApplication;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Current(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure Start
   (
      callback : Windows.UI.Xaml.ApplicationInitializationCallback
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Application");
      m_Factory     : IApplicationStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Start(callback);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure LoadComponent
   (
      component : Windows.Object
      ; resourceLocator : Windows.Foundation.IUriRuntimeClass
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Application");
      m_Factory     : IApplicationStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadComponent(component, resourceLocator);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure LoadComponentWithResourceLocation
   (
      component : Windows.Object
      ; resourceLocator : Windows.Foundation.IUriRuntimeClass
      ; componentResourceLocation : Windows.UI.Xaml.Controls.Primitives.ComponentResourceLocation
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Application");
      m_Factory     : IApplicationStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadComponentWithResourceLocation(component, resourceLocator, componentResourceLocation);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IApplication is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Application");
      m_Factory     : IApplicationFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IApplication;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromCoordinates
   (
      x : Windows.Single
      ; y : Windows.Single
   )
   return Windows.Foundation.Point is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.PointHelper");
      m_Factory     : IPointHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Point;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPointHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromCoordinates(x, y, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Empty
   return Windows.Foundation.Rect is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.RectHelper");
      m_Factory     : IRectHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Rect;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRectHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Empty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromCoordinatesAndDimensions
   (
      x : Windows.Single
      ; y : Windows.Single
      ; width : Windows.Single
      ; height : Windows.Single
   )
   return Windows.Foundation.Rect is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.RectHelper");
      m_Factory     : IRectHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Rect;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRectHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromCoordinatesAndDimensions(x, y, width, height, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromPoints
   (
      point1 : Windows.Foundation.Point
      ; point2 : Windows.Foundation.Point
   )
   return Windows.Foundation.Rect is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.RectHelper");
      m_Factory     : IRectHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Rect;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRectHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromPoints(point1, point2, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromLocationAndSize
   (
      location : Windows.Foundation.Point
      ; size : Windows.Foundation.Size
   )
   return Windows.Foundation.Rect is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.RectHelper");
      m_Factory     : IRectHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Rect;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRectHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromLocationAndSize(location, size, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetIsEmpty
   (
      target : Windows.Foundation.Rect
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.RectHelper");
      m_Factory     : IRectHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRectHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetIsEmpty(target, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetBottom
   (
      target : Windows.Foundation.Rect
   )
   return Windows.Single is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.RectHelper");
      m_Factory     : IRectHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Single;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRectHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetBottom(target, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetLeft
   (
      target : Windows.Foundation.Rect
   )
   return Windows.Single is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.RectHelper");
      m_Factory     : IRectHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Single;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRectHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetLeft(target, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetRight
   (
      target : Windows.Foundation.Rect
   )
   return Windows.Single is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.RectHelper");
      m_Factory     : IRectHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Single;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRectHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetRight(target, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetTop
   (
      target : Windows.Foundation.Rect
   )
   return Windows.Single is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.RectHelper");
      m_Factory     : IRectHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Single;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRectHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetTop(target, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Contains
   (
      target : Windows.Foundation.Rect
      ; point : Windows.Foundation.Point
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.RectHelper");
      m_Factory     : IRectHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRectHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Contains(target, point, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Equals
   (
      target : Windows.Foundation.Rect
      ; value : Windows.Foundation.Rect
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.RectHelper");
      m_Factory     : IRectHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRectHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Equals(target, value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Intersect
   (
      target : Windows.Foundation.Rect
      ; rect : Windows.Foundation.Rect
   )
   return Windows.Foundation.Rect is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.RectHelper");
      m_Factory     : IRectHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Rect;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRectHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Intersect(target, rect, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function UnionWithPoint
   (
      target : Windows.Foundation.Rect
      ; point : Windows.Foundation.Point
   )
   return Windows.Foundation.Rect is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.RectHelper");
      m_Factory     : IRectHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Rect;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRectHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.UnionWithPoint(target, point, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function UnionWithRect
   (
      target : Windows.Foundation.Rect
      ; rect : Windows.Foundation.Rect
   )
   return Windows.Foundation.Rect is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.RectHelper");
      m_Factory     : IRectHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Rect;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRectHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.UnionWithRect(target, rect, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Empty
   return Windows.Foundation.Size is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.SizeHelper");
      m_Factory     : ISizeHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Size;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISizeHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Empty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromDimensions
   (
      width : Windows.Single
      ; height : Windows.Single
   )
   return Windows.Foundation.Size is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.SizeHelper");
      m_Factory     : ISizeHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Size;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISizeHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromDimensions(width, height, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetIsEmpty
   (
      target : Windows.Foundation.Size
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.SizeHelper");
      m_Factory     : ISizeHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISizeHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetIsEmpty(target, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Equals
   (
      target : Windows.Foundation.Size
      ; value : Windows.Foundation.Size
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.SizeHelper");
      m_Factory     : ISizeHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISizeHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Equals(target, value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Current
   return Windows.UI.Xaml.IWindow is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Window");
      m_Factory     : IWindowStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IWindow;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWindowStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Current(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetVisualStateGroups
   (
      obj : Windows.UI.Xaml.IFrameworkElement
   )
   return Windows.UI.Xaml.IVector_IVisualStateGroup is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.VisualStateManager");
      m_Factory     : IVisualStateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IVector_IVisualStateGroup;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVisualStateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetVisualStateGroups(obj, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CustomVisualStateManagerProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.VisualStateManager");
      m_Factory     : IVisualStateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVisualStateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CustomVisualStateManagerProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetCustomVisualStateManager
   (
      obj : Windows.UI.Xaml.IFrameworkElement
   )
   return Windows.UI.Xaml.IVisualStateManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.VisualStateManager");
      m_Factory     : IVisualStateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IVisualStateManager;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVisualStateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetCustomVisualStateManager(obj, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetCustomVisualStateManager
   (
      obj : Windows.UI.Xaml.IFrameworkElement
      ; value : Windows.UI.Xaml.IVisualStateManager
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.VisualStateManager");
      m_Factory     : IVisualStateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVisualStateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetCustomVisualStateManager(obj, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function GoToState
   (
      control : Windows.UI.Xaml.Controls.IControl
      ; stateName : Windows.String
      ; useTransitions : Windows.Boolean
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.VisualStateManager");
      m_Factory     : IVisualStateManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVisualStateManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GoToState(control, stateName, useTransitions, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.IVisualStateManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.VisualStateManager");
      m_Factory     : IVisualStateManagerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IVisualStateManager;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVisualStateManagerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
