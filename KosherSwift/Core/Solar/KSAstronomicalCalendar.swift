//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

public class KSAstronomicalCalendar
{
	public var geoLocation : KSGeoLocation?
	public var astronomicalCalculator : KSSunriseAndSunsetCalculator?
	public var internalCalendar : NSCalendar?
	public var workingDate : NSDate?
	
	public init()
	{
	    internalCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierGregorian)
	}
	
	public init(location aGeoLocation: KSGeoLocation)
	{
	    let tempCalc: KSSunriseAndSunsetCalculator = KSSunriseAndSunsetCalculator(geoLocation: aGeoLocation)
		astronomicalCalculator = tempCalc
		geoLocation = aGeoLocation
		workingDate = NSDate()
        internalCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierGregorian)
	}
	
	public func sunrise() -> NSDate?
	{
	    let sunrise = UTCSunrise(kZenithGeometric)
	    return dateFromTime(sunrise)
	}
	
	public func seaLevelSunrise() -> NSDate?
	{
	    let sunrise: Double = UTCSeaLevelSunrise(kZenithGeometric)
        return dateFromTime(sunrise)
	}
	
	public func beginCivilTwilight() -> NSDate
	{
	    return sunriseOffsetByDegrees(kZenithCivil)
	}
	
	public func beginNauticalTwilight() -> NSDate
	{
	    return sunriseOffsetByDegrees(kZenithNautical)
	}
	
	public func beginAstronomicalTwilight() -> NSDate
	{
	    return sunriseOffsetByDegrees(kZenithAstronomical)
	}
	
	public func sunset() -> NSDate?
	{
	    let sunset: Double = UTCSunset(kZenithGeometric)
	    return adjustedSunsetDateWithSunset(dateFromTime(sunset), andSunrise: sunrise())
	}
	
	public func seaLevelSunset() -> NSDate?
	{
	    let sunset: Double = UTCSeaLevelSunset(kZenithGeometric)
	    return adjustedSunsetDateWithSunset(dateFromTime(sunset), andSunrise: sunrise())
	}
	
	public func adjustedSunsetDateWithSunset(sunset: NSDate?, andSunrise sunrise: NSDate?) -> NSDate
	{
	    if sunrise != nil && sunset != nil && (sunrise!.timeIntervalSinceDate(sunset!) > 0)
	    {
	        return dateByAddingDays(1, toDate: sunset!)
	    }
	    return sunset!
	}
	
	public func endCivilTwilight() -> NSDate
	{
	    return sunsetOffsetByDegrees(kZenithCivil)
	}
	
	public func endNauticalTwilight() -> NSDate
	{
	    return sunsetOffsetByDegrees(kZenithNautical)
	}
	
	public func endAstronomicalTwilight() -> NSDate
	{
	    return sunsetOffsetByDegrees(kZenithAstronomical)
	}
	
	public func sunriseOffsetByDegrees(offsetZenith: Double) -> NSDate
	{
	    let dawn: Double = UTCSunrise(offsetZenith)
	    
	    return  dateFromTime(dawn)
	}
	
	public func sunsetOffsetByDegrees(offsetZenith: Double) -> NSDate
	{
	    let sunset: Double = UTCSunset(offsetZenith)
		
	    return adjustedSunsetDateWithSunset(dateFromTime(sunset), andSunrise: sunriseOffsetByDegrees(offsetZenith))
	}
	
	public func UTCSunrise(zenith: Double) -> Double
	{
	    return astronomicalCalculator!.UTCSunriseForDate(workingDate!, andZenith: zenith, adjustForElevation: true)
	}
	
	public func UTCSeaLevelSunrise(zenith: Double) -> Double
	{
	    let sunrise: Double = (astronomicalCalculator!).UTCSunriseForDate(workingDate!, andZenith: zenith, adjustForElevation: false)
	    return sunrise
	}
	
	public func UTCSunset(zenith: Double) -> Double
	{
	    return astronomicalCalculator!.UTCSunsetForDate(workingDate!, andZenith: zenith, adjustForElevation: true)
	}
	
	public func UTCSeaLevelSunset(zenith: Double) -> Double
	{
	    return astronomicalCalculator!.UTCSunsetForDate(workingDate!, andZenith: zenith, adjustForElevation: false)
	}
	
	public func temporalHourFromSunrise(sunrise: NSDate?, toSunset sunset: NSDate?) -> Double
	{
	    if sunrise == nil || sunset == nil
	    {
	        return Double(Int.min)
	    }
	    return sunset!.timeIntervalSinceDate(sunrise!) / 12
	}
	
	public func sunTransit() -> NSDate
	{
	    return sunrise()!.dateByAddingTimeInterval(temporalHourFromSunrise(sunrise(), toSunset: sunset()) * 6)
	}
	
	public func dateFromTime(time: Double) -> NSDate
	{
	    return dateFromTime(time, inTimeZone: NSTimeZone.localTimeZone(), onDate: workingDate!)!
	}
	
	public func dateFromTime(time: Double, inTimeZone tz: NSTimeZone, onDate date: NSDate) -> NSDate?
	{
        var calculatedTime = time
        let gregorianCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let components: NSDateComponents = gregorianCalendar.components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.WeekOfYear, NSCalendarUnit.Day, NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second, NSCalendarUnit.Era], fromDate: date)
        
		//  Set the components time zone to GMT, since all of our calculations were done in GMT initially.
	    components.timeZone = NSTimeZone(forSecondsFromGMT: 0)
	    
	    let hours = calculatedTime
	    calculatedTime -= Double(hours)
        let minutes: Double = Double(calculatedTime *= 60)
	    calculatedTime -= Double(minutes)
	    let seconds = calculatedTime * 60
        
	    components.hour = Int(hours)
	    components.minute = Int(minutes)
	    components.second = Int(seconds)
	    
        var returnDate: NSDate = gregorianCalendar.dateFromComponents(components)!
	    
	    //  Here we apply a time zone offset. If the time is greater
	    //  than 24, or less than 0, then we "roll" the date by a day.
	    let offsetFromGMT = Double(tz.secondsFromGMTForDate(date)) / 3600.0
        if time + offsetFromGMT > 24
	    {
	        returnDate = dateBySubtractingDays(1, fromDate: returnDate)
	    }
	    else if time + offsetFromGMT < 0
	    {
	        returnDate = dateByAddingDays(1, toDate: returnDate)
	    }
	    
	    return returnDate 
	}
	
	public func stringFromDate(date: NSDate, forTimeZone tz: NSTimeZone, withSeconds shouldShowSeconds: Bool) -> String{
	    
	    let form: NSDateFormatter = NSDateFormatter()
	    
	    if shouldShowSeconds
	    {
	        form.timeStyle = .MediumStyle
	    }
	    else
	    {
	        form.timeStyle = .ShortStyle
	    }
	
	    form.timeZone = tz
	    
	    return form.stringFromDate(date)
	}
	
	public func stringFromDate(date: NSDate, forTimeZone timezone: NSTimeZone) -> String
	{
	    
	    return stringFromDate(date, forTimeZone: timezone, withSeconds: true)
	    
	}
	
	public func  getInternalCalendar() -> NSCalendar
	{
	    return internalCalendar!
	}
}