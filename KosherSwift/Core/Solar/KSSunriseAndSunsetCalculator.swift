//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

/** A class that uses the United States Naval Almanac Algorithm to calculate sunrise and sunset. */
public class SunriseAndSunsetCalculator: trigonometry, AstronomicalCalculator
{
    /**
     *  The location of the user.
     */
	public var geoLocation : GeoLocation?
    
    /**
     *  A string representing the name of the calculator
     */
	public var calculatorName : String?
	
    public init(geoLocation: GeoLocation)
	{
		calculatorName = "United States Naval Almanac Algorithm"
        self.geoLocation = geoLocation
	}
	
    /**
     *  A method returning the sunrise in UTC as a double. If an error was
     *  encountered in the calculation (as expected in some locations, such
     *  as near the poles) NAN will be returned.
     *
     *  - parameter year: A Gregorian year number as an integer.
     *  - parameter month: The month of the gregorian year. Valud values range from 1 to 12.
     *  - parameter day: The day of the gregorian month. Valid values range from 1 to 31.
     *  - parameter longitude: The longitude in degrees. (Longitude values west of Meridian are negative.)
     *  - parameter latitude: The latitude in degrees. longitudes south of Equator are negative
     *  - parameter zenith: Which zenith to use in the calculation.
     *  - parameter type: The type of calculation to carry out. Values are kCalcTypeSunrise or kCalcTypeSunset. (Alternatively, an integer 0 or 1)
     *
     *  - returns: The time that sunset occurs UTC as a double.
     */
	public func sunriseOrSunsetForYear(year: Int, andMonth month: Int, andDay day: Int, atLongitude longitude: Double, andLatitude latitude: Double, withZenith zenith: Double, andType type: Int) -> Double
	{
	    
		let dayOfYear: Int = dayOfYearForYear(year: year, month: month, day: day)
	    
		let sunMeanAnomaly: Double = meanAnomalyForDayOfYear(dayOfYear: dayOfYear, atLongitude: longitude, forCalculationType: type)
	    
		let sunTrueLong: Double = sunTrueLongitudeFromAnomaly(sunMeanAnomaly: sunMeanAnomaly)
	    
		let sunRightAscensionHours: Double = sunRightAscensionHoursForLongitude(sunTrueLongitude: sunTrueLong)
	    
		let cosLocalHourAngle: Double = cosLocalHourAngleForAngle(sunTrueLongitude: sunTrueLong, andLatitude: latitude, andZenith: zenith)
	    
        var localHourAngle: Double = 0
	    
	    if type == kTypeSunrise
	    {
	        if cosLocalHourAngle > 1
	        { // no rise. No need for an Exception
	            // since the calculation
	            // will return NaN
	        }
			localHourAngle = 360.0 - acosDeg(x: cosLocalHourAngle)
	    }
	    else /* if (type == TYPE_SUNSET)*/
	    {
	        if cosLocalHourAngle < -1
	        {// no SET. No need for an Exception
	            // since the calculation
	            // will return Double.NaN
	        }
			localHourAngle = acosDeg(x: cosLocalHourAngle)
	    }
	    let localHour: Double = localHourAngle / kDegreesPerHour
	    
		let localMeanTime: Double = localMeanTimeForHour(localHour: localHour, andAscension: sunRightAscensionHours, andApproxTimeDays: approxTimeDaysForDayOfYear(dayOfYear: dayOfYear, withHoursFromMeridian: hoursFromMeridianForLongitude(longitude: longitude), forCalculationType: type))
	    
		var processedTime: Double = localMeanTime - hoursFromMeridianForLongitude(longitude: longitude)
	    
		while  processedTime < 0.0
	    {
			processedTime = processedTime + 24.0
		}
		
		while  processedTime >= 24.0
	    {
			processedTime = processedTime - 24.0
		}
	    
	    return processedTime
	}
	
