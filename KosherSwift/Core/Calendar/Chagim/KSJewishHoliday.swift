//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

class KSJewishHoliday
{
	static var names: [AnyObject]? = nil
	var holidayIndex : Int = 0
    typealias holidayData = (hebrew: String, english: String)
	
	class func holidayWithIndex(index: Int) -> AnyObject
	{
	    let holiday: KSJewishHoliday = KSJewishHoliday()
	    
	    holiday.holidayIndex = index
	    
	    return holiday
	}
	
	func name() -> String
	{
        return holidayNames()[holidayIndex].hebrew
    }
	
	func nameTransliterated() -> String
	{
	    return holidayNames()[holidayIndex].english
	}
	
	func holidayNames() -> [holidayData]
	{
        let names = [(hebrew: "ערב פסח", english: "Erev Pesach"),
                 (hebrew: "פסח", english: "Pesach"),
                 (hebrew: "חול המועד פסח", english: "Chol Hamoed Pesach"),
                 (hebrew: "פסח שני", english: "Pesach Sheni"),
                 (hebrew: "ערב שבועות", english: "Erev Shavuos"),
                 (hebrew: "שבועות", english: "Shavuos"),
                 (hebrew: "שבעה עשר בתמוז", english: "Fast of Seventeenth Of Tammuz"),
                 (hebrew: "תשעה באב", english: "Fast of Ninth of Av"),
                 (hebrew: "ט״ו באב", english: "Tu Be'Av"),
                 (hebrew: "ערב ראש השנה", english: "Erev Rosh Hashana"),
                 (hebrew: "ראש השנה", english: "Rosh Hashana"),
                 (hebrew: "צום גדלי-ה", english: "Fast of Gedalya"),
                 (hebrew: "ערב יום כיפור", english: "Erev Yom Kippur"),
                 (hebrew: "יום כיפור", english: "Yom Kippur"),
                 (hebrew: "ערב סוכות", english: "Erev Sukkot"),
                 (hebrew: "סוכות", english: "Sukkot"),
                 (hebrew: "חול המועד סוכות", english: "Chol Hamoed Sukkot"),
                 (hebrew: "הושנה רבה", english: "Hoshana Rabba"),
                 (hebrew: "שמיני עצרת", english: "Shemini Atzeres"),
                 (hebrew: "שמחת תורה", english: "Simchat Torah"),
                 (hebrew: "ערב חנוכה", english: "Erev Chanukah"),
                 (hebrew: "חנוכה", english: "Chanukah"),
                 (hebrew: "עשרה בטבת", english: "Fast of Tenth of Teves"),
                 (hebrew: "ט״ו בשבט", english: "Tu Be'Shvat"),
                 (hebrew: "תענית אסתר", english: "Fast of Esther"),
                 (hebrew: "פורים", english: "Purim"),
                 (hebrew: "שושן פורים", english: "Shushan Purim"),
                 (hebrew: "פורים קטן", english: "Purim Katan"),
                 (hebrew: "ראש חודש", english: "Rosh Chodesh"),
                 (hebrew: "יום השואה", english: "Yom Hashoah"),
                 (hebrew: "יום הזיכרון", english: "Yom Hazikaron"),
                 (hebrew: "יום העצמאות", english: "Yom Ha'atzma'ut")]
	    
	    return names
	}
}