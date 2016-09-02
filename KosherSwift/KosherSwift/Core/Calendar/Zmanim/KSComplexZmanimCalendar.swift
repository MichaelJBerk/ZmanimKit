//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

class KSComplexZmanimCalendar: KSZmanimCalendar
{
	var ateretTorahSunsetOffset = 0
	
	override init (location aGeoLocation: KSGeoLocation)
	{
		super.init(location: aGeoLocation)
	}
	
//    convenience init()
//	{
//	    ateretTorahSunsetOffset = 40
//	}
	
	func shaahZmanis19Point8Degrees() -> Double
	{
	    return temporalHourFromSunrise(alos19Point8Degrees(), toSunset: tzais19Point8Degrees())
	}
	
	func shaahZmanis18Degrees() -> Double
	{
	    return temporalHourFromSunrise(alos18Degrees(), toSunset: tzais18Degrees())
	}
	
	func shaahZmanis26Degrees() -> Double
	{
	    return temporalHourFromSunrise(alos26Degrees(), toSunset: tzais26Degrees())
	}
	
	func shaahZmanis16Point1Degrees() -> Double
	{
	    return temporalHourFromSunrise(alos16Point1Degrees(), toSunset: tzais16Point1Degrees())
	}
	
	func shaahZmanis60Minutes() -> Double
	{
	    return temporalHourFromSunrise(alos60(), toSunset: tzais60())
	}
	
	func shaahZmanis72Minutes() -> Double
	{
	    return shaahZmanisMogenAvraham()
	}
	
	func shaahZmanis72MinutesZmanis() -> Double
	{
	    return temporalHourFromSunrise(alos72Zmanis(), toSunset: tzais72Zmanis())
	}
	
	func shaahZmanis90Minutes() -> Double
	{
	    return temporalHourFromSunrise(alos90(), toSunset: tzais90())
	}
	
	func shaahZmanis90MinutesZmanis() -> Double
	{
	    return temporalHourFromSunrise(alos90Zmanis(), toSunset: tzais90Zmanis())
	}
	
	func shaahZmanis96Minutes() -> Double
	{
	    return temporalHourFromSunrise(alos96(), toSunset: tzais96())
	}
	
	func shaahZmanis96MinutesZmanis() -> Double
	{
	    return temporalHourFromSunrise(alos96Zmanis(), toSunset: tzais96Zmanis())
	}
	
	func shaahZmanisAteretTorah() -> Double
	{
	    return temporalHourFromSunrise(alos72Zmanis(), toSunset: tzaisAteretTorah())
	}
	
	func shaahZmanis120Minutes() -> Double
	{
	    return temporalHourFromSunrise(alos120(), toSunset: tzais120())
	}
	
	func shaahZmanis120MinutesZmanis() -> Double
	{
	    return temporalHourFromSunrise(alos120Zmanis(), toSunset: tzais120Zmanis())
	}
	
	func plagHamincha120Minutes() -> NSDate
	{
	    return alos120Zmanis()!.dateByAddingTimeInterval(shaahZmanis120Minutes() * 10.75)
	}
	
	func plagHamincha120MinutesZmanis() -> NSDate
	{
	    return alos120Zmanis()!.dateByAddingTimeInterval(shaahZmanis120MinutesZmanis() * 10.75)
	}
	
	func alos60() -> NSDate
	{
	    return dateBySubtractingHours(1, fromDate: seaLevelSunrise()!)
	}
	
	func alos72Zmanis() -> NSDate?
	{
	    let shaahZmanis = shaahZmanisGra()
	    
	    if shaahZmanis == Double(Int.min) {
	        return nil
	    }
	    
	    return seaLevelSunrise()!.dateByAddingTimeInterval(shaahZmanis - 1.2)
	}
	
	func alos90() -> NSDate
	{
	    
	    let baseDate: NSDate = seaLevelSunrise()!
	    return dateBySubtractingMinutes(90, fromDate: baseDate)
	}
	
