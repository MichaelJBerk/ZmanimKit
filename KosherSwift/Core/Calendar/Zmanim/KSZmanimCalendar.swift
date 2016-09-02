//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

public class KSZmanimCalendar: KSAstronomicalCalendar
{
	var candleLightingOffset = 0
	
	override init (location aGeoLocation:KSGeoLocation)
	{
		super.init(location: aGeoLocation)
	}
	
	public func alosHashachar() -> NSDate
	{
	    return sunriseOffsetByDegrees(kZenithSixteenPointOne)
	}
	
	public func alos72() -> NSDate
	{
	    return dateBySubtractingMinutes(72, fromDate: seaLevelSunrise()!)
	}
	
	public func chatzos() -> NSDate
	{
	    return sunTransit()    
	}
	
	public func sofZmanShmaGra() -> NSDate
	{
	    return seaLevelSunrise()!.dateByAddingTimeInterval(shaahZmanisGra() * 3)
	}
	
	public func sofZmanShmaMogenAvraham() -> NSDate
	{
	    return alos72().dateByAddingTimeInterval(shaahZmanisMogenAvraham() * 3)
	}
	
	public func candleLighting() -> NSDate
	{
	    let candleLightingOffset: Int = self.candleLightingOffset
	
	    return candleLightingWithOffsetFromSunset(Int(candleLightingOffset))
	}
	
	public func candleLightingWithOffsetFromSunset(offsetInMinutes: Int) -> NSDate
	{
	    return dateBySubtractingMinutes(offsetInMinutes, fromDate: sunset()!)
	}
	
	public func candleLighting15() -> NSDate
	{
	    return candleLightingWithOffsetFromSunset(15)
	}
	
	public func candleLighting18() -> NSDate
	{
	    return candleLightingWithOffsetFromSunset(18)
	}
	
	public func candleLighting20() -> NSDate
	{
	    return candleLightingWithOffsetFromSunset(20)
	}
	
	public func candleLighting22() -> NSDate
	{
	    return candleLightingWithOffsetFromSunset(22)
	}
	
	public func candleLighting30() -> NSDate
	{
	    return candleLightingWithOffsetFromSunset(30)
	}
	
	public func candleLighting40() -> NSDate
	{
	    return candleLightingWithOffsetFromSunset(40)
	}
	
	public func sofZmanTfilaGra() -> NSDate
	{
	    return seaLevelSunrise()!.dateByAddingTimeInterval(shaahZmanisGra() * 4)
	}
	
	public func sofZmanTfilaMogenAvraham() -> NSDate
	{
	    return alos72().dateByAddingTimeInterval(shaahZmanisMogenAvraham() * 4)
	}
	
	public func minchaGedola() -> NSDate
	{
	    return seaLevelSunrise()!.dateByAddingTimeInterval(shaahZmanisGra() * 6.5)
	}
	
	public func minchaKetana() -> NSDate
	{
	    return seaLevelSunrise()!.dateByAddingTimeInterval(shaahZmanisGra() * 9.5)
	}
	
	public func plagHamincha() -> NSDate
	{
		return seaLevelSunrise()!.dateByAddingTimeInterval(shaahZmanisGra() * 10.75)
	}
	
	public func shaahZmanisGra() -> Double
	{
	    return temporalHourFromSunrise(seaLevelSunrise(), toSunset: seaLevelSunset())
	}
	
	public func shaahZmanisMogenAvraham() -> Double
	{
	    return temporalHourFromSunrise(alos72(), toSunset: tzais72())
	}
	
	public func tzais() -> NSDate
	{
	    return sunsetOffsetByDegrees(kZenithEightPointFive)
	}
	
	public func tzais72() -> NSDate
	{
	    return dateByAddingMinutes(72, toDate: seaLevelSunset()!)
	}
}