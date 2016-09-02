//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

class KSDaf
{
    var pageNumber: Int = 0
    var tractateIndex: Int = 0

    init(tractateIndex: Int, andPageNumber number: Int)
    {
        self.tractateIndex = tractateIndex
        pageNumber = number
    }

    func name() -> String
    {
        let names = ["ברכות", "שבת", "עירובין", "פסחים", "שקלים", "יומא", "סוכה", "ביצה", "ראש השנה", "תענית", "מגילה",
        "מועד קטן", "חגיגה", "יבמות", "כתובות", "נדרים", "נזיר", "סוטה", "גיטין", "קידושין", "בבא קמא", "בבא מציעא", "בבא בתרא",
        "סנהדרין", "מכות", "שבועות", "עבודה זרה", "הוריות", "זבחים", "מנחות", "חולין", "בכורות", "ערכין", "תמורה", "כריתות", "מעילה",
        "קינים", "תמיד", "מדות", "נדה"]

        return names[self.tractateIndex]
    }

    func nameTransliterated() -> String
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