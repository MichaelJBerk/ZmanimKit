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
	
	public static func metadata() -> KeyValuePairs<String, [String: String]> {
		let data: KeyValuePairs<String, [String: String]> = .init()
		return data
		
	}

	public func getMetadata() {
		
		let jd = JSONDecoder()
		var d: URL = URL(string: "mberk.com")!
		
		#if SWIFT_PACKAGE
		d = Bundle.module.url(forResource: "ZmanMetadata", withExtension: "json")!
		#else
		d = Bundle.init(for: Self.self).url(forResource: "ZmanMetadata", withExtension: "json")!
		#endif
				
		let jsonData = try! Data(contentsOf: d)
		do {
			let decodedData = try jd.decode([ZMetadata].self, from: jsonData)
			self.data = decodedData
		} catch let error as NSError {
			print("Error loading metadata. \(error), \(error.userInfo)")
		}
		
	}
	
	public func ksZmanDataForCurrentZman() -> ZMetadata {
		if self.data == nil {
			getMetadata()
		}
		return (self.data?.first(where: {$0.selector == String(_sel: selector!)}))!
	}
	
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
