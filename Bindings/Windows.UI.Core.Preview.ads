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
with Windows.Foundation;
limited with Windows.UI.WindowManagement;
--------------------------------------------------------------------------------
package Windows.UI.Core.Preview is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type EventHandler_ISystemNavigationCloseRequestedPreviewEventArgs_Interface;
   type EventHandler_ISystemNavigationCloseRequestedPreviewEventArgs is access all EventHandler_ISystemNavigationCloseRequestedPreviewEventArgs_Interface'Class;
   type EventHandler_ISystemNavigationCloseRequestedPreviewEventArgs_Ptr is access all EventHandler_ISystemNavigationCloseRequestedPreviewEventArgs;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ICoreAppWindowPreview_Interface;
   type ICoreAppWindowPreview is access all ICoreAppWindowPreview_Interface'Class;
   type ICoreAppWindowPreview_Ptr is access all ICoreAppWindowPreview;
   type ICoreAppWindowPreviewStatics_Interface;
   type ICoreAppWindowPreviewStatics is access all ICoreAppWindowPreviewStatics_Interface'Class;
   type ICoreAppWindowPreviewStatics_Ptr is access all ICoreAppWindowPreviewStatics;
   type ISystemNavigationCloseRequestedPreviewEventArgs_Interface;
   type ISystemNavigationCloseRequestedPreviewEventArgs is access all ISystemNavigationCloseRequestedPreviewEventArgs_Interface'Class;
   type ISystemNavigationCloseRequestedPreviewEventArgs_Ptr is access all ISystemNavigationCloseRequestedPreviewEventArgs;
   type ISystemNavigationManagerPreview_Interface;
   type ISystemNavigationManagerPreview is access all ISystemNavigationManagerPreview_Interface'Class;
   type ISystemNavigationManagerPreview_Ptr is access all ISystemNavigationManagerPreview;
   type ISystemNavigationManagerPreviewStatics_Interface;
   type ISystemNavigationManagerPreviewStatics is access all ISystemNavigationManagerPreviewStatics_Interface'Class;
   type ISystemNavigationManagerPreviewStatics_Ptr is access all ISystemNavigationManagerPreviewStatics;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ICoreAppWindowPreview : aliased constant Windows.IID := (2767644261, 13918, 24542, (135, 165, 149, 67, 195, 161, 90, 168 ));
   
   type ICoreAppWindowPreview_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ICoreAppWindowPreviewStatics : aliased constant Windows.IID := (866918846, 16955, 23990, (138, 142, 77, 200, 115, 83, 183, 91 ));
   
   type ICoreAppWindowPreviewStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetIdFromWindow
   (
      This       : access ICoreAppWindowPreviewStatics_Interface
      ; window : Windows.UI.WindowManagement.IAppWindow
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISystemNavigationCloseRequestedPreviewEventArgs : aliased constant Windows.IID := (2211450337, 52197, 20273, (132, 20, 54, 29, 160, 70, 81, 143 ));
   
   type ISystemNavigationCloseRequestedPreviewEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Handled
   (
      This       : access ISystemNavigationCloseRequestedPreviewEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access ISystemNavigationCloseRequestedPreviewEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access ISystemNavigationCloseRequestedPreviewEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISystemNavigationManagerPreview : aliased constant Windows.IID := (3965650056, 25637, 18295, (165, 54, 203, 86, 52, 66, 127, 13 ));
   
   type ISystemNavigationManagerPreview_Interface is interface and Windows.IInspectable_Interface;
   
   function add_CloseRequested
   (
      This       : access ISystemNavigationManagerPreview_Interface
      ; handler : Windows.UI.Core.Preview.EventHandler_ISystemNavigationCloseRequestedPreviewEventArgs
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CloseRequested
   (
      This       : access ISystemNavigationManagerPreview_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISystemNavigationManagerPreviewStatics : aliased constant Windows.IID := (244781920, 57204, 19406, (132, 203, 189, 17, 129, 172, 10, 113 ));
   
   type ISystemNavigationManagerPreviewStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access ISystemNavigationManagerPreviewStatics_Interface
      ; RetVal : access Windows.UI.Core.Preview.ISystemNavigationManagerPreview
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_EventHandler_ISystemNavigationCloseRequestedPreviewEventArgs : aliased constant Windows.IID := (29139011, 19721, 23012, (177, 179, 162, 206, 36, 98, 158, 65 ));
   
   type EventHandler_ISystemNavigationCloseRequestedPreviewEventArgs_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.UI.Core.Preview.ISystemNavigationCloseRequestedPreviewEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_EventHandler_ISystemNavigationCloseRequestedPreviewEventArgs'access) with null record;
   function Invoke
   (
      This       : access EventHandler_ISystemNavigationCloseRequestedPreviewEventArgs_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Core.Preview.ISystemNavigationCloseRequestedPreviewEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype CoreAppWindowPreview is Windows.UI.Core.Preview.ICoreAppWindowPreview;
   subtype SystemNavigationCloseRequestedPreviewEventArgs is Windows.UI.Core.Preview.ISystemNavigationCloseRequestedPreviewEventArgs;
   subtype SystemNavigationManagerPreview is Windows.UI.Core.Preview.ISystemNavigationManagerPreview;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetIdFromWindow
   (
      window : Windows.UI.WindowManagement.IAppWindow
   )
   return Windows.Int32;
   
   function GetForCurrentView
   return Windows.UI.Core.Preview.ISystemNavigationManagerPreview;
   
end;