	func alos90Zmanis() -> NSDate?
	{
	    let shaahZmanis = shaahZmanisGra()
	    
	    if shaahZmanis == Double(Int.min)
		{
	        return nil
	    }
	    
	    return seaLevelSunrise()!.dateByAddingTimeInterval((shaahZmanis  - 1.5))
	}
	
	func alos96() -> NSDate
	{
	    let baseDate: NSDate = seaLevelSunrise()!
	    return dateBySubtractingMinutes(96, fromDate: baseDate)
	}
	
	func alos96Zmanis() -> NSDate?
	{
	
	    let shaahZmanis = shaahZmanisGra()
	    
	    if shaahZmanis == Double(Int.min)
		{
	        return nil
	    }
	    
	    return seaLevelSunrise()!.dateByAddingTimeInterval(shaahZmanis  - 1.6)
	}
	
	func alos120() -> NSDate
	{
	    let baseDate: NSDate = seaLevelSunrise()!
	    return dateBySubtractingMinutes(120, fromDate: baseDate)
	}
	
	func alos120Zmanis() -> NSDate?
	{
	    let shaahZmanis = shaahZmanisGra()
	    
	    if shaahZmanis == Double(Int.min)
		{
	        return nil
	    }
	    
	    return seaLevelSunrise()!.dateByAddingTimeInterval(shaahZmanis  - 2)
	}
	
	func alos26Degrees() -> NSDate
	{
	    return sunriseOffsetByDegrees(kZenithTwentySix)
	}
	
	func alos18Degrees() -> NSDate
	{
	    return sunriseOffsetByDegrees(kZenithAstronomical)
	}
	
	func alos19Point8Degrees() -> NSDate
	{
	    return sunriseOffsetByDegrees(kZenithNineteenPointEight)
	}
	
	func alos16Point1Degrees() -> NSDate
	{
	    return sunriseOffsetByDegrees(kZenithSixteenPointOne)
	}
	
	func misheyakir11Point5Degrees() -> NSDate
	{
	    return sunriseOffsetByDegrees(kZenithElevenPointFive)
	}
	
	func misheyakir11Degrees() -> NSDate
	{
	    return sunriseOffsetByDegrees(kZenithElevenDegrees)
	}
	
	func misheyakir10Point2Degrees() -> NSDate
	{
	    return sunriseOffsetByDegrees(kZenithTenPointTwo)
	}
	
	func sofZmanShmaMGA19Point8Degrees() -> NSDate
	{
	    return sunriseOffsetByDegrees(kZenithNineteenPointEight).dateByAddingTimeInterval(shaahZmanis19Point8Degrees() * 3)
	}
	
	func sofZmanShmaMGA16Point1Degrees() -> NSDate
	{
	    return alos16Point1Degrees().dateByAddingTimeInterval(shaahZmanis16Point1Degrees() * 3)
	}
	
	func sofZmanShmaMGA72Minutes() -> NSDate
	{
	    return sofZmanShmaMogenAvraham()
	}
	
	func sofZmanShmaMGA72MinutesZmanis() -> NSDate
	{
	    return alos72Zmanis()!.dateByAddingTimeInterval(shaahZmanis72MinutesZmanis() * 3)
	}
	
	func sofZmanShmaMGA90Minutes() -> NSDate
	{
	    return alos90().dateByAddingTimeInterval(shaahZmanis90Minutes() * 3)
	}
	
	func sofZmanShmaMGA90MinutesZmanis() -> NSDate
	{
	    return alos90Zmanis()!.dateByAddingTimeInterval(shaahZmanis90MinutesZmanis() * 3)
	}
	
	func sofZmanShmaMGA96Minutes() -> NSDate
	{
	    return alos96().dateByAddingTimeInterval(shaahZmanis96Minutes() * 3)
	}
	
	func sofZmanShmaMGA96MinutesZmanis() -> NSDate
	{
	    return alos96Zmanis()!.dateByAddingTimeInterval(shaahZmanis96MinutesZmanis() * 3)
	}
	
