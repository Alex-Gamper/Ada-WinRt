--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.1.0.1                                                     --
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
-- along with this program.If not, see < http://www.gnu.org/licenses/>.       --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.Foundation.Collections;
with Windows.Foundation;
limited with Windows.Storage.Streams;
limited with Windows.Media.Core;
--------------------------------------------------------------------------------
package Windows.Media.SpeechSynthesis is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type VoiceGender is (
      Male,
      Female
   );
   for VoiceGender use (
      Male => 0,
      Female => 1
   );
   for VoiceGender'Size use 32;
   
   type VoiceGender_Ptr is access VoiceGender;
   
   type SpeechAppendedSilence is (
      Default,
      Min
   );
   for SpeechAppendedSilence use (
      Default => 0,
      Min => 1
   );
   for SpeechAppendedSilence'Size use 32;
   
   type SpeechAppendedSilence_Ptr is access SpeechAppendedSilence;
   
   type SpeechPunctuationSilence is (
      Default,
      Min
   );
   for SpeechPunctuationSilence use (
      Default => 0,
      Min => 1
   );
   for SpeechPunctuationSilence'Size use 32;
   
   type SpeechPunctuationSilence_Ptr is access SpeechPunctuationSilence;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_ISpeechSynthesisStream_Interface;
   type AsyncOperationCompletedHandler_ISpeechSynthesisStream is access all AsyncOperationCompletedHandler_ISpeechSynthesisStream_Interface'Class;
   type AsyncOperationCompletedHandler_ISpeechSynthesisStream_Ptr is access all AsyncOperationCompletedHandler_ISpeechSynthesisStream;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IVoiceInformation_Interface;
   type IVoiceInformation is access all IVoiceInformation_Interface'Class;
   type IVoiceInformation_Ptr is access all IVoiceInformation;
   type IInstalledVoicesStatic_Interface;
   type IInstalledVoicesStatic is access all IInstalledVoicesStatic_Interface'Class;
   type IInstalledVoicesStatic_Ptr is access all IInstalledVoicesStatic;
   type IInstalledVoicesStatic2_Interface;
   type IInstalledVoicesStatic2 is access all IInstalledVoicesStatic2_Interface'Class;
   type IInstalledVoicesStatic2_Ptr is access all IInstalledVoicesStatic2;
   type ISpeechSynthesisStream_Interface;
   type ISpeechSynthesisStream is access all ISpeechSynthesisStream_Interface'Class;
   type ISpeechSynthesisStream_Ptr is access all ISpeechSynthesisStream;
   type ISpeechSynthesizer_Interface;
   type ISpeechSynthesizer is access all ISpeechSynthesizer_Interface'Class;
   type ISpeechSynthesizer_Ptr is access all ISpeechSynthesizer;
   type ISpeechSynthesizer2_Interface;
   type ISpeechSynthesizer2 is access all ISpeechSynthesizer2_Interface'Class;
   type ISpeechSynthesizer2_Ptr is access all ISpeechSynthesizer2;
   type ISpeechSynthesizerOptions_Interface;
   type ISpeechSynthesizerOptions is access all ISpeechSynthesizerOptions_Interface'Class;
   type ISpeechSynthesizerOptions_Ptr is access all ISpeechSynthesizerOptions;
   type ISpeechSynthesizerOptions2_Interface;
   type ISpeechSynthesizerOptions2 is access all ISpeechSynthesizerOptions2_Interface'Class;
   type ISpeechSynthesizerOptions2_Ptr is access all ISpeechSynthesizerOptions2;
   type ISpeechSynthesizerOptions3_Interface;
   type ISpeechSynthesizerOptions3 is access all ISpeechSynthesizerOptions3_Interface'Class;
   type ISpeechSynthesizerOptions3_Ptr is access all ISpeechSynthesizerOptions3;
   type IRandomAccessStreamWithContentType_Imported_Interface;
   type IRandomAccessStreamWithContentType_Imported is access all IRandomAccessStreamWithContentType_Imported_Interface'Class;
   type IRandomAccessStreamWithContentType_Imported_Ptr is access all IRandomAccessStreamWithContentType_Imported;
   type IContentTypeProvider_Imported_Interface;
   type IContentTypeProvider_Imported is access all IContentTypeProvider_Imported_Interface'Class;
   type IContentTypeProvider_Imported_Ptr is access all IContentTypeProvider_Imported;
   type IRandomAccessStream_Imported_Interface;
   type IRandomAccessStream_Imported is access all IRandomAccessStream_Imported_Interface'Class;
   type IRandomAccessStream_Imported_Ptr is access all IRandomAccessStream_Imported;
   type IOutputStream_Imported_Interface;
   type IOutputStream_Imported is access all IOutputStream_Imported_Interface'Class;
   type IOutputStream_Imported_Ptr is access all IOutputStream_Imported;
   type IInputStream_Imported_Interface;
   type IInputStream_Imported is access all IInputStream_Imported_Interface'Class;
   type IInputStream_Imported_Ptr is access all IInputStream_Imported;
   type ITimedMetadataTrackProvider_Imported_Interface;
   type ITimedMetadataTrackProvider_Imported is access all ITimedMetadataTrackProvider_Imported_Interface'Class;
   type ITimedMetadataTrackProvider_Imported_Ptr is access all ITimedMetadataTrackProvider_Imported;
   type IIterator_IVoiceInformation_Interface;
   type IIterator_IVoiceInformation is access all IIterator_IVoiceInformation_Interface'Class;
   type IIterator_IVoiceInformation_Ptr is access all IIterator_IVoiceInformation;
   type IIterable_IVoiceInformation_Interface;
   type IIterable_IVoiceInformation is access all IIterable_IVoiceInformation_Interface'Class;
   type IIterable_IVoiceInformation_Ptr is access all IIterable_IVoiceInformation;
   type IVectorView_IVoiceInformation_Interface;
   type IVectorView_IVoiceInformation is access all IVectorView_IVoiceInformation_Interface'Class;
   type IVectorView_IVoiceInformation_Ptr is access all IVectorView_IVoiceInformation;
   type IAsyncOperation_ISpeechSynthesisStream_Interface;
   type IAsyncOperation_ISpeechSynthesisStream is access all IAsyncOperation_ISpeechSynthesisStream_Interface'Class;
   type IAsyncOperation_ISpeechSynthesisStream_Ptr is access all IAsyncOperation_ISpeechSynthesisStream;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IVoiceInformation : aliased constant Windows.IID := (2972178084, 4753, 17924, (170, 156, 131, 19, 64, 131, 53, 44 ));
   
   type IVoiceInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DisplayName
   (
      This       : access IVoiceInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access IVoiceInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Language
   (
      This       : access IVoiceInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IVoiceInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Gender
   (
      This       : access IVoiceInformation_Interface
      ; RetVal : access Windows.Media.SpeechSynthesis.VoiceGender
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInstalledVoicesStatic : aliased constant Windows.IID := (2102554316, 30003, 19519, (133, 190, 136, 140, 43, 174, 235, 220 ));
   
   type IInstalledVoicesStatic_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AllVoices
   (
      This       : access IInstalledVoicesStatic_Interface
      ; RetVal : access Windows.Media.SpeechSynthesis.IVectorView_IVoiceInformation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_DefaultVoice
   (
      This       : access IInstalledVoicesStatic_Interface
      ; RetVal : access Windows.Media.SpeechSynthesis.IVoiceInformation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInstalledVoicesStatic2 : aliased constant Windows.IID := (1680170798, 13709, 16472, (190, 154, 253, 63, 203, 66, 53, 48 ));
   
   type IInstalledVoicesStatic2_Interface is interface and Windows.IInspectable_Interface;
   
   function TrySetDefaultVoiceAsync
   (
      This       : access IInstalledVoicesStatic2_Interface
      ; voice : Windows.Media.SpeechSynthesis.IVoiceInformation
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpeechSynthesisStream : aliased constant Windows.IID := (2212785811, 9292, 17954, (186, 11, 98, 41, 196, 208, 214, 93 ));
   
   type ISpeechSynthesisStream_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Markers
   (
      This       : access ISpeechSynthesisStream_Interface
      ; RetVal : access Windows.Media.IVectorView_IMediaMarker -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpeechSynthesizer : aliased constant Windows.IID := (3466558582, 38900, 19693, (173, 104, 213, 28, 69, 142, 69, 198 ));
   
   type ISpeechSynthesizer_Interface is interface and Windows.IInspectable_Interface;
   
   function SynthesizeTextToStreamAsync
   (
      This       : access ISpeechSynthesizer_Interface
      ; text : Windows.String
      ; RetVal : access Windows.Media.SpeechSynthesis.IAsyncOperation_ISpeechSynthesisStream -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SynthesizeSsmlToStreamAsync
   (
      This       : access ISpeechSynthesizer_Interface
      ; Ssml : Windows.String
      ; RetVal : access Windows.Media.SpeechSynthesis.IAsyncOperation_ISpeechSynthesisStream -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Voice
   (
      This       : access ISpeechSynthesizer_Interface
      ; value : Windows.Media.SpeechSynthesis.IVoiceInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_Voice
   (
      This       : access ISpeechSynthesizer_Interface
      ; RetVal : access Windows.Media.SpeechSynthesis.IVoiceInformation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpeechSynthesizer2 : aliased constant Windows.IID := (2814766258, 17209, 19818, (187, 248, 199, 164, 241, 84, 76, 46 ));
   
   type ISpeechSynthesizer2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Options
   (
      This       : access ISpeechSynthesizer2_Interface
      ; RetVal : access Windows.Media.SpeechSynthesis.ISpeechSynthesizerOptions
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpeechSynthesizerOptions : aliased constant Windows.IID := (2699180145, 52285, 17353, (145, 177, 238, 24, 83, 36, 216, 61 ));
   
   type ISpeechSynthesizerOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IncludeWordBoundaryMetadata
   (
      This       : access ISpeechSynthesizerOptions_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IncludeWordBoundaryMetadata
   (
      This       : access ISpeechSynthesizerOptions_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IncludeSentenceBoundaryMetadata
   (
      This       : access ISpeechSynthesizerOptions_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IncludeSentenceBoundaryMetadata
   (
      This       : access ISpeechSynthesizerOptions_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpeechSynthesizerOptions2 : aliased constant Windows.IID := (482276878, 4508, 19437, (177, 24, 210, 80, 195, 162, 87, 147 ));
   
   type ISpeechSynthesizerOptions2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AudioVolume
   (
      This       : access ISpeechSynthesizerOptions2_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_AudioVolume
   (
      This       : access ISpeechSynthesizerOptions2_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_SpeakingRate
   (
      This       : access ISpeechSynthesizerOptions2_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_SpeakingRate
   (
      This       : access ISpeechSynthesizerOptions2_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_AudioPitch
   (
      This       : access ISpeechSynthesizerOptions2_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_AudioPitch
   (
      This       : access ISpeechSynthesizerOptions2_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpeechSynthesizerOptions3 : aliased constant Windows.IID := (1075763319, 36908, 18452, (165, 130, 165, 208, 192, 118, 159, 168 ));
   
   type ISpeechSynthesizerOptions3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppendedSilence
   (
      This       : access ISpeechSynthesizerOptions3_Interface
      ; RetVal : access Windows.Media.SpeechSynthesis.SpeechAppendedSilence
   )
   return Windows.HRESULT is abstract;
   
   function put_AppendedSilence
   (
      This       : access ISpeechSynthesizerOptions3_Interface
      ; value : Windows.Media.SpeechSynthesis.SpeechAppendedSilence
   )
   return Windows.HRESULT is abstract;
   
   function get_PunctuationSilence
   (
      This       : access ISpeechSynthesizerOptions3_Interface
      ; RetVal : access Windows.Media.SpeechSynthesis.SpeechPunctuationSilence
   )
   return Windows.HRESULT is abstract;
   
   function put_PunctuationSilence
   (
      This       : access ISpeechSynthesizerOptions3_Interface
      ; value : Windows.Media.SpeechSynthesis.SpeechPunctuationSilence
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IRandomAccessStreamWithContentType_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   type IContentTypeProvider_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContentType
   (
      This       : access IContentTypeProvider_Imported_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IRandomAccessStream_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Size
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function put_Size
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; value : Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function GetInputStreamAt
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; position : Windows.UInt64
      ; RetVal : access Windows.Storage.Streams.IInputStream
   )
   return Windows.HRESULT is abstract;
   
   function GetOutputStreamAt
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; position : Windows.UInt64
      ; RetVal : access Windows.Storage.Streams.IOutputStream
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function Seek
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; position : Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function CloneStream
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function get_CanRead
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CanWrite
   (
      This       : access IRandomAccessStream_Imported_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IOutputStream_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function WriteAsync
   (
      This       : access IOutputStream_Imported_Interface
      ; buffer : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FlushAsync
   (
      This       : access IOutputStream_Imported_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IInputStream_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function ReadAsync
   (
      This       : access IInputStream_Imported_Interface
      ; buffer : Windows.Storage.Streams.IBuffer
      ; count : Windows.UInt32
      ; options : Windows.Storage.Streams.InputStreamOptions
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type ITimedMetadataTrackProvider_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TimedMetadataTracks
   (
      This       : access ITimedMetadataTrackProvider_Imported_Interface
      ; RetVal : access Windows.Media.Core.IVectorView_ITimedMetadataTrack -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IVoiceInformation : aliased constant Windows.IID := (315886119, 44685, 24496, (143, 237, 0, 22, 93, 89, 198, 171 ));
   
   type IIterator_IVoiceInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IVoiceInformation_Interface
      ; RetVal : access Windows.Media.SpeechSynthesis.IVoiceInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IVoiceInformation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IVoiceInformation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IVoiceInformation_Interface
      ; items : Windows.Media.SpeechSynthesis.IVoiceInformation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IVoiceInformation : aliased constant Windows.IID := (1010023250, 48536, 23692, (173, 238, 238, 141, 160, 98, 142, 252 ));
   
   type IIterable_IVoiceInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IVoiceInformation_Interface
      ; RetVal : access Windows.Media.SpeechSynthesis.IIterator_IVoiceInformation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IVoiceInformation : aliased constant Windows.IID := (4002243534, 20908, 22916, (137, 27, 210, 50, 250, 127, 100, 83 ));
   
   type IVectorView_IVoiceInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IVoiceInformation_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.SpeechSynthesis.IVoiceInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IVoiceInformation_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IVoiceInformation_Interface
      ; value : Windows.Media.SpeechSynthesis.IVoiceInformation
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IVoiceInformation_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.SpeechSynthesis.IVoiceInformation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ISpeechSynthesisStream : aliased constant Windows.IID := (3751626925, 40170, 22028, (158, 220, 203, 136, 82, 203, 85, 227 ));
   
   type IAsyncOperation_ISpeechSynthesisStream_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ISpeechSynthesisStream_Interface
      ; handler : Windows.Media.SpeechSynthesis.AsyncOperationCompletedHandler_ISpeechSynthesisStream
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ISpeechSynthesisStream_Interface
      ; RetVal : access Windows.Media.SpeechSynthesis.AsyncOperationCompletedHandler_ISpeechSynthesisStream
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ISpeechSynthesisStream_Interface
      ; RetVal : access Windows.Media.SpeechSynthesis.ISpeechSynthesisStream
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ISpeechSynthesisStream : aliased constant Windows.IID := (3379739030, 24933, 20692, (175, 96, 168, 195, 223, 81, 208, 146 ));
   
   type AsyncOperationCompletedHandler_ISpeechSynthesisStream_Interface(Callback : access procedure (asyncInfo : Windows.Media.SpeechSynthesis.IAsyncOperation_ISpeechSynthesisStream ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ISpeechSynthesisStream'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISpeechSynthesisStream_Interface
      ; asyncInfo : Windows.Media.SpeechSynthesis.IAsyncOperation_ISpeechSynthesisStream
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype VoiceInformation is Windows.Media.SpeechSynthesis.IVoiceInformation;
   subtype SpeechSynthesisStream is Windows.Media.SpeechSynthesis.ISpeechSynthesisStream;
   subtype SpeechSynthesizerOptions is Windows.Media.SpeechSynthesis.ISpeechSynthesizerOptions;
   subtype SpeechSynthesizer is Windows.Media.SpeechSynthesis.ISpeechSynthesizer;
   function CreateSpeechSynthesizer return Windows.Media.SpeechSynthesis.ISpeechSynthesizer;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function TrySetDefaultVoiceAsync
   (
      voice : Windows.Media.SpeechSynthesis.IVoiceInformation
   )
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   function get_AllVoices
   return Windows.Media.SpeechSynthesis.IVectorView_IVoiceInformation;
   
   function get_DefaultVoice
   return Windows.Media.SpeechSynthesis.IVoiceInformation;
   
end;
