//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

/// A Class that calculates times for common Zmanim
///
/// - seealso: [ComplexZmanimCalendar]
public class ZmanimCalendar: AstronomicalCalendar
{
	public var candleLightingOffset = 0
	
	public override init(location aGeoLocation:GeoLocation)
	{
		super.init(location: aGeoLocation)
	}
	
	@objc public func alosHashachar() -> Date?
	{
		return sunriseOffsetByDegrees(offsetZenith: kZenithSixteenPointOne)
	}
	
	@objc public func alos72() -> Date
	{
		return dateBySubtractingMinutes(minutes: 72, fromDate: seaLevelSunrise()!)
	}
	
	@objc public func chatzos() -> Date
	{
	    return sunTransit()    
	}
	
	@objc public func sofZmanShmaGra() -> Date
	{
		return seaLevelSunrise()!.addingTimeInterval(shaahZmanisGra() * 3)
	}
	
	@objc public func sofZmanShmaMogenAvraham() -> Date
	{
		return alos72().addingTimeInterval(shaahZmanisMogenAvraham() * 3)
	}
	
	@objc public func candleLighting() -> Date
	{
	    let candleLightingOffset: Int = self.candleLightingOffset
	
		return candleLightingWithOffsetFromSunset(offsetInMinutes: Int(candleLightingOffset))
	}
	
	@objc public func candleLightingWithOffsetFromSunset(offsetInMinutes: Int) -> Date
	{
		return dateBySubtractingMinutes(minutes: offsetInMinutes, fromDate: sunset()!)
	}
	
	@objc public func candleLighting15() -> Date
	{
		return candleLightingWithOffsetFromSunset(offsetInMinutes: 15)
	}
	
	@objc public func candleLighting18() -> Date
	{
		return candleLightingWithOffsetFromSunset(offsetInMinutes: 18)
	}
	
	@objc public func candleLighting20() -> Date
	{
		return candleLightingWithOffsetFromSunset(offsetInMinutes: 20)
	}
	
	@objc public func candleLighting22() -> Date
	{
		return candleLightingWithOffsetFromSunset(offsetInMinutes: 22)
	}
	
	@objc public func candleLighting30() -> Date
	{
		return candleLightingWithOffsetFromSunset(offsetInMinutes: 30)
	}
	
	@objc public func candleLighting40() -> Date
	{
		return candleLightingWithOffsetFromSunset(offsetInMinutes: 40)
	}
	
	@objc public func sofZmanTfilaGra() -> Date
	{
		return seaLevelSunrise()!.addingTimeInterval(shaahZmanisGra() * 4)
	}
	
	@objc public func sofZmanTfilaMogenAvraham() -> Date
	{
		return alos72().addingTimeInterval(shaahZmanisMogenAvraham() * 4)
	}
	
	@objc public func minchaGedola() -> Date
	{
		return seaLevelSunrise()!.addingTimeInterval(shaahZmanisGra() * 6.5)
	}
	
	@objc public func minchaKetana() -> Date
	{
		return seaLevelSunrise()!.addingTimeInterval(shaahZmanisGra() * 9.5)
	}
	
	@objc public func plagHamincha() -> Date
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
	
	@objc public func tzais() -> Date
	{
		return sunsetOffsetByDegrees(offsetZenith: kZenithEightPointFive)
	}
	
	@objc public func tzais72() -> Date
	{
		return dateByAddingMinutes(minutes: 72, toDate: seaLevelSunset()!)
	}
	@objc public func havdalah() -> Date
	{
		return tzais72()
	}
	
}
