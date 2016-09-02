//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

class KSSefiraFormatter
{
	var ashkenazTransliteratedStrings : [String]?
	var sefardTransliteratedStrings : [String]?
	var ashkenazHebrewStrings : [String]?
	var sephardicTransliteratedStrings : [String]?
	var sefardHebrewStrings : [String]?
	var sephardicHebrewStrings : [String]?
	var englishStrings : [String]?
    var custom = KSSefiraCustom.Sefard
    var language = KSSefiraLanguage.Hebrew
	
	init()
	{
	    language = KSSefiraLanguage.Hebrew;
		custom = KSSefiraCustom.Ashkenaz;
	}
	
//	func stringFromInteger(num: Int) -> String?
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
enum KSSefiraCustom: Int
{
    case Ashkenaz //  Uses the bet prefix
    case Sefard   //  Uses the lamed prefix
    case ephardic //  Uses the lamed prefix and sephardic formula
    case Ari      // Chabad - not sure what's different here yet.
}

/**
 *  This flag determines which language to use to display the text.
 */
enum KSSefiraLanguage: Int
{
    case Hebrew                 //  The count, in Hebrew
    case English                //  The count, in English
    case TransliteratedHebrew   //  The count, in Hebrew, spelled in English
}

/**
 *  The options for the formatter.
 *
 *  If the KSSefiraLanguage is not set to KSSefiraLanguageHebrew
 *  or KSSefiraCustom is not KSSefiraCustomAshkenaz, these flags are ignored.
 */
enum KSSefiraPrayerAddition: Int
{
    case LeshaimYichud //= 1 << 0
    case Beracha //= 1 << 1
    case Harachaman //= 1 << 2
    case Lamenatzaiach //= 1 << 3
    case Ana //= 1 << 4
    case Ribono //= 1 << 5
    case Aleinu //= 1 << 6
}