	func sofZmanShma3HoursBeforeChatzos() -> NSDate
	{
	    let baseDate: NSDate = chatzos()
	    return dateBySubtractingHours(3, fromDate: baseDate)
	}
	
	func sofZmanShmaMGA120Minutes() -> NSDate
	{
	    return alos120().dateByAddingTimeInterval(shaahZmanis120Minutes() * 3)
	}
	
	func sofZmanShmaAlos16Point1ToSunset() -> NSDate?
	{
	    let shaahZmanis = temporalHourFromSunrise(alos16Point1Degrees(), toSunset: seaLevelSunset())
	    
	    if shaahZmanis == Double(Int.min) {
	        return nil
	    }
	    
	    return alos16Point1Degrees().dateByAddingTimeInterval(shaahZmanis * 3)
	}
	
	func sofZmanShmaAlos16Point1ToTzaisGeonim7Point083Degrees() -> NSDate?
	{
	    let shaahZmanis = temporalHourFromSunrise(alos16Point1Degrees(), toSunset: tzaisGeonim7Point083Degrees())
	    
	     if shaahZmanis == Double(Int.min)
		 {
	        return nil
	     }
	    
	    return alos16Point1Degrees().dateByAddingTimeInterval(shaahZmanis * 3)
	}
	
	func sofZmanTfilaMGA19Point8Degrees() -> NSDate
	{
	    return alos19Point8Degrees().dateByAddingTimeInterval(shaahZmanis19Point8Degrees() * 4)
	}
	
	func sofZmanTfilaMGA16Point1Degrees() -> NSDate
	{
	    return alos16Point1Degrees().dateByAddingTimeInterval(shaahZmanis16Point1Degrees() * 4)
	}
	
	func sofZmanTfilaMGA72Minutes() -> NSDate
	{
	    return sofZmanTfilaMogenAvraham()
	}
	
	func sofZmanTfilaMGA72MinutesZmanis() -> NSDate
	{
	    return alos72Zmanis()!.dateByAddingTimeInterval(shaahZmanis72MinutesZmanis() * 4)
	}
	
	func sofZmanTfilaMGA90Minutes() -> NSDate
	{
	    return alos90().dateByAddingTimeInterval(shaahZmanis90Minutes() * 4)
	}
	
	func sofZmanTfilaMGA90MinutesZmanis() -> NSDate
	{
	    return alos90Zmanis()!.dateByAddingTimeInterval(shaahZmanis90MinutesZmanis() * 4)
	}
	
	func sofZmanTfilaMGA96Minutes() -> NSDate
	{
	    return alos96().dateByAddingTimeInterval(shaahZmanis96Minutes() * 4)
	}
	
	func sofZmanTfilaMGA96MinutesZmanis() -> NSDate
	{
	    return alos96Zmanis()!.dateByAddingTimeInterval(shaahZmanis96MinutesZmanis() * 4)
	}
	
	func sofZmanTfilaMGA120Minutes() -> NSDate
	{
	    return alos120().dateByAddingTimeInterval(shaahZmanis120Minutes() * 4)
	}
	
	func sofZmanTfila2HoursBeforeChatzos() -> NSDate
	{
	    return dateBySubtractingHours(2, fromDate: chatzos())
	}
	
	func minchaGedola30Minutes() -> NSDate
	{
	    return dateByAddingMinutes(30, toDate: chatzos())
	}
	
	func minchaGedola72Minutes() -> NSDate
	{
	    return alos72().dateByAddingTimeInterval(shaahZmanis72Minutes() * 6.5)
	}
	
	func minchaGedola16Point1Degrees() -> NSDate
	{
	    return alos16Point1Degrees().dateByAddingTimeInterval(shaahZmanis16Point1Degrees() * 6.5)
	}
	
    // TODO
//	func minchaGedolaGreaterThan30() -> NSDate?
//	{
//	    if minchaGedola30Minutes() == nil || minchaGedola() == nil
//		{
//	        return nil
//	    }
//	    
//	    if minchaGedola() > 0
//		{
//	        return minchaGedola30Minutes()
//	    }
//		else
//		{
//	        return minchaGedola()
//	    }
//	}
	
