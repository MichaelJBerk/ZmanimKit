//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

public class Zman
{
    public var data: [ZMetadata]? = nil
	public var selector: Selector?
//    public typealias ksZmanData = (hebrew: String, english: String, transAsh: String, transSef: String, selector: String, description: String?)
	
	class public func zmanForSelector(selector: Selector) -> Zman
	{
	    return Zman(selector: selector)
	}
	
	public init(selector: Selector)
	{
	    self.selector = selector
	}
	
	public func hebrewName() -> String
	{
	    return ksZmanDataForCurrentZman().hebrew
	}
	
	public func transliteratedNameAshkenazic() -> String
	{
		return ksZmanDataForCurrentZman().ash
	}
	
	public func transliteratedNameSephardic() -> String
	{
	    return ksZmanDataForCurrentZman().sef
	}
	
	public func englishName() -> String
	{
		return ksZmanDataForCurrentZman().eng
	}
	
	public func explanation() -> String?
	{
		return ksZmanDataForCurrentZman().exp
	}
	public func name(from displayName:String) -> String {
		var name:String = displayName
		
		/*
		For english-language strings, this should be able to split the strings into two parts.
		*/
		
		var components:[String] = displayName.components(separatedBy: "(")//.componentsSeparatedByString("(")
		
		/**
		For Hebrew text, it's more complicated...
		
		Some strings are typed in the incorrect order, even if they display as "Time (Opinion)"
		This means that:
		
		1. rangeOfString: (or localized variants) won't give consistent results
		2. Splitting by @"(" is sometimes correct, but other times, we want @")"
		3. Even when that does work, we sometimes get an empty component as the first element of that array
		4. Sometimes the opinion and the Time name are flipped.
		5. Sometimes the opinion and time are grouped, because they were flipped.
		
		*/
		
//		let predicate:NSPredicate = NSPredicate.predicateWithBlock({ (evaluatedObject:AnyObject,bindings:NSDictionary?) in
//			let string:String = evaluatedObject
//
//			return string.length > 0
//		})
		
		/** Handle empty components entry. (case 3) */
		components = components.filter({$0.count > 0})//.filteredArrayUsingPredicate(predicate)
		
		/** Handle grouped time and opinion (case 5) */
		if components.count != 2
		{
			/** Handle flipped time & opinion. (case 4) */
			components = displayName.components(separatedBy: ")").reversed()//.componentsSeparatedByString(")").reverseObjectEnumerator().allObjects()
			
			/** Handle empty components entry. (case 3) */
			components = components.filter({$0.count > 0})//.filteredArrayUsingPredicate(predicate)
		}
		if components.count > 1 {
			name = components[0]
		}
		
		
		/** In all cases trim whitespace. */
		name = name.trimmingCharacters(in: .whitespacesAndNewlines)//.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
		
		return name
	}
	
