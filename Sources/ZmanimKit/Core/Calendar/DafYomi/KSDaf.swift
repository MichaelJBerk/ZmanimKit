//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

/** A class that represents a page in the Talmud. */
public class Daf: NSObject
{
    /**
     *  The page number that the given Daf represents.
     */
    public var pageNumber: Int = 0
    
    /**
     *  The index of the tractate.
     *
     *  The index can be translated into a string
     *  by calling displayName or displayNameTransliterated.
     *
     *  - see name()
     *  - see nameTransliterated()
     */
    public var tractateIndex: Int = 0

    public init(tractateIndex: Int, andPageNumber number: Int)
    {
        self.tractateIndex = tractateIndex
        pageNumber = number
    }

    /**
     *  This method returns the display name of a given tractate 
     *  as a Hebrew string.
     *
     *  - returns: A string with hebrew name of the tractate that corresponds to the tractateIndex.
     */
    public func name() -> String
    {
        let names = ["ברכות", "שבת", "עירובין", "פסחים", "שקלים", "יומא", "סוכה", "ביצה", "ראש השנה", "תענית", "מגילה",
        "מועד קטן", "חגיגה", "יבמות", "כתובות", "נדרים", "נזיר", "סוטה", "גיטין", "קידושין", "בבא קמא", "בבא מציעא", "בבא בתרא",
        "סנהדרין", "מכות", "שבועות", "עבודה זרה", "הוריות", "זבחים", "מנחות", "חולין", "בכורות", "ערכין", "תמורה", "כריתות", "מעילה",
        "קינים", "תמיד", "מדות", "נדה"]

        return names[self.tractateIndex]
    }

    /**
     *  This method returns the dispolay name of a given tractate
     *  as a transliterated Hebrew string.
     *
     *  - returns: A string with transliterated name of the tractate that corresponds to the tractateIndex.
     */
    public func nameTransliterated() -> String
    {
        let names: [String] = ["Berachos", "Shabbos", "Eruvin", "Pesachim", "Shekalim", "Yoma", "Sukkah",
                                                 "Beitzah", "Rosh Hashana", "Taanis", "Megillah", "Moed Katan",
                                                 "Chagigah", "Yevamos", "Kesubos", "Nedarim", "Nazir", "Sotah",
                                                 "Gitin", "Kiddushin", "Bava Kamma", "Bava Metzia", "Bava Basra",
                                                 "Sanhedrin", "Makkos", "Shevuos", "Avodah Zarah", "Horiyos",
                                                 "Zevachim", "Menachos", "Chullin", "Bechoros", "Arachin", "Temurah",
                                                 "Kerisos", "Meilah", "Kinnim", "Tamid", "Midos", "Niddah"]

        return names[tractateIndex]
    }

}
