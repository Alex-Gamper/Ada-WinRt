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
limited with Windows.Storage.FileProperties;
limited with Windows.Data.Text;
--------------------------------------------------------------------------------
package Windows.Storage.Search is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type DateStackOption is (
      None,
      Year,
      Month
   );
   for DateStackOption use (
      None => 0,
      Year => 1,
      Month => 2
   );
   for DateStackOption'Size use 32;
   
   type DateStackOption_Ptr is access DateStackOption;
   
   type IndexerOption is (
      UseIndexerWhenAvailable,
      OnlyUseIndexer,
      DoNotUseIndexer,
      OnlyUseIndexerAndOptimizeForIndexedProperties
   );
   for IndexerOption use (
      UseIndexerWhenAvailable => 0,
      OnlyUseIndexer => 1,
      DoNotUseIndexer => 2,
      OnlyUseIndexerAndOptimizeForIndexedProperties => 3
   );
   for IndexerOption'Size use 32;
   
   type IndexerOption_Ptr is access IndexerOption;
   
   type FolderDepth is (
      Shallow,
      Deep
   );
   for FolderDepth use (
      Shallow => 0,
      Deep => 1
   );
   for FolderDepth'Size use 32;
   
   type FolderDepth_Ptr is access FolderDepth;
   
   type CommonFileQuery is (
      DefaultQuery,
      OrderByName,
      OrderByTitle,
      OrderByMusicProperties,
      OrderBySearchRank,
      OrderByDate
   );
   for CommonFileQuery use (
      DefaultQuery => 0,
      OrderByName => 1,
      OrderByTitle => 2,
      OrderByMusicProperties => 3,
      OrderBySearchRank => 4,
      OrderByDate => 5
   );
   for CommonFileQuery'Size use 32;
   
   type CommonFileQuery_Ptr is access CommonFileQuery;
   
   type CommonFolderQuery is (
      DefaultQuery,
      GroupByYear,
      GroupByMonth,
      GroupByArtist,
      GroupByAlbum,
      GroupByAlbumArtist,
      GroupByComposer,
      GroupByGenre,
      GroupByPublishedYear,
      GroupByRating,
      GroupByTag,
      GroupByAuthor,
      GroupByType
   );
   for CommonFolderQuery use (
      DefaultQuery => 0,
      GroupByYear => 100,
      GroupByMonth => 101,
      GroupByArtist => 102,
      GroupByAlbum => 103,
      GroupByAlbumArtist => 104,
      GroupByComposer => 105,
      GroupByGenre => 106,
      GroupByPublishedYear => 107,
      GroupByRating => 108,
      GroupByTag => 109,
      GroupByAuthor => 110,
      GroupByType => 111
   );
   for CommonFolderQuery'Size use 32;
   
   type CommonFolderQuery_Ptr is access CommonFolderQuery;
   
   type IndexedState is (
      Unknown,
      NotIndexed,
      PartiallyIndexed,
      FullyIndexed
   );
   for IndexedState use (
      Unknown => 0,
      NotIndexed => 1,
      PartiallyIndexed => 2,
      FullyIndexed => 3
   );
   for IndexedState'Size use 32;
   
   type IndexedState_Ptr is access IndexedState;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type SortEntry is record
      PropertyName : Windows.String;
      AscendingOrder : Windows.Boolean;
   end record;
   pragma Convention (C_Pass_By_Copy , SortEntry);
   
   type SortEntry_Ptr is access SortEntry;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IStorageQueryResultBase_add_ContentsChanged_Interface;
   type TypedEventHandler_IStorageQueryResultBase_add_ContentsChanged is access all TypedEventHandler_IStorageQueryResultBase_add_ContentsChanged_Interface'Class;
   type TypedEventHandler_IStorageQueryResultBase_add_ContentsChanged_Ptr is access all TypedEventHandler_IStorageQueryResultBase_add_ContentsChanged;
   type TypedEventHandler_IStorageQueryResultBase_add_OptionsChanged_Interface;
   type TypedEventHandler_IStorageQueryResultBase_add_OptionsChanged is access all TypedEventHandler_IStorageQueryResultBase_add_OptionsChanged_Interface'Class;
   type TypedEventHandler_IStorageQueryResultBase_add_OptionsChanged_Ptr is access all TypedEventHandler_IStorageQueryResultBase_add_OptionsChanged;
   type AsyncOperationCompletedHandler_IndexedState_Interface;
   type AsyncOperationCompletedHandler_IndexedState is access all AsyncOperationCompletedHandler_IndexedState_Interface'Class;
   type AsyncOperationCompletedHandler_IndexedState_Ptr is access all AsyncOperationCompletedHandler_IndexedState;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IContentIndexerStatics_Interface;
   type IContentIndexerStatics is access all IContentIndexerStatics_Interface'Class;
   type IContentIndexerStatics_Ptr is access all IContentIndexerStatics;
   type IIndexableContent_Interface;
   type IIndexableContent is access all IIndexableContent_Interface'Class;
   type IIndexableContent_Ptr is access all IIndexableContent;
   type IContentIndexer_Interface;
   type IContentIndexer is access all IContentIndexer_Interface'Class;
   type IContentIndexer_Ptr is access all IContentIndexer;
   type IValueAndLanguage_Interface;
   type IValueAndLanguage is access all IValueAndLanguage_Interface'Class;
   type IValueAndLanguage_Ptr is access all IValueAndLanguage;
   type IContentIndexerQueryOperations_Interface;
   type IContentIndexerQueryOperations is access all IContentIndexerQueryOperations_Interface'Class;
   type IContentIndexerQueryOperations_Ptr is access all IContentIndexerQueryOperations;
   type IContentIndexerQuery_Interface;
   type IContentIndexerQuery is access all IContentIndexerQuery_Interface'Class;
   type IContentIndexerQuery_Ptr is access all IContentIndexerQuery;
   type IQueryOptions_Interface;
   type IQueryOptions is access all IQueryOptions_Interface'Class;
   type IQueryOptions_Ptr is access all IQueryOptions;
   type IQueryOptionsWithProviderFilter_Interface;
   type IQueryOptionsWithProviderFilter is access all IQueryOptionsWithProviderFilter_Interface'Class;
   type IQueryOptionsWithProviderFilter_Ptr is access all IQueryOptionsWithProviderFilter;
   type IQueryOptionsFactory_Interface;
   type IQueryOptionsFactory is access all IQueryOptionsFactory_Interface'Class;
   type IQueryOptionsFactory_Ptr is access all IQueryOptionsFactory;
   type IStorageQueryResultBase_Interface;
   type IStorageQueryResultBase is access all IStorageQueryResultBase_Interface'Class;
   type IStorageQueryResultBase_Ptr is access all IStorageQueryResultBase;
   type IStorageFileQueryResult_Interface;
   type IStorageFileQueryResult is access all IStorageFileQueryResult_Interface'Class;
   type IStorageFileQueryResult_Ptr is access all IStorageFileQueryResult;
   type IStorageFileQueryResult2_Interface;
   type IStorageFileQueryResult2 is access all IStorageFileQueryResult2_Interface'Class;
   type IStorageFileQueryResult2_Ptr is access all IStorageFileQueryResult2;
   type IStorageFolderQueryResult_Interface;
   type IStorageFolderQueryResult is access all IStorageFolderQueryResult_Interface'Class;
   type IStorageFolderQueryResult_Ptr is access all IStorageFolderQueryResult;
   type IStorageItemQueryResult_Interface;
   type IStorageItemQueryResult is access all IStorageItemQueryResult_Interface'Class;
   type IStorageItemQueryResult_Ptr is access all IStorageItemQueryResult;
   type IStorageFolderQueryOperations_Interface;
   type IStorageFolderQueryOperations is access all IStorageFolderQueryOperations_Interface'Class;
   type IStorageFolderQueryOperations_Ptr is access all IStorageFolderQueryOperations;
   type IVector_SortEntry_Interface;
   type IVector_SortEntry is access all IVector_SortEntry_Interface'Class;
   type IVector_SortEntry_Ptr is access all IVector_SortEntry;
   type IIterable_SortEntry_Interface;
   type IIterable_SortEntry is access all IIterable_SortEntry_Interface'Class;
   type IIterable_SortEntry_Ptr is access all IIterable_SortEntry;
   type IStorageLibraryContentChangedTriggerDetails_Interface;
   type IStorageLibraryContentChangedTriggerDetails is access all IStorageLibraryContentChangedTriggerDetails_Interface'Class;
   type IStorageLibraryContentChangedTriggerDetails_Ptr is access all IStorageLibraryContentChangedTriggerDetails;
   type IIterator_SortEntry_Interface;
   type IIterator_SortEntry is access all IIterator_SortEntry_Interface'Class;
   type IIterator_SortEntry_Ptr is access all IIterator_SortEntry;
   type IVectorView_SortEntry_Interface;
   type IVectorView_SortEntry is access all IVectorView_SortEntry_Interface'Class;
   type IVectorView_SortEntry_Ptr is access all IVectorView_SortEntry;
   type IAsyncOperation_IndexedState_Interface;
   type IAsyncOperation_IndexedState is access all IAsyncOperation_IndexedState_Interface'Class;
   type IAsyncOperation_IndexedState_Ptr is access all IAsyncOperation_IndexedState;
   
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
   type IContentIndexerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetIndexerWithName
   (
      This       : access IContentIndexerStatics_Interface
      ; indexName : Windows.String
      ; RetVal : access Windows.Storage.Search.IContentIndexer
   )
   return Windows.HRESULT is abstract;
   
   function GetIndexer
   (
      This       : access IContentIndexerStatics_Interface
      ; RetVal : access Windows.Storage.Search.IContentIndexer
   )
   return Windows.HRESULT is abstract;
   
   IID_IContentIndexerStatics : aliased constant Windows.IID := (2353562485, 45950, 19552, (155, 168, 183, 96, 253, 163, 229, 157 ));
   
   ------------------------------------------------------------------------
   type IIndexableContent_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IIndexableContent_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Id
   (
      This       : access IIndexableContent_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IIndexableContent_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Stream
   (
      This       : access IIndexableContent_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function put_Stream
   (
      This       : access IIndexableContent_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function get_StreamContentType
   (
      This       : access IIndexableContent_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_StreamContentType
   (
      This       : access IIndexableContent_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IIndexableContent : aliased constant Windows.IID := (3438387295, 54453, 18490, (176, 110, 224, 219, 30, 196, 32, 228 ));
   
   ------------------------------------------------------------------------
   type IContentIndexer_Interface is interface and Windows.IInspectable_Interface;
   
   function AddAsync
   (
      This       : access IContentIndexer_Interface
      ; indexableContent : Windows.Storage.Search.IIndexableContent
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function UpdateAsync
   (
      This       : access IContentIndexer_Interface
      ; indexableContent : Windows.Storage.Search.IIndexableContent
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function DeleteAsync
   (
      This       : access IContentIndexer_Interface
      ; contentId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function DeleteMultipleAsync
   (
      This       : access IContentIndexer_Interface
      ; contentIds : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function DeleteAllAsync
   (
      This       : access IContentIndexer_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function RetrievePropertiesAsync
   (
      This       : access IContentIndexer_Interface
      ; contentId : Windows.String
      ; propertiesToRetrieve : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Revision
   (
      This       : access IContentIndexer_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   IID_IContentIndexer : aliased constant Windows.IID := (2977333133, 63128, 18818, (176, 95, 58, 110, 140, 171, 1, 162 ));
   
   ------------------------------------------------------------------------
   type IValueAndLanguage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Language
   (
      This       : access IValueAndLanguage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Language
   (
      This       : access IValueAndLanguage_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IValueAndLanguage_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function put_Value
   (
      This       : access IValueAndLanguage_Interface
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   IID_IValueAndLanguage : aliased constant Windows.IID := (3113306241, 41454, 19396, (146, 165, 70, 105, 104, 227, 4, 54 ));
   
   ------------------------------------------------------------------------
   type IContentIndexerQueryOperations_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateQueryWithSortOrderAndLanguage
   (
      This       : access IContentIndexerQueryOperations_Interface
      ; searchFilter : Windows.String
      ; propertiesToRetrieve : Windows.Foundation.Collections.IIterable_String
      ; sortOrder : Windows.Storage.Search.IIterable_SortEntry
      ; searchFilterLanguage : Windows.String
      ; RetVal : access Windows.Storage.Search.IContentIndexerQuery
   )
   return Windows.HRESULT is abstract;
   
   function CreateQueryWithSortOrder
   (
      This       : access IContentIndexerQueryOperations_Interface
      ; searchFilter : Windows.String
      ; propertiesToRetrieve : Windows.Foundation.Collections.IIterable_String
      ; sortOrder : Windows.Storage.Search.IIterable_SortEntry
      ; RetVal : access Windows.Storage.Search.IContentIndexerQuery
   )
   return Windows.HRESULT is abstract;
   
   function CreateQuery
   (
      This       : access IContentIndexerQueryOperations_Interface
      ; searchFilter : Windows.String
      ; propertiesToRetrieve : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Storage.Search.IContentIndexerQuery
   )
   return Windows.HRESULT is abstract;
   
   IID_IContentIndexerQueryOperations : aliased constant Windows.IID := (679624208, 18310, 17137, (151, 48, 121, 43, 53, 102, 177, 80 ));
   
   ------------------------------------------------------------------------
   type IContentIndexerQuery_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCountAsync
   (
      This       : access IContentIndexerQuery_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetPropertiesAsync
   (
      This       : access IContentIndexerQuery_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetPropertiesRangeAsync
   (
      This       : access IContentIndexerQuery_Interface
      ; startIndex : Windows.UInt32
      ; maxItems : Windows.UInt32
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetAsync
   (
      This       : access IContentIndexerQuery_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetRangeAsync
   (
      This       : access IContentIndexerQuery_Interface
      ; startIndex : Windows.UInt32
      ; maxItems : Windows.UInt32
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_QueryFolder
   (
      This       : access IContentIndexerQuery_Interface
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   IID_IContentIndexerQuery : aliased constant Windows.IID := (1893970168, 19452, 17034, (136, 137, 204, 81, 218, 154, 123, 157 ));
   
   ------------------------------------------------------------------------
   type IQueryOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FileTypeFilter
   (
      This       : access IQueryOptions_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_FolderDepth
   (
      This       : access IQueryOptions_Interface
      ; RetVal : access Windows.Storage.Search.FolderDepth
   )
   return Windows.HRESULT is abstract;
   
   function put_FolderDepth
   (
      This       : access IQueryOptions_Interface
      ; value : Windows.Storage.Search.FolderDepth
   )
   return Windows.HRESULT is abstract;
   
   function get_ApplicationSearchFilter
   (
      This       : access IQueryOptions_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ApplicationSearchFilter
   (
      This       : access IQueryOptions_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_UserSearchFilter
   (
      This       : access IQueryOptions_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_UserSearchFilter
   (
      This       : access IQueryOptions_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Language
   (
      This       : access IQueryOptions_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Language
   (
      This       : access IQueryOptions_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IndexerOption
   (
      This       : access IQueryOptions_Interface
      ; RetVal : access Windows.Storage.Search.IndexerOption
   )
   return Windows.HRESULT is abstract;
   
   function put_IndexerOption
   (
      This       : access IQueryOptions_Interface
      ; value : Windows.Storage.Search.IndexerOption
   )
   return Windows.HRESULT is abstract;
   
   function get_SortOrder
   (
      This       : access IQueryOptions_Interface
      ; RetVal : access Windows.Storage.Search.IVector_SortEntry -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_GroupPropertyName
   (
      This       : access IQueryOptions_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DateStackOption
   (
      This       : access IQueryOptions_Interface
      ; RetVal : access Windows.Storage.Search.DateStackOption
   )
   return Windows.HRESULT is abstract;
   
   function SaveToString
   (
      This       : access IQueryOptions_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function LoadFromString
   (
      This       : access IQueryOptions_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetThumbnailPrefetch
   (
      This       : access IQueryOptions_Interface
      ; mode : Windows.Storage.FileProperties.ThumbnailMode
      ; requestedSize : Windows.UInt32
      ; options : Windows.Storage.FileProperties.ThumbnailOptions
   )
   return Windows.HRESULT is abstract;
   
   function SetPropertyPrefetch
   (
      This       : access IQueryOptions_Interface
      ; options : Windows.Storage.FileProperties.PropertyPrefetchOptions
      ; propertiesToRetrieve : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.HRESULT is abstract;
   
   IID_IQueryOptions : aliased constant Windows.IID := (509495022, 3909, 18488, (168, 233, 208, 71, 157, 68, 108, 48 ));
   
   ------------------------------------------------------------------------
   type IQueryOptionsWithProviderFilter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StorageProviderIdFilter
   (
      This       : access IQueryOptionsWithProviderFilter_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IQueryOptionsWithProviderFilter : aliased constant Windows.IID := (1537019942, 5572, 17629, (184, 154, 71, 165, 155, 125, 124, 79 ));
   
   ------------------------------------------------------------------------
   type IQueryOptionsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateCommonFileQuery
   (
      This       : access IQueryOptionsFactory_Interface
      ; query : Windows.Storage.Search.CommonFileQuery
      ; fileTypeFilter : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Storage.Search.IQueryOptions
   )
   return Windows.HRESULT is abstract;
   
   function CreateCommonFolderQuery
   (
      This       : access IQueryOptionsFactory_Interface
      ; query : Windows.Storage.Search.CommonFolderQuery
      ; RetVal : access Windows.Storage.Search.IQueryOptions
   )
   return Windows.HRESULT is abstract;
   
   IID_IQueryOptionsFactory : aliased constant Windows.IID := (53354380, 43457, 20081, (128, 17, 13, 238, 157, 72, 17, 163 ));
   
   ------------------------------------------------------------------------
   type IStorageQueryResultBase_Interface is interface and Windows.IInspectable_Interface;
   
   function GetItemCountAsync
   (
      This       : access IStorageQueryResultBase_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Folder
   (
      This       : access IStorageQueryResultBase_Interface
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function add_ContentsChanged
   (
      This       : access IStorageQueryResultBase_Interface
      ; handler : TypedEventHandler_IStorageQueryResultBase_add_ContentsChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ContentsChanged
   (
      This       : access IStorageQueryResultBase_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_OptionsChanged
   (
      This       : access IStorageQueryResultBase_Interface
      ; changedHandler : TypedEventHandler_IStorageQueryResultBase_add_OptionsChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_OptionsChanged
   (
      This       : access IStorageQueryResultBase_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function FindStartIndexAsync
   (
      This       : access IStorageQueryResultBase_Interface
      ; value : Windows.Object
      ; RetVal : access Windows.Foundation.IAsyncOperation_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetCurrentQueryOptions
   (
      This       : access IStorageQueryResultBase_Interface
      ; RetVal : access Windows.Storage.Search.IQueryOptions
   )
   return Windows.HRESULT is abstract;
   
   function ApplyNewQueryOptions
   (
      This       : access IStorageQueryResultBase_Interface
      ; newQueryOptions : Windows.Storage.Search.IQueryOptions
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageQueryResultBase : aliased constant Windows.IID := (3264730893, 29523, 18347, (186, 88, 140, 97, 66, 93, 197, 75 ));
   
   ------------------------------------------------------------------------
   type IStorageFileQueryResult_Interface is interface and Windows.IInspectable_Interface;
   
   function GetFilesAsync
   (
      This       : access IStorageFileQueryResult_Interface
      ; startIndex : Windows.UInt32
      ; maxNumberOfItems : Windows.UInt32
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetFilesAsyncDefaultStartAndCount
   (
      This       : access IStorageFileQueryResult_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageFileQueryResult : aliased constant Windows.IID := (1392354375, 11178, 16684, (178, 159, 212, 177, 119, 142, 250, 30 ));
   
   ------------------------------------------------------------------------
   type IStorageFileQueryResult2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetMatchingPropertiesWithRanges
   (
      This       : access IStorageFileQueryResult2_Interface
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageFileQueryResult2 : aliased constant Windows.IID := (1314765277, 28993, 18116, (139, 227, 233, 220, 158, 39, 39, 92 ));
   
   ------------------------------------------------------------------------
   type IStorageFolderQueryResult_Interface is interface and Windows.IInspectable_Interface;
   
   function GetFoldersAsync
   (
      This       : access IStorageFolderQueryResult_Interface
      ; startIndex : Windows.UInt32
      ; maxNumberOfItems : Windows.UInt32
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetFoldersAsyncDefaultStartAndCount
   (
      This       : access IStorageFolderQueryResult_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageFolderQueryResult : aliased constant Windows.IID := (1716832529, 32102, 18170, (174, 207, 228, 164, 186, 169, 58, 184 ));
   
   ------------------------------------------------------------------------
   type IStorageItemQueryResult_Interface is interface and Windows.IInspectable_Interface;
   
   function GetItemsAsync
   (
      This       : access IStorageItemQueryResult_Interface
      ; startIndex : Windows.UInt32
      ; maxNumberOfItems : Windows.UInt32
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetItemsAsyncDefaultStartAndCount
   (
      This       : access IStorageItemQueryResult_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageItemQueryResult : aliased constant Windows.IID := (3902046329, 40280, 18360, (178, 178, 65, 176, 127, 71, 149, 249 ));
   
   ------------------------------------------------------------------------
   type IStorageFolderQueryOperations_Interface is interface and Windows.IInspectable_Interface;
   
   function GetIndexedStateAsync
   (
      This       : access IStorageFolderQueryOperations_Interface
      ; RetVal : access Windows.Storage.Search.IAsyncOperation_IndexedState -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateFileQueryOverloadDefault
   (
      This       : access IStorageFolderQueryOperations_Interface
      ; RetVal : access Windows.Storage.Search.IStorageFileQueryResult
   )
   return Windows.HRESULT is abstract;
   
   function CreateFileQuery
   (
      This       : access IStorageFolderQueryOperations_Interface
      ; query : Windows.Storage.Search.CommonFileQuery
      ; RetVal : access Windows.Storage.Search.IStorageFileQueryResult
   )
   return Windows.HRESULT is abstract;
   
   function CreateFileQueryWithOptions
   (
      This       : access IStorageFolderQueryOperations_Interface
      ; queryOptions : Windows.Storage.Search.IQueryOptions
      ; RetVal : access Windows.Storage.Search.IStorageFileQueryResult
   )
   return Windows.HRESULT is abstract;
   
   function CreateFolderQueryOverloadDefault
   (
      This       : access IStorageFolderQueryOperations_Interface
      ; RetVal : access Windows.Storage.Search.IStorageFolderQueryResult
   )
   return Windows.HRESULT is abstract;
   
   function CreateFolderQuery
   (
      This       : access IStorageFolderQueryOperations_Interface
      ; query : Windows.Storage.Search.CommonFolderQuery
      ; RetVal : access Windows.Storage.Search.IStorageFolderQueryResult
   )
   return Windows.HRESULT is abstract;
   
   function CreateFolderQueryWithOptions
   (
      This       : access IStorageFolderQueryOperations_Interface
      ; queryOptions : Windows.Storage.Search.IQueryOptions
      ; RetVal : access Windows.Storage.Search.IStorageFolderQueryResult
   )
   return Windows.HRESULT is abstract;
   
   function CreateItemQuery
   (
      This       : access IStorageFolderQueryOperations_Interface
      ; RetVal : access Windows.Storage.Search.IStorageItemQueryResult
   )
   return Windows.HRESULT is abstract;
   
   function CreateItemQueryWithOptions
   (
      This       : access IStorageFolderQueryOperations_Interface
      ; queryOptions : Windows.Storage.Search.IQueryOptions
      ; RetVal : access Windows.Storage.Search.IStorageItemQueryResult
   )
   return Windows.HRESULT is abstract;
   
   function GetFilesAsync
   (
      This       : access IStorageFolderQueryOperations_Interface
      ; query : Windows.Storage.Search.CommonFileQuery
      ; startIndex : Windows.UInt32
      ; maxItemsToRetrieve : Windows.UInt32
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetFilesAsyncOverloadDefaultStartAndCount
   (
      This       : access IStorageFolderQueryOperations_Interface
      ; query : Windows.Storage.Search.CommonFileQuery
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetFoldersAsync
   (
      This       : access IStorageFolderQueryOperations_Interface
      ; query : Windows.Storage.Search.CommonFolderQuery
      ; startIndex : Windows.UInt32
      ; maxItemsToRetrieve : Windows.UInt32
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetFoldersAsyncOverloadDefaultStartAndCount
   (
      This       : access IStorageFolderQueryOperations_Interface
      ; query : Windows.Storage.Search.CommonFolderQuery
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetItemsAsync
   (
      This       : access IStorageFolderQueryOperations_Interface
      ; startIndex : Windows.UInt32
      ; maxItemsToRetrieve : Windows.UInt32
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function AreQueryOptionsSupported
   (
      This       : access IStorageFolderQueryOperations_Interface
      ; queryOptions : Windows.Storage.Search.IQueryOptions
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsCommonFolderQuerySupported
   (
      This       : access IStorageFolderQueryOperations_Interface
      ; query : Windows.Storage.Search.CommonFolderQuery
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsCommonFileQuerySupported
   (
      This       : access IStorageFolderQueryOperations_Interface
      ; query : Windows.Storage.Search.CommonFileQuery
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageFolderQueryOperations : aliased constant Windows.IID := (3410218185, 17515, 19023, (190, 151, 117, 119, 113, 190, 82, 3 ));
   
   ------------------------------------------------------------------------
   type IVector_SortEntry_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_SortEntry_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Storage.Search.SortEntry
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_SortEntry_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_SortEntry_Interface
      ; RetVal : access Windows.Storage.Search.SortEntry
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_SortEntry_Interface
      ; value : Windows.Storage.Search.SortEntry
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_SortEntry_Interface
      ; index : Windows.UInt32
      ; value : Windows.Storage.Search.SortEntry
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_SortEntry_Interface
      ; index : Windows.UInt32
      ; value : Windows.Storage.Search.SortEntry
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_SortEntry_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_SortEntry_Interface
      ; value : Windows.Storage.Search.SortEntry
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_SortEntry_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_SortEntry_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_SortEntry_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Storage.Search.SortEntry_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_SortEntry_Interface
      ; items : Windows.Storage.Search.SortEntry_Ptr
   )
   return Windows.HRESULT is abstract;
   
   IID_IVector_SortEntry : aliased constant Windows.IID := (3639230491, 18355, 21076, (132, 244, 238, 161, 12, 76, 240, 104 ));
   
   ------------------------------------------------------------------------
   type IIterable_SortEntry_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_SortEntry_Interface
      ; RetVal : access Windows.Storage.Search.SortEntry
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_SortEntry : aliased constant Windows.IID := (900724473, 61301, 21120, (187, 132, 162, 191, 131, 23, 207, 53 ));
   
   ------------------------------------------------------------------------
   type IStorageLibraryContentChangedTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Folder
   (
      This       : access IStorageLibraryContentChangedTriggerDetails_Interface
      ; RetVal : access Windows.Storage.IStorageFolder
   )
   return Windows.HRESULT is abstract;
   
   function CreateModifiedSinceQuery
   (
      This       : access IStorageLibraryContentChangedTriggerDetails_Interface
      ; lastQueryTime : Windows.Foundation.DateTime
      ; RetVal : access Windows.Storage.Search.IStorageItemQueryResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorageLibraryContentChangedTriggerDetails : aliased constant Windows.IID := (708254071, 43967, 19997, (138, 165, 99, 133, 216, 136, 71, 153 ));
   
   ------------------------------------------------------------------------
   type IIterator_SortEntry_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_SortEntry_Interface
      ; RetVal : access Windows.Storage.Search.SortEntry
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_SortEntry_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_SortEntry_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_SortEntry_Interface
      ; items : Windows.Storage.Search.SortEntry_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_SortEntry : aliased constant Windows.IID := (1376007330, 44279, 22729, (180, 122, 39, 65, 242, 250, 194, 194 ));
   
   ------------------------------------------------------------------------
   type IVectorView_SortEntry_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_SortEntry_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Storage.Search.SortEntry
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_SortEntry_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_SortEntry_Interface
      ; value : Windows.Storage.Search.SortEntry
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_SortEntry_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Storage.Search.SortEntry_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_SortEntry : aliased constant Windows.IID := (2185000452, 45947, 21605, (161, 105, 41, 73, 120, 147, 205, 185 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IndexedState_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IndexedState_Interface
      ; handler : Windows.Storage.Search.AsyncOperationCompletedHandler_IndexedState
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IndexedState_Interface
      ; RetVal : access Windows.Storage.Search.AsyncOperationCompletedHandler_IndexedState
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IndexedState_Interface
      ; RetVal : access Windows.Storage.Search.IndexedState
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IndexedState : aliased constant Windows.IID := (2288601887, 62336, 22349, (138, 5, 79, 103, 189, 82, 205, 17 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IStorageQueryResultBase_add_ContentsChanged_Interface(Callback : access procedure (sender : Windows.Storage.Search.IStorageQueryResultBase ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IStorageQueryResultBase_add_ContentsChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IStorageQueryResultBase_add_ContentsChanged_Interface
      ; sender : Windows.Storage.Search.IStorageQueryResultBase
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IStorageQueryResultBase_add_ContentsChanged : aliased constant Windows.IID := (1268918369, 196, 22911, (182, 191, 58, 245, 22, 243, 184, 112 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IStorageQueryResultBase_add_OptionsChanged_Interface(Callback : access procedure (sender : Windows.Storage.Search.IStorageQueryResultBase ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IStorageQueryResultBase_add_OptionsChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IStorageQueryResultBase_add_OptionsChanged_Interface
      ; sender : Windows.Storage.Search.IStorageQueryResultBase
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IStorageQueryResultBase_add_OptionsChanged : aliased constant Windows.IID := (1268918369, 196, 22911, (182, 191, 58, 245, 22, 243, 184, 112 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IndexedState_Interface(Callback : access procedure (asyncInfo : Windows.Storage.Search.IAsyncOperation_IndexedState ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IndexedState_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IndexedState_Interface
      ; asyncInfo : Windows.Storage.Search.IAsyncOperation_IndexedState
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IndexedState : aliased constant Windows.IID := (3061464250, 62967, 24145, (150, 138, 56, 81, 38, 209, 249, 24 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype ContentIndexer is Windows.Storage.Search.IContentIndexer;
   subtype ValueAndLanguage is Windows.Storage.Search.IValueAndLanguage;
   
   function CreateValueAndLanguage return Windows.Storage.Search.IValueAndLanguage;
   
   subtype ContentIndexerQuery is Windows.Storage.Search.IContentIndexerQuery;
   subtype IndexableContent is Windows.Storage.Search.IIndexableContent;
   
   function CreateIndexableContent return Windows.Storage.Search.IIndexableContent;
   
   subtype QueryOptions is Windows.Storage.Search.IQueryOptions;
   
   function CreateCommonFileQuery
   (
      query : Windows.Storage.Search.CommonFileQuery
      ; fileTypeFilter : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Storage.Search.IQueryOptions;
   
   function CreateCommonFolderQuery
   (
      query : Windows.Storage.Search.CommonFolderQuery
   )
   return Windows.Storage.Search.IQueryOptions;
   
   subtype StorageFileQueryResult is Windows.Storage.Search.IStorageFileQueryResult;
   subtype StorageFolderQueryResult is Windows.Storage.Search.IStorageFolderQueryResult;
   subtype StorageItemQueryResult is Windows.Storage.Search.IStorageItemQueryResult;
   subtype SortEntryVector is Windows.Storage.Search.IVector_SortEntry;
   subtype StorageLibraryContentChangedTriggerDetails is Windows.Storage.Search.IStorageLibraryContentChangedTriggerDetails;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetIndexerWithName
   (
      indexName : Windows.String
   )
   return Windows.Storage.Search.IContentIndexer;
   
   function GetIndexer
   return Windows.Storage.Search.IContentIndexer;

end;
