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
with Windows.UI.Core;
with Windows.UI.Input.Inking;
with Windows.UI.Composition;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.Input.Inking.Core is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreInkIndependentInputSource_add_PointerEntering_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource(sender), Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreInkIndependentInputSource_add_PointerHovering_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource(sender), Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreInkIndependentInputSource_add_PointerExiting_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource(sender), Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreInkIndependentInputSource_add_PointerPressing_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource(sender), Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreInkIndependentInputSource_add_PointerMoving_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource(sender), Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreInkIndependentInputSource_add_PointerReleasing_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource(sender), Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreInkIndependentInputSource_add_PointerLost_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource
      ; args : Windows.UI.Core.IPointerEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource(sender), Windows.UI.Core.IPointerEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeStarting_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource
      ; args : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource(sender), Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeContinuing_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource
      ; args : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource(sender), Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeStopping_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource
      ; args : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource(sender), Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeCompleted_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource
      ; args : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource(sender), Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ICoreWetStrokeUpdateSource_add_WetStrokeCanceled_Interface
      ; sender : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource
      ; args : Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource(sender), Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function CreateCoreInkPresenterHost return Windows.UI.Input.Inking.Core.ICoreInkPresenterHost is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.Inking.Core.CoreInkPresenterHost");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.Input.Inking.Core.ICoreInkPresenterHost) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.Input.Inking.Core.IID_ICoreInkPresenterHost'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      drawingAttributes : Windows.UI.Input.Inking.IInkDrawingAttributes
      ; pointTransform : Windows.Foundation.Numerics.Matrix3x2
   )
   return Windows.UI.Input.Inking.Core.ICoreIncrementalInkStroke is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.Inking.Core.CoreIncrementalInkStroke");
      m_Factory     : Windows.UI.Input.Inking.Core.ICoreIncrementalInkStrokeFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.Inking.Core.ICoreIncrementalInkStroke := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreIncrementalInkStrokeFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(drawingAttributes, pointTransform, RetVal'Access);
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
   
   function Create
   (
      inkPresenter : Windows.UI.Input.Inking.IInkPresenter
   )
   return Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.Inking.Core.CoreInkIndependentInputSource");
      m_Factory     : ICoreInkIndependentInputSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreInkIndependentInputSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(inkPresenter, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      inkPresenter : Windows.UI.Input.Inking.IInkPresenter
   )
   return Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.Inking.Core.CoreWetStrokeUpdateSource");
      m_Factory     : ICoreWetStrokeUpdateSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.Inking.Core.ICoreWetStrokeUpdateSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICoreWetStrokeUpdateSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(inkPresenter, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
