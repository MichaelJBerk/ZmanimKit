//
// Created by Daniel Smith on 8/31/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

/** YomTov
Jewish holidays (and their "eve"s).
*/
public enum YomTov: Int
{
	/// Day prior to Passover
	case erevPesach = 0
	/// Holiday of Passover
	case pesach
	/// Intermediate days of Passover
	case holHamoedPesach
	
	case pesachSheni
	
	/// Day prior to Shavuot
	case erevShavuos
	/// Holiday of Shavuot
	case shavuos
	/// Fast of the 17th of Tammuz
	case seventeenthOfTammuz
	/// Fast of the 9th of Av
	case ninthOfAv
	case tuBeav
	/// Day prior to Rosh Hashana
	case erevRoshHashana
	/// Holiday of Rosh Hashana
	case roshHashana
	/// Fast of Gedalya
	case fastOfGedalya
	/// Day prior to Yom Kippur
	case erevYomKippur
	/// Holiday of Yom Kippur
	case yomKippur
	/// Day prior to Sukkot
	case erevSuccos
	/// Holiday of Sukkot
	case succos
	/// Intermediate days of Sukkot
	case holHamoedSuccos
	/// Final intermediate day of Sukkot
	case hoshanaRabba
	/// Final day of Sukkot. Holiday of Simchat Torah (in Ireael)
	case sheminiAtzeres
	/// Holiday of Simchat Torah (outside of Israel)
	case simchasTorah
	/// Day  prior to the first day of Chanukah
	case erevChanukah
	/// Holiday of Chanukah
	case hanukah
	/// Fast of the 10th of Tevet
	case tenthOfTevet
	
	case tuBeshvat
	/// Fast of Esther
	case fastOfEsther
	/// Holdiay of Purim (outside of Jerusalem)
	case purim
	/// Holiday of Purim (within of Jerusalem)
	case shushanPurim
	/// 14th of Adar I (on a leap year)
	case purimKatan
	/// 15th of Adar I (on a leap year)
	case shushanPuirmKatan
	
	/// Beginning of the New Month
	case roshChodesh
	/// Holocaust Memorial Day
	case yomHashoah
	/// Israeli Memorial Day
	case yomHazikaron
	/// Israeli Independance Day
	case yomHaatzmaut
	/// Jersusalem Independance Day
	case yomYerushalayim
	
	case erevShabbos
	case shabbos
	
	public static var shaloshRegalim: [YomTov] {
		return [.pesach, .succos, .shavuos]
	}
	
	public static var zionistHolidays: [YomTov] {
		return [.yomHashoah, .yomHazikaron, .yomHaatzmaut, .yomYerushalayim]
	}
	public static var fastDays: [YomTov] {
		return [.fastOfEsther, .erevPesach, .seventeenthOfTammuz, .ninthOfAv, .fastOfGedalya, .tenthOfTevet]
	}
	///Days where you can't perform Melacha
	public static var noMelacha: [YomTov] {
		return [.shabbos, .roshHashana, .yomKippur, .succos, .simchasTorah, .sheminiAtzeres, .pesach, .shavuos]
	}
	
	public static var erev: [YomTov] {
		return [.erevShabbos, .erevPesach, .erevSuccos, .erevShavuos, .erevRoshHashana, .erevYomKippur ]
	}
	public static var showCandleLighting: [YomTov] {
		//TODO: Don't include days that we say havdalah
		//It should show on erev yom tov, erev shabbos, and the first day if outside of diaspora
		return noMelacha + erev
	}
	public static var showHavdalah: [YomTov] {
		//TODO: Only show on 2nd day outside of diaspora, or if the following day isn't shabbos
		return noMelacha
	}
	
	public var transliterated: String {
		switch self {
		case .simchasTorah:
			return "Simchas Torah"
		case .succos:
			return "Sukkot"
		case .pesach:
			return "Pesach"
		case .shavuos:
			return "Shavuot"
		case .roshHashana:
			return "Rosh Hashana"
		case .yomKippur:
			return "Yom Kippur"
		case .hoshanaRabba:
			return "Hoshanah Rabbah"
		case .sheminiAtzeres:
			return "Shemini Atzeres"
		case .hanukah:
			return "Chanukkah"
		case .purim:
			return "Purim"
		case .fastOfGedalya:
			return "Tzom Gedalya"
		case .tenthOfTevet:
			return "10th of Tevet"
		case .fastOfEsther:
			return "Taanit Esther"
		case .seventeenthOfTammuz:
			return "17th of Taamuz"
		case .ninthOfAv:
			return "9th of Av"
		case .erevChanukah:
			return "Erev Chanukah"
		case .erevPesach:
			return "Erev Pesach"
		case .erevShavuos:
			return "Erev Shavuot"
		case .erevRoshHashana:
			return "Erev Rosh Hashana"
		case .erevYomKippur:
			return "Erev Yom Kippur"
		case .erevSuccos:
			return "Erev Sukkot"
		case .holHamoedPesach:
			return "Chol Hamoed Pesach"
		case .holHamoedSuccos:
			return "Chol Hamoed Sukkot"
		case .erevShabbos:
			return "Erev Shabbos"
		case .shabbos:
			return "Shabbos"
		case .tuBeshvat:
			return "Tu B'Shvat"
		case .shushanPurim:
			return "Shushan Purim"
		case .yomHashoah:
			return "Yom Hashoah"
		case .yomHazikaron:
			return "Yom Hazikaron"
		case .yomYerushalayim:
			return "Yom Yerushalayim"
		case .pesachSheni:
			return "Pesach Sheni"
		case .tuBeav:
			return "Tu B'av"
		case .purimKatan:
			return "Purim Katan"
		case .shushanPuirmKatan:
			return "Sushan Purim Katan"
		case .roshChodesh:
			return "Rosh Chodesh"
		case .yomHaatzmaut:
			return "Yom Haatzmaut"
		}
	}
}
