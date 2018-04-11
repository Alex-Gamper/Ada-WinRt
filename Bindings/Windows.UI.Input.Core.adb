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
with Windows.ApplicationModel.Core;
with Windows.UI.Input;
with Windows.UI.Core;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.Input.Core is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function CreateForView
   (
      view : Windows.ApplicationModel.Core.ICoreApplicationView
   )
   return Windows.UI.Input.Core.IRadialControllerIndependentInputSource is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Input.Core.RadialControllerIndependentInputSource");
      m_Factory     : IRadialControllerIndependentInputSourceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Input.Core.IRadialControllerIndependentInputSource;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRadialControllerIndependentInputSourceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateForView(view, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