	func minchaKetana16Point1Degrees() -> NSDate
	{
	    return alos16Point1Degrees().dateByAddingTimeInterval(shaahZmanis16Point1Degrees() * 9.5)
	}
	
	func minchaKetana72Minutes() -> NSDate
	{
	    return alos72().dateByAddingTimeInterval(shaahZmanis72MinutesZmanis() * 9.5)
	}
	
	func plagHamincha60Minutes() -> NSDate
	{
	    return alos60().dateByAddingTimeInterval(shaahZmanis60Minutes() * 10.75)
	}
	
	func plagHamincha72Minutes() -> NSDate
	{
	    return alos72().dateByAddingTimeInterval(shaahZmanis72Minutes() * 10.75)
	}
	
	func plagHamincha90Minutes() -> NSDate
	{
	    return alos90().dateByAddingTimeInterval(shaahZmanis90Minutes() * 10.75)
	}
	
	func plagHamincha96Minutes() -> NSDate
	{
	    return alos96().dateByAddingTimeInterval(shaahZmanis96Minutes() * 10.75)
	}
	
	func plagHamincha96MinutesZmanis() -> NSDate
	{
	    return alos96Zmanis()!.dateByAddingTimeInterval(shaahZmanis96MinutesZmanis() * 10.75)
	}
	
	func plagHamincha90MinutesZmanis() -> NSDate
	{
	    return alos90Zmanis()!.dateByAddingTimeInterval(shaahZmanis90MinutesZmanis() * 10.75)
	}
	
	func plagHamincha72MinutesZmanis() -> NSDate
	{
	    return alos72Zmanis()!.dateByAddingTimeInterval(shaahZmanis72MinutesZmanis() * 10.75)
	}
	
	func plagHamincha16Point1Degrees() -> NSDate
	{
	    return alos16Point1Degrees().dateByAddingTimeInterval(shaahZmanis16Point1Degrees() * 10.75)
	}
	
	func plagHamincha19Point8Degrees() -> NSDate
	{
	    return alos19Point8Degrees().dateByAddingTimeInterval(shaahZmanis19Point8Degrees() * 10.75)
	}
	
	func plagHamincha26Degrees() -> NSDate
	{
	    return alos26Degrees().dateByAddingTimeInterval(shaahZmanis26Degrees() * 10.75)
	}
	
	func plagHamincha18Degrees() -> NSDate
	{
	    return alos18Degrees().dateByAddingTimeInterval(shaahZmanis18Degrees() * 10.75)
	}
	
	func plagAlosToSunset() -> NSDate
	{
	    let shaaZmanis = temporalHourFromSunrise(alos16Point1Degrees(), toSunset: seaLevelSunset())
	    return alos16Point1Degrees().dateByAddingTimeInterval(shaaZmanis * 10.75)
	}
	
	func plagAlos16Point1ToTzaisGeonim7Point083Degrees() -> NSDate
	{
	    let shaahZmanis = temporalHourFromSunrise(alos16Point1Degrees(), toSunset: tzaisGeonim7Point083Degrees())
	    return alos16Point1Degrees().dateByAddingTimeInterval(shaahZmanis * 10.75)
	}
	
	func bainHashmashosRT13Degrees() -> NSDate
	{
	    return sunsetOffsetByDegrees(kZenithThirteenPointTwentyFourDegrees)
	}
	
	func bainHashmashosRT58Point5Minutes() -> NSDate
	{
	    let baseDate: NSDate = seaLevelSunset()!
        return dateByAddingMinutes(58, seconds: 30, toDate: baseDate)
	}
	
	func bainHashmashosRT13Point5MinutesBefore7Point083Degrees() -> NSDate
	{
	    let baseDate: NSDate = sunsetOffsetByDegrees(kZenithSevenPointZeroEightThree)
	    return dateBySubtractingMinutes(13, seconds: 30, fromDate: baseDate)
	}
	
