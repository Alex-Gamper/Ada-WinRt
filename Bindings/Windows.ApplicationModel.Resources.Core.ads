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
with Windows.Foundation.Collections;
limited with Windows.Storage;
with Windows.Foundation;
limited with Windows.Storage.Streams;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.Resources.Core is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type ResourceQualifierPersistence is (
      None,
      LocalMachine
   );
   for ResourceQualifierPersistence use (
      None => 0,
      LocalMachine => 1
   );
   for ResourceQualifierPersistence'Size use 32;
   
   type ResourceQualifierPersistence_Ptr is access ResourceQualifierPersistence;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type ResourceLayoutInfo is record
      MajorVersion : Windows.UInt32;
      MinorVersion : Windows.UInt32;
      ResourceSubtreeCount : Windows.UInt32;
      NamedResourceCount : Windows.UInt32;
      Checksum : Windows.Int32;
   end record;
   pragma Convention (C_Pass_By_Copy , ResourceLayoutInfo);
   
   type ResourceLayoutInfo_Ptr is access ResourceLayoutInfo;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IResourceManager_Interface;
   type IResourceManager is access all IResourceManager_Interface'Class;
   type IResourceManager_Ptr is access all IResourceManager;
   type IMapView_String_NamedResource_Interface;
   type IMapView_String_NamedResource is access all IMapView_String_NamedResource_Interface'Class;
   type IMapView_String_NamedResource_Ptr is access all IMapView_String_NamedResource;
   type IIterable_NamedResource_Interface;
   type IIterable_NamedResource is access all IIterable_NamedResource_Interface'Class;
   type IIterable_NamedResource_Ptr is access all IIterable_NamedResource;
   type IResourceManager2_Interface;
   type IResourceManager2 is access all IResourceManager2_Interface'Class;
   type IResourceManager2_Ptr is access all IResourceManager2;
   type IResourceManagerStatics_Interface;
   type IResourceManagerStatics is access all IResourceManagerStatics_Interface'Class;
   type IResourceManagerStatics_Ptr is access all IResourceManagerStatics;
   type IResourceQualifier_Interface;
   type IResourceQualifier is access all IResourceQualifier_Interface'Class;
   type IResourceQualifier_Ptr is access all IResourceQualifier;
   type IResourceContext_Interface;
   type IResourceContext is access all IResourceContext_Interface'Class;
   type IResourceContext_Ptr is access all IResourceContext;
   type IResourceContextStatics_Interface;
   type IResourceContextStatics is access all IResourceContextStatics_Interface'Class;
   type IResourceContextStatics_Ptr is access all IResourceContextStatics;
   type IResourceContextStatics2_Interface;
   type IResourceContextStatics2 is access all IResourceContextStatics2_Interface'Class;
   type IResourceContextStatics2_Ptr is access all IResourceContextStatics2;
   type IResourceContextStatics3_Interface;
   type IResourceContextStatics3 is access all IResourceContextStatics3_Interface'Class;
   type IResourceContextStatics3_Ptr is access all IResourceContextStatics3;
   type IResourceCandidate_Interface;
   type IResourceCandidate is access all IResourceCandidate_Interface'Class;
   type IResourceCandidate_Ptr is access all IResourceCandidate;
   type IResourceCandidate2_Interface;
   type IResourceCandidate2 is access all IResourceCandidate2_Interface'Class;
   type IResourceCandidate2_Ptr is access all IResourceCandidate2;
   type INamedResource_Interface;
   type INamedResource is access all INamedResource_Interface'Class;
   type INamedResource_Ptr is access all INamedResource;
   type IResourceMap_Interface;
   type IResourceMap is access all IResourceMap_Interface'Class;
   type IResourceMap_Ptr is access all IResourceMap;
   type IIterator_NamedResource_Interface;
   type IIterator_NamedResource is access all IIterator_NamedResource_Interface'Class;
   type IIterator_NamedResource_Ptr is access all IIterator_NamedResource;
   type IMapView_String_ResourceMap_Interface;
   type IMapView_String_ResourceMap is access all IMapView_String_ResourceMap_Interface'Class;
   type IMapView_String_ResourceMap_Ptr is access all IMapView_String_ResourceMap;
   type IIterable_ResourceMap_Interface;
   type IIterable_ResourceMap is access all IIterable_ResourceMap_Interface'Class;
   type IIterable_ResourceMap_Ptr is access all IIterable_ResourceMap;
   type IIterator_ResourceMap_Interface;
   type IIterator_ResourceMap is access all IIterator_ResourceMap_Interface'Class;
   type IIterator_ResourceMap_Ptr is access all IIterator_ResourceMap;
   type IObservableMap_String_String_Interface;
   type IObservableMap_String_String is access all IObservableMap_String_String_Interface'Class;
   type IObservableMap_String_String_Ptr is access all IObservableMap_String_String;
   type IMap_String_String_Interface;
   type IMap_String_String is access all IMap_String_String_Interface'Class;
   type IMap_String_String_Ptr is access all IMap_String_String;
   type IIterable_IKeyValuePair_Interface;
   type IIterable_IKeyValuePair is access all IIterable_IKeyValuePair_Interface'Class;
   type IIterable_IKeyValuePair_Ptr is access all IIterable_IKeyValuePair;
   type IMapView_String_String_Interface;
   type IMapView_String_String is access all IMapView_String_String_Interface'Class;
   type IMapView_String_String_Ptr is access all IMapView_String_String;
   type IVectorView_ResourceQualifier_Interface;
   type IVectorView_ResourceQualifier is access all IVectorView_ResourceQualifier_Interface'Class;
   type IVectorView_ResourceQualifier_Ptr is access all IVectorView_ResourceQualifier;
   type IIterable_ResourceQualifier_Interface;
   type IIterable_ResourceQualifier is access all IIterable_ResourceQualifier_Interface'Class;
   type IIterable_ResourceQualifier_Ptr is access all IIterable_ResourceQualifier;
   type IVectorView_ResourceCandidate_Interface;
   type IVectorView_ResourceCandidate is access all IVectorView_ResourceCandidate_Interface'Class;
   type IVectorView_ResourceCandidate_Ptr is access all IVectorView_ResourceCandidate;
   type IIterable_ResourceCandidate_Interface;
   type IIterable_ResourceCandidate is access all IIterable_ResourceCandidate_Interface'Class;
   type IIterable_ResourceCandidate_Ptr is access all IIterable_ResourceCandidate;
   type IVectorView_String_Interface;
   type IVectorView_String is access all IVectorView_String_Interface'Class;
   type IVectorView_String_Ptr is access all IVectorView_String;
   type IIterable_String_Interface;
   type IIterable_String is access all IIterable_String_Interface'Class;
   type IIterable_String_Ptr is access all IIterable_String;
   type IIterator_INamedResource_Interface;
   type IIterator_INamedResource is access all IIterator_INamedResource_Interface'Class;
   type IIterator_INamedResource_Ptr is access all IIterator_INamedResource;
   type IIterable_INamedResource_Interface;
   type IIterable_INamedResource is access all IIterable_INamedResource_Interface'Class;
   type IIterable_INamedResource_Ptr is access all IIterable_INamedResource;
   type IVectorView_INamedResource_Interface;
   type IVectorView_INamedResource is access all IVectorView_INamedResource_Interface'Class;
   type IVectorView_INamedResource_Ptr is access all IVectorView_INamedResource;
   type IIterator_IResourceMap_Interface;
   type IIterator_IResourceMap is access all IIterator_IResourceMap_Interface'Class;
   type IIterator_IResourceMap_Ptr is access all IIterator_IResourceMap;
   type IIterable_IResourceMap_Interface;
   type IIterable_IResourceMap is access all IIterable_IResourceMap_Interface'Class;
   type IIterable_IResourceMap_Ptr is access all IIterable_IResourceMap;
   type IVectorView_IResourceMap_Interface;
   type IVectorView_IResourceMap is access all IVectorView_IResourceMap_Interface'Class;
   type IVectorView_IResourceMap_Ptr is access all IVectorView_IResourceMap;
   type IIterator_IResourceQualifier_Interface;
   type IIterator_IResourceQualifier is access all IIterator_IResourceQualifier_Interface'Class;
   type IIterator_IResourceQualifier_Ptr is access all IIterator_IResourceQualifier;
   type IIterable_IResourceQualifier_Interface;
   type IIterable_IResourceQualifier is access all IIterable_IResourceQualifier_Interface'Class;
   type IIterable_IResourceQualifier_Ptr is access all IIterable_IResourceQualifier;
   type IVectorView_IResourceQualifier_Interface;
   type IVectorView_IResourceQualifier is access all IVectorView_IResourceQualifier_Interface'Class;
   type IVectorView_IResourceQualifier_Ptr is access all IVectorView_IResourceQualifier;
   type IIterator_IResourceCandidate_Interface;
   type IIterator_IResourceCandidate is access all IIterator_IResourceCandidate_Interface'Class;
   type IIterator_IResourceCandidate_Ptr is access all IIterator_IResourceCandidate;
   type IIterable_IResourceCandidate_Interface;
   type IIterable_IResourceCandidate is access all IIterable_IResourceCandidate_Interface'Class;
   type IIterable_IResourceCandidate_Ptr is access all IIterable_IResourceCandidate;
   type IVectorView_IResourceCandidate_Interface;
   type IVectorView_IResourceCandidate is access all IVectorView_IResourceCandidate_Interface'Class;
   type IVectorView_IResourceCandidate_Ptr is access all IVectorView_IResourceCandidate;
   
   ------------------------------------------------------------------------
   -- generic packages/types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- generic instantiations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type IResourceManager_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MainResourceMap
   (
      This       : access IResourceManager_Interface
      ; RetVal : access Windows.ApplicationModel.Resources.Core.IResourceMap
   )
   return Windows.HRESULT is abstract;
   
   function get_AllResourceMaps
   (
      This       : access IResourceManager_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_DefaultContext
   (
      This       : access IResourceManager_Interface
      ; RetVal : access Windows.ApplicationModel.Resources.Core.IResourceContext
   )
   return Windows.HRESULT is abstract;
   
   function LoadPriFiles
   (
      This       : access IResourceManager_Interface
      ; files : Windows.Storage.IIterable_IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   function UnloadPriFiles
   (
      This       : access IResourceManager_Interface
      ; files : Windows.Storage.IIterable_IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   IID_IResourceManager : aliased constant Windows.IID := (4148484475, 39304, 17659, (171, 214, 83, 120, 132, 76, 250, 139 ));
   
   ------------------------------------------------------------------------
   type IMapView_String_NamedResource_Interface is interface and Windows.IInspectable_Interface;
   
   function Lookup
   (
      This       : access IMapView_String_NamedResource_Interface
      ; key : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IMapView_String_NamedResource_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function HasKey
   (
      This       : access IMapView_String_NamedResource_Interface
      ; key : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Split
   (
      This       : access IMapView_String_NamedResource_Interface
      ; first : access Windows.ApplicationModel.Resources.Core.INamedResource
      ; second : access Windows.ApplicationModel.Resources.Core.INamedResource
   )
   return Windows.HRESULT is abstract;
   
   IID_IMapView_String_NamedResource : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   ------------------------------------------------------------------------
   type IIterable_NamedResource_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_NamedResource_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_NamedResource : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   ------------------------------------------------------------------------
   type IResourceManager2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAllNamedResourcesForPackage
   (
      This       : access IResourceManager2_Interface
      ; packageName : Windows.String
      ; resourceLayoutInfo : Windows.ApplicationModel.Resources.Core.ResourceLayoutInfo
      ; RetVal : access Windows.ApplicationModel.Resources.Core.IVectorView_INamedResource -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetAllSubtreesForPackage
   (
      This       : access IResourceManager2_Interface
      ; packageName : Windows.String
      ; resourceLayoutInfo : Windows.ApplicationModel.Resources.Core.ResourceLayoutInfo
      ; RetVal : access Windows.ApplicationModel.Resources.Core.IVectorView_IResourceMap -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IResourceManager2 : aliased constant Windows.IID := (2640772716, 42199, 19491, (158, 133, 103, 95, 48, 76, 37, 45 ));
   
   ------------------------------------------------------------------------
   type IResourceManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IResourceManagerStatics_Interface
      ; RetVal : access Windows.ApplicationModel.Resources.Core.IResourceManager
   )
   return Windows.HRESULT is abstract;
   
   function IsResourceReference
   (
      This       : access IResourceManagerStatics_Interface
      ; resourceReference : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IResourceManagerStatics : aliased constant Windows.IID := (482409980, 27118, 20035, (153, 1, 71, 241, 38, 135, 186, 247 ));
   
   ------------------------------------------------------------------------
   type IResourceQualifier_Interface is interface and Windows.IInspectable_Interface;
   
   function get_QualifierName
   (
      This       : access IResourceQualifier_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_QualifierValue
   (
      This       : access IResourceQualifier_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDefault
   (
      This       : access IResourceQualifier_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsMatch
   (
      This       : access IResourceQualifier_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Score
   (
      This       : access IResourceQualifier_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IResourceQualifier : aliased constant Windows.IID := (2019403186, 19197, 17270, (168, 136, 197, 249, 166, 183, 160, 92 ));
   
   ------------------------------------------------------------------------
   type IResourceContext_Interface is interface and Windows.IInspectable_Interface;
   
   function get_QualifierValues
   (
      This       : access IResourceContext_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function Reset
   (
      This       : access IResourceContext_Interface
   )
   return Windows.HRESULT is abstract;
   
   function ResetQualifierValues
   (
      This       : access IResourceContext_Interface
      ; qualifierNames : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.HRESULT is abstract;
   
   function OverrideToMatch
   (
      This       : access IResourceContext_Interface
      ; result : Windows.ApplicationModel.Resources.Core.IIterable_IResourceQualifier
   )
   return Windows.HRESULT is abstract;
   
   function Clone
   (
      This       : access IResourceContext_Interface
      ; RetVal : access Windows.ApplicationModel.Resources.Core.IResourceContext
   )
   return Windows.HRESULT is abstract;
   
   function get_Languages
   (
      This       : access IResourceContext_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Languages
   (
      This       : access IResourceContext_Interface
      ; languages : Windows.Foundation.Collections.IVectorView_String
   )
   return Windows.HRESULT is abstract;
   
   IID_IResourceContext : aliased constant Windows.IID := (799158091, 28798, 19239, (173, 13, 208, 216, 205, 70, 143, 210 ));
   
   ------------------------------------------------------------------------
   type IResourceContextStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateMatchingContext
   (
      This       : access IResourceContextStatics_Interface
      ; result : Windows.ApplicationModel.Resources.Core.IIterable_IResourceQualifier
      ; RetVal : access Windows.ApplicationModel.Resources.Core.IResourceContext
   )
   return Windows.HRESULT is abstract;
   
   IID_IResourceContextStatics : aliased constant Windows.IID := (2562628972, 25400, 19249, (153, 223, 178, 180, 66, 241, 113, 73 ));
   
   ------------------------------------------------------------------------
   type IResourceContextStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access IResourceContextStatics2_Interface
      ; RetVal : access Windows.ApplicationModel.Resources.Core.IResourceContext
   )
   return Windows.HRESULT is abstract;
   
   function SetGlobalQualifierValue
   (
      This       : access IResourceContextStatics2_Interface
      ; key : Windows.String
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ResetGlobalQualifierValues
   (
      This       : access IResourceContextStatics2_Interface
   )
   return Windows.HRESULT is abstract;
   
   function ResetGlobalQualifierValuesForSpecifiedQualifiers
   (
      This       : access IResourceContextStatics2_Interface
      ; qualifierNames : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.HRESULT is abstract;
   
   function GetForViewIndependentUse
   (
      This       : access IResourceContextStatics2_Interface
      ; RetVal : access Windows.ApplicationModel.Resources.Core.IResourceContext
   )
   return Windows.HRESULT is abstract;
   
   IID_IResourceContextStatics2 : aliased constant Windows.IID := (1106727663, 4783, 16825, (171, 54, 177, 235, 75, 81, 36, 96 ));
   
   ------------------------------------------------------------------------
   type IResourceContextStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function SetGlobalQualifierValueWithPersistence
   (
      This       : access IResourceContextStatics3_Interface
      ; key : Windows.String
      ; value : Windows.String
      ; persistence : Windows.ApplicationModel.Resources.Core.ResourceQualifierPersistence
   )
   return Windows.HRESULT is abstract;
   
   IID_IResourceContextStatics3 : aliased constant Windows.IID := (550455596, 44815, 17675, (157, 166, 16, 109, 208, 194, 154, 57 ));
   
   ------------------------------------------------------------------------
   type IResourceCandidate_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Qualifiers
   (
      This       : access IResourceCandidate_Interface
      ; RetVal : access Windows.ApplicationModel.Resources.Core.IVectorView_IResourceQualifier -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_IsMatch
   (
      This       : access IResourceCandidate_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsMatchAsDefault
   (
      This       : access IResourceCandidate_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDefault
   (
      This       : access IResourceCandidate_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ValueAsString
   (
      This       : access IResourceCandidate_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetValueAsFileAsync
   (
      This       : access IResourceCandidate_Interface
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetQualifierValue
   (
      This       : access IResourceCandidate_Interface
      ; qualifierName : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IResourceCandidate : aliased constant Windows.IID := (2941388761, 50227, 18276, (179, 253, 143, 166, 191, 188, 186, 220 ));
   
   ------------------------------------------------------------------------
   type IResourceCandidate2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetValueAsStreamAsync
   (
      This       : access IResourceCandidate2_Interface
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStream -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IResourceCandidate2 : aliased constant Windows.IID := (1776661608, 63228, 16403, (170, 162, 213, 63, 23, 87, 211, 181 ));
   
   ------------------------------------------------------------------------
   type INamedResource_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Uri
   (
      This       : access INamedResource_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Candidates
   (
      This       : access INamedResource_Interface
      ; RetVal : access Windows.ApplicationModel.Resources.Core.IVectorView_IResourceCandidate -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function Resolve
   (
      This       : access INamedResource_Interface
      ; RetVal : access Windows.ApplicationModel.Resources.Core.IResourceCandidate
   )
   return Windows.HRESULT is abstract;
   
   function ResolveForContext
   (
      This       : access INamedResource_Interface
      ; resourceContext : Windows.ApplicationModel.Resources.Core.IResourceContext
      ; RetVal : access Windows.ApplicationModel.Resources.Core.IResourceCandidate
   )
   return Windows.HRESULT is abstract;
   
   function ResolveAll
   (
      This       : access INamedResource_Interface
      ; RetVal : access Windows.ApplicationModel.Resources.Core.IVectorView_IResourceCandidate -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ResolveAllForContext
   (
      This       : access INamedResource_Interface
      ; resourceContext : Windows.ApplicationModel.Resources.Core.IResourceContext
      ; RetVal : access Windows.ApplicationModel.Resources.Core.IVectorView_IResourceCandidate -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_INamedResource : aliased constant Windows.IID := (479773209, 2835, 16960, (137, 165, 212, 149, 220, 24, 154, 0 ));
   
   ------------------------------------------------------------------------
   type IResourceMap_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Uri
   (
      This       : access IResourceMap_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function GetValue
   (
      This       : access IResourceMap_Interface
      ; resource : Windows.String
      ; RetVal : access Windows.ApplicationModel.Resources.Core.IResourceCandidate
   )
   return Windows.HRESULT is abstract;
   
   function GetValueForContext
   (
      This       : access IResourceMap_Interface
      ; resource : Windows.String
      ; context : Windows.ApplicationModel.Resources.Core.IResourceContext
      ; RetVal : access Windows.ApplicationModel.Resources.Core.IResourceCandidate
   )
   return Windows.HRESULT is abstract;
   
   function GetSubtree
   (
      This       : access IResourceMap_Interface
      ; reference : Windows.String
      ; RetVal : access Windows.ApplicationModel.Resources.Core.IResourceMap
   )
   return Windows.HRESULT is abstract;
   
   IID_IResourceMap : aliased constant Windows.IID := (1915242532, 56204, 17144, (176, 140, 83, 255, 53, 125, 173, 130 ));
   
   ------------------------------------------------------------------------
   type IIterator_NamedResource_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_NamedResource_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_NamedResource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_NamedResource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_NamedResource_Interface
      ; items : Windows.Address
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_NamedResource : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   ------------------------------------------------------------------------
   type IMapView_String_ResourceMap_Interface is interface and Windows.IInspectable_Interface;
   
   function Lookup
   (
      This       : access IMapView_String_ResourceMap_Interface
      ; key : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IMapView_String_ResourceMap_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function HasKey
   (
      This       : access IMapView_String_ResourceMap_Interface
      ; key : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Split
   (
      This       : access IMapView_String_ResourceMap_Interface
      ; first : access Windows.ApplicationModel.Resources.Core.IResourceMap
      ; second : access Windows.ApplicationModel.Resources.Core.IResourceMap
   )
   return Windows.HRESULT is abstract;
   
   IID_IMapView_String_ResourceMap : aliased constant Windows.IID := (3560217310, 37809, 21285, (186, 92, 5, 243, 94, 239, 252, 85 ));
   
   ------------------------------------------------------------------------
   type IIterable_ResourceMap_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ResourceMap_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_ResourceMap : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   ------------------------------------------------------------------------
   type IIterator_ResourceMap_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ResourceMap_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ResourceMap_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ResourceMap_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ResourceMap_Interface
      ; items : Windows.Address
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_ResourceMap : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   ------------------------------------------------------------------------
   type IObservableMap_String_String_Interface is interface and Windows.IInspectable_Interface;
   
   function add_MapChanged
   (
      This       : access IObservableMap_String_String_Interface
      ; vhnd : Windows.String
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MapChanged
   (
      This       : access IObservableMap_String_String_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IObservableMap_String_String : aliased constant Windows.IID := (503538294, 12128, 22006, (183, 243, 248, 96, 121, 230, 144, 11 ));
   
   ------------------------------------------------------------------------
   type IMap_String_String_Interface is interface and Windows.IInspectable_Interface;
   
   function Lookup
   (
      This       : access IMap_String_String_Interface
      ; key : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IMap_String_String_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function HasKey
   (
      This       : access IMap_String_String_Interface
      ; key : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IMap_String_String_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Insert
   (
      This       : access IMap_String_String_Interface
      ; key : Windows.String
      ; value : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Remove
   (
      This       : access IMap_String_String_Interface
      ; key : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IMap_String_String_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IMap_String_String : aliased constant Windows.IID := (4140955392, 18882, 21166, (129, 84, 130, 111, 153, 8, 119, 60 ));
   
   ------------------------------------------------------------------------
   type IIterable_IKeyValuePair_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IKeyValuePair_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IKeyValuePair : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   ------------------------------------------------------------------------
   type IMapView_String_String_Interface is interface and Windows.IInspectable_Interface;
   
   function Lookup
   (
      This       : access IMapView_String_String_Interface
      ; key : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IMapView_String_String_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function HasKey
   (
      This       : access IMapView_String_String_Interface
      ; key : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Split
   (
      This       : access IMapView_String_String_Interface
      ; first : access Windows.String
      ; second : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IMapView_String_String : aliased constant Windows.IID := (2894014194, 65207, 23338, (138, 196, 52, 91, 198, 44, 174, 222 ));
   
   ------------------------------------------------------------------------
   type IVectorView_ResourceQualifier_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ResourceQualifier_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Resources.Core.IResourceQualifier
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ResourceQualifier_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ResourceQualifier_Interface
      ; value : Windows.ApplicationModel.Resources.Core.IResourceQualifier
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ResourceQualifier_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Resources.Core.IResourceQualifier_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_ResourceQualifier : aliased constant Windows.IID := (3089914076, 7360, 21488, (176, 244, 102, 239, 57, 168, 28, 214 ));
   
   ------------------------------------------------------------------------
   type IIterable_ResourceQualifier_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ResourceQualifier_Interface
      ; RetVal : access Windows.ApplicationModel.Resources.Core.IResourceQualifier
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_ResourceQualifier : aliased constant Windows.IID := (787376354, 26748, 24442, (161, 78, 88, 140, 77, 48, 137, 225 ));
   
   ------------------------------------------------------------------------
   type IVectorView_ResourceCandidate_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ResourceCandidate_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Resources.Core.IResourceCandidate
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ResourceCandidate_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ResourceCandidate_Interface
      ; value : Windows.ApplicationModel.Resources.Core.IResourceCandidate
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ResourceCandidate_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Resources.Core.IResourceCandidate_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_ResourceCandidate : aliased constant Windows.IID := (3800994544, 40955, 24231, (159, 201, 167, 59, 218, 71, 24, 134 ));
   
   ------------------------------------------------------------------------
   type IIterable_ResourceCandidate_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ResourceCandidate_Interface
      ; RetVal : access Windows.ApplicationModel.Resources.Core.IResourceCandidate
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_ResourceCandidate : aliased constant Windows.IID := (3634140312, 34921, 22520, (168, 131, 156, 45, 254, 236, 182, 198 ));
   
   ------------------------------------------------------------------------
   type IVectorView_String_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_String_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_String_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_String_Interface
      ; value : Windows.String
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_String_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.String_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_String : aliased constant Windows.IID := (789823494, 41018, 24425, (176, 144, 117, 164, 62, 51, 66, 62 ));
   
   ------------------------------------------------------------------------
   type IIterable_String_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_String_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_String : aliased constant Windows.IID := (3808217025, 15356, 23051, (178, 176, 114, 231, 105, 209, 203, 126 ));
   
   ------------------------------------------------------------------------
   type IIterator_INamedResource_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_INamedResource_Interface
      ; RetVal : access Windows.ApplicationModel.Resources.Core.INamedResource
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_INamedResource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_INamedResource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_INamedResource_Interface
      ; items : Windows.ApplicationModel.Resources.Core.INamedResource_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_INamedResource : aliased constant Windows.IID := (207249503, 42993, 20528, (161, 121, 159, 211, 99, 202, 243, 181 ));
   
   ------------------------------------------------------------------------
   type IIterable_INamedResource_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_INamedResource_Interface
      ; RetVal : access Windows.ApplicationModel.Resources.Core.IIterator_INamedResource
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_INamedResource : aliased constant Windows.IID := (3893181853, 38601, 22430, (142, 66, 213, 80, 112, 13, 233, 37 ));
   
   ------------------------------------------------------------------------
   type IVectorView_INamedResource_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_INamedResource_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Resources.Core.INamedResource
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_INamedResource_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_INamedResource_Interface
      ; value : Windows.ApplicationModel.Resources.Core.INamedResource
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_INamedResource_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Resources.Core.INamedResource_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_INamedResource : aliased constant Windows.IID := (1724504598, 54085, 23515, (185, 83, 216, 109, 217, 234, 132, 9 ));
   
   ------------------------------------------------------------------------
   type IIterator_IResourceMap_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IResourceMap_Interface
      ; RetVal : access Windows.ApplicationModel.Resources.Core.IResourceMap
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IResourceMap_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IResourceMap_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IResourceMap_Interface
      ; items : Windows.ApplicationModel.Resources.Core.IResourceMap_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IResourceMap : aliased constant Windows.IID := (1038994150, 53320, 24234, (175, 162, 251, 74, 121, 112, 239, 104 ));
   
   ------------------------------------------------------------------------
   type IIterable_IResourceMap_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IResourceMap_Interface
      ; RetVal : access Windows.ApplicationModel.Resources.Core.IIterator_IResourceMap
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IResourceMap : aliased constant Windows.IID := (2344489300, 6570, 21479, (157, 110, 220, 125, 53, 133, 128, 244 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IResourceMap_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IResourceMap_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Resources.Core.IResourceMap
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IResourceMap_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IResourceMap_Interface
      ; value : Windows.ApplicationModel.Resources.Core.IResourceMap
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IResourceMap_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Resources.Core.IResourceMap_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IResourceMap : aliased constant Windows.IID := (4066733813, 64551, 23588, (168, 194, 22, 151, 224, 190, 115, 111 ));
   
   ------------------------------------------------------------------------
   type IIterator_IResourceQualifier_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IResourceQualifier_Interface
      ; RetVal : access Windows.ApplicationModel.Resources.Core.IResourceQualifier
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IResourceQualifier_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IResourceQualifier_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IResourceQualifier_Interface
      ; items : Windows.ApplicationModel.Resources.Core.IResourceQualifier_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IResourceQualifier : aliased constant Windows.IID := (4275795163, 59215, 22906, (185, 191, 112, 75, 13, 173, 202, 56 ));
   
   ------------------------------------------------------------------------
   type IIterable_IResourceQualifier_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IResourceQualifier_Interface
      ; RetVal : access Windows.ApplicationModel.Resources.Core.IIterator_IResourceQualifier
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IResourceQualifier : aliased constant Windows.IID := (787376354, 26748, 24442, (161, 78, 88, 140, 77, 48, 137, 225 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IResourceQualifier_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IResourceQualifier_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Resources.Core.IResourceQualifier
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IResourceQualifier_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IResourceQualifier_Interface
      ; value : Windows.ApplicationModel.Resources.Core.IResourceQualifier
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IResourceQualifier_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Resources.Core.IResourceQualifier_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IResourceQualifier : aliased constant Windows.IID := (3089914076, 7360, 21488, (176, 244, 102, 239, 57, 168, 28, 214 ));
   
   ------------------------------------------------------------------------
   type IIterator_IResourceCandidate_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IResourceCandidate_Interface
      ; RetVal : access Windows.ApplicationModel.Resources.Core.IResourceCandidate
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IResourceCandidate_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IResourceCandidate_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IResourceCandidate_Interface
      ; items : Windows.ApplicationModel.Resources.Core.IResourceCandidate_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IResourceCandidate : aliased constant Windows.IID := (3780230540, 41606, 22443, (188, 234, 121, 183, 188, 38, 135, 161 ));
   
   ------------------------------------------------------------------------
   type IIterable_IResourceCandidate_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IResourceCandidate_Interface
      ; RetVal : access Windows.ApplicationModel.Resources.Core.IIterator_IResourceCandidate
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IResourceCandidate : aliased constant Windows.IID := (3634140312, 34921, 22520, (168, 131, 156, 45, 254, 236, 182, 198 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IResourceCandidate_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IResourceCandidate_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Resources.Core.IResourceCandidate
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IResourceCandidate_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IResourceCandidate_Interface
      ; value : Windows.ApplicationModel.Resources.Core.IResourceCandidate
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IResourceCandidate_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Resources.Core.IResourceCandidate_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IResourceCandidate : aliased constant Windows.IID := (3800994544, 40955, 24231, (159, 201, 167, 59, 218, 71, 24, 134 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype ResourceMap is Windows.ApplicationModel.Resources.Core.IResourceMap;
   subtype ResourceContext is Windows.ApplicationModel.Resources.Core.IResourceContext;
   
   function CreateResourceContext return Windows.ApplicationModel.Resources.Core.IResourceContext;
   
   subtype NamedResource is Windows.ApplicationModel.Resources.Core.INamedResource;
   subtype ResourceManager is Windows.ApplicationModel.Resources.Core.IResourceManager;
   subtype ResourceQualifier is Windows.ApplicationModel.Resources.Core.IResourceQualifier;
   subtype ResourceCandidate is Windows.ApplicationModel.Resources.Core.IResourceCandidate;
   subtype ResourceMapIterator is Windows.ApplicationModel.Resources.Core.IIterator_NamedResource;
   subtype ResourceMapMapView is Windows.ApplicationModel.Resources.Core.IMapView_String_ResourceMap;
   subtype ResourceMapMapViewIterator is Windows.ApplicationModel.Resources.Core.IIterator_ResourceMap;
   subtype ResourceQualifierObservableMap is Windows.ApplicationModel.Resources.Core.IObservableMap_String_String;
   subtype ResourceQualifierMapView is Windows.ApplicationModel.Resources.Core.IMapView_String_String;
   subtype ResourceQualifierVectorView is Windows.ApplicationModel.Resources.Core.IVectorView_ResourceQualifier;
   subtype ResourceCandidateVectorView is Windows.ApplicationModel.Resources.Core.IVectorView_ResourceCandidate;
   subtype ResourceContextLanguagesVectorView is Windows.ApplicationModel.Resources.Core.IVectorView_String;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   procedure SetGlobalQualifierValueWithPersistence
   (
      key : Windows.String
      ; value : Windows.String
      ; persistence : Windows.ApplicationModel.Resources.Core.ResourceQualifierPersistence
   )
   ;
   
   function GetForCurrentView
   return Windows.ApplicationModel.Resources.Core.IResourceContext;
   
   procedure SetGlobalQualifierValue
   (
      key : Windows.String
      ; value : Windows.String
   )
   ;
   
   procedure ResetGlobalQualifierValues
   ;
   
   procedure ResetGlobalQualifierValuesForSpecifiedQualifiers
   (
      qualifierNames : Windows.Foundation.Collections.IIterable_String
   )
   ;
   
   function GetForViewIndependentUse
   return Windows.ApplicationModel.Resources.Core.IResourceContext;
   
   function CreateMatchingContext
   (
      result : Windows.ApplicationModel.Resources.Core.IIterable_IResourceQualifier
   )
   return Windows.ApplicationModel.Resources.Core.IResourceContext;
   
   function get_Current
   return Windows.ApplicationModel.Resources.Core.IResourceManager;
   
   function IsResourceReference
   (
      resourceReference : Windows.String
   )
   return Windows.Boolean;

end;
