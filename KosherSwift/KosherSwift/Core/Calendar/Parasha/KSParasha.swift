//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

class KSParasha
{
	var transliteratedNames = ["Bereshit", "Noach", "Lech Lecha", "Vayeira", "Chayei Sarah", "Toldot", "Vayeitsei", "Vayishlach", "Vayeishev", "Miketz", "Vayigash", "Vayechi", "Shemot", "Va'era", "Bo", "Beshalach", "Yitro", "Mishpatim", "Terumah", "Tetzaveh", "Terumah - Tetzaveh", "Ki Tissa", "Vayakhel", "Pekudei", "Vayakhel - Pekudei", "Vayikra", "Tzav", "Shemini", "Tazria", "Metzora", "Tazria - Metzorah", "Acharei Mot", "Kedoshim", "Acharei Mot - Kedoshim", "Emor", "Behar", "Bechukotai", "Behar - Bechukotai", "Bamidbar", "Naso", "Beha'alotecha", "Shelach", "Korach", "Chukat", "Balak", "Chukat - Balak", "Pinchas", "Matot", "Masei", "Matot - Masei", "Devarim", "Va'etchanan", "Eikev", "Re'eh", "Shoftim", "Ki Teitzei", "Ki Tavo", "Nitzavim", "Vayeilech", "Nitzavim - Vayeilech", "Ha'azinu", "Vezot Haberacha", "Rosh Hashana", "Yom Kippur", "Sukkot 1", "Chol Hamoed Sukkot", "Shmini Atzeret", "Pesach 1", "Chol Hamoed Pesach", "Pesach 7", "Pesach 8", "Shavuot 2"]
	var names = ["בראשית", "נח", "לך לך", "וירא", "חיי שרה", "תולדות", "ויצא", "וישלח", "וישב", "מקץ", "ויגש", "ויחי", "שמות", "וארא", "בא", "בשלח", "יתרו", "משפטים", "תרומה", "תצוה", "תרומה - תצוה", "כי תשא", "ויקהל", "פקודי", "ויקהל - פקודי", "ויקרא", "צו", "שמיני", "תזריע", "מצורע", "תזריע - מצורע", "אחרי מות", "קדושים", "אחרי מות - קדושים", "אמור", "בהר", "בחקתי", "בהר - בחקתי", "במדבר", "נשא", "בהעלותך", "שלח", "קרח", "חקת", "בלק", "חקת - בלק", "פינחס", "מטות", "מסעי", "מטות - מסעי", "דברים", "ואתחנן", "עקב", "ראה", "שופטים", "כי תצא", "כי תבוא", "נצבים", "וילך", "נצבים - וילך", "האזינו", "וזאת הברכה", "א' ראש השנה", "יום כיפור", "א' סוכות", "חוה\"מ סוכות", "שמיני עצרת", "א' פסח", "חוה\"מ פסח", "ז' פסח", "ח' פסח", "ב' שבועות"]
	var identifier: KSParashot?
	
	init(_identifier: KSParashot)
	{
	    identifier = _identifier
	}
	
	class func parashaWithIdentifier(_identifier: KSParashot) -> KSParasha
	{
	    return KSParasha(_identifier: _identifier)
	}
	
	func name() -> String
	{
	    return names[identifier!.rawValue]
	}
	
	func nameTransliterated() -> String
	{    
	    return transliteratedNames[identifier!.rawValue]
	}
	
	func description() -> String
	{
		return "\(description) : \(nameTransliterated())"
	}
}