	func bainHashmashosRT2Stars() -> NSDate?
	{
	    let alos19Point8: NSDate? = alos19Point8Degrees()
	    let sunrise: NSDate? = seaLevelSunrise()
	    
	    if alos19Point8 == nil || sunrise == nil
		{
	        return nil
	    }
	
	    return seaLevelSunrise()!.dateByAddingTimeInterval((sunrise!.timeIntervalSinceReferenceDate - alos19Point8Degrees().timeIntervalSinceReferenceDate) * (5 / 18))
	}
	
	func tzaisGeonim5Point95Degrees() -> NSDate
	{
	    return sunsetOffsetByDegrees(kZenithFivePointNinetyFive)
	}
	
	func tzaisGeonim3Point65Degrees() -> NSDate
	{
	    return sunsetOffsetByDegrees(kZenithThreePointSixtyFive)
	}
	
	func tzaisGeonim4Point61Degrees() -> NSDate
	{
	    return sunsetOffsetByDegrees(kZenithFourPointSixtyOne)
	}
	
	func tzaisGeonim4Point37Degrees() -> NSDate
	{
	    return sunsetOffsetByDegrees(kZenithFourPointThirtySeven)
	}
	
	func tzaisGeonim5Point88Degrees() -> NSDate
	{
	    return sunsetOffsetByDegrees(kZenithFivePointEightyEight)
	}
	
	func tzaisGeonim4Point8Degrees() -> NSDate
	{
	    return sunsetOffsetByDegrees(kZenithFourPointEight)
	}
	
	func tzaisGeonim7Point083Degrees() -> NSDate
	{
	    return sunsetOffsetByDegrees(kZenithSevenPointZeroEightThree)
	}
	
	func tzaisGeonim8Point5Degrees() -> NSDate
	{
	    return  sunsetOffsetByDegrees(kZenithEightPointFive)
	}
	
	func tzais50() -> NSDate
	{
	    return dateByAddingMinutes(50, toDate: seaLevelSunset()!)
	}
	
	func tzais60() -> NSDate
	{
	    return dateByAddingMinutes(60, toDate: seaLevelSunset()!)
	}
	
	func tzaisAteretTorah() -> NSDate
	{
	    return dateByAddingMinutes(ateretTorahSunsetOffset, toDate: seaLevelSunset()!)
	}
	
	func sofZmanShmaAteretTorah() -> NSDate
	{
	    return alos72Zmanis()!.dateByAddingTimeInterval(shaahZmanisAteretTorah() * 3)
	}
	
	func sofZmanTfilaAteretTorah() -> NSDate
	{
	    return alos72Zmanis()!.dateByAddingTimeInterval(shaahZmanisAteretTorah() * 4)
	}
	
	func minchaGedolaAteretTorah() -> NSDate
	{
	    return alos72Zmanis()!.dateByAddingTimeInterval(shaahZmanisAteretTorah() * 6.5)
	}
	
	func minchaKetanaAteretTorah() -> NSDate
	{
	    return alos72Zmanis()!.dateByAddingTimeInterval(shaahZmanisAteretTorah() * 9.5)
	}
	
	func plagHaminchaAteretTorah() -> NSDate
	{
	    return alos72Zmanis()!.dateByAddingTimeInterval(shaahZmanisAteretTorah() * 10.75)
	}
	
	func misheyakirAteretTorahWithMinutes(minutes: Int) -> NSDate
	{
	    return dateByAddingMinutes(minutes, toDate: alos72Zmanis()!)
	}
	
	func tzais72Zmanis() -> NSDate?
	{
	    let shaahZmanis = shaahZmanisGra()
	    
	    if shaahZmanis == Double(Int.min)
		{
	        return nil
	    }
	    
	    return seaLevelSunset()!.dateByAddingTimeInterval(shaahZmanis * 1.2)
	}
	
