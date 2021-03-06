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
limited with Windows.Storage;
--------------------------------------------------------------------------------
package Windows.Management.Core is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IApplicationDataManager_Interface;
   type IApplicationDataManager is access all IApplicationDataManager_Interface'Class;
   type IApplicationDataManager_Ptr is access all IApplicationDataManager;
   type IApplicationDataManagerStatics_Interface;
   type IApplicationDataManagerStatics is access all IApplicationDataManagerStatics_Interface'Class;
   type IApplicationDataManagerStatics_Ptr is access all IApplicationDataManagerStatics;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IApplicationDataManager : aliased constant Windows.IID := (1959855154, 11929, 16384, (154, 58, 100, 48, 126, 133, 129, 41 ));
   
   type IApplicationDataManager_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IApplicationDataManagerStatics : aliased constant Windows.IID := (504914659, 27022, 18849, (151, 82, 222, 233, 73, 37, 185, 179 ));
   
   type IApplicationDataManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateForPackageFamily
   (
      This       : access IApplicationDataManagerStatics_Interface
      ; packageFamilyName : Windows.String
      ; RetVal : access Windows.Storage.IApplicationData
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype ApplicationDataManager is Windows.Management.Core.IApplicationDataManager;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function CreateForPackageFamily
   (
      packageFamilyName : Windows.String
   )
   return Windows.Storage.IApplicationData;
   
end;