	public func rabbinicOpinion(from displayName:String) -> String? {
		var opinion:String = ""
		
		let parenthesis:CharacterSet = .init(charactersIn: "()")
		
		/**
		Because of the complexities outlined in `nameFromDisplayName:`,
		we need to do some manual labor here...
		
		We can't get the rabbinic opinion by replacing the name with an empty string,
		then trimming parenthesis and whitespace because the hebrew word for degrees "מעלות"
		contains the word for dawn: עלות.
		*/
		
		var name:String = displayName
		
		/*
		For english-language strings, this should be able to split the strings into two parts.
		*/
		
		var components:[String] = displayName.components(separatedBy: "(")
		
		/**
		For Hebrew text, it's more complicated...
		
		Some strings are typed in the incorrect order, even if they display as "Time (Opinion)"
		This means that:
		
		1. rangeOfString: (or localized variants) won't give consistent results
		2. Splitting by @"(" is sometimes correct, but other times, we want @")"
		3. Even when that does work, we sometimes get an empty component as the first element of that array
		4. Sometimes the opinion and the Time name are flipped.
		5. Sometimes the opinion and time are grouped, because they were flipped.
		
		*/
		
//		let predicate:NSPredicate = NSPredicate(block:{ (evaluatedObject:Any,bindings:[String: Any]?) in
//			let string:String = evaluatedObject
//
//			return string.length > 0
//		})
		
		/** Handle empty components entry. (case 3) */
		components = components.filter({$0.count > 0})
		
		/** Handle grouped time and opinion (case 5) */
		if components.count != 2
		{
			/** Handle flipped time & opinion. (case 4) */
			components = displayName.components(separatedBy: ")").reversed()//.componentsSeparatedByString(")").reverseObjectEnumerator().allObjects()
			
			/** Handle empty components entry. (case 3) */
			
			components = components.filter({$0.count > 0})//.filteredArrayUsingPredicate(predicate)
		}
		
		/**
		If there's no opinion, there will be only one component
		at this point. We'll want to skip in this case.
		*/
		if components.count > 1
		{
			name = components.last!
			
			/** Some strings will have an extra parenthesis at this point.*/
			name = name.trimmingCharacters(in: parenthesis)//.stringByTrimmingCharactersInSet(parenthesis)
			
			/** In all cases trim whitespace. */
			name = name.trimmingCharacters(in: .whitespacesAndNewlines)//NSCharacterSet.whitespaceAndNewlineCharacterSet())
			
			opinion = name
		}
		return opinion
	}

	
	public func relatedZmanim() -> [String]
	{
	    
	    let selectorAsString: String = NSStringFromSelector(selector!)
		var related: [String] = [selectorAsString] //  By default, return the array of just this selector.
	    
	    /**
	     *  All of the related sets
	     */
	    let sets: [[String]] = [["shaahZmanisMogenAvraham", "shaahZmanisGra", "shaahZmanis16Point1Degrees", "shaahZmanis18Degrees", "shaahZmanis19Point8Degrees", "shaahZmanis26Degrees", "shaahZmanis60Minutes", "shaahZmanis72Minutes", "shaahZmanis72MinutesZmanis", "shaahZmanis90Minutes", "shaahZmanis90MinutesZmanis", "shaahZmanis96Minutes", "shaahZmanis96MinutesZmanis", "shaahZmanisAteretTorah", "shaahZmanis120Minutes", "shaahZmanis120MinutesZmanis"], ["alosHashachar", "alos72", "alos60", "alos72Zmanis", "alos90", "alos90Zmanis", "alos96", "alos96Zmanis", "alos120", "alos120Zmanis", "alos26Degrees", "alos18Degrees", "alos19Point8Degrees", "alos16Point1Degrees"], ["misheyakir10Point2Degrees", "misheyakir11Degrees", "misheyakir11Point5Degrees", "misheyakirAteretTorahWithMinutes:"], ["sunrise"], ["sofZmanShmaGra", "sofZmanShmaMogenAvraham", "sofZmanShmaFixedLocal", "sofZmanShmaMGA19Point8Degrees", "sofZmanShmaMGA16Point1Degrees", "sofZmanShmaMGA72Minutes", "sofZmanShmaMGA72MinutesZmanis", "sofZmanShmaMGA90Minutes", "sofZmanShmaMGA90MinutesZmanis", "sofZmanShmaMGA96Minutes", "sofZmanShmaMGA96MinutesZmanis", "sofZmanShma3HoursBeforeChatzos", "sofZmanShmaMGA120Minutes", "sofZmanShmaAlos16Point1ToSunset", "sofZmanShmaAlos16Point1ToTzaisGeonim7Point083Degrees"], ["sofZmanTfilaMogenAvraham", "sofZmanTfilaGra", "sofZmanTfilaFixedLocal", "sofZmanTfilaMGA19Point8Degrees", "sofZmanTfilaMGA16Point1Degrees", "sofZmanTfilaMGA72Minutes", "sofZmanTfilaMGA72MinutesZmanis", "sofZmanTfilaMGA90Minutes", "sofZmanTfilaMGA90MinutesZmanis", "sofZmanTfilaMGA96Minutes", "sofZmanTfilaMGA96MinutesZmanis", "sofZmanTfilaMGA120Minutes", "sofZmanTfila2HoursBeforeChatzos"], ["chatzos", "fixedLocalChatzos"], ["minchaGedola", "minchaGedola30Minutes", "minchaGedola72Minutes", "minchaGedola16Point1Degrees", "minchaGedola30Minutes", "minchaGedolaGreaterThan30", "minchaGedola16Point1Degrees", "minchaGedolaAteretTorah"], ["minchaKetana", "minchaKetana16Point1Degrees", "minchaKetana72Minutes", "minchaKetanaAteretTorah"], ["plagHamincha", "plagHamincha60Minutes", "plagHamincha72Minutes", "plagHamincha72MinutesZmanis", "plagHamincha90Minutes", "plagHamincha90MinutesZmanis", "plagHamincha96Minutes", "plagHamincha96MinutesZmanis", "plagHamincha16Point1Degrees", "plagHamincha18Degrees", "plagHamincha19Point8Degrees", "plagHamincha26Degrees", "plagAlosToSunset", "plagAlos16Point1ToTzaisGeonim7Point083Degrees"], ["sunset"], ["bainHashmashosRT13Degrees", "bainHashmashosRT58Point5Minutes", "bainHashmashosRT13Point5MinutesBefore7Point083Degrees", "bainHashmashosRT2Stars"], ["tzais", "tzaisGeonim5Point95Degrees", "tzaisGeonim5Point88Degrees", "tzaisGeonim3Point65Degrees", "tzaisGeonim4Point37Degrees", "tzaisGeonim4Point61Degrees", "tzaisGeonim4Point8Degrees", "tzaisGeonim7Point083Degrees", "tzaisGeonim8Point5Degrees", "tzais50", "tzais60", "tzaisAteretTorah", "tzais72", "tzais72Zmanis", "tzais90", "tzais90Zmanis", "tzais96", "tzais96Zmanis", "tzais120", "tzais120Zmanis", "tzais16Point1Degrees", "tzais26Degrees", "tzais18Degrees", "tzais19Point8Degrees"], ["sofZmanAchilasChametzGra", "sofZmanAchilasChametzMGA72Minutes", "sofZmanAchilasChametzMGA16Point1Degrees"], ["sofZmanBiurChametzGra", "sofZmanBiurChametzMGA72Minutes", "sofZmanBiurChametzMGA16Point1Degrees"]]

	    for arr in sets
	    {
	        if arr.contains(selectorAsString)
	        {
	            related = arr
	            break
	        }
	    }
	    
	    return related
	}
	
	public static func metadata() -> DictionaryLiteral<String, [String: String]> {
		var data: DictionaryLiteral<String, [String: String]> = .init()
		return data
		
	}

	public func getMetadata() {
		
			let jd = JSONDecoder()
		let b = Bundle(for: Self.self)
		print(b.bundleURL)
		let bp = try? FileManager.default.contentsOfDirectory(atPath: "file:///var/containers/Bundle/Application/E1A74A8E-3EC8-4DA2-8E0C-5A1A187BE267/ZmanApp.app/Frameworks/SwiftZmanim.framework/SwiftZmanim" )//+ "SwiftZmanim")
		print(bp)
			let d = Bundle.init(for: Self.self).url(forResource: "ZmanMetadata", withExtension: "json")!
			let jsonData = try! Data(contentsOf: d)
			let decodedData = try! jd.decode([ZMetadata].self, from: jsonData)
			self.data = decodedData
	}
	