    /**
     *  Calculate the local mean time of rising or setting.
     *  By `local' is meant the exact time at the location,
     *  assuming that there were no time zone. That is, the
     *  time difference between the location and the Meridian
     *  depended entirely on the longitude. We can't do anything
     *  with this time directly; we must convert it to UTC and
     *  then to a local time. The result is expressed as a
     *  fractional number of hours since midnight.
     *
     *  - parameter localHour: Description unavailable.
     *  - parameter sunRightAscensionHours: Description unavailable.
     *  - parameter approxTimeDays: Description unavailable.
     *
     *  - returns: The local mean time of sunrise or sunset.
     */
	public func localMeanTimeForHour(localHour: Double, andAscension sunRightAscensionHours: Double, andApproxTimeDays approxTimeDays: Double) -> Double
	{
	    let temp: Double = localHour + sunRightAscensionHours - (0.06571 * approxTimeDays) - 6.622
	    return temp
	}
	
    /**
     *  Gets the cosine of the Sun's local hour angle.
     *
     *  - parameter sunTrueLongitude: Description unavailable.
     *  - parameter latitude: The latitude to use for the calculation.
     *  - parameter zenith: The zenith to use for the calculation.
     */
	public func cosLocalHourAngleForAngle(sunTrueLongitude: Double, andLatitude latitude: Double, andZenith zenith: Double) -> Double
	{
		let sinDec: Double = 0.39782 * (sinDeg(deg: sunTrueLongitude))
		let cosDec: Double = cosDeg(deg: (asinDeg(x: sinDec)))
		let cosH: Double = ((cosDeg(deg: zenith)) - (sinDec * (sinDeg(deg: latitude)))) / (cosDec * (cosDeg(deg: latitude)))
	    return cosH
	}
	
    /**
     *  Calculates the Sun's right ascension in hours, given the Sun's true
     *  longitude in degrees. Input and output are angles greater than 0 and
     *  less than 360.
     *
     *  - parameter sunTrueLongitude: Description unavailable.
     *
     *  - returns: The sun's right ascension.
     */
	public func sunRightAscensionHoursForLongitude(sunTrueLongitude: Double) -> Double
	{
		let a: Double = 0.91764 * tanDeg(deg: sunTrueLongitude)
        var ra: Double = 360.0 / (2.0 * M_PI) * atan(a)
	    
	    // get result into 0-360 degree range
	    // if (ra >= 360.0)ra = ra - 360.0;
	    // if (ra < 0)ra = ra + 360.0;
	    
	    let lQuadrant: Double = floor(sunTrueLongitude / 90.0) * 90.0
	    let raQuadrant: Double = floor(ra / 90.0) * 90.0
	    ra = ra + (lQuadrant - raQuadrant)	    
	    return ra / kDegreesPerHour; // convert to hours
	}
	
    /**
     *  Calculates the Sun's true longitude in degrees. The result is an angle
     *  greater than 0 and less than 360. Requires the Sun's mean anomaly, also
     *  in degrees.
     *
     *  - parameter sunMeanAnomaly: The mean anomaly of the sun, in degrees.
     *
     *  - returns: The sun's true longitude in degrees.
     */
	public func sunTrueLongitudeFromAnomaly(sunMeanAnomaly: Double) -> Double
	{
		var l: Double = sunMeanAnomaly + (1.916 * sinDeg(deg: sunMeanAnomaly)) + (0.020 * sinDeg(deg: 2 * sunMeanAnomaly)) + 282.634
	    
	    // get longitude into 0-360 degree range
	    if l >= 360.0
	    {
	        l = l - 360.0
	    }
	    if l < 0
	    {
	        l = l + 360.0
	    }
        return l
	}
	
    /**
     *  Calculate the Sun's mean anomaly in degrees, at sunrise or sunset, given
     *  the longitude in degrees.
     *
     *  - parameter dayOfYear: The day of the year that we're calculating for.
     *  - parameter longitude: The longitude for the calculation.
     *  - parameter type: Either 0 or 1. Also defined as kTypeSunrise and kTypeSunset in kSunCalculationTypes.h,
     *  respectively.
     *
     *  - returns: The sun's mean anomaly in degrees.
     */
	public func meanAnomalyForDayOfYear(dayOfYear: Int, atLongitude longitude: Double, forCalculationType type: Int) -> Double
	{
		let temp: Double = (0.9856 * approxTimeDaysForDayOfYear(dayOfYear: dayOfYear, withHoursFromMeridian: hoursFromMeridianForLongitude(longitude: longitude), forCalculationType: type)) - 3.289
	    return temp
	}
	
