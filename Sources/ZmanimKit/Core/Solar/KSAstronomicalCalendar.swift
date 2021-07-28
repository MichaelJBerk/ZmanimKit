//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

/** A class that calculates various sunrise and sunset values.

Documentation from KosherJava:

A calendar that calculates astronomical times such as `sunrise()`, `sunset()` and twilight times. This class contains a `Calendar` and can therefore use the standard Calendar functionality to change dates etc...

The calculation engine used to calculate the astronomical times can be changed to a different implementation by implementing the `AstronomicalCalculator` protocol and setting it with the `setAstronomicalCalculator(AstronomicalCalculator)` method. A number of different calculation engine
implementations are included in the util package.
- NOTE: Only SunriseAndSunsetCalendar is included in `ZmanimKit`
- NOTE: There are times when the algorithms can't calculate proper values for sunrise, sunset and twilight. This
is usually caused by trying to calculate times for areas either very far North or South, where sunrise / sunset never
happen on that date. This is common when calculating twilight with a deep dip below the horizon for locations as far
south of the North Pole as London, in the northern hemisphere. The sun never reaches this dip at certain times of the
year. When the calculations encounter this condition a null will be returned when a
`Date` is expected and `Long` when a <code>`Long`</code> is expected. The
reason that `Errors` are not thrown in these cases is because the lack of a rise/set or twilight is
not an exception, but an expected condition in many parts of the world.

Here is a simple example of how to use the API to calculate sunrise.
First create the Calendar for the location you would like to calculate sunrise or sunset times for:

<pre>
String locationName = &quot;Lakewood, NJ&quot;;
double latitude = 40.0828; // Lakewood, NJ
double longitude = -74.2094; // Lakewood, NJ
double elevation = 20; // optional elevation correction in Meters
// the String parameter in getTimeZone() has to be a valid timezone listed in
// {@link java.util.TimeZone#getAvailableIDs()}
TimeZone timeZone = TimeZone.getTimeZone(&quot;America/New_York&quot;);
GeoLocation location = new GeoLocation(locationName, latitude, longitude, elevation, timeZone);
AstronomicalCalendar ac = new AstronomicalCalendar(location);
</pre>

To get the time of sunrise, first set the date you want (if not set, the date will default to today):

<pre>
ac.getCalendar().set(Calendar.MONTH, Calendar.FEBRUARY);
ac.getCalendar().set(Calendar.DAY_OF_MONTH, 8);
Date sunrise = ac.getSunrise();
</pre>


@author &copy; Eliyahu Hershfeld 2004 - 2020

*/
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
	public var internalCalendar : Calendar?
    
    /**
     * The date for which we want to perform the calculations.
     */
	public var workingDate : Date?
	
	public init()
	{
		internalCalendar = Calendar(identifier: .gregorian)
	}
	
	public init(location aGeoLocation: GeoLocation)
	{
	    let tempCalc: SunriseAndSunsetCalculator = SunriseAndSunsetCalculator(geoLocation: aGeoLocation)
		astronomicalCalculator = tempCalc
		geoLocation = aGeoLocation
		workingDate = Date()
		internalCalendar = Calendar(identifier: .gregorian)
	}
	
    /**
     *  This method calculates sunrise at the current geolocation.
     *
     *  The zenith used for the calculation uses geometric zenith of 90 degrees plus elevation.
     *  This is adjusted by the KCAstronomicalCalculator to add approximately 50/60 of a degree
     *  to account for 34 archminutes of refraction and 16 archminutes for the sun's radius for
     *  a total of 90.83333 degrees.
     *
     *  - returns: Sunrise as a Date.
     *  If the calculation cannot be computed, such as in the Arctic Circle, where there is
     *  at least one day a year that the sun does not rise, and one where it does not set,
     *  nil will be returned.
     */
	@objc public func sunrise() -> Date?
	{
		let sunrise = UTCSunrise(zenith: kZenithGeometric)
		return dateFromTime(time: sunrise)
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
     *  - returns: Sunrise at sea level as a Date.
     */
	@objc public func seaLevelSunrise() -> Date?
	{
		let sunrise: Double = UTCSeaLevelSunrise(zenith: kZenithGeometric)
		return dateFromTime(time: sunrise)
	}
	
    /**
     *  This method calculates the start of civil twilight.
     */
	@objc public func beginCivilTwilight() -> Date?
	{
		return sunriseOffsetByDegrees(offsetZenith: kZenithCivil)
	}
	
    /**
     *  This method calculates the start of nautical twilight.
     */
	@objc public func beginNauticalTwilight() -> Date?
	{
		return sunriseOffsetByDegrees(offsetZenith: kZenithNautical)
	}
	
    /**
     *  This method calculates the start of astronomical twilight.
     */
	@objc public func beginAstronomicalTwilight() -> Date?
	{
		return sunriseOffsetByDegrees(offsetZenith: kZenithAstronomical)
	}
	
    /**
     *  This method returns a Date representing the time of sunset on
     *  the KCAstronomicalCalendar instance's workingDate property.
     *
     *  This method takes elevation into account.
     *
     *  - returns: A Date representing sunset on workingDate.
     */
	@objc public func sunset() -> Date?
	{
		let sunset: Double = UTCSunset(zenith: kZenithGeometric)
		let sunsetDate = dateFromTime(time: sunset)
		let sunriseDate = sunrise()
		return adjustedSunsetDateWithSunset(sunset: sunsetDate, andSunrise: sunriseDate)
	}
	
    /**
     *  This method returns a Date representing the time of sunset on
     *  the KCAstronomicalCalendar instance's workingDate property.
     *
     *  This method does not take elevation into account.
     *
     *  - returns: A Date representing sunset on workingDate.
     */
	@objc public func seaLevelSunset() -> Date?
	{
		let sunset: Double = UTCSeaLevelSunset(zenith: kZenithGeometric)
		return adjustedSunsetDateWithSunset(sunset: dateFromTime(time: sunset), andSunrise: sunrise())
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
	@objc public func adjustedSunsetDateWithSunset(sunset: Date?, andSunrise sunrise: Date?) -> Date
	{
		if sunrise != nil && sunset != nil && (sunrise!.timeIntervalSince(sunset! as Date) > 0)
	    {
			return dateByAddingDays(days: 1, toDate: sunset!)
	    }
	    return sunset!
	}
	
    /**
     * A method that returns the end of civil twilight using a zenith of {@link #CIVIL_ZENITH 96&deg;}.
     *
     * - returns: The Date of the end of civil twilight using a zenith of {@link #CIVIL_ZENITH 96&deg;}. If
     *         the calculation can't be computed, null will be returned. See detailed explanation on top of the page.
     */
	@objc public func endCivilTwilight() -> Date
	{
		return sunsetOffsetByDegrees(offsetZenith: kZenithCivil)
	}
	
    /**
     * A method that returns the end of nautical twilight using a zenith of {@link #NAUTICAL_ZENITH 102&deg;}.
     *
     * - returns The <code>Date</code> of the end of nautical twilight using a zenith of {@link #NAUTICAL_ZENIT
     *   102&deg;}.  If the calculation can't be computed, null will be returned. See detailed explanation on top of
     *   the page.
     */
	@objc public func endNauticalTwilight() -> Date
	{
		return sunsetOffsetByDegrees(offsetZenith: kZenithNautical)
	}
	
    /**
     * A method that returns the end of astronomical twilight using a zenith of {@link #ASTRONOMICAL_ZENITH 108&deg;}.
     *
     * - returns: The Date of the end of astronomical twilight using a zenith of {@link #ASTRONOMICAL_ZENITH
     *         108&deg;}. If the calculation can't be computed, null will be returned. See detailed explanation on top
     *         of the page.
     */
	@objc public func endAstronomicalTwilight() -> Date
	{
		return sunsetOffsetByDegrees(offsetZenith: kZenithAstronomical)
	}
	
    /**
     *  This method returns the beginning of civil twilight (dawn) using a zenith of {@link #CIVIL_ZENITH 96&deg;}.
     *
     *  - perameter offsetZenith: The offset zenith.
     *
     *  - returns: The Date of the beginning of civil twilight using a zenith of 96 degrees. If the calculation
     *         can't be computed, nill will be returned. See detailed explanation on top of the page.
     */
	@objc public func sunriseOffsetByDegrees(offsetZenith: Double) -> Date?
	{
		let dawn: Double = UTCSunrise(zenith: offsetZenith)
	    
		return dateFromTime(time: dawn)
	}
	
    /**
     * A utility method that returns the time of an offset by degrees below or above the horizon of {@link #getSunset()
     * sunset}. Note that the degree offset is from the vertical, so for a calculation of 14&deg; after sunset, an
     * offset of 14 + {@link #GEOMETRIC_ZENITH} = 104 would have to be passed as a parameter.
     *
     * - parameter offsetZenith: The degrees after {@link #getSunset()} to use in the calculation.
     *          For time before sunset use negative numbers. Note that the degree offset is from the vertical, so for a calculation of 14&deg;
     *          after sunset, an offset of 14 + {@link #GEOMETRIC_ZENITH} = 104 would have to be passed as a parameter.
     * - returns: The Date of the offset after (or before) {@link #getSunset()}. If the calculation can't
     *         be computed such as in the Arctic Circle where there is at least one day a year where the sun does not
     *         rise, and one where it does not set, a null will be returned. See detailed explanation on top of the
     *         page.
     */
	@objc public func sunsetOffsetByDegrees(offsetZenith: Double) -> Date
	{
		let sunset: Double = UTCSunset(zenith: offsetZenith)
		
		return adjustedSunsetDateWithSunset(sunset: dateFromTime(time: sunset), andSunrise: sunriseOffsetByDegrees(offsetZenith: offsetZenith))
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
	@objc public func UTCSunrise(zenith: Double) -> Double
	{
		return astronomicalCalculator!.UTCSunriseForDate(date: workingDate!, andZenith: zenith, adjustForElevation: true)
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
	@objc public func UTCSeaLevelSunrise(zenith: Double) -> Double
	{
		let sunrise: Double = (astronomicalCalculator!).UTCSunriseForDate(date: workingDate!, andZenith: zenith, adjustForElevation: false)
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
	@objc public func UTCSunset(zenith: Double) -> Double
	{
		return astronomicalCalculator!.UTCSunsetForDate(date: workingDate!, andZenith: zenith, adjustForElevation: true)
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
	@objc public func UTCSeaLevelSunset(zenith: Double) -> Double
	{
		return astronomicalCalculator!.UTCSunsetForDate(date: workingDate!, andZenith: zenith, adjustForElevation: false)
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
	@objc public func temporalHourFromSunrise(sunrise: Date?, toSunset sunset: Date?) -> Double
	{
	    if sunrise == nil || sunset == nil
	    {
	        return Double(Int.min)
	    }
		return sunset!.timeIntervalSince(sunrise! as Date) / 12
	}
	
    /**
     * A method that returns sundial or solar noon. It occurs when the Sun is <a href
     * ="http://en.wikipedia.org/wiki/Transit_%28astronomy%29">transitting</a> the <a
     * href="http://en.wikipedia.org/wiki/Meridian_%28astronomy%29">celestial meridian</a>. In this class it is
     * calculated as halfway between sea level sunrise and sea level sunset, which can be slightly off the real transit
     * time due to changes in declination (the lengthening or shortening day).
     *
     * - returns: the Date representing Sun's transit. If the calculation can't be computed such as in the
     *   Arctic Circle where there is at least one day a year where the sun does not rise, and one where it does
     *   not set, null will be returned. See detailed explanation on top of the page.
     */
	@objc public func sunTransit() -> Date
	{
		return sunrise()!.addingTimeInterval(temporalHourFromSunrise(sunrise: sunrise(), toSunset: sunset()) * 6)
	}
	
    /**
     *  This method returns the calculated time
     *  as a Date object based on the user's time zone
     *  and today's date.
     *
     *  - parameter time: The time as a double.
     *
     *  - returns: The calculated time as a Date object based on the user's time zone and today's date.
     */
	public func dateFromTime(time: Double) -> Date?
	{
        if let date = workingDate
        {
			return dateFromTime(time: time, inTimeZone: .current, onDate: date)
        }
        return nil
	}
	
    /**
     *  A method that returns the calculated time
     *  as a Date object based on a given time
     *  zone and a given date.
     *
     *  Returns nil if the the "time" parameter is NAN.
     *
     *  - parameter time: The time offset from the start of the day, representing hours, minutes, and seconds.
     *  - parameter tz: A timezone to use to calculate the date.
     *  - parameter date: The date representing the units larger than hours.
     *
     *  - returns: A Date containing the exact time represented by combining the date and time values.
     */
	public func dateFromTime(time: Double, inTimeZone tz: TimeZone, onDate date: Date) -> Date?
	{
		if time.isNaN {
			return nil
		}
        var calculatedTime = time
		let gregorianCalendar = Calendar(identifier:.gregorian)
		var components: DateComponents = gregorianCalendar.dateComponents([.year, .month, .weekOfYear, .day, .hour, .minute, .second, .era], from: date)
        
		//  Set the components time zone to GMT, since all of our calculations were done in GMT initially.
		components.timeZone = TimeZone(secondsFromGMT: 0)
	    
		let hours: Int = Int(calculatedTime)
	    calculatedTime -= Double(hours)
		
        let minutes = Int(calculatedTime * 60)
		calculatedTime *= 60
	    calculatedTime -= Double(minutes)
		let seconds: Int = Int(calculatedTime * 60)
        
	    components.hour = Int(hours)
	    components.minute = Int(minutes)
	    components.second = Int(seconds)
	    
		var returnDate: Date = gregorianCalendar.date(from: components as DateComponents)!
	    
	    //  Here we apply a time zone offset. If the time is greater
	    //  than 24, or less than 0, then we "roll" the date by a day.
		let offsetFromGMT = Double(tz.secondsFromGMT(for: date as Date)) / 3600.0
        if time + offsetFromGMT > 24
	    {
			returnDate = dateBySubtractingDays(days: 1, fromDate: returnDate)
	    }
	    else if time + offsetFromGMT < 0
	    {
			returnDate = dateByAddingDays(days: 1, toDate: returnDate)
	    }
	    
	    return returnDate 
	}
	
    /**
     *  Returns a formatted string representing the supplied
     *  date in the supplied time zone.
     *
     *  This method does not toggle the timezone of the
     *  DateFormatter that is used, so assume the default
     *  calendar.
     *
     *  - parameter date: The date to display.
     *  - parameter timezone: The time zone to format against.
     *
     *  - returns: A string representation of the supplied date in the supplied time zone.
     */
	public func stringFromDate(date: Date, forTimeZone tz: NSTimeZone, withSeconds shouldShowSeconds: Bool) -> String{
	    
		let form: DateFormatter = DateFormatter()
	    
	    if shouldShowSeconds
	    {
			form.timeStyle = .medium
	    }
	    else
	    {
			form.timeStyle = .short
	    }
	
		form.timeZone = tz as TimeZone
	    
		return form.string(from: date as Date)
	}
	
    /**
     *  Returns a formatted string representing the supplied
     *  date in the supplied time zone.
     *
     *  This method does not toggle the timezone of the
     *  DateFormatter that is used, so assume the default
     *  calendar.
     *
     *  - parameter date: The date to display.
     *  - parameter tz: The time zone to format against.
     *  - parameter shouldShowSeconds: A flag to disable seconds in our final string.
     *
     *  - returns: A string representation of the supplied date in the supplied time zone.
     */
	public func stringFromDate(date: Date, forTimeZone timezone: NSTimeZone) -> String
	{
	    
		return stringFromDate(date: date, forTimeZone: timezone, withSeconds: true)
	    
	}
	
    /**
     *  Expose the internal calendar so the main class can
     *  appropriately forward methods.
     */
	public func  getInternalCalendar() -> Calendar
	{
	    return internalCalendar!
	}
}
