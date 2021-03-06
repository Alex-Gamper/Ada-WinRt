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
package Windows.UI.Xaml.Interop is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type NotifyCollectionChangedAction is (
      Add,
      Remove,
      Replace,
      Move,
      Reset
   );
   for NotifyCollectionChangedAction use (
      Add => 0,
      Remove => 1,
      Replace => 2,
      Move => 3,
      Reset => 4
   );
   for NotifyCollectionChangedAction'Size use 32;
   
   type NotifyCollectionChangedAction_Ptr is access NotifyCollectionChangedAction;
   
   type TypeKind is (
      Primitive,
      Metadata,
      Custom
   );
   for TypeKind use (
      Primitive => 0,
      Metadata => 1,
      Custom => 2
   );
   for TypeKind'Size use 32;
   
   type TypeKind_Ptr is access TypeKind;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type TypeName is record
      Name : Windows.String;
      Kind : Windows.UI.Xaml.Interop.TypeKind;
   end record;
   pragma Convention (C_Pass_By_Copy , TypeName);
   
   type TypeName_Ptr is access TypeName;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type BindableVectorChangedEventHandler_Interface;
   type BindableVectorChangedEventHandler is access all BindableVectorChangedEventHandler_Interface'Class;
   type BindableVectorChangedEventHandler_Ptr is access all BindableVectorChangedEventHandler;
   type NotifyCollectionChangedEventHandler_Interface;
   type NotifyCollectionChangedEventHandler is access all NotifyCollectionChangedEventHandler_Interface'Class;
   type NotifyCollectionChangedEventHandler_Ptr is access all NotifyCollectionChangedEventHandler;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IBindableIterable_Interface;
   type IBindableIterable is access all IBindableIterable_Interface'Class;
   type IBindableIterable_Ptr is access all IBindableIterable;
   type IBindableIterator_Interface;
   type IBindableIterator is access all IBindableIterator_Interface'Class;
   type IBindableIterator_Ptr is access all IBindableIterator;
   type IBindableObservableVector_Interface;
   type IBindableObservableVector is access all IBindableObservableVector_Interface'Class;
   type IBindableObservableVector_Ptr is access all IBindableObservableVector;
   type IBindableVector_Interface;
   type IBindableVector is access all IBindableVector_Interface'Class;
   type IBindableVector_Ptr is access all IBindableVector;
   type IBindableVectorView_Interface;
   type IBindableVectorView is access all IBindableVectorView_Interface'Class;
   type IBindableVectorView_Ptr is access all IBindableVectorView;
   type INotifyCollectionChanged_Interface;
   type INotifyCollectionChanged is access all INotifyCollectionChanged_Interface'Class;
   type INotifyCollectionChanged_Ptr is access all INotifyCollectionChanged;
   type INotifyCollectionChangedEventArgs_Interface;
   type INotifyCollectionChangedEventArgs is access all INotifyCollectionChangedEventArgs_Interface'Class;
   type INotifyCollectionChangedEventArgs_Ptr is access all INotifyCollectionChangedEventArgs;
   type INotifyCollectionChangedEventArgsFactory_Interface;
   type INotifyCollectionChangedEventArgsFactory is access all INotifyCollectionChangedEventArgsFactory_Interface'Class;
   type INotifyCollectionChangedEventArgsFactory_Ptr is access all INotifyCollectionChangedEventArgsFactory;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IBindableIterable : aliased constant Windows.IID := (57486344, 57129, 16815, (138, 162, 215, 116, 190, 98, 186, 111 ));
   
   type IBindableIterable_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IBindableIterable_Interface
      ; RetVal : access Windows.UI.Xaml.Interop.IBindableIterator
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBindableIterator : aliased constant Windows.IID := (1780313095, 1901, 18930, (131, 20, 245, 44, 156, 154, 131, 49 ));
   
   type IBindableIterator_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IBindableIterator_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IBindableIterator_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IBindableIterator_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBindableObservableVector : aliased constant Windows.IID := (4263425334, 32383, 20368, (172, 154, 71, 73, 132, 170, 229, 18 ));
   
   type IBindableObservableVector_Interface is interface and Windows.IInspectable_Interface;
   
   function add_VectorChanged
   (
      This       : access IBindableObservableVector_Interface
      ; handler : Windows.UI.Xaml.Interop.BindableVectorChangedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_VectorChanged
   (
      This       : access IBindableObservableVector_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBindableVector : aliased constant Windows.IID := (960358366, 28624, 19469, (187, 113, 71, 36, 74, 17, 62, 147 ));
   
   type IBindableVector_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IBindableVector_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IBindableVector_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IBindableVector_Interface
      ; RetVal : access Windows.UI.Xaml.Interop.IBindableVectorView
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IBindableVector_Interface
      ; value : Windows.Object
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IBindableVector_Interface
      ; index : Windows.UInt32
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IBindableVector_Interface
      ; index : Windows.UInt32
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IBindableVector_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IBindableVector_Interface
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IBindableVector_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IBindableVector_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBindableVectorView : aliased constant Windows.IID := (879613671, 38766, 19395, (129, 93, 236, 226, 67, 188, 15, 51 ));
   
   type IBindableVectorView_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IBindableVectorView_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IBindableVectorView_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IBindableVectorView_Interface
      ; value : Windows.Object
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INotifyCollectionChanged : aliased constant Windows.IID := (682715093, 6705, 18011, (155, 37, 213, 195, 174, 104, 108, 64 ));
   
   type INotifyCollectionChanged_Interface is interface and Windows.IInspectable_Interface;
   
   function add_CollectionChanged
   (
      This       : access INotifyCollectionChanged_Interface
      ; handler : Windows.UI.Xaml.Interop.NotifyCollectionChangedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CollectionChanged
   (
      This       : access INotifyCollectionChanged_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INotifyCollectionChangedEventArgs : aliased constant Windows.IID := (1291226419, 58354, 18788, (184, 94, 148, 91, 79, 126, 47, 33 ));
   
   type INotifyCollectionChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Action
   (
      This       : access INotifyCollectionChangedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Interop.NotifyCollectionChangedAction
   )
   return Windows.HRESULT is abstract;
   
   function get_NewItems
   (
      This       : access INotifyCollectionChangedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Interop.IBindableVector
   )
   return Windows.HRESULT is abstract;
   
   function get_OldItems
   (
      This       : access INotifyCollectionChangedEventArgs_Interface
      ; RetVal : access Windows.UI.Xaml.Interop.IBindableVector
   )
   return Windows.HRESULT is abstract;
   
   function get_NewStartingIndex
   (
      This       : access INotifyCollectionChangedEventArgs_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_OldStartingIndex
   (
      This       : access INotifyCollectionChangedEventArgs_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INotifyCollectionChangedEventArgsFactory : aliased constant Windows.IID := (3003924026, 57229, 17573, (154, 56, 122, 192, 208, 140, 230, 61 ));
   
   type INotifyCollectionChangedEventArgsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceWithAllParameters
   (
      This       : access INotifyCollectionChangedEventArgsFactory_Interface
      ; action : Windows.UI.Xaml.Interop.NotifyCollectionChangedAction
      ; newItems : Windows.UI.Xaml.Interop.IBindableVector
      ; oldItems : Windows.UI.Xaml.Interop.IBindableVector
      ; newIndex : Windows.Int32
      ; oldIndex : Windows.Int32
      ; baseInterface : Windows.Object
      ; innerInterface : access Windows.Object
      ; RetVal : access Windows.UI.Xaml.Interop.INotifyCollectionChangedEventArgs
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_BindableVectorChangedEventHandler : aliased constant Windows.IID := (1649202401, 53255, 17329, (156, 3, 175, 77, 62, 98, 88, 196 ));
   
   type BindableVectorChangedEventHandler_Interface(Callback : access procedure (vector : Windows.UI.Xaml.Interop.IBindableObservableVector ; e : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_BindableVectorChangedEventHandler'access) with null record;
   function Invoke
   (
      This       : access BindableVectorChangedEventHandler_Interface
      ; vector : Windows.UI.Xaml.Interop.IBindableObservableVector
      ; e : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_NotifyCollectionChangedEventHandler : aliased constant Windows.IID := (3390092156, 62338, 17809, (133, 87, 94, 36, 150, 82, 121, 176 ));
   
   type NotifyCollectionChangedEventHandler_Interface(Callback : access procedure (sender : Windows.Object ; e : Windows.UI.Xaml.Interop.INotifyCollectionChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_NotifyCollectionChangedEventHandler'access) with null record;
   function Invoke
   (
      This       : access NotifyCollectionChangedEventHandler_Interface
      ; sender : Windows.Object
      ; e : Windows.UI.Xaml.Interop.INotifyCollectionChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype NotifyCollectionChangedEventArgs is Windows.UI.Xaml.Interop.INotifyCollectionChangedEventArgs;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function CreateInstanceWithAllParameters
   (
      action : Windows.UI.Xaml.Interop.NotifyCollectionChangedAction
      ; newItems : Windows.UI.Xaml.Interop.IBindableVector
      ; oldItems : Windows.UI.Xaml.Interop.IBindableVector
      ; newIndex : Windows.Int32
      ; oldIndex : Windows.Int32
      ; baseInterface : Windows.Object
      ; innerInterface : access Windows.Object
   )
   return Windows.UI.Xaml.Interop.INotifyCollectionChangedEventArgs;
   
end;