	public func ksZmanDataForCurrentZman() -> ZMetadata {
		if self.data == nil {
			getMetadata()
		}
		return (self.data?.first(where: {$0.selector == String(_sel: selector!)}))!
	}
	
//	public func oldksZmanDataForCurrentZman() -> ksZmanData
//	{
//	    if data == nil
//		{
//			data = [(hebrew: "(שעה זמנית (מ״א)", english: "Temporal Hour (M'A)", transAsh: "Sha'ah Zmanis (Mogen Avraham)", transSef: "Sha'ah Zmanit (Mogen Avraham)", selector: "shaahZmanisMogenAvraham", description: " A shaah zmanis (temporal hour) according to the opinion of the Mogen Avraham. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk (for Sof Zman Shema  and tfila). Dawn for this calculation is 72 minutes before sunrise and dusk is 72 minutes after sunset. This day is split into 12 equal parts with each part being a temporal hour."),
//					(hebrew: "שעה זמנית (גר״א)", english: "Temporal Hour (Gr'a)", transAsh: "Sha'ah Zmanis (Gr'a)", transSef: "Sha'ah Zmanit (Gr'a)", selector: "shaahZmanisGra", description: "A shaah zmanis (temporal hour) according to the opinion of the Gra and the Baal Hatanya. This calculation divides the day based on the opinion of the GRA and the Baal Hatanya that the day runs from sunrise to  sunset. The calculations are based on a day from sea level sunrise to sea level sunset. The day is split into 12 equal parts with each one being a shaah zmanis. An explanation and detailed sources for not using elevation for anything besides sunrise and sunset can be found in Zmanim Kehilchasam (second edition published in 2007) by Rabbi Dovid Yehuda Bursztyn chapter 2 (pages 186-187)."),
//					(hebrew: "שעה זמנית (16.1 מעלות)", english: "Temporal Hour (16.1 Degrees)", transAsh: "Sha'ah Zmanis (16.1 Maalos)", transSef: "Sha'ah Zmanit (16.1 Maalot)", selector: "shaahZmanis16Point1Degrees", description: "A shaah zmanis (temporal hour) calculated using a 16.1 degree dip. This calculation divides the day based on the opinion that the day runs from dawn to dusk. Dawn for this calculation is  when the sun is 16.1 degrees below the eastern geometric horizon before sunrise. Dusk for this is when the sun is 16.1 degrees below the western geometric horizon after sunset. This day is split into 12 equal parts with each part being a shaah zmanis."),
//					(hebrew: "שעה זמנית (18 מעלות)", english: "Temporal Hour (18 Degrees)", transAsh: "Sha'ah Zmanis (18 Maalos)", transSef: "Sha'ah Zmanit (18 Maalos)", selector: "shaahZmanis18Degrees", description: "A shaah zmanis (temporal hour) calculated using an 18 degree dip. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is  when the sun is 18 degrees below the eastern geometric horizon before sunrise. Dusk for this is when the sun is 18 degrees below the western geometric horizon after sunset. This day is split into 12 equal parts with each part being a shaah zmanis."),
//					(hebrew: "שעה זמנית (19.8 מעלות)", english: "Temporal Hour (19.8 Degrees)", transAsh: "Sha'ah Zmanis (19.8 Maalos)", transSef: "Sha'ah Zmanit (19.8 Maalot)", selector: "shaahZmanis19Point8Degrees", description: "A shaah zmanis (temporal hour) calculated using a 19.8 degree dip. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is  when the sun is 19.8 degrees below the eastern geometric horizon before sunrise. Dusk for this is when the sun is 19.8 degrees below the western geometric horizon after sunset. This day is split into 12 equal parts with each part being a shaah zmanis"),
//					(hebrew: "שעה זמנית (26 מעלות)", english: "Temporal Hour (26 Degrees)", transAsh: "Sha'ah Zmanis (26 Maalos)", transSef: "Sha'ah Zmanit (26 Maalot)", selector: "shaahZmanis26Degrees", description: "Method to return a shaah zmanis (temporal hour) calculated using a 26 degree dip. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is  when the sun is 26 degrees below the eastern geometric horizon before sunrise. Dusk for this is when the sun is 26 degree below the western geometric horizon after sunset. This day is split into 12 equal parts with each part being a shaah zmanis."),
//					(hebrew: "שעה זמנית (60 דקות)", english: "Temporal Hour (60 Minutes)", transAsh: "Sha'ah Zmanis (60 Dakos)", transSef: "Sha'ah Zmanit (60 Dakot)", selector: "shaahZmanis60Minutes", description: "Method to return a shaah zmanis (solar hour) according to the opinion of the Mogen Avraham. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is 60 minutes before sunrise and dusk is 60 minutes after sunset. This day is split into 12 equal parts with each part being a shaah zmanis."),
//					(hebrew: "שעה זמנית (72 דקות)", english: "Temporal Hour (72 Minutes)", transAsh: "Sha'ah Zmanis (72 Dakos)", transSef: "Sha'ah Zmanit (72 Dakot)", selector: "shaahZmanis72Minutes", description: "Method to return a shaah zmanis (solar hour) according to the opinion of the Mogen Avraham. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is 72 minutes before sunrise and dusk is 72 minutes after sunset. This day is split into 12 equal parts with each part being a shaah zmanis."),
//					(hebrew: "שעה זמנית (72 דקות זמנית)", english: "Temporal Hour (72 Temporal Minutes)", transAsh: "Sha'ah Zmanis (72 Dakos Zmanis)", transSef: "Sha'ah Zmanit (72 Dakot Zmanit)", selector: "shaahZmanis72MinutesZmanis", description: "Method to return a shaah zmanis (temporal hour) according to the opinion of the Mogen Avraham based on alos being 72 minutes zmaniyos before sunrise. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is 72 minutes zmaniyos before sunrise and dusk is 72 minutes zmaniyos after sunset. This day is split into 12 equal parts with each part being a shaah zmanis. This is identical to 1/10th of the day from sunrise to sunset."),
//					(hebrew: "שעה זמנית (90 דקות)", english: "Temporal Hour (90 Minutes)", transAsh: "Sha'ah Zmanis (90 Dakos)", transSef: "Sha'ah Zmanit (90 Dakot)", selector: "shaahZmanis90Minutes", description: "Method to return a shaah zmanis (temporal hour) calculated using a dip of 90 minutes. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is 90 minutes before sunrise and dusk is 90 minutes after sunset. This day is split into 12 equal parts with each part being a shaah zmanis."),
//					(hebrew: "שעה זמנית (90 דקות זמנית)", english: "Temporal Hour (90 Temporal Minutes)", transAsh: "Sha'ah Zmanis (90 Dakos Zmanis)", transSef: "Sha'ah Zmanit (90 Dakot Zmanit)", selector: "shaahZmanis90MinutesZmanis", description: "Method to return a shaah zmanis (temporal hour) according to the opinion of the Mogen Avraham based on alos being 90 minutes zmaniyos before sunrise. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is 90 minutes zmaniyos before sunrise and dusk is 90 minutes zmaniyos after sunset. This day is split into 12 equal parts with each part being a shaah zmanis. This is identical to 1/8th of the day from sunrise to sunset."),
//					(hebrew: "שעה זמנית (96 דקות)", english: "Temporal Hour (96 Minutes)", transAsh: "Sha'ah Zmanis (96 Dakos)", transSef: "Sha'ah Zmanit (96 Dakot)", selector: "shaahZmanis96Minutes", description: "Method to return a shaah zmanis (temporal hour) calculated using a dip of 96 minutes. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is 96 minutes before sunrise and dusk is 96 minutes after sunset. This day is split into 12 equal parts with each part being a shaah zmanis."),
//					(hebrew: "שעה זמנית (96 דקות זמנית)", english: "Temporal Hour (96 Temporal Minutes)", transAsh: "Sha'ah Zmanis (96 Dakos Zmanis)", transSef: "Sha'ah Zmanit (96 Dakot Zmanit)", selector: "shaahZmanis96MinutesZmanis", description: "Method to return a shaah zmanis (temporal hour) according to the opinion of the Mogen Avraham based on alos being 96 minutes zmaniyos before sunrise. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is 96 minutes zmaniyos before sunrise and dusk is 96 minutes zmaniyos after sunset. This day is split into 12 equal parts with each part being a shaah zmanis. This is identical to 1/7.5th of the day from sunrise to sunset."),
//					(hebrew: "שעה זמנית (עטרת תורה)", english: "Temporal Hour (Ateret Torah)", transAsh: "Sha'ah Zmanis (Ateret Torah)", transSef: "Sha'ah Zmanit (Ateret Torah)", selector: "shaahZmanisAteretTorah", description: "Method to return a shaah zmanis (temporal hour) according to the opinion of the Chacham Yosef Harari-Raful of Yeshivat Ateret Torah calculated with alos being 1/10th of sunrise to sunset day, or 72 minutes zmaniyos of such a day before sunrise, and tzais is usually calculated as 40 minutes (configurable to any offset by modifying AteretTorahSunsetOffset) after sunset. This day is split into 12 equal parts with each part being a shaah zmanis. Note that with this system, chatzos (mid-day) will not be the point that the sun is halfway across the sky."),
//					(hebrew: "שעה זמנית (120 דקות)", english: "Temporal Hour (120 Minutes)", transAsh: "Sha'ah Zmanis (120 Dakos)", transSef: "Sha'ah Zmanit (120 Dakot)", selector: "shaahZmanis120Minutes", description: "A shaah zmanis (temporal hour) calculated using a dip of 120 minutes. This calculation divides the day based on the opinion of the Mogen Avraham that the day runs from dawn to dusk. Dawn for this calculation is 120 minutes before sunrise and dusk is 120 minutes after sunset. This day is split into 12 equal parts with each part being a shaah zmanis."),
//					(hebrew: "שעה זמנית (120 דקות זמנית)", english: "Temporal Hour (120 Temporal Minutes)", transAsh: "Sha'ah Zmanis (120 Dakos Zmanis)", transSef: "Sha'ah Zmanit (120 Dakot Zmanit)", selector: "shaahZmanis120MinutesZmanis", description: "The time of plag hamincha based on sunrise being 120 minutes zmaniyos (GRA and the Baal Hatanya) or 1/6th of the day before sea level sunrise. This is calculated as 10.75 hours after dawn. The formula used is: 10.75 * ShaahZmanis120MinutesZmanis after dawn."),
//					(hebrew: "עלות השחר", english: "Dawn", transAsh: "Alos HaShachar", transSef: "Alot HaShachar", selector: "alosHashachar", description: "Dawn, based on the time when the sun is 16.1 degrees below the eastern geometric horizon before sunrise. In some places, this calculation can't be computed, such as northern and southern locations even south of the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough below the horizon for this calculation."),
//					(hebrew: "עלות השחר (72 דקות)", english: "Dawn (72 Minutes)", transAsh: "Alos HaShachar (72 Dakos)", transSef: "Alot HaShachar (72 Dakot)", selector: "alos72", description: " Dawn, calculated using 72 minutes before sunrise at sea level (no adjustment for elevation) based on the time to walk the distance of 4 \"mil\" at 18 minutes a \"mil\". This is based on the opinion of most rishonim who stated that the time of the \"neshef\" (time between dawn and sunrise) does not vary by the time of year or location but purely depends on the time it takes to walk the distance of 4 \"mil.\""),
//					(hebrew: "(עלות השחר (60 דקות", english: "Dawn (60 Minutes)", transAsh: "Alos HaShachar (60 Dakos)", transSef: "Alot HaShachar (60 Dakot)", selector: "alos60", description: "Dawn calculated as 60 minutes before sea level sunrise. This is the time to walk the distance of 4 \"mil\" at 15 minutes a \"mil\" (the opinion of the Chavas Yair. See the Divrei Malkiel). Time based offset calculations for alos are based on the opinion of most Rishonim who stated that the time of the \"neshef\" (time between dawn and sunrise) does not vary by the time of year or location but purely depends on the time it takes to walk the distance of 4 \"mil.\""),
//					(hebrew: "(עלות השחר (72 דקות זמנית", english: "Dawn (72 Temporal Minutes)", transAsh: "Alos HaShachar (72 Dakos Zmanis)", transSef: "Alot HaShachar (72 Dakot Zmanit)", selector: "alos72Zmanis", description: "Dawn calculated using 72 minutes zmaniyos (GRA and the Baal Hatanya) or 1/10th of the day before sea level sunrise. This is based on an 18 minute \"mil\" so the time for 4 \"mil\" is 72 minutes which is 1/10th of a day (12 * 60 = 720) based on the day starting at sea level sunrise and ending at sea level sunset. This calculation is used in the calendars published by Hisachdus Harabanim D'Artzos Habris Ve'Canada."),
//					(hebrew: "(עלות השחר (90 דקות", english: "Dawn (90 Minutes)", transAsh: "Alos HaShachar (90 Dakos)", transSef: "Alot HaShachar (90 Dakot)", selector: "alos90", description: "Dawn calculated as 90 minutes before sea level sunrise based on the time to walk the distance of 4 \"mil\" at 22.5 minutes per \"mil.\" Time based offset calculations for alos are based on the opinion of most Rishonim who stated that the time of the \"neshef\" (time between dawn and sunrise) does not vary by the time of year or location but purely depends on the time it takes to walk the distance of 4 \"mil.\""),
//					(hebrew: "(עלות השחר (90 דקות זמנית", english: "Dawn (90 Temporal Minutes)", transAsh: "Alos HaShachar (90 Dakos Zmanis)", transSef: "Alot HaShachar (90 Dakot Zmanit)", selector: "alos90Zmanis", description: "Dawn calculated using 90 minutes zmaniyos (GRA and the Baal Hatanya) or 1/10th of the day before sea level sunrise. This is based on an 22.5 minute \"mil\" so the time for 4 \"mil\" is 90 minutes which is 1/8th of a day (12 * 60) / 8 = 90 based on the day starting at sea level sunrise and ending at sea level sunset. This calculation is used in the calendars published by Hisachdus Harabanim D'Artzos Habris Ve'Canada."),
//					(hebrew: "(עלות השחר (96 דקות", english: "Dawn (96 Minutes)", transAsh: "Alos HaShachar (96 Dakos)", transSef: "Alot HaShachar (96 Dakot)", selector: "alos96", description: "Dawn calculated using 96 minutes before sea level sunrise based on the time to walk the distance of 4 \"mil\" at 24 minutes a \"mil.\" Time based offset calculations for alos are based on the opinion of most Rishonim who stated that the time of the \"neshef\" (time between dawn and sunrise) does not vary by the time of year or location but purely depends on the time it takes to walk the distance of 4 \"mil.\""),
//					(hebrew: "(עלות השחר (96 דקות זמנית", english: "Dawn (96 Temporal Minutes)", transAsh: "Alos HaShachar (96 Dakos Zmanis)", transSef: "Alot HaShachar (96 Dakot Zmanit)", selector: "alos96Zmanis", description: "Method to return alos (dawn) calculated using 120 minutes before sea level sunrise (no adjustment for elevation is made) based on the time to walk the distance of 5 \"mil\" (Ula) at 24 minutes a \"mil.\" Time based offset calculations for alos are based on the opinion of most Rishonim who stated that the time of the \"neshef\" (time between dawn and sunrise) does not vary by the time of year or location but purely depends on the time it takes to walk the distance of 5 \"mil\" (Ula)."),
//					(hebrew: "(עלות השחר (120 דקות", english: "Dawn (120 Minutes)", transAsh: "Alos HaShachar (120 Dakos)", transSef: "Alot HaShachar (120 Dakot)", selector: "alos120", description: "Dawn calculated using 120 minutes before sea level sunrise (no adjustment for elevation is made) based on the time to walk the distance of 5 \"Mil\" (Ula) at 24 minutes a \"mil.\" Time based offset calculations for alos are based on the opinion of most Rishonim who stated that the time of the Neshef (time between dawn and sunrise) does not vary by the time of year or location but purely depends on the time it takes to walk the distance of 5 \"mil\"(Ula)."),
//					(hebrew: "(עלות השחר (120 דקות זמנית", english: "Dawn (120 Temporal Minutes)", transAsh: "Alos HaShachar (120 Dakos Zmanis)", transSef: "Alot HaShachar (120 Dakot Zmanit)", selector: "alos120Zmanis", description: "Method to return alos (dawn) calculated using 120 minutes zmaniyos (GRA and the Baal Hatanya) or 1/6th of the day before sea level sunrise. This is based on a 24 minute \"mil\" so the time for 5 \"mil\" is 120 minutes which is 1/6th of a day (12 * 60) / 6 = 120 based on the day starting at sunrise and ending at sunset."),
//					(hebrew: "(עלות השחר (26 מעלות", english: "Dawn (26 Degrees)", transAsh: "Alos HaShachar (26 Ma'alos)", transSef: "Alot HaShachar (26 Ma'alot)", selector: "alos26Degrees", description: "Dawn calculated when the sun is 26° below the eastern geometric horizon before sunrise. This calculation is based on the same calculation of 120 minutes but uses a degree based calculation instead of 120 exact minutes. This calculation is based on the position of the sun 120 minutes before sunrise in Jerusalem during the equinox which calculates to 26° below geometric zenith."),
//					(hebrew: "(עלות השחר (18 מעלות", english: "Dawn (18 Degrees)", transAsh: "Alos HaShachar (18 Ma'alos)", transSef: "Alot HaShachar (18 Ma'alot)", selector: "alos18Degrees", description: "Dawn calculated when the sun is 18° below the eastern geometric horizon before sunrise."),
//					(hebrew: "(עלות השחר (19.8 מעלות", english: "Dawn (19.8 Degrees)", transAsh: "Alos HaShachar (19.8 Ma'alos)", transSef: "Alot HaShachar (19.8 Ma'alot)", selector: "alos19Point8Degrees", description: "Dawn calculated when the sun is 19.8° below the eastern geometric horizon before sunrise.  This calculation is based on the same calculation of 90 minutes but uses a degree based calculation instead of 90 exact minutes. This calculation is based on the position of the sun 90 minutes before sunrise in Jerusalem during the equinox which calculates to 19.8° below geometric zenith."),
//					(hebrew: "(עלות השחר (16.1 מעלות", english: "Dawn (16.1 Degrees)", transAsh: "Alos HaShachar (16.1 Ma'alos)", transSef: "Alot HaShachar (16.1 Ma'alot)", selector: "alos16Point1Degrees", description: "Dawn calculated when the sun is 16.1° below the eastern geometric horizon before sunrise. This calculation is based on the same calculation of 72 minutes but uses a degree based calculation instead of 72 exact minutes. This calculation is based on the position of the sun 72 minutes before sunrise in Jerusalem during the equinox which calculates to 16.1° below geometric zenith."),
//					(hebrew: "משיכיר (10.20 מעלות)", english: "First Sunlight (10.20 Degrees)", transAsh: "Misheyakir (10.20 Ma'alos)", transSef: "Misheyakir (10.20 Ma'alot)", selector: "misheyakir10Point2Degrees", description: "Based on the position of the sun when it is 10.2° below the geometric zenith (90°). This calculation is used for calculating misheyakir according to some opinions. This calculation is based on the position of the sun 45 minutes before sunrise in Jerusalem during the equinox which calculates to 10.2° below geometric zenith."),
//					(hebrew: "משיכיר (11 מעלות)", english: "First Sunlight (11 Degrees)", transAsh: "Misheyakir (11 Ma'alos)", transSef: "Misheyakir (11 Ma'alot)", selector: "misheyakir11Degrees", description: "Based on the position of the sun when it is 11° below for calculating misheyakir according to some opinions. This calculation is based on the position of the sun 48 minutes beforesunrise in Jerusalem during the equinox which calculates to 11° below geometric zenith."),
//					(hebrew: "משיכיר (11.5 מעלות)", english: "First Sunlight (11.5 Degrees)", transAsh: "Misheyakir (11.5 Ma'alos)", transSef: "Misheyakir (11.5 Ma'alot)", selector: "misheyakir11Point5Degrees", description: "Based on the position of the sun when it is 11.5° below for calculating misheyakir according to some opinions. This calculation is based on the position of the sun 52 minutes before sunrise in Jerusalem during the equinox which calculates to 11.5.° below geometric zenith."),
//					(hebrew: "משיכיר (עטרת תורה)", english: "First Sunlight (Ateret Torah)", transAsh: "Misheyakir (Ateret Torah)", transSef: "Misheyakir (Ateret Torah)", selector: "misheyakirAteretTorahWithMinutes:", description: "This method calculates the misheyakir as an offset the Alos 72 minutes, zmanis calculation."),
//					(hebrew: "נץ החמה", english: "Sunrise", transAsh: "Naitz HAchama", transSef: "Netz Hachama", selector: "sunrise", description: "Sunrise at the current location. The zenith used for the calculation uses geometric zenith of 90 degrees plus elevation. This is adjusted to add approximately 50/60 of a degree to account for 34 archminutes of refraction and 16 archminutes for the sun's radius for a total of 90.83333 degrees."),
//					(hebrew: "סוף זמן קריאת שמע (גר״א)", english: "Latest Shema (Gr'a)", transAsh: "Sof Zman Shema  (Gr\"a)", transSef: "Sof Zman Shema (Gr\"a)", selector: "sofZmanShmaGra", description: "This time is 3 solar hours after sea level sunrise based on the opinion of the Vilna Gaon and the Baal Hatanya that the day is calculated from sunrise to sunset."),
//					(hebrew: "סוף זמן קריאת שמע (מ״א)", english: "Latest Shema (M\"A)", transAsh: "Sof Zman Shema  (M\"A)", transSef: "Sof Zman Shema (M\"A)", selector: "sofZmanShmaMogenAvraham", description: "The latest time to recite shema in the morning in the opinion of the Mogen Avraham based on alos being 72 minutes before sunrise. This time is 3 solar hours after dawn based on the opinion of the Mogen Avraham that the day is calculated from a dawn of 72 minutes before sunrise to nightfall of 72 minutes after sunset."),
//					(hebrew: "סוף זמן קריאת שמע (קבוע)", english: "Latest Shema (Kavuah)", transAsh: "Sof Zman Shema  (Kavua)", transSef: "Sof Zman Shema (Fixed Local)", selector: "sofZmanShmaFixedLocal", description: "The latest time  to recite Shema in the morning calculated as 3 hours before fixed local chatzos."),
//					(hebrew: "סוף זמן קריאת שמע (19.8 מעלות)", english: "Latest Shema (19.8 Degrees)", transAsh: "Sof Zman Shema  (19.8 Maalos)", transSef: "Sof Zman Shema (19.8 Ma'alot)", selector: "sofZmanShmaMGA19Point8Degrees", description: "The latest zman krias shema (time to recite Shema in the morning) according to the opinion of the Mogen Avraham based on alos being 19.8° before sunrise. This time is 3 solar hours after dawn based on the opinion of the MGA that the day is calculated from dawn to nightfall with both being 19.8° below sunrise or sunset."),
//					(hebrew: "(16.1 מעלות) סוף זמן קריאת שמע", english: "Latest Shema (16.1 Degrees)", transAsh: "Sof Zman Shema  (16.1 Maalos)", transSef: "Sof Zman Shema (16.1 Ma'alot)", selector: "sofZmanShmaMGA16Point1Degrees", description: "the latest time to recite Shema in the morning according to the opinion of the Mogen Avraham  based on alos being 16.1° before sunrise. This time is 3 solar hours after dawn based on the opinion of the MGA that the day is calculated from dawn to nightfall with both being 16.1° below sunrise or sunset."),
//					(hebrew: "(72 דקות) סוף זמן קריאת שמע", english: "Latest Shema (72 Minutes)", transAsh: "Sof Zman Shema  (72 Dakos)", transSef: "Sof Zman Shema (Dakot)", selector: "sofZmanShmaMGA72Minutes", description: "The latest time to recite Shema in the morning according to the opinion of the Mogen Avraham based on alos being 72 minutes before sunrise. This time is 3 shaos solar hours after dawn based on the opinion of the Mogen Avraham that the day is calculated from a dawn of 72 minutes before sunrise to nightfall of 72 minutes after sunset."),
//					(hebrew: "(72 דקות זמנית) סוף זמן קריאת שמע", english: "Latest Shema (72 Temporal Minutes)", transAsh: "Sof Zman Shema  (72 Dakos Zmanis)", transSef: "Sof Zman Shema (72 Dakot Zmanit)", selector: "sofZmanShmaMGA72MinutesZmanis", description: "Latest time to recite Shema in the morning) according to the opinion of the Mogen Avraham based on dawn being 72 temporal minutes, or 1/10th of the day before sunrise. This time is 3 shaos solar hours after dawn based on the opinion of the Mogen Avraham that the day is calculated from a dawn of 72 minutes zmaniyos, or 1/10th of the day before sea level sunrise to nightfall of 72 minutes zmaniyos after sea level sunset."),
//					(hebrew: "(90 דקות) סוף זמן קריאת שמע", english: "Latest Shema (90 Minutes)", transAsh: "Sof Zman Shema  (90 Dakos)", transSef: "Sof Zman Shema (90 Dakot)", selector: "sofZmanShmaMGA90Minutes", description: "The latest time to recite Shema in the morning according to the opinion of the Mogen Avraham based on alos being 90 minutes before sunrise. This time is 3 solar hours after dawn based on the opinion of the Mogen Avraham that the day is calculated from a dawn of 90 minutes before sunrise to nightfall of 90 minutes after sunset."),
//					(hebrew: "סוף זמן קריאת שמע (90 דקות זמנית)", english: "Latest Shema (90 Minutes)", transAsh: "Sof Zman Shema  (90 Dakos)", transSef: "Sof Zman Shema (90 Dakot)", selector: "sofZmanShmaMGA90MinutesZmanis", description: "The latest time to recite Shema in the morning according to the opinion of the MGA based on alos being 90 minutes zmaniyos before sunrise. This time is 3 solar hours after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 90 minutes zmaniyos before sunrise to nightfall of 90 minutes zmaniyos after sunset. "),
//					(hebrew: "(96 דקות) סוף זמן קריאת שמע", english: "Latest Shema (96 Minutes)", transAsh: "Sof Zman Shema  (96 Dakos)", transSef: "Sof Zman Shema (96 Dakot)", selector: "sofZmanShmaMGA96Minutes", description: "The latest time to recite Shema in the morning according to the opinion of the MGA based on alos being 96 minutes before sunrise. This time is 3 shaos zmaniyos solar hours after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 96 minutes before sunrise to nightfall of 96 minutes after sunset. "),
//					(hebrew: "סוף זמן קריאת שמע (96 דקות זמנית)", english: "Latest Shema (96 Solar Minutes)", transAsh: "Sof Zman Shema  (96 Dakos Zmanis)", transSef: "Sof Zman Shema (96 Dakot Zmanit)", selector: "sofZmanShmaMGA96MinutesZmanis", description: "The latest time to recite Shema in the morning according to the opinion of the MGA based on alos being 96 minutes zmaniyos before sunrise. This time is 3 solar hours after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 96 minutes zmaniyos before sunrise to nightfall of 96 minutes zmaniyos after sunset."),
//					(hebrew: "סוף זמן קריאת שמע (3 שעות לפני חצות)", english: "Latest Shema (3 Hours Before Chatzos)", transAsh: "Sof Zman Shema  (3 Shaos L'fnei Chatzos)", transSef: "Sof Zman Shema (3 Sha'ot L'fnei Chatzot)", selector: "sofZmanShma3HoursBeforeChatzos", description: "The latest time to recite Shema in the morning according to the opinion of the Magen Avraham based on alos being 120 minutes or 1/6th of the day before sunrise. This time is 3 solar hours after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 120 minutes before sunrise to nightfall of 120 minutes after sunset. "),
//					(hebrew: "סוף זמן קריאת שמע (120 דקות)", english: "Latest Shema (120 Minutes)", transAsh: "Sof Zman Shema  (120 Dakos)", transSef: "Sof Zman Shema (120 Dakot)", selector: "sofZmanShmaMGA120Minutes", description: "The latest time to recite Shema in the morning according to the opinion of the Magen Avraham based on alos being 120 minutes or 1/6th of the day before sunrise. This time is 3 solar hours after dawn based on the opinion of the Magen Avraham that the day is calculated from a dawn of 120 minutes before sunrise to nightfall of 120 minutes after sunset. "),
//					(hebrew: "סוף זמן קריאת שמע (16.1 מעלות עד שקיעה)", english: "Latest Shema (16.1 Degrees to Sunset)", transAsh: "Sof Zman Shema  (16.1 Maalos Ad Shkia)", transSef: "Sof Zman Shema (16.1 Ma'alot Ad Shkia)", selector: "sofZmanShmaAlos16Point1ToSunset", description: "The latest time to recite Shema in the morning based on the opinion that the day starts at alos 16.1° and ends at sea level sunset. 3 solart hours are calculated based on this day and added to alos to reach this time. This time is 3 solar hours after dawn based on the opinion that the day is calculated from a alos 16.1° to sea level sunset. Note: Based on this calculation chatzos will not be at midday."),
//					(hebrew: "סוף זמן קריאת שמע (צאת גאונים)", english: "Latest Shema (Tzais Geonim)", transAsh: "Sof Zman Shema  (Tzais Geonim)", transSef: "Sof Zman Shema (Tzait Ge'onim)", selector: "sofZmanShmaAlos16Point1ToTzaisGeonim7Point083Degrees", description: "The latest time to recite Shema in the morning based on the opinion that the day starts at alos 16.1° and ends at tzais 7.083°. 3 solar hours are calculated based on this day and added to alos to reach this time. This time is 3 shaos zmaniyos (temporal hours) after alos 16.1° based on the opinion that the day is calculated from a alos 16.1° to tzais 7.083°. Note: Based on this calculation chatzos will not be at midday."),
//					(hebrew: "סוף זמן תפילה (מגן אברהם))", english: "", transAsh: "", transSef: "Sof Zman T'fila (Mogen Avraham)", selector: "sofZmanTfilaMogenAvraham", description: "The latest time to recite the morning prayers in the opinion of the Mogen Avraham based on alos being 72 minutes before sunrise. This time is 4 solar hours after dawn based on the opinion of the <em>MGA</em> that the day is calculated from a dawn of 72 minutes before sunrise to nightfall} of 72 minutes after sunset."),
//					(hebrew: "", english: "", transAsh: "", transSef: "Sof Zman T'fila (Gr'a)", selector: "sofZmanTfilaGra", description: "The latest time to recite the morning prayers in the opinion of the Mogen Avraham based on alos being 72 minutes before sunrise. This time is 4 solar hours after dawn based on the opinion of the Mogen Avraham that the day is calculated from a dawn of 72 minutes before sunrise to nightfall of 72 minutes after sunset."),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "sofZmanTfilaFixedLocal", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "sofZmanTfilaMGA19Point8Degrees", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "sofZmanTfilaMGA16Point1Degrees", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "sofZmanTfilaMGA72Minutes", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "sofZmanTfilaMGA72MinutesZmanis", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "sofZmanTfilaMGA90Minutes", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "sofZmanTfilaMGA90MinutesZmanis", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "sofZmanTfilaMGA96Minutes", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "sofZmanTfilaMGA96MinutesZmanis", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "sofZmanTfilaMGA120Minutes", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "sofZmanTfila2HoursBeforeChatzos", description: nil),
//					(hebrew: "חצות", english: "Midday", transAsh: "Chatzos", transSef: "Chatzot", selector: "chatzos", description: "Midday following the opinion of the GRA that the day for Jewish halachic times start at sea level sunrise and ends at sea level sunset."),
//					(hebrew: "(חצות (קבוע", english: "Midday (Fixed Local)", transAsh: "Chatzos (Kavua)", transSef: "Chatzot (Kavu'a)", selector: "fixedLocalChatzos", description: "This time is noon and midnight adjusted from standard time to account for the local latitude. The 360° of the globe divided by 24 calculates to 15° per hour with 4 minutes per degree, so at a longitude of 0 , 15, 30 etc... Chatzos in 12:00 noon. Lakewood, N.J., whose longitude is -74.2094, is 0.7906 away from the closest multiple of 15 at -75°. This is multiplied by 4 to yield 3 minutes and 10 seconds for a chatzos of 11:56:50.  This method is not tied to the theoretical 15° timezones, but will adjust to the actual timezone and Daylight saving time."),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "minchaGedola", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "minchaGedola30Minutes", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "minchaGedola72Minutes", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "Mincha Gedola (16.1 Ma'alot)", selector: "minchaGedola16Point1Degrees", description: "The the earliest time to pray mincha according to the Mogen Avraham with the day starting and ending 16.1° below the horizon."),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "minchaGedola30Minutes", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "minchaGedolaGreaterThan30", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "minchaGedola16Point1Degrees", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "minchaGedolaAteretTorah", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "minchaKetana", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "Mincha Ketana (16.1 Ma'alot)", selector: "minchaKetana16Point1Degrees", description: "The time of mincha ketana according to the Magen Avraham with the day starting and ending 16.1° below the horizon. This is the perfered earliest time to pray mincha according to the opinion of the Rambam and others. This is calculated as 9.5 solar hours after alos. "),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "minchaKetana72Minutes", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "minchaKetanaAteretTorah", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "Plag Hamincha", selector: "plagHamincha", description: "This is calculated as 10.75 hours after sunrise. This calculation is based on the opinion of the GRA and the Baal Hatanya that the day is calculated from sunrise to sunset."),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "plagHamincha60Minutes", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "plagHamincha72Minutes", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "plagHamincha72MinutesZmanis", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "plagHamincha90Minutes", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "plagHamincha90MinutesZmanis", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "plagHamincha96Minutes", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "plagHamincha96MinutesZmanis", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "plagHamincha16Point1Degrees", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "plagHamincha18Degrees", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "plagHamincha19Point8Degrees", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "plagHamincha26Degrees", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "plagAlosToSunset", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "plagAlos16Point1ToTzaisGeonim7Point083Degrees", description: nil),
//					(hebrew: "שקיעת החמה", english: "Sunset", transAsh: "Shkias Hachama", transSef: "Shki'at Hachama", selector: "sunset", description: "The time of sunset, taking elevation into account."),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "bainHashmashosRT13Degrees", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "bainHashmashosRT58Point5Minutes", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "bainHashmashosRT13Point5MinutesBefore7Point083Degrees", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "bainHashmashosRT2Stars", description: nil),
//					(hebrew: "", english: "First Starlight", transAsh: "Tzais Hakochavim (8.5 Maalos)", transSef: "Tzait Hakochavim (8.5 Ma'alot)", selector: "tzais", description: "This calculation is based on the position of the sun 36 minutes after sunset in Jerusalem on March 16, about 4 days before the equinox, the day that a solar hour is 60 minutes, which is 8.5degrees below geometric zenith. The Ohr Meir considers this the time that 3 small stars are visible, which is later than the required 3 medium stars."),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "tzaisGeonim5Point95Degrees", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "tzaisGeonim5Point88Degrees", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "tzaisGeonim3Point65Degrees", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "tzaisGeonim4Point37Degrees", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "tzaisGeonim4Point61Degrees", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "tzaisGeonim4Point8Degrees", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "tzaisGeonim7Point083Degrees", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "tzaisGeonim8Point5Degrees", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "tzais50", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "tzais60", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "tzaisAteretTorah", description: nil),
//					(hebrew: "", english: "First Starlight (72 Minutes)", transAsh: "Tzais Hakochavim (72 Dakos)", transSef: "Tzait Hakochavim (72 Dakot)", selector: "tzais72", description: "Calculated as 72 minutes after sunset, not taking elevation into account."),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "tzais72Zmanis", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "tzais90", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "tzais90Zmanis", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "tzais96", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "tzais96Zmanis", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "tzais120", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "tzais120Zmanis", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "tzais16Point1Degrees", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "tzais26Degrees", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "tzais18Degrees", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "tzais19Point8Degrees", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "sofZmanAchilasChametzGra", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "sofZmanAchilasChametzMGA72Minutes", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "sofZmanAchilasChametzMGA16Point1Degrees", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "sofZmanBiurChametzGra", description: nil),
//					(hebrew: "", english: "", transAsh: "", transSef: "", selector: "sofZmanBiurChametzMGA72Minutes", description: nil)]
//	    }
//		var metadata = [ksZmanData]()
//
//		for item in data! where item.selector ==  String(_sel: selector!)
//        {
//            metadata.append(item)
//        }
//        return metadata[0]
//	}
	
	public func mdForCurrentZman() -> [String: String] {
		var metadata = [String: String]()
		for item in Zman.metadata() {
			if item.key == String(_sel: selector!)
			{
				metadata = item.value
			}
		}
		return metadata
	}
	
	public func isEqualToZman(anotherZman: Zman) -> Bool
	{
		let mySelector: String = String(_sel: selector!)
		let otherZmanSelector: String = String(_sel: anotherZman.selector!)
	    
	    return (mySelector == otherZmanSelector)
	}
}
