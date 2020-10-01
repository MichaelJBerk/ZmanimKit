//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

public class ZmanimCalendar: AstronomicalCalendar
{
	public var candleLightingOffset = 0
	
	public override init(location aGeoLocation:GeoLocation)
	{
		super.init(location: aGeoLocation)
	}
	
	@objc public func alosHashachar() -> NSDate?
	{
		return sunriseOffsetByDegrees(offsetZenith: kZenithSixteenPointOne)
	}
	
	@objc public func alos72() -> NSDate
	{
		return dateBySubtractingMinutes(minutes: 72, fromDate: seaLevelSunrise()!)
	}
	
	@objc public func chatzos() -> NSDate
	{
	    return sunTransit()    
	}
	
	@objc public func sofZmanShmaGra() -> NSDate
	{
		return seaLevelSunrise()!.addingTimeInterval(shaahZmanisGra() * 3)
	}
	
	@objc public func sofZmanShmaMogenAvraham() -> NSDate
	{
		return alos72().addingTimeInterval(shaahZmanisMogenAvraham() * 3)
	}
	
	@objc public func candleLighting() -> NSDate
	{
	    let candleLightingOffset: Int = self.candleLightingOffset
	
		return candleLightingWithOffsetFromSunset(offsetInMinutes: Int(candleLightingOffset))
	}
	
	@objc public func candleLightingWithOffsetFromSunset(offsetInMinutes: Int) -> NSDate
	{
		return dateBySubtractingMinutes(minutes: offsetInMinutes, fromDate: sunset()!)
	}
	
	@objc public func candleLighting15() -> NSDate
	{
		return candleLightingWithOffsetFromSunset(offsetInMinutes: 15)
	}
	
	@objc public func candleLighting18() -> NSDate
	{
		return candleLightingWithOffsetFromSunset(offsetInMinutes: 18)
	}
	
	@objc public func candleLighting20() -> NSDate
	{
		return candleLightingWithOffsetFromSunset(offsetInMinutes: 20)
	}
	
	@objc public func candleLighting22() -> NSDate
	{
		return candleLightingWithOffsetFromSunset(offsetInMinutes: 22)
	}
	
	@objc public func candleLighting30() -> NSDate
	{
		return candleLightingWithOffsetFromSunset(offsetInMinutes: 30)
	}
	
	@objc public func candleLighting40() -> NSDate
	{
		return candleLightingWithOffsetFromSunset(offsetInMinutes: 40)
	}
	
	@objc public func sofZmanTfilaGra() -> NSDate
	{
		return seaLevelSunrise()!.addingTimeInterval(shaahZmanisGra() * 4)
	}
	
	@objc public func sofZmanTfilaMogenAvraham() -> NSDate
	{
		return alos72().addingTimeInterval(shaahZmanisMogenAvraham() * 4)
	}
	
	@objc public func minchaGedola() -> NSDate
	{
		return seaLevelSunrise()!.addingTimeInterval(shaahZmanisGra() * 6.5)
	}
	
	@objc public func minchaKetana() -> NSDate
	{
		return seaLevelSunrise()!.addingTimeInterval(shaahZmanisGra() * 9.5)
	}
	
	@objc public func plagHamincha() -> NSDate
	{
		return seaLevelSunrise()!.addingTimeInterval(shaahZmanisGra() * 10.75)
	}
	
	@objc public func shaahZmanisGra() -> Double
	{
		return temporalHourFromSunrise(sunrise: seaLevelSunrise(), toSunset: seaLevelSunset())
	}
	
	@objc public func shaahZmanisMogenAvraham() -> Double
	{
		return temporalHourFromSunrise(sunrise: alos72(), toSunset: tzais72())
	}
	
	@objc public func tzais() -> NSDate
	{
		return sunsetOffsetByDegrees(offsetZenith: kZenithEightPointFive)
	}
	
	@objc public func tzais72() -> NSDate
	{
		return dateByAddingMinutes(minutes: 72, toDate: seaLevelSunset()!)
	}
}
