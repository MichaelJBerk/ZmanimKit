//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

/** This class formats an integer into a sefira day */
public class SefiraFormatter
{
	public var ashkenazTransliteratedStrings : [String]?
	public var sefardTransliteratedStrings : [String]?
	public var ashkenazHebrewStrings : [String]?
	public var sephardicTransliteratedStrings : [String]?
	public var sefardHebrewStrings : [String]?
	public var sephardicHebrewStrings : [String]?
	public var englishStrings : [String]?
    
    /**
     *  The custom for the formatter to use.
     */
    public var custom = SefiraCustom.Sefard
    
    /**
     *  The language for the formatter to use.
     */
    public var language = SefiraLanguage.Hebrew
	
	public init()
	{
	    language = SefiraLanguage.Hebrew;
		custom = SefiraCustom.Ashkenaz;
	}
	
//	public func stringFromInteger(num: Int) -> String?
//	{
//	    if num < 0 || num > 49
//        {
//	        return nil
//	    }
//	    if let composite: [[String]] = [ashkenazHebrewStrings?, sefardHebrewStrings?, sephardicHebrewStrings?]
//        {
//            if language == .English
//            {
//                custom = .Ashkenaz //  There's only one version of English.
//            }
//            
//            return composite[language][custom][integer]
//        }
//	}
}
/**
 *  This flag determines which custom to use when returning a formatted string.
 */
public enum SefiraCustom: Int
{
    case Ashkenaz //  Uses the bet prefix
    case Sefard   //  Uses the lamed prefix
    case ephardic //  Uses the lamed prefix and sephardic formula
    case Ari      // Chabad - not sure what's different here yet.
}

/**
 *  This flag determines which language to use to display the text.
 */
public enum SefiraLanguage: Int
{
    case Hebrew                 //  The count, in Hebrew
    case English                //  The count, in English
    case TransliteratedHebrew   //  The count, in Hebrew, spelled in English
}

/**
 *  The options for the formatter.
 *
 *  If the SefiraLanguage is not set to SefiraLanguageHebrew
 *  or SefiraCustom is not SefiraCustomAshkenaz, these flags are ignored.
 */
public enum SefiraPrayerAddition: Int
{
    case LeshaimYichud //= 1 << 0
    case Beracha //= 1 << 1
    case Harachaman //= 1 << 2
    case Lamenatzaiach //= 1 << 3
    case Ana //= 1 << 4
    case Ribono //= 1 << 5
    case Aleinu //= 1 << 6
}
