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
--------------------------------------------------------------------------------
package Windows.Globalization.PhoneNumberFormatting is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type PhoneNumberFormat is (
      E164,
      International,
      National,
      Rfc3966
   );
   for PhoneNumberFormat use (
      E164 => 0,
      International => 1,
      National => 2,
      Rfc3966 => 3
   );
   for PhoneNumberFormat'Size use 32;
   
   type PhoneNumberFormat_Ptr is access PhoneNumberFormat;
   
   type PredictedPhoneNumberKind is (
      FixedLine,
      Mobile,
      FixedLineOrMobile,
      TollFree,
      PremiumRate,
      SharedCost,
      Voip,
      PersonalNumber,
      Pager,
      UniversalAccountNumber,
      Voicemail,
      Unknown
   );
   for PredictedPhoneNumberKind use (
      FixedLine => 0,
      Mobile => 1,
      FixedLineOrMobile => 2,
      TollFree => 3,
      PremiumRate => 4,
      SharedCost => 5,
      Voip => 6,
      PersonalNumber => 7,
      Pager => 8,
      UniversalAccountNumber => 9,
      Voicemail => 10,
      Unknown => 11
   );
   for PredictedPhoneNumberKind'Size use 32;
   
   type PredictedPhoneNumberKind_Ptr is access PredictedPhoneNumberKind;
   
   type PhoneNumberParseResult is (
      Valid,
      NotANumber,
      InvalidCountryCode,
      TooShort,
      TooLong
   );
   for PhoneNumberParseResult use (
      Valid => 0,
      NotANumber => 1,
      InvalidCountryCode => 2,
      TooShort => 3,
      TooLong => 4
   );
   for PhoneNumberParseResult'Size use 32;
   
   type PhoneNumberParseResult_Ptr is access PhoneNumberParseResult;
   
   type PhoneNumberMatchResult is (
      NoMatch,
      ShortNationalSignificantNumberMatch,
      NationalSignificantNumberMatch,
      ExactMatch
   );
   for PhoneNumberMatchResult use (
      NoMatch => 0,
      ShortNationalSignificantNumberMatch => 1,
      NationalSignificantNumberMatch => 2,
      ExactMatch => 3
   );
   for PhoneNumberMatchResult'Size use 32;
   
   type PhoneNumberMatchResult_Ptr is access PhoneNumberMatchResult;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IPhoneNumberInfo_Interface;
   type IPhoneNumberInfo is access all IPhoneNumberInfo_Interface'Class;
   type IPhoneNumberInfo_Ptr is access all IPhoneNumberInfo;
   type IPhoneNumberFormatter_Interface;
   type IPhoneNumberFormatter is access all IPhoneNumberFormatter_Interface'Class;
   type IPhoneNumberFormatter_Ptr is access all IPhoneNumberFormatter;
   type IPhoneNumberInfoFactory_Interface;
   type IPhoneNumberInfoFactory is access all IPhoneNumberInfoFactory_Interface'Class;
   type IPhoneNumberInfoFactory_Ptr is access all IPhoneNumberInfoFactory;
   type IPhoneNumberInfoStatics_Interface;
   type IPhoneNumberInfoStatics is access all IPhoneNumberInfoStatics_Interface'Class;
   type IPhoneNumberInfoStatics_Ptr is access all IPhoneNumberInfoStatics;
   type IPhoneNumberFormatterStatics_Interface;
   type IPhoneNumberFormatterStatics is access all IPhoneNumberFormatterStatics_Interface'Class;
   type IPhoneNumberFormatterStatics_Ptr is access all IPhoneNumberFormatterStatics;
   
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
   type IPhoneNumberInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CountryCode
   (
      This       : access IPhoneNumberInfo_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_PhoneNumber
   (
      This       : access IPhoneNumberInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetLengthOfGeographicalAreaCode
   (
      This       : access IPhoneNumberInfo_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function GetNationalSignificantNumber
   (
      This       : access IPhoneNumberInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetLengthOfNationalDestinationCode
   (
      This       : access IPhoneNumberInfo_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function PredictNumberKind
   (
      This       : access IPhoneNumberInfo_Interface
      ; RetVal : access Windows.Globalization.PhoneNumberFormatting.PredictedPhoneNumberKind
   )
   return Windows.HRESULT is abstract;
   
   function GetGeographicRegionCode
   (
      This       : access IPhoneNumberInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function CheckNumberMatch
   (
      This       : access IPhoneNumberInfo_Interface
      ; otherNumber : Windows.Globalization.PhoneNumberFormatting.IPhoneNumberInfo
      ; RetVal : access Windows.Globalization.PhoneNumberFormatting.PhoneNumberMatchResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneNumberInfo : aliased constant Windows.IID := (477947101, 51380, 20131, (154, 239, 179, 66, 226, 197, 180, 23 ));
   
   ------------------------------------------------------------------------
   type IPhoneNumberFormatter_Interface is interface and Windows.IInspectable_Interface;
   
   function Format
   (
      This       : access IPhoneNumberFormatter_Interface
      ; number : Windows.Globalization.PhoneNumberFormatting.IPhoneNumberInfo
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FormatWithOutputFormat
   (
      This       : access IPhoneNumberFormatter_Interface
      ; number : Windows.Globalization.PhoneNumberFormatting.IPhoneNumberInfo
      ; numberFormat : Windows.Globalization.PhoneNumberFormatting.PhoneNumberFormat
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FormatPartialString
   (
      This       : access IPhoneNumberFormatter_Interface
      ; number : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FormatString
   (
      This       : access IPhoneNumberFormatter_Interface
      ; number : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FormatStringWithLeftToRightMarkers
   (
      This       : access IPhoneNumberFormatter_Interface
      ; number : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneNumberFormatter : aliased constant Windows.IID := (358003870, 47828, 19274, (144, 13, 68, 7, 173, 183, 201, 129 ));
   
   ------------------------------------------------------------------------
   type IPhoneNumberInfoFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IPhoneNumberInfoFactory_Interface
      ; number : Windows.String
      ; RetVal : access Windows.Globalization.PhoneNumberFormatting.IPhoneNumberInfo
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneNumberInfoFactory : aliased constant Windows.IID := (2181216612, 44458, 19711, (143, 207, 23, 231, 81, 106, 40, 255 ));
   
   ------------------------------------------------------------------------
   type IPhoneNumberInfoStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function TryParse
   (
      This       : access IPhoneNumberInfoStatics_Interface
      ; input : Windows.String
      ; phoneNumber : access Windows.Globalization.PhoneNumberFormatting.IPhoneNumberInfo
      ; RetVal : access Windows.Globalization.PhoneNumberFormatting.PhoneNumberParseResult
   )
   return Windows.HRESULT is abstract;
   
   function TryParseWithRegion
   (
      This       : access IPhoneNumberInfoStatics_Interface
      ; input : Windows.String
      ; regionCode : Windows.String
      ; phoneNumber : access Windows.Globalization.PhoneNumberFormatting.IPhoneNumberInfo
      ; RetVal : access Windows.Globalization.PhoneNumberFormatting.PhoneNumberParseResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneNumberInfoStatics : aliased constant Windows.IID := (1530875754, 34473, 16617, (134, 73, 109, 97, 22, 25, 40, 212 ));
   
   ------------------------------------------------------------------------
   type IPhoneNumberFormatterStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function TryCreate
   (
      This       : access IPhoneNumberFormatterStatics_Interface
      ; regionCode : Windows.String
      ; phoneNumber : access Windows.Globalization.PhoneNumberFormatting.IPhoneNumberFormatter
   )
   return Windows.HRESULT is abstract;
   
   function GetCountryCodeForRegion
   (
      This       : access IPhoneNumberFormatterStatics_Interface
      ; regionCode : Windows.String
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function GetNationalDirectDialingPrefixForRegion
   (
      This       : access IPhoneNumberFormatterStatics_Interface
      ; regionCode : Windows.String
      ; stripNonDigit : Windows.Boolean
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function WrapWithLeftToRightMarkers
   (
      This       : access IPhoneNumberFormatterStatics_Interface
      ; number : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneNumberFormatterStatics : aliased constant Windows.IID := (1554446641, 34009, 16715, (171, 78, 160, 85, 44, 135, 134, 2 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype PhoneNumberInfo is Windows.Globalization.PhoneNumberFormatting.IPhoneNumberInfo;
   
   function Create
   (
      number : Windows.String
   )
   return Windows.Globalization.PhoneNumberFormatting.IPhoneNumberInfo;
   
   subtype PhoneNumberFormatter is Windows.Globalization.PhoneNumberFormatting.IPhoneNumberFormatter;
   
   function CreatePhoneNumberFormatter return Windows.Globalization.PhoneNumberFormatting.IPhoneNumberFormatter;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function TryParse
   (
      input : Windows.String
      ; phoneNumber : access Windows.Globalization.PhoneNumberFormatting.IPhoneNumberInfo
   )
   return Windows.Globalization.PhoneNumberFormatting.PhoneNumberParseResult;
   
   function TryParseWithRegion
   (
      input : Windows.String
      ; regionCode : Windows.String
      ; phoneNumber : access Windows.Globalization.PhoneNumberFormatting.IPhoneNumberInfo
   )
   return Windows.Globalization.PhoneNumberFormatting.PhoneNumberParseResult;
   
   procedure TryCreate
   (
      regionCode : Windows.String
      ; phoneNumber : access Windows.Globalization.PhoneNumberFormatting.IPhoneNumberFormatter
   )
   ;
   
   function GetCountryCodeForRegion
   (
      regionCode : Windows.String
   )
   return Windows.Int32;
   
   function GetNationalDirectDialingPrefixForRegion
   (
      regionCode : Windows.String
      ; stripNonDigit : Windows.Boolean
   )
   return Windows.String;
   
   function WrapWithLeftToRightMarkers
   (
      number : Windows.String
   )
   return Windows.String;

end;
