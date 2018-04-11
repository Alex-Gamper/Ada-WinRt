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
with Windows.Graphics.DirectX.Direct3D11;
with Windows.Media;
with Windows.Media.Editing;
with Windows.Media.Render;
with Windows.Media.Capture;
with Windows.Storage.Streams;
with Windows.Media.MediaProperties;
with Windows.UI;
with Windows.Media.Transcoding;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Media.Effects is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_IAudioRenderEffectsManager_add_AudioRenderEffectsChanged_Interface
      ; sender : Windows.Media.Effects.IAudioRenderEffectsManager
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Effects.IAudioRenderEffectsManager(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAudioCaptureEffectsManager_add_AudioCaptureEffectsChanged_Interface
      ; sender : Windows.Media.Effects.IAudioCaptureEffectsManager
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Effects.IAudioCaptureEffectsManager(sender), args);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create
   (
      activatableClassId : Windows.String
   )
   return Windows.Media.Effects.IVideoCompositorDefinition is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Effects.VideoCompositorDefinition");
      m_Factory     : Windows.Media.Effects.IVideoCompositorDefinitionFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Effects.IVideoCompositorDefinition := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVideoCompositorDefinitionFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(activatableClassId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithProperties
   (
      activatableClassId : Windows.String
      ; props : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.Media.Effects.IVideoCompositorDefinition is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Effects.VideoCompositorDefinition");
      m_Factory     : Windows.Media.Effects.IVideoCompositorDefinitionFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Effects.IVideoCompositorDefinition := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVideoCompositorDefinitionFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithProperties(activatableClassId, props, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      activatableClassId : Windows.String
   )
   return Windows.Media.Effects.IVideoEffectDefinition is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Effects.VideoEffectDefinition");
      m_Factory     : Windows.Media.Effects.IVideoEffectDefinitionFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Effects.IVideoEffectDefinition := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVideoEffectDefinitionFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(activatableClassId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithProperties
   (
      activatableClassId : Windows.String
      ; props : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.Media.Effects.IVideoEffectDefinition is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Effects.VideoEffectDefinition");
      m_Factory     : Windows.Media.Effects.IVideoEffectDefinitionFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Effects.IVideoEffectDefinition := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVideoEffectDefinitionFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithProperties(activatableClassId, props, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      activatableClassId : Windows.String
   )
   return Windows.Media.Effects.IAudioEffectDefinition is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Effects.AudioEffectDefinition");
      m_Factory     : Windows.Media.Effects.IAudioEffectDefinitionFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Effects.IAudioEffectDefinition := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAudioEffectDefinitionFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(activatableClassId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithProperties
   (
      activatableClassId : Windows.String
      ; props : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.Media.Effects.IAudioEffectDefinition is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Effects.AudioEffectDefinition");
      m_Factory     : Windows.Media.Effects.IAudioEffectDefinitionFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Effects.IAudioEffectDefinition := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAudioEffectDefinitionFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithProperties(activatableClassId, props, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateVideoTransformEffectDefinition return Windows.Media.Effects.IVideoEffectDefinition is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Effects.VideoTransformEffectDefinition");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.Effects.IVideoEffectDefinition) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Effects.IID_IVideoEffectDefinition'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateSlowMotionEffectDefinition return Windows.Media.Effects.ISlowMotionEffectDefinition is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Effects.SlowMotionEffectDefinition");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.Effects.ISlowMotionEffectDefinition) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Effects.IID_ISlowMotionEffectDefinition'Access, RetVal'access);
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
   
   function CreateAudioRenderEffectsManager
   (
      deviceId : Windows.String
      ; category : Windows.Media.Render.AudioRenderCategory
   )
   return Windows.Media.Effects.IAudioRenderEffectsManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Effects.AudioEffectsManager");
      m_Factory     : IAudioEffectsManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Effects.IAudioRenderEffectsManager;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAudioEffectsManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateAudioRenderEffectsManager(deviceId, category, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateAudioRenderEffectsManagerWithMode
   (
      deviceId : Windows.String
      ; category : Windows.Media.Render.AudioRenderCategory
      ; mode : Windows.Media.AudioProcessing
   )
   return Windows.Media.Effects.IAudioRenderEffectsManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Effects.AudioEffectsManager");
      m_Factory     : IAudioEffectsManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Effects.IAudioRenderEffectsManager;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAudioEffectsManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateAudioRenderEffectsManagerWithMode(deviceId, category, mode, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateAudioCaptureEffectsManager
   (
      deviceId : Windows.String
      ; category : Windows.Media.Capture.MediaCategory
   )
   return Windows.Media.Effects.IAudioCaptureEffectsManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Effects.AudioEffectsManager");
      m_Factory     : IAudioEffectsManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Effects.IAudioCaptureEffectsManager;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAudioEffectsManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateAudioCaptureEffectsManager(deviceId, category, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateAudioCaptureEffectsManagerWithMode
   (
      deviceId : Windows.String
      ; category : Windows.Media.Capture.MediaCategory
      ; mode : Windows.Media.AudioProcessing
   )
   return Windows.Media.Effects.IAudioCaptureEffectsManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Effects.AudioEffectsManager");
      m_Factory     : IAudioEffectsManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Effects.IAudioCaptureEffectsManager;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAudioEffectsManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateAudioCaptureEffectsManagerWithMode(deviceId, category, mode, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