	func tzais90Zmanis() -> NSDate?
	{
	    let shaahZmanis = shaahZmanisGra()
	    
	    if shaahZmanis == Double(Int.min)
		{
	        return nil
	    }
	    
	    return seaLevelSunset()!.dateByAddingTimeInterval(shaahZmanis * 1.5)
	}
	
	func tzais96Zmanis() -> NSDate?
	{
	    let shaahZmanis = shaahZmanisGra()
	    
	    if shaahZmanis == Double(Int.min)
		{
	        return nil
	    }
	    
	    return seaLevelSunset()!.dateByAddingTimeInterval(shaahZmanis * 1.6)
	}
	
	func tzais90() -> NSDate
	{
	    return dateByAddingMinutes(90, toDate: seaLevelSunset()!)
	}
	
	func tzais120() -> NSDate
	{
	    return dateByAddingMinutes(120, toDate: seaLevelSunset()!)
	}
	
	func tzais120Zmanis() -> NSDate?
	{
	    let shaahZmanis = shaahZmanisGra()
	    if shaahZmanis == Double(Int.min)
		{
	        return nil
	    }
	    return seaLevelSunset()!.dateByAddingTimeInterval(shaahZmanis * 2.0)
	}
	
	func tzais16Point1Degrees() -> NSDate
	{
	    return sunsetOffsetByDegrees(kZenithSixteenPointOne)
	}
	
	func tzais26Degrees() -> NSDate
	{
	    return sunsetOffsetByDegrees(kZenithTwentySix)
	}
	
	func tzais18Degrees() -> NSDate
	{
	    return sunsetOffsetByDegrees(kZenithAstronomical)
	}
	
	func tzais19Point8Degrees() -> NSDate
	{
	    return sunsetOffsetByDegrees(kZenithNineteenPointEight)
	}
	
	func tzais96() -> NSDate
	{
	    return dateByAddingMinutes(96, toDate: seaLevelSunset()!)
	}
	
	func fixedLocalChatzos() -> NSDate
	{
	    return dateFromTime((12.0 - Double(geoLocation!.timeZone!.secondsFromGMT))).dateByAddingTimeInterval(Double(geoLocation!.localMeanTimeOffset()))
	}
	
	func sofZmanShmaFixedLocal() -> NSDate
	{
	    return dateBySubtractingMinutes(180, fromDate: fixedLocalChatzos())
	}
	
	func sofZmanTfilaFixedLocal() -> NSDate
	{
	    return dateBySubtractingMinutes(120, fromDate: fixedLocalChatzos())
	}
	
	func sofZmanAchilasChametzGra() -> NSDate
	{
	    return sofZmanTfilaGra()
	}
	
	func sofZmanAchilasChametzMGA72Minutes() -> NSDate
	{
	    return sofZmanTfilaMGA72Minutes()
	}
	
	func sofZmanAchilasChametzMGA16Point1Degrees() -> NSDate
	{
	    return sofZmanTfilaMGA16Point1Degrees()
	}
	
	func sofZmanBiurChametzGra() -> NSDate
	{
	    return seaLevelSunrise()!.dateByAddingTimeInterval(shaahZmanisGra() * 5)
	}
	
	func sofZmanBiurChametzMGA72Minutes() -> NSDate
	{
	    return alos72().dateByAddingTimeInterval(shaahZmanisMogenAvraham() * 5)
	}
	
	func sofZmanBiurChametzMGA16Point1Degrees() -> NSDate
	{
	    return alos16Point1Degrees().dateByAddingTimeInterval(shaahZmanis16Point1Degrees() * 5)
	}
	
	func solarMidnight() -> NSDate
	{
	    let clonedCalendar: KSComplexZmanimCalendar = self
        clonedCalendar.workingDate = dateByAddingDays(1, toDate: clonedCalendar.workingDate!)
	    let tempSunset: NSDate = sunset()!
	    let tempSunrise: NSDate = sunrise()!
	    
	    return sunset()!.dateByAddingTimeInterval(temporalHourFromSunrise(tempSunrise, toSunset: tempSunset) * 6)
	}
}