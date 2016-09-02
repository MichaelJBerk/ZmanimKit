//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

class KSZmanimCalendar: KSAstronomicalCalendar
{
	var candleLightingOffset = 0
	
	override init (location aGeoLocation:KSGeoLocation)
	{
		super.init(location: aGeoLocation)
	}
	
	func alosHashachar() -> NSDate
	{
	    return sunriseOffsetByDegrees(kZenithSixteenPointOne)
	}
	
	func alos72() -> NSDate
	{
	    return dateBySubtractingMinutes(72, fromDate: seaLevelSunrise()!)
	}
	
	func chatzos() -> NSDate
	{
	    return sunTransit()    
	}
	
	func sofZmanShmaGra() -> NSDate
	{
	    return seaLevelSunrise()!.dateByAddingTimeInterval(shaahZmanisGra() * 3)
	}
	
	func sofZmanShmaMogenAvraham() -> NSDate
	{
	    return alos72().dateByAddingTimeInterval(shaahZmanisMogenAvraham() * 3)
	}
	
	func candleLighting() -> NSDate
	{
	    let candleLightingOffset: Int = self.candleLightingOffset
	
	    return candleLightingWithOffsetFromSunset(Int(candleLightingOffset))
	}
	
	func candleLightingWithOffsetFromSunset(offsetInMinutes: Int) -> NSDate
	{
	    return dateBySubtractingMinutes(offsetInMinutes, fromDate: sunset()!)
	}
	
	func candleLighting15() -> NSDate
	{
	    return candleLightingWithOffsetFromSunset(15)
	}
	
	func candleLighting18() -> NSDate
	{
	    return candleLightingWithOffsetFromSunset(18)
	}
	
	func candleLighting20() -> NSDate
	{
	    return candleLightingWithOffsetFromSunset(20)
	}
	
	func candleLighting22() -> NSDate
	{
	    return candleLightingWithOffsetFromSunset(22)
	}
	
	func candleLighting30() -> NSDate
	{
	    return candleLightingWithOffsetFromSunset(30)
	}
	
	func candleLighting40() -> NSDate
	{
	    return candleLightingWithOffsetFromSunset(40)
	}
	
	func sofZmanTfilaGra() -> NSDate
	{
	    return seaLevelSunrise()!.dateByAddingTimeInterval(shaahZmanisGra() * 4)
	}
	
	func sofZmanTfilaMogenAvraham() -> NSDate
	{
	    return alos72().dateByAddingTimeInterval(shaahZmanisMogenAvraham() * 4)
	}
	
	func minchaGedola() -> NSDate
	{
	    return seaLevelSunrise()!.dateByAddingTimeInterval(shaahZmanisGra() * 6.5)
	}
	
	func minchaKetana() -> NSDate
	{
	    return seaLevelSunrise()!.dateByAddingTimeInterval(shaahZmanisGra() * 9.5)
	}
	
	func plagHamincha() -> NSDate
	{
		return seaLevelSunrise()!.dateByAddingTimeInterval(shaahZmanisGra() * 10.75)
	}
	
	func shaahZmanisGra() -> Double
	{
	    return temporalHourFromSunrise(seaLevelSunrise(), toSunset: seaLevelSunset())
	}
	
	func shaahZmanisMogenAvraham() -> Double
	{
	    return temporalHourFromSunrise(alos72(), toSunset: tzais72())
	}
	
	func tzais() -> NSDate
	{
	    return sunsetOffsetByDegrees(kZenithEightPointFive)
	}
	
	func tzais72() -> NSDate
	{
	    return dateByAddingMinutes(72, toDate: seaLevelSunset()!)
	}
}