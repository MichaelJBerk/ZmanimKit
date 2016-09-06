//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

/** A class that calculates various sunrise and sunset values. */
public class AstronomicalCalendar
{
    /**
     *  The location of the user.
     */
	public var geoLocation : GeoLocation?
    
    /**
     * The calculator to use.
     *
     *  In KosherCocoa, it's always a KCSunriseAndSunsetCalculator. The
     *  original Java library offered several calculator options.
     */
	public var astronomicalCalculator : SunriseAndSunsetCalculator?
    
    /**
     *  Expose the internal calendar so the main class can
     *  appropriately forward methods.
     */
	public var internalCalendar : NSCalendar?
    
    /**
     * The date for which we want to perform the calculations.
     */
	public var workingDate : NSDate?
	
	public init()
	{
	    internalCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierGregorian)
	}
	
	public init(location aGeoLocation: GeoLocation)
	{
	    let tempCalc: SunriseAndSunsetCalculator = SunriseAndSunsetCalculator(geoLocation: aGeoLocation)
		astronomicalCalculator = tempCalc
		geoLocation = aGeoLocation
		workingDate = NSDate()
        internalCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierGregorian)
	}
	
    /**
     *  This method calculates sunrise at the current geolocation.
     *
     *  The zenith used for the calculation uses geometric zenith of 90 degrees plus elevation.
     *  This is adjusted by the KCAstronomicalCalculator to add approximately 50/60 of a degree
     *  to account for 34 archminutes of refraction and 16 archminutes for the sun's radius for
     *  a total of 90.83333 degrees.
     *
     *  - returns: Sunrise as an NSDate.
     *  If the calculation cannot be computed, such as in the Arctic Circle, where there is
     *  at least one day a year that the sun does not rise, and one where it does not set,
     *  nil will be returned.
     */
	public func sunrise() -> NSDate?
	{
	    let sunrise = UTCSunrise(kZenithGeometric)
	    return dateFromTime(sunrise)
	}
	
    /**
     *  This method calculates sunrise at sea-level at
     *  the latitude and longitude represented by the
     *  current geolocation.
     *
     *  Non-sunrise and sunset calculations such as dawn and dusk, depend on the amount of
     *  visible light, something that is not affected by elevation. This method returns
     *  sunrise calculated at sea level. This forms the base for dawn calculations that are
     *  calculated as a dip below the horizon before sunrise.
     *
     *  - returns: Sunrise at sea level as an NSDate.
     */
	public func seaLevelSunrise() -> NSDate?
	{
	    let sunrise: Double = UTCSeaLevelSunrise(kZenithGeometric)
        return dateFromTime(sunrise)
	}
	
    /**
     *  This method calculates the start of civil twilight.
     */
	public func beginCivilTwilight() -> NSDate
	{
	    return sunriseOffsetByDegrees(kZenithCivil)
	}
	
    /**
     *  This method calculates the start of nautical twilight.
     */
	public func beginNauticalTwilight() -> NSDate
	{
	    return sunriseOffsetByDegrees(kZenithNautical)
	}
	
    /**
     *  This method calculates the start of astronomical twilight.
     */
	public func beginAstronomicalTwilight() -> NSDate
	{
	    return sunriseOffsetByDegrees(kZenithAstronomical)
	}
	
    /**
     *  This method returns an NSDate representing the time of sunset on
     *  the KCAstronomicalCalendar instance's workingDate property.
     *
     *  This method takes elevation into account.
     *
     *  - returns: An NSDate representing sunset on workingDate.
     */
	public func sunset() -> NSDate?
	{
	    let sunset: Double = UTCSunset(kZenithGeometric)
	    return adjustedSunsetDateWithSunset(dateFromTime(sunset), andSunrise: sunrise())
	}
	
    /**
     *  This method returns an NSDate representing the time of sunset on
     *  the KCAstronomicalCalendar instance's workingDate property.
     *
     *  This method does not take elevation into account.
     *
     *  - returns: An NSDate representing sunset on workingDate.
     */
	public func seaLevelSunset() -> NSDate?
	{
	    let sunset: Double = UTCSeaLevelSunset(kZenithGeometric)
	    return adjustedSunsetDateWithSunset(dateFromTime(sunset), andSunrise: sunrise())
	}
	
    /**
     * A method that will roll the sunset time forward a day if sunset occurs before sunrise. This is a rare occurrence
     * and will typically happen when calculating very early and late twilights in a location with a time zone far off
     * from its natural 15&deg; boundaries. This method will ensure that in this case, the sunset will be incremented to
     * the following date. An example of this is Marquette, Michigan that far west of the natural boundaries for EST.
     * When you add in DST this pushes it an additional hour off. Calculating the extreme 26&deg;twilight on March 6th
     * it start at 2:34:30 on the 6th and end at 1:01:46 on the following day March 7th. Occurrences are more common in
     * the polar region for dips as low as 3&deg; (Tested for Hooper Bay, Alaska).
     *
     * - parameter sunset: The sunset date to adjust if needed
     * - parameter sunrise: The sunrise to compare to the sunset
     * - returns: The adjusted sunset date. If the calculation can't be computed such as in the Arctic Circle where 
     *   there is at least one day a year where the sun does not rise, and one where it does not set, a null will be
     *   returned. See detailed explanation on top of the page.
     */
	public func adjustedSunsetDateWithSunset(sunset: NSDate?, andSunrise sunrise: NSDate?) -> NSDate
	{
	    if sunrise != nil && sunset != nil && (sunrise!.timeIntervalSinceDate(sunset!) > 0)
	    {
	        return dateByAddingDays(1, toDate: sunset!)
	    }
	    return sunset!
	}
	
    /**
     * A method that returns the end of civil twilight using a zenith of {@link #CIVIL_ZENITH 96&deg;}.
     *
     * - returns: The NSDate of the end of civil twilight using a zenith of {@link #CIVIL_ZENITH 96&deg;}. If
     *         the calculation can't be computed, null will be returned. See detailed explanation on top of the page.
     */
	public func endCivilTwilight() -> NSDate
	{
	    return sunsetOffsetByDegrees(kZenithCivil)
	}
	
    /**
     * A method that returns the end of nautical twilight using a zenith of {@link #NAUTICAL_ZENITH 102&deg;}.
     *
     * - returns The <code>Date</code> of the end of nautical twilight using a zenith of {@link #NAUTICAL_ZENIT
     *   102&deg;}.  If the calculation can't be computed, null will be returned. See detailed explanation on top of
     *   the page.
     */
	public func endNauticalTwilight() -> NSDate
	{
	    return sunsetOffsetByDegrees(kZenithNautical)
	}
	
    /**
     * A method that returns the end of astronomical twilight using a zenith of {@link #ASTRONOMICAL_ZENITH 108&deg;}.
     *
     * - returns: The NSDate of the end of astronomical twilight using a zenith of {@link #ASTRONOMICAL_ZENITH
     *         108&deg;}. If the calculation can't be computed, null will be returned. See detailed explanation on top
     *         of the page.
     */
	public func endAstronomicalTwilight() -> NSDate
	{
	    return sunsetOffsetByDegrees(kZenithAstronomical)
	}
	
    /**
     *  This method returns the beginning of civil twilight (dawn) using a zenith of {@link #CIVIL_ZENITH 96&deg;}.
     *
     *  - perameter offsetZenith: The offset zenith.
     *
     *  - returns: The Date of the beginning of civil twilight using a zenith of 96 degrees. If the calculation
     *         can't be computed, nill will be returned. See detailed explanation on top of the page.
     */
	public func sunriseOffsetByDegrees(offsetZenith: Double) -> NSDate
	{
	    let dawn: Double = UTCSunrise(offsetZenith)
	    
	    return  dateFromTime(dawn)
	}
	
    /**
     * A utility method that returns the time of an offset by degrees below or above the horizon of {@link #getSunset()
     * sunset}. Note that the degree offset is from the vertical, so for a calculation of 14&deg; after sunset, an
     * offset of 14 + {@link #GEOMETRIC_ZENITH} = 104 would have to be passed as a parameter.
     *
     * - parameter offsetZenith: The degrees after {@link #getSunset()} to use in the calculation.
     *          For time before sunset use negative numbers. Note that the degree offset is from the vertical, so for a calculation of 14&deg;
     *          after sunset, an offset of 14 + {@link #GEOMETRIC_ZENITH} = 104 would have to be passed as a parameter.
     * - returns: The NSDate of the offset after (or before) {@link #getSunset()}. If the calculation can't
     *         be computed such as in the Arctic Circle where there is at least one day a year where the sun does not
     *         rise, and one where it does not set, a null will be returned. See detailed explanation on top of the
     *         page.
     */
	public func sunsetOffsetByDegrees(offsetZenith: Double) -> NSDate
	{
	    let sunset: Double = UTCSunset(offsetZenith)
		
	    return adjustedSunsetDateWithSunset(dateFromTime(sunset), andSunrise: sunriseOffsetByDegrees(offsetZenith))
	}
	
    /**
     * A method that returns the sunrise in UTC time without correction for time zone offset from GMT and without using
     * daylight savings time.
     *
     * - parameter zenith: The degrees below the horizon. For time after sunrise use negative numbers.
     * - returns: The time in the format: 18.75 for 18:45:00 UTC/GMT. If the calculation can't be computed such as in
     *   the Arctic Circle where there is at least one day a year where the sun does not rise, and one where it does
     *   not set, {@link Double#NaN} will be returned. See detailed explanation on top of the page.
     */
	public func UTCSunrise(zenith: Double) -> Double
	{
	    return astronomicalCalculator!.UTCSunriseForDate(workingDate!, andZenith: zenith, adjustForElevation: true)
	}
	
    /**
     * A method that returns the sunrise in UTC time without correction for time zone offset from GMT and without
     * using daylight savings time. Non-sunrise and sunset calculations such as dawn and dusk, depend on the amount of 
     * visible light, something that is not affected by elevation. This method returns UTC sunrise calculated at sea 
     * level. This forms the base for dawn calculations that are calculated as a dip below the horizon before sunrise.
     *
     * - parameter zenith: The degrees below the horizon. For time after sunrise use negative numbers.
     * - returns: The time in the format: 18.75 for 18:45:00 UTC/GMT. If the calculation can't be computed such as in the Arctic Circle where there is at least one day a year where the sun does not rise, and one where it does
     *   not set, {@link Double#NaN} will be returned. See detailed explanation on top of the page.
     */
	public func UTCSeaLevelSunrise(zenith: Double) -> Double
	{
	    let sunrise: Double = (astronomicalCalculator!).UTCSunriseForDate(workingDate!, andZenith: zenith, adjustForElevation: false)
	    return sunrise
	}
	
    /**
     * A method that returns the sunset in UTC time without correction for time zone offset from GMT and without using
     * daylight savings time.
     *
     * - parameter zenith: The degrees below the horizon. For time after sunset use negative numbers.
     * - returns: The time in the format: 18.75 for 18:45:00 UTC/GMT. If the calculation can't be computed such as in 
     *   the Arctic Circle where there is at least one day a year where the sun does not rise, and one where it does
     *   not set, {@link Double#NaN} will be returned. See detailed explanation on top of the page.
     */
	public func UTCSunset(zenith: Double) -> Double
	{
	    return astronomicalCalculator!.UTCSunsetForDate(workingDate!, andZenith: zenith, adjustForElevation: true)
	}
	
    /**
     * A method that returns the sunset in UTC time without correction for elevation, time zone offset from GMT and
     * without using daylight savings time. Non-sunrise and sunset calculations such as dawn and dusk, depend on the
     * amount of visible light, something that is not affected by elevation. This method returns UTC sunset calculated
     * at sea level. This forms the base for dusk calculations that are calculated as a dip below the horizon after
     * sunset.
     *
     * - parameter zenith: The degrees below the horizon. For time before sunset use negative numbers.
     * - returns: The time in the format: 18.75 for 18:45:00 UTC/GMT. If the calculation can't be computed such as in 
     *   the Arctic Circle where there is at least one day a year where the sun does not rise, and one where it does
     *   not set, {@link Double#NaN} will be returned. See detailed explanation on top of the page.
     */
	public func UTCSeaLevelSunset(zenith: Double) -> Double
	{
	    return astronomicalCalculator!.UTCSunsetForDate(workingDate!, andZenith: zenith, adjustForElevation: false)
	}
	
    /**
     * A utility method that will allow the calculation of a temporal (solar) hour based on the sunrise and sunset
     * passed as parameters to this method. An example of the use of this method would be the calculation of a
     * non-elevation adjusted temporal hour by passing in getSeaLevelSunrise sea level sunrise} and
     * {@link #getSeaLevelSunset() sea level sunset} as parameters.
     *
     * - parameter sunrise: The start of the day.
     * - parameter sunset: The end of the day.
     *
     * - returns: The long millisecond length of the temporal hour. If the calculation can't be computed a
     *         Int.min will be returned. See detailed explanation on top of the page.
     */
	public func temporalHourFromSunrise(sunrise: NSDate?, toSunset sunset: NSDate?) -> Double
	{
	    if sunrise == nil || sunset == nil
	    {
	        return Double(Int.min)
	    }
	    return sunset!.timeIntervalSinceDate(sunrise!) / 12
	}
	
    /**
     * A method that returns sundial or solar noon. It occurs when the Sun is <a href
     * ="http://en.wikipedia.org/wiki/Transit_%28astronomy%29">transitting</a> the <a
     * href="http://en.wikipedia.org/wiki/Meridian_%28astronomy%29">celestial meridian</a>. In this class it is
     * calculated as halfway between sea level sunrise and sea level sunset, which can be slightly off the real transit
     * time due to changes in declination (the lengthening or shortening day).
     *
     * - returns: the NSDate representing Sun's transit. If the calculation can't be computed such as in the
     *   Arctic Circle where there is at least one day a year where the sun does not rise, and one where it does
     *   not set, null will be returned. See detailed explanation on top of the page.
     */
	public func sunTransit() -> NSDate
	{
	    return sunrise()!.dateByAddingTimeInterval(temporalHourFromSunrise(sunrise(), toSunset: sunset()) * 6)
	}
	
    /**
     *  This method returns the calculated time
     *  as an NSDate object based on the user's time zone
     *  and today's date.
     *
     *  - parameter time: The time as a double.
     *
     *  - returns: The calculated time as an NSDate object based on the user's time zone and today's date.
     */
	public func dateFromTime(time: Double) -> NSDate
	{
	    return dateFromTime(time, inTimeZone: NSTimeZone.localTimeZone(), onDate: workingDate!)!
	}
	
    /**
     *  A method that returns the calculated time
     *  as an NSDate object based on a given time
     *  zone and a given date.
     *
     *  Returns nil if the the "time" parameter is NAN.
     *
     *  - parameter time: The time offset from the start of the day, representing hours, minutes, and seconds.
     *  - parameter tz: A timezone to use to calculate the date.
     *  - parameter date: The date representing the units larger than hours.
     *
     *  - returns: An NSDate containing the exact time represented by combining the date and time values.
     */
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
	
    /**
     *  Returns a formatted string representing the supplied
     *  date in the supplied time zone.
     *
     *  This method does not toggle the timezone of the
     *  NSDateFormatter that is used, so assume the default
     *  calendar.
     *
     *  - parameter date: The date to display.
     *  - parameter timezone: The time zone to format against.
     *
     *  - returns: A string representation of the supplied date in the supplied time zone.
     */
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
	
    /**
     *  Returns a formatted string representing the supplied
     *  date in the supplied time zone.
     *
     *  This method does not toggle the timezone of the
     *  NSDateFormatter that is used, so assume the default
     *  calendar.
     *
     *  - parameter date: The date to display.
     *  - parameter tz: The time zone to format against.
     *  - parameter shouldShowSeconds: A flag to disable seconds in our final string.
     *
     *  - returns: A string representation of the supplied date in the supplied time zone.
     */
	public func stringFromDate(date: NSDate, forTimeZone timezone: NSTimeZone) -> String
	{
	    
	    return stringFromDate(date, forTimeZone: timezone, withSeconds: true)
	    
	}
	
    /**
     *  Expose the internal calendar so the main class can
     *  appropriately forward methods.
     */
	public func  getInternalCalendar() -> NSCalendar
	{
	    return internalCalendar!
	}
}