    /**
     *  Gets the approximate time of sunset or sunrise In DAYS since midnight
     *  Jan 1st, assuming 6am and 6pm events. We need this figure to derive the
     *  Sun's mean anomaly.
     *
     *  - parameter dayOfYear: The day of the gregorian year.
     *  - parameter hoursFromMeridian: How far we are from the meridian.
     *  - parameter type: Either 0 or 1. Also defined as kTypeSunrise and kTypeSunset in kSunCalculationTypes.h,
     *  respectively.
     */
	public func approxTimeDaysForDayOfYear(dayOfYear: Int, withHoursFromMeridian hoursFromMeridian: Double, forCalculationType type: Int) -> Double
	{
	    
	    if type == kTypeSunrise
	    {
	        return Double(dayOfYear) + ((6.0 - hoursFromMeridian) / 24)
	    }
        else
	    {
	        return Double(dayOfYear) + ((18.0 - hoursFromMeridian) / 24)
	    }
	    
	}
	
    /**
     *  Get time difference between location's longitude and the Meridian, in
     *  hours. West of Meridian has a negative time difference.
     *
     *  - parameter longitude: The longitude that we're calculating for.
     *
     *  - returns: the time difference between the longitude and the prime meridian.
     */
	public func hoursFromMeridianForLongitude(longitude: Double) -> Double
	{
	    return longitude / kDegreesPerHour
	}
	
    /**
     *  Calculate the day of the year, where Jan 1st is day 1. Note that this
     *  method needs to know the year, because leap years have an impact here
     *
     *  - parameter year: A Gregorian year number.
     *  - parameter month: A gregorian month number. January is 1, December is 12.
     *  - parameter day: The day of the month, beginning with 1.
     *
     *  - returns: The days of the Gregorian year.
     */
	public func dayOfYearForYear(year: Int, month: Int, day: Int) -> Int
	{
	    let n1: Int = 275 * month / 9
	    let n2: Int = (month + 9) / 12
	    let n3: Int = (1 + ((year - 4 * (year / 4) + 2) / 3))
	    let n: Int = n1 - (n2 * n3) + day - 30
	    
	    //NSLog(@"- (int)getDayOfYearForYear:(int)year andMonth:(int)month andDay:(int)day;  %i", n);
	    return n
	}
	
    /**
     *  Get sunset as a double.
     *
     *  - parameter date: The date we're using to calculate sunrise.
     *  - parameter zenith: The zenith we use.
     *  - parameter adjustForElevation: Determines if we calculate at a the given elevation or at
     *  sea level.
     *
     *  - returns: The sunset time as a double. (TODO: Check the units.)
     */
	public func UTCSunsetForDate(date: NSDate, andZenith zenith: Double, adjustForElevation: Bool) -> Double
	{
        var doubleTime: Double = 0.0
        var tempZenith = zenith
	    if adjustForElevation
	    {
			tempZenith = adjustZenith(zenith: zenith, forElevation: geoLocation!.altitude)
	    }
	    else
	    {
			tempZenith = adjustZenith(zenith: zenith, forElevation: 0)
	    }
	    
		let year: Int = yearMonthAndDayFromDate(date: date)[0]
	    
		let month: Int = yearMonthAndDayFromDate(date: date)[1]
	    
		let day: Int = yearMonthAndDayFromDate(date: date)[2]
	    
		doubleTime = sunriseOrSunsetForYear(year: year, andMonth: month, andDay: day, atLongitude: geoLocation!.longitude, andLatitude: geoLocation!.latitude, withZenith: tempZenith, andType: kTypeSunset)
	    
	    return doubleTime
	}
	
    /**
     *  Get sunrise as a double.
     *
     *  - parameter date: The date we're using to calculate sunrise.
     *  - parameter zenith: The zenith we use.
     *  - parameter adjustForElevation: Determines if we calculate at a the given elevation or at
     *  sea level.
     *
     *  - returns: The sunrise time as a double. (TODO: Check the units.)
     */
	public func UTCSunriseForDate(date: NSDate, andZenith zenith: Double, adjustForElevation: Bool) -> Double
	{
        var doubleTime: Double = 0.0
        var tempZenith = zenith
	    if adjustForElevation
	    {
			tempZenith = adjustZenith(zenith: zenith, forElevation: geoLocation!.altitude)
	    }
	    else
	    {
			tempZenith = adjustZenith(zenith: zenith, forElevation: 0)
	    }
	    
		let year: Int = yearMonthAndDayFromDate(date: date)[0]
		let month: Int = yearMonthAndDayFromDate(date: date)[1]
		let day: Int = yearMonthAndDayFromDate(date: date)[2]
		doubleTime = sunriseOrSunsetForYear(year: year, andMonth: month, andDay: day, atLongitude: geoLocation!.longitude, andLatitude: geoLocation!.latitude, withZenith: tempZenith, andType: kTypeSunrise)
	    return doubleTime
	}
	
    /**
     *	Method to return the adjustment to the zenith required to account for the
     *	elevation. Since a person at a higher elevation can see farther below the
     *	horizon, the calculation for sunrise / sunset is calculated below the
     *	horizon used at sea level. This is only used for sunrise and sunset and
     *	not times above or below it such as nautical twilight since those calculations
     *  are based on the level of available light at the
     *	given dip below the horizon, something that is not affected by elevation,
     *	the adjustment should only made if the zenith == 90&deg;
     *	{@link #adjustZenith adjusted} for refraction and solar radius.<br />
     *
     *	The source of this algorthitm is <a
     *	href="http: *www.calendarists.com">Calendrical Calculations</a> by
     *	Edward M. Reingold and Nachum Dershowitz.
     *
     *	- parameter elevation: elevation in Meters.
     *
     *	- returns: the adjusted zenith
     */
	public func elevationAdjustmentForElevation(elevation: Double) -> Double
	{
	    let earthRadius: Double = kEarthRadiusInKilometers
		let elevationAdjustment: Double = toDegrees(radians: acos(earthRadius / (earthRadius + (elevation / 1000))))
	    return elevationAdjustment
	}
	
    /**
     *	Adjusts the zenith to account for solar refraction, solar radius and
     *	elevation. The value for Sun's zenith and true rise/set Zenith (used in
     *	this class and subclasses) is the angle that the center of the Sun makes
     *	to a line perpendicular to the Earth's surface. If the Sun were a point
     *	and the Earth were without an atmosphere, true sunset and sunrise would
     *	correspond to a 90&deg; zenith. Because the Sun is not a point, and
     *	because the atmosphere refracts light, this 90&deg; zenith does not, in
     *	fact, correspond to true sunset or sunrise, instead the centre of the
     *	Sun's disk must lie just below the horizon for the upper edge to be
     *	obscured. This means that a zenith of just above 90&deg; must be used.
     *	The Sun subtends an angle of 16 minutes of arc (this can be changed via
     *	the {@link #setSolarRadius(double)} method , and atmospheric refraction
     *	accounts for 34 minutes or so, giving a total of 50 arcminutes.
     *	The total value for ZENITH is 90+(5/6) or 90.8333333&deg; for true
     *	sunrise/sunset. Since a person at an elevation can see blow the horizon
     *	of a person at sea level, this will also adjust the zenith to account for
     *	elevation if available.
     *
     *  - parameter zenith: The zenith to use with the calculation.
     *  - parameter elevation: The elevation to use for the calculation.
     *
     *	- returns: The zenith adjusted to include the sun's radius, refraction, and
     *  elevation adjustment.
     */
	public func adjustZenith(zenith: Double, forElevation elevation: Double) -> Double
	{
	    if zenith == kZenithGeometric
	    {
			return zenith + (kSolarRadius + kRefraction + elevationAdjustmentForElevation(elevation: elevation))
	    }
	    
	    return zenith
	}
	
    /**
     *  Break up a date object into day, month, year.
     *
     *  - parameter date: An NSDate to use extract information from.
     *
     *  - returns: An array containing three numbers. The first represents a year. The second represents the month. The third value is the day of the month.
     */
	public func yearMonthAndDayFromDate(date: NSDate) -> [Int]
	{
		let gregorianCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSCalendar.Identifier.gregorian)!
		let parts = gregorianCalendar.components([.year, .month, .day], from: date as Date)
        let year = parts.year ?? 0
	    let month = parts.month ?? 0
	    let day = parts.day ?? 0
        let tempArray = [year, month, day]
	    return tempArray
	}
}
