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
with Windows.Devices.Lights;
with Windows.Graphics.Imaging;
with Windows.UI;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Devices.Lights.Effects is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_ILampArrayBitmapEffect_add_BitmapRequested_Interface
      ; sender : Windows.Devices.Lights.Effects.ILampArrayBitmapEffect
      ; args : Windows.Devices.Lights.Effects.ILampArrayBitmapRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Lights.Effects.ILampArrayBitmapEffect(sender), Windows.Devices.Lights.Effects.ILampArrayBitmapRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ILampArrayCustomEffect_add_UpdateRequested_Interface
      ; sender : Windows.Devices.Lights.Effects.ILampArrayCustomEffect
      ; args : Windows.Devices.Lights.Effects.ILampArrayUpdateRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Lights.Effects.ILampArrayCustomEffect(sender), Windows.Devices.Lights.Effects.ILampArrayUpdateRequestedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function CreateInstance
   (
      lampArray : Windows.Devices.Lights.ILampArray
      ; lampIndexes : Windows.Int32_Ptr
   )
   return Windows.Devices.Lights.Effects.ILampArrayBitmapEffect is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Lights.Effects.LampArrayBitmapEffect");
      m_Factory     : Windows.Devices.Lights.Effects.ILampArrayBitmapEffectFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Lights.Effects.ILampArrayBitmapEffect := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILampArrayBitmapEffectFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(lampArray, lampIndexes, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      lampArray : Windows.Devices.Lights.ILampArray
      ; lampIndexes : Windows.Int32_Ptr
   )
   return Windows.Devices.Lights.Effects.ILampArrayBlinkEffect is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Lights.Effects.LampArrayBlinkEffect");
      m_Factory     : Windows.Devices.Lights.Effects.ILampArrayBlinkEffectFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Lights.Effects.ILampArrayBlinkEffect := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILampArrayBlinkEffectFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(lampArray, lampIndexes, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      lampArray : Windows.Devices.Lights.ILampArray
      ; lampIndexes : Windows.Int32_Ptr
   )
   return Windows.Devices.Lights.Effects.ILampArrayColorRampEffect is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Lights.Effects.LampArrayColorRampEffect");
      m_Factory     : Windows.Devices.Lights.Effects.ILampArrayColorRampEffectFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Lights.Effects.ILampArrayColorRampEffect := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILampArrayColorRampEffectFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(lampArray, lampIndexes, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateInstance
   (
      lampArray : Windows.Devices.Lights.ILampArray
      ; lampIndexes : Windows.Int32_Ptr
   )
   return Windows.Devices.Lights.Effects.ILampArrayCustomEffect is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Lights.Effects.LampArrayCustomEffect");
      m_Factory     : Windows.Devices.Lights.Effects.ILampArrayCustomEffectFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Lights.Effects.ILampArrayCustomEffect := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILampArrayCustomEffectFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(lampArray, lampIndexes, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create return Windows.Devices.Lights.Effects.ILampArrayEffectPlaylist is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Lights.Effects.LampArrayEffectPlaylist");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.Lights.Effects.ILampArrayEffectPlaylist) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Lights.Effects.IID_ILampArrayEffectPlaylist'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateInstance
   (
      lampArray : Windows.Devices.Lights.ILampArray
      ; lampIndexes : Windows.Int32_Ptr
   )
   return Windows.Devices.Lights.Effects.ILampArraySolidEffect is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Lights.Effects.LampArraySolidEffect");
      m_Factory     : Windows.Devices.Lights.Effects.ILampArraySolidEffectFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Lights.Effects.ILampArraySolidEffect := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILampArraySolidEffectFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(lampArray, lampIndexes, RetVal'Access);
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
   
   procedure PauseAll
   (
      value : Windows.Devices.Lights.Effects.IIterable_ILampArrayEffectPlaylist
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Lights.Effects.LampArrayEffectPlaylist");
      m_Factory     : ILampArrayEffectPlaylistStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILampArrayEffectPlaylistStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.PauseAll(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure StartAll
   (
      value : Windows.Devices.Lights.Effects.IIterable_ILampArrayEffectPlaylist
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Lights.Effects.LampArrayEffectPlaylist");
      m_Factory     : ILampArrayEffectPlaylistStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILampArrayEffectPlaylistStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.StartAll(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure StopAll
   (
      value : Windows.Devices.Lights.Effects.IIterable_ILampArrayEffectPlaylist
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Lights.Effects.LampArrayEffectPlaylist");
      m_Factory     : ILampArrayEffectPlaylistStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILampArrayEffectPlaylistStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.StopAll(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
end;