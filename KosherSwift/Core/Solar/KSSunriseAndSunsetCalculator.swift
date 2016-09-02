//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

public class KSSunriseAndSunsetCalculator: trigonometry, KSAstronomicalCalculator
{
	var geoLocation : KSGeoLocation?
	var calculatorName : String?
	
    public init(geoLocation: KSGeoLocation)
	{
		calculatorName = "United States Naval Almanac Algorithm"
        self.geoLocation = geoLocation
	}
	
	public func sunriseOrSunsetForYear(year: Int, andMonth month: Int, andDay day: Int, atLongitude longitude: Double, andLatitude latitude: Double, withZenith zenith: Double, andType type: Int) -> Double
	{
	    
	    let dayOfYear: Int = dayOfYearForYear(year, month: month, day: day)
	    
	    let sunMeanAnomaly: Double = meanAnomalyForDayOfYear(dayOfYear, atLongitude: longitude, forCalculationType: type)
	    
	    let sunTrueLong: Double = sunTrueLongitudeFromAnomaly(sunMeanAnomaly)
	    
	    let sunRightAscensionHours: Double = sunRightAscensionHoursForLongitude(sunTrueLong)
	    
	    let cosLocalHourAngle: Double = cosLocalHourAngleForAngle(sunTrueLong, andLatitude: latitude, andZenith: zenith)
	    
	    var localHourAngle: Double = 0
	    
	    if type == kTypeSunrise
	    {
	        if cosLocalHourAngle > 1
	        { // no rise. No need for an Exception
	            // since the calculation
	            // will return NaN
	        }
	        localHourAngle = 360.0 - acosDeg(cosLocalHourAngle)
	    }
	    else /* if (type == TYPE_SUNSET)*/
	    {
	        if cosLocalHourAngle < -1
	        {// no SET. No need for an Exception
	            // since the calculation
	            // will return Double.NaN
	        }
	        localHourAngle = acosDeg(cosLocalHourAngle)
	    }
	    let localHour: Double = localHourAngle / kDegreesPerHour
	    
	    let localMeanTime: Double = localMeanTimeForHour(localHour, andAscension: sunRightAscensionHours, andApproxTimeDays: approxTimeDaysForDayOfYear(dayOfYear, withHoursFromMeridian: hoursFromMeridianForLongitude(longitude), forCalculationType: type))
	    
	    var processedTime: Double = localMeanTime - hoursFromMeridianForLongitude(longitude)
	    
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
	
	public func localMeanTimeForHour(localHour: Double, andAscension sunRightAscensionHours: Double, andApproxTimeDays approxTimeDays: Double) -> Double
	{
	    
	    let temp: Double = localHour + sunRightAscensionHours - (0.06571 * approxTimeDays) - 6.622
	    
	    //NSLog(@"- (double)localMeanTimeForHour:(double)localHour andAscension:(double)sunRightAscensionHours andApproxTimeDays:(double)approxTimeDays; %.15f", temp);
	    
	    return temp
	    
	}
	
	public func cosLocalHourAngleForAngle(sunTrueLongitude: Double, andLatitude latitude: Double, andZenith zenith: Double) -> Double
	{
	    
	    //NSLog(@"\n\n\n Long: %.15f \n\n Lat: %.15f \n\n Zen: %.15f\n\n\n", sunTrueLongitude, latitude, zenith);
	    let sinDec: Double = 0.39782 * (sinDeg(sunTrueLongitude))
	    let cosDec: Double = cosDeg((asinDeg(sinDec)))
	    
	    let cosH: Double = ((cosDeg(zenith)) - (sinDec * (sinDeg(latitude)))) / (cosDec * (cosDeg(latitude)))
	    
	    //NSLog(@"- (double)cosLocalHourAngleForAngle:(double)sunTrueLongitude andLatitude:(double)latitude andZenith:(double)zenith; %.15f" ,cosH);
	    
	    return cosH
	    
	}
	
	public func sunRightAscensionHoursForLongitude(sunTrueLongitude: Double) -> Double
	{
	    let a: Double = 0.91764 * tanDeg(sunTrueLongitude)
	    var ra: Double = 360.0 / (2.0 * M_PI) * atan(a)
	    
	    // get result into 0-360 degree range
	    // if (ra >= 360.0)ra = ra - 360.0;
	    // if (ra < 0)ra = ra + 360.0;
	    
	    let lQuadrant: Double = floor(sunTrueLongitude / 90.0) * 90.0
	    let raQuadrant: Double = floor(ra / 90.0) * 90.0
	    ra = ra + (lQuadrant - raQuadrant)

	    //NSLog(@"- (double)sunRightAscensionHoursForLongitude:(double)sunTrueLongitude; %.15f", ra/kDegreesPerHour);
	    
	    return ra / kDegreesPerHour; // convert to hours
	}
	
	public func sunTrueLongitudeFromAnomaly(sunMeanAnomaly: Double) -> Double
	{
	    var l: Double = sunMeanAnomaly + (1.916 * sinDeg(sunMeanAnomaly)) + (0.020 * sinDeg(2 * sunMeanAnomaly)) + 282.634
	    
	    // get longitude into 0-360 degree range
	    if l >= 360.0
	    {
	        l = l - 360.0
	    }
	    if l < 0
	    {
	        l = l + 360.0
	    }
	    
	    //NSLog(@"- (double)sunTrueLongitudeFromAnomaly:(double)sunMeanAnomaly{ Anomaly: %.15f", l);
	    return l
	}
	
	public func meanAnomalyForDayOfYear(dayOfYear: Int, atLongitude longitude: Double, forCalculationType type: Int) -> Double
	{
	    let temp: Double = (0.9856 * approxTimeDaysForDayOfYear(dayOfYear, withHoursFromMeridian: hoursFromMeridianForLongitude(longitude), forCalculationType: type)) - 3.289
	    
	    //NSLog(@"- (double)getMeanAnamolyForDayOfYear:(int)dayOfYear atLongitude:(double)longitude forCalculationType:(int)type %.15f", temp);
	    
	    return temp
	}
	
	public func approxTimeDaysForDayOfYear(dayOfYear: Int, withHoursFromMeridian hoursFromMeridian: Double, forCalculationType type: Int) -> Double
	{
	    
	    if type == kTypeSunrise
	    {
	        return Double(dayOfYear) + ((6.0 - hoursFromMeridian) / 24)
	    } else /* if (type == TYPE_SUNSET)*/
	    {
	        return Double(dayOfYear) + ((18.0 - hoursFromMeridian) / 24)
	    }
	    
	}
	
	public func hoursFromMeridianForLongitude(longitude: Double) -> Double
	{
	    return longitude / kDegreesPerHour
	}
	
	public func dayOfYearForYear(year: Int, month: Int, day: Int) -> Int
	{
	    let n1: Int = 275 * month / 9
	    let n2: Int = (month + 9) / 12
	    let n3: Int = (1 + ((year - 4 * (year / 4) + 2) / 3))
	    let n: Int = n1 - (n2 * n3) + day - 30
	    
	    //NSLog(@"- (int)getDayOfYearForYear:(int)year andMonth:(int)month andDay:(int)day;  %i", n);
	    return n
	}
	
	public func UTCSunsetForDate(date: NSDate, andZenith zenith: Double, adjustForElevation: Bool) -> Double
	{
	    var doubleTime: Double = 0.0
	    var tempZenith = zenith
	    if adjustForElevation
	    {
	        tempZenith = adjustZenith(zenith, forElevation: geoLocation!.altitude)
	    }
	    else
	    {
	        tempZenith = adjustZenith(zenith, forElevation: 0)
	    }
	    
	    let year: Int = yearMonthAndDayFromDate(date)[0]
	    
	    let month: Int = yearMonthAndDayFromDate(date)[1]
	    
	    let day: Int = yearMonthAndDayFromDate(date)[2]
	    
	    doubleTime = sunriseOrSunsetForYear(year, andMonth: month, andDay: day, atLongitude: geoLocation!.longitude, andLatitude: geoLocation!.latitude, withZenith: tempZenith, andType: kTypeSunset)
	    
	    return doubleTime
	}
	
	public func UTCSunriseForDate(date: NSDate, andZenith zenith: Double, adjustForElevation: Bool) -> Double
	{
	    var doubleTime: Double = 0.0
	    var tempZenith = zenith
	    if adjustForElevation
	    {
	        tempZenith = adjustZenith(zenith, forElevation: geoLocation!.altitude)
	    }
	    else
	    {
	        tempZenith = adjustZenith(zenith, forElevation: 0)
	    }
	    
	    let year: Int = yearMonthAndDayFromDate(date)[0]
	    
	    let month: Int = yearMonthAndDayFromDate(date)[1]
	    
	    let day: Int = yearMonthAndDayFromDate(date)[2]
        
	    doubleTime = sunriseOrSunsetForYear(year, andMonth: month, andDay: day, atLongitude: geoLocation!.longitude, andLatitude: geoLocation!.latitude, withZenith: tempZenith, andType: kTypeSunrise)
	    
	    return doubleTime
	}
	
	public func elevationAdjustmentForElevation(elevation: Double) -> Double
	{
	    let earthRadius: Double = kEarthRadiusInKilometers
	    
	    //double elevationAdjustment = 0.0347 * sqrt(elevation);
	    let elevationAdjustment: Double = toDegrees(acos(earthRadius / (earthRadius + (elevation / 1000))))
	    
	    //NSLog(@"Elevation Adjustment: %.15f", elevationAdjustment);
	    
	    return elevationAdjustment
	}
	
	public func adjustZenith(zenith: Double, forElevation elevation: Double) -> Double
	{
	    if zenith == kZenithGeometric
	    {
            return zenith + (kSolarRadius + kRefraction + elevationAdjustmentForElevation(elevation))
	    }
	    
	    return zenith
	}
	
	public func yearMonthAndDayFromDate(date: NSDate) -> [Int]
	{
	    //
	    //  Create a calendar
	    //
	    
	    let gregorianCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierGregorian)!
	    
	    //
	    //  Set up the date components
	    //
	    
	    let parts: NSDateComponents = gregorianCalendar.components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day], fromDate:date)
	    
	    
	    //  Store the values in NSNumbers
	    let year = parts.year
	    let month = parts.month
	    let day = parts.day
	    
	    //  Create an array to hold the day, month and year
	    let tempArray = [year, month, day]
	    
	    return tempArray
	}
}