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
with Windows.Foundation;
with Windows.Foundation.Collections;
limited with Windows.Storage.Streams;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.Wallet.System is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type WalletItemAppAssociation is (
      None,
      AppInstalled,
      AppNotInstalled
   );
   for WalletItemAppAssociation use (
      None => 0,
      AppInstalled => 1,
      AppNotInstalled => 2
   );
   for WalletItemAppAssociation'Size use 32;
   
   type WalletItemAppAssociation_Ptr is access WalletItemAppAssociation;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IWalletItemSystemStore2_add_ItemsChanged_Interface;
   type TypedEventHandler_IWalletItemSystemStore2_add_ItemsChanged is access all TypedEventHandler_IWalletItemSystemStore2_add_ItemsChanged_Interface'Class;
   type TypedEventHandler_IWalletItemSystemStore2_add_ItemsChanged_Ptr is access all TypedEventHandler_IWalletItemSystemStore2_add_ItemsChanged;
   type AsyncOperationCompletedHandler_IWalletItemSystemStore_Interface;
   type AsyncOperationCompletedHandler_IWalletItemSystemStore is access all AsyncOperationCompletedHandler_IWalletItemSystemStore_Interface'Class;
   type AsyncOperationCompletedHandler_IWalletItemSystemStore_Ptr is access all AsyncOperationCompletedHandler_IWalletItemSystemStore;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IWalletItemSystemStore_Interface;
   type IWalletItemSystemStore is access all IWalletItemSystemStore_Interface'Class;
   type IWalletItemSystemStore_Ptr is access all IWalletItemSystemStore;
   type IWalletItemSystemStore2_Interface;
   type IWalletItemSystemStore2 is access all IWalletItemSystemStore2_Interface'Class;
   type IWalletItemSystemStore2_Ptr is access all IWalletItemSystemStore2;
   type IWalletManagerSystemStatics_Interface;
   type IWalletManagerSystemStatics is access all IWalletManagerSystemStatics_Interface'Class;
   type IWalletManagerSystemStatics_Ptr is access all IWalletManagerSystemStatics;
   type IAsyncOperation_IWalletItemSystemStore_Interface;
   type IAsyncOperation_IWalletItemSystemStore is access all IAsyncOperation_IWalletItemSystemStore_Interface'Class;
   type IAsyncOperation_IWalletItemSystemStore_Ptr is access all IAsyncOperation_IWalletItemSystemStore;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IWalletItemSystemStore : aliased constant Windows.IID := (1378757631, 38562, 18967, (141, 25, 254, 29, 159, 131, 117, 97 ));
   
   type IWalletItemSystemStore_Interface is interface and Windows.IInspectable_Interface;
   
   function GetItemsAsync
   (
      This       : access IWalletItemSystemStore_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function DeleteAsync
   (
      This       : access IWalletItemSystemStore_Interface
      ; item : Windows.ApplicationModel.Wallet.IWalletItem
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ImportItemAsync
   (
      This       : access IWalletItemSystemStore_Interface
      ; stream : Windows.Storage.Streams.IRandomAccessStreamReference
      ; RetVal : access Windows.ApplicationModel.Wallet.IAsyncOperation_IWalletItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetAppStatusForItem
   (
      This       : access IWalletItemSystemStore_Interface
      ; item : Windows.ApplicationModel.Wallet.IWalletItem
      ; RetVal : access Windows.ApplicationModel.Wallet.System.WalletItemAppAssociation
   )
   return Windows.HRESULT is abstract;
   
   function LaunchAppForItemAsync
   (
      This       : access IWalletItemSystemStore_Interface
      ; item : Windows.ApplicationModel.Wallet.IWalletItem
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWalletItemSystemStore2 : aliased constant Windows.IID := (4186782286, 48640, 20445, (151, 52, 108, 17, 60, 26, 193, 203 ));
   
   type IWalletItemSystemStore2_Interface is interface and Windows.IInspectable_Interface;
   
   function add_ItemsChanged
   (
      This       : access IWalletItemSystemStore2_Interface
      ; handler : TypedEventHandler_IWalletItemSystemStore2_add_ItemsChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ItemsChanged
   (
      This       : access IWalletItemSystemStore2_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWalletManagerSystemStatics : aliased constant Windows.IID := (3202935689, 9780, 19354, (139, 35, 238, 137, 3, 201, 31, 224 ));
   
   type IWalletManagerSystemStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestStoreAsync
   (
      This       : access IWalletManagerSystemStatics_Interface
      ; RetVal : access Windows.ApplicationModel.Wallet.System.IAsyncOperation_IWalletItemSystemStore -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IWalletItemSystemStore : aliased constant Windows.IID := (1484545871, 31829, 24436, (178, 106, 248, 14, 59, 198, 212, 242 ));
   
   type IAsyncOperation_IWalletItemSystemStore_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IWalletItemSystemStore_Interface
      ; handler : Windows.ApplicationModel.Wallet.System.AsyncOperationCompletedHandler_IWalletItemSystemStore
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IWalletItemSystemStore_Interface
      ; RetVal : access Windows.ApplicationModel.Wallet.System.AsyncOperationCompletedHandler_IWalletItemSystemStore
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IWalletItemSystemStore_Interface
      ; RetVal : access Windows.ApplicationModel.Wallet.System.IWalletItemSystemStore
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWalletItemSystemStore2_add_ItemsChanged : aliased constant Windows.IID := (1013029187, 42610, 22510, (173, 50, 246, 217, 122, 111, 66, 23 ));
   
   type TypedEventHandler_IWalletItemSystemStore2_add_ItemsChanged_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Wallet.System.IWalletItemSystemStore ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWalletItemSystemStore2_add_ItemsChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWalletItemSystemStore2_add_ItemsChanged_Interface
      ; sender : Windows.ApplicationModel.Wallet.System.IWalletItemSystemStore
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IWalletItemSystemStore : aliased constant Windows.IID := (4269194630, 13680, 23894, (147, 46, 166, 251, 128, 147, 165, 87 ));
   
   type AsyncOperationCompletedHandler_IWalletItemSystemStore_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Wallet.System.IAsyncOperation_IWalletItemSystemStore ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IWalletItemSystemStore'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IWalletItemSystemStore_Interface
      ; asyncInfo : Windows.ApplicationModel.Wallet.System.IAsyncOperation_IWalletItemSystemStore
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype WalletItemSystemStore is Windows.ApplicationModel.Wallet.System.IWalletItemSystemStore;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function RequestStoreAsync
   return Windows.ApplicationModel.Wallet.System.IAsyncOperation_IWalletItemSystemStore;
   
end;
