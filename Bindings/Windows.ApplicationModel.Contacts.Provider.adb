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
with Windows.ApplicationModel.Contacts;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.ApplicationModel.Contacts.Provider is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function Invoke
   (
      This       : access TypedEventHandler_IContactPickerUI_add_ContactRemoved_Interface
      ; sender : Windows.ApplicationModel.Contacts.Provider.IContactPickerUI
      ; args : Windows.ApplicationModel.Contacts.Provider.IContactRemovedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Contacts.Provider.IContactPickerUI(sender), Windows.ApplicationModel.Contacts.Provider.IContactRemovedEventArgs(args));
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
