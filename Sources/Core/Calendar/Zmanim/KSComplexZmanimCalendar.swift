//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

/**
 *  This class extends ZmanimCalendar and provides many
 *  more zmanim than available in the ZmanimCalendar.
 *
 *  The basis for most zmanim in this class are from the sefer
 *  Yisroel Vehazmanim by Rabbi Yisroel Dovid Harfenes.
 *  As an example of the number of different zmanim made available
 *  by this class, there are methods to return 12 different
 *  calculations for alos (dawn) available in this class.
 *  The real power of this API is the ease in calculating zmanim
 *  that are not part of the API.
 *
 *  The methods for doing zmanim calculations not present in this class or its
 *  superclass the ZmanimCalendar are contained in AstronomicalCalendar,
 *  the base class of the calendars in our API since they are generic methods
 *  for calculating time based on degrees or time before or after sunrise and
 *  sunset and
 *  are of interest for calculation beyond zmanim calculations.
 */
public class ComplexZmanimCalendar: ZmanimCalendar
{
    /**
     *  The default value is 40 minutes. In Israel, this should be 25
     *  minutes.
     */
	public var ateretTorahSunsetOffset = 0
	
	public override init (location aGeoLocation: GeoLocation)
	{
		super.init(location: aGeoLocation)
	}
	
    /**
     *  Method to return a <em>shaah zmanis</em> (temporal hour) calculated using a
     *  19.8&deg; dip.
     *
     *  This calculation divides the day based on the opinion of the Magen Avraham that the day runs
     *  from dawn to dusk. Dawn for this calculation is  when the sun is 19.8&deg; below the
     *  eastern geometric horizon before sunrise.
     *
     *  Dusk for this is when the sun is 19.8&deg; below the western geometric horizon
     *  after sunset. This day is split into 12 equal parts with each part being a <em>shaah
     *  zmanis</em>.
     *
     *  - returns: The millisecond length of a shaah zmanis.
     *
     *  If the calculation can't be computed
     *  such as northern and southern locations even south of the Arctic Circle and north
     *  of the Antarctic Circle
     *  where the sun may not reach low enough below the horizon for this calculation, a
     *  Int.min will be returned. See detailed explanation on top of
     *  AstronomicalCalendar documentation.
     */
	@objc public func shaahZmanis19Point8Degrees() -> Double
	{
		return temporalHourFromSunrise(sunrise: alos19Point8Degrees(), toSunset: tzais19Point8Degrees())
	}
	
    /**
     *  Method to return a <em>shaah zmanis</em> (temporal hour) calculated using a
     *  18&deg; dip.
     *
     *  This calculation divides the day based on the opinion of the Magen Avraham that the day runs
     *  from dawn to dusk. Dawn for this calculation is  when the sun is 18&deg; below the
     *  eastern geometric horizon before sunrise.
     *
     *  Dusk for this is when the sun is 18&deg; below the western geometric horizon
     *  after sunset. This day is split into 12 equal parts with each part being a <em>shaah
     *  zmanis</em>.
     *
     *  - returns: The millisecond length of a shaah zmanis.
     *
     *  If the calculation can't be computed
     *  such as northern and southern locations even south of the Arctic Circle and north
     *  of the Antarctic Circle
     *  where the sun may not reach low enough below the horizon for this calculation, a
     *  Int.min will be returned. See detailed explanation on top of
     *  AstronomicalCalendar documentation.
     */
	@objc public func shaahZmanis18Degrees() -> Double
	{
		return temporalHourFromSunrise(sunrise: alos18Degrees(), toSunset: tzais18Degrees())
	}
	
    /**
     *  Method to return a <em>shaah zmanis</em> (temporal hour) calculated using a
     *  26&deg; dip.
     *
     *  This calculation divides the day based on the opinion of the Magen Avraham that the day runs
     *  from dawn to dusk. Dawn for this calculation is  when the sun is 26&deg; below the
     *  eastern geometric horizon before sunrise.
     *
     *  Dusk for this is when the sun is 26&deg; below the western geometric horizon
     *  after sunset. This day is split into 12 equal parts with each part being a <em>shaah
     *  zmanis</em>.
     *
     *  - returns: The millisecond length of a shaah zmanis.
     *
     *  If the calculation can't be computed
     *  such as northern and southern locations even south of the Arctic Circle and north
     *  of the Antarctic Circle
     *  where the sun may not reach low enough below the horizon for this calculation, a
     *  Int.min will be returned. See detailed explanation on top of
     *  AstronomicalCalendar documentation.
     */
	@objc public func shaahZmanis26Degrees() -> Double
	{
		return temporalHourFromSunrise(sunrise: alos26Degrees(), toSunset: tzais26Degrees())
	}
	
    /**
     *  Method to return a <em>shaah zmanis</em> (temporal hour) calculated using a
     *  16.1&deg; dip.
     *
     *  This calculation divides the day based on the opinion that the day runs
     *  from dawn to dusk. Dawn for this calculation is  when the sun is 16.1&deg; below the
     *  eastern geometric horizon before sunrise.
     *
     *  Dusk for this is when the sun is 16.1&deg; below the western geometric horizon
     *  after sunset. This day is split into 12 equal parts with each part being a <em>shaah
     *  zmanis</em>.
     *
     *  - returns: The millisecond length of a shaah zmanis.
     *
     *  If the calculation can't be computed
     *  such as northern and southern locations even south of the Arctic Circle and north
     *  of the Antarctic Circle
     *  where the sun may not reach low enough below the horizon for this calculation, a
     *  Int.min will be returned. See detailed explanation on top of
     *  AstronomicalCalendar documentation.
     */
	@objc public func shaahZmanis16Point1Degrees() -> Double
	{
		return temporalHourFromSunrise(sunrise: alos16Point1Degrees(), toSunset: tzais16Point1Degrees())
	}
	
    /**
     * Method to return a shaah zmanis (solar hour) according to the opinion of the Magen Avraham.
     * This calculation divides the day based on the opinion of the Magen Avraham that the day runs
     * from dawn to dusk. Dawn for this calculation is 60 minutes before sunrise and dusk is 60 minutes
     * after sunset. This day is split into 12 equal parts with each part being a shaah zmanis.
     *
     * - returns: The millisecond length of a shaah zmanis.
     *
     * If the calculation can't be computed such as in the Arctic Circle where
     * there is at least one day a year where the sun does not rise,
     * and one where it does not set, a Int.min will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func shaahZmanis60Minutes() -> Double
	{
		return temporalHourFromSunrise(sunrise: alos60(), toSunset: tzais60())
	}
	
    /**
     * Method to return a shaah zmanis (solar hour) according to the opinion of the Magen Avraham.
     * This calculation divides the day based on the opinion of the Magen Avraham that the day
     * runs from dawn to dusk. Dawn for this calculation is 72 minutes before sunrise
     * and dusk is 72 minutes after sunset. This day is split into 12 equal parts with
     * each part being a shaah zmanis.
     *
     * - returns: The millisecond length of a shaah zmanis.
     *
     * If the calculation can't be computed such as in the Arctic Circle where
     * there is at least one day a year where the sun does not rise,
     * and one where it does not set, a Int.min will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func shaahZmanis72Minutes() -> Double
	{
	    return shaahZmanisMogenAvraham()
	}
	
    /**
     * Method to return a shaah zmanis (temporal hour) according to the opinion of the Magen Avraham
     * based on alos being 72 minutes zmaniyos before sunrise.
     * This calculation divides the day based on the opinion of the Magen Avraham that the day
     * runs from dawn to dusk. Dawn for this calculation is 72 minutes zmaniyos before
     * sunrise and dusk is 72 minutes zmaniyos after sunset. This day is split into 12 equal
     * parts with each part being a shaah zmanis.
     * This is identical to 1/10th of the day from sunrise to sunset.
     *
     * @returns long The millisecond length of a shaah zmanis.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at
     * least one day a year where the sun does not rise, and one where it does not set,
     * a Int.min will be returned. See detailed explanation on top of
     * the AstronomicalCalendar documentation.
     */
	@objc public func shaahZmanis72MinutesZmanis() -> Double
	{
		return temporalHourFromSunrise(sunrise: alos72Zmanis(), toSunset: tzais72Zmanis())
	}
	
    /**
     * Method to return a shaah zmanis (temporal hour) calculated using a dip of 90 minutes.
     * This calculation divides the day based on the opinion of the Magen Avraham that
     * the day runs from dawn to dusk. Dawn for this calculation is 90 minutes before sunrise
     * and dusk is 90 minutes after sunset.
     * This day is split into 12 equal parts with each part being a shaah zmanis.
     *
     * - returns: The millisecond length of a shaah zmanis.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least
     * one day a year where the sun does not rise, and one where it does not set, a
     * Int.min will be returned. See detailed explanation on top of
     * the AstronomicalCalendar documentation.
     */
	@objc public func shaahZmanis90Minutes() -> Double
	{
		return temporalHourFromSunrise(sunrise: alos90(), toSunset: tzais90())
	}
	
    /**
     * Method to return a shaah zmanis (temporal hour) according to the opinion of the Magen Avraham
     * based on alos being 90 minutes zmaniyos before sunrise. This calculation divides the day
     * based on the opinion of the Magen Avraham that the day runs from dawn to dusk.
     * Dawn for this calculation is 90 minutes zmaniyos before sunrise and dusk is 90 minutes
     * zmaniyos after sunset.
     * This day is split into 12 equal parts with each part being a shaah zmanis.
     * This is identical to 1/8th of the day from sunrise to sunset.
     *
     * - returns: The millisecond length of a shaah zmanis.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least
     * one day a year where the sun does not rise, and one where it does not set,
     * a Int.min will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func shaahZmanis90MinutesZmanis() -> Double
	{
		return temporalHourFromSunrise(sunrise: alos90Zmanis(), toSunset: tzais90Zmanis())
	}
	
    /**
     * Method to return a shaah zmanis (temporal hour) calculated using a dip of 96 minutes.
     * This calculation divides the day based on the opinion of the Magen Avraham that
     * the day runs from dawn to dusk. Dawn for this calculation is 96 minutes before sunrise
     * and dusk is 96 minutes after sunset.
     * This day is split into 12 equal parts with each part being a shaah zmanis.
     *
     * - returns: The millisecond length of a shaah zmanis.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least
     * one day a year where the sun does not rise, and one where it does not set, a
     * Int.min will be returned. See detailed explanation on top of
     * the AstronomicalCalendar documentation.
     */
	@objc public func shaahZmanis96Minutes() -> Double
	{
		return temporalHourFromSunrise(sunrise: alos96(), toSunset: tzais96())
	}
	
    /**
     * Method to return a shaah zmanis (temporal hour) according to the opinion of the Magen Avraham
     * based on alos being 96 minutes zmaniyos before sunrise. This calculation divides the day
     * based on the opinion of the Magen Avraham that the day runs from dawn to dusk.
     * Dawn for this calculation is 96 minutes zmaniyos before sunrise
     * and dusk is 96 minutes zmaniyos after sunset.
     * This day is split into 12 equal parts with each part being a shaah zmanis.
     * This is identical to 1/7.5th of the day from sunrise to sunset.
     *
     * @return the long millisecond length of a shaah zmanis.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least
     * one day a year where the sun does not rise, and one where it does not set, a Int.min
     * will be returned. See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func shaahZmanis96MinutesZmanis() -> Double
	{
		return temporalHourFromSunrise(sunrise: alos96Zmanis(), toSunset: tzais96Zmanis())
	}
	
    /**
     * Method to return a shaah zmanis (temporal hour) according to the opinion of
     * the Chacham Yosef Harari-Raful of Yeshivat Ateret Torah calculated with alos
     * being 1/10th of sunrise to sunset day, or 72 minutes zmaniyos of such a day
     * before sunrise, and tzais is usually calculated as 40 minutes
     * (configurable to any offset by modifying AteretTorahSunsetOffset) after sunset.
     * This day is split into 12 equal parts with each part being a shaah zmanis.
     * Note that with this system, chatzos (mid-day) will not be the point that
     * the sun is halfway across the sky.
     *
     * - returns: The millisecond length of a shaah zmanis.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there
     * is at least one day a year where the sun does not rise, and one where it does
     * not set, a Int.min will be returned. See detailed explanation on top
     * of the AstronomicalCalendar documentation.
     */
	@objc public func shaahZmanisAteretTorah() -> Double
	{
		return temporalHourFromSunrise(sunrise: alos72Zmanis(), toSunset: tzaisAteretTorah())
	}
	
    /**
     * Method to return a shaah zmanis (temporal hour) calculated using a dip of 120 minutes.
     * This calculation divides the day based on the opinion of the Magen Avraham that the day
     * runs from dawn to dusk. Dawn for this calculation is 120 minutes before sunrise and dusk
     * is 120 minutes after sunset. This day is split into 12 equal parts with each part
     * being a shaah zmanis.
     *
     * - returns: The millisecond length of a shaah zmanis.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least
     * one day a year where the sun does not rise, and one where it does not set, a Int.min
     * will be returned. See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func shaahZmanis120Minutes() -> Double
	{
		return temporalHourFromSunrise(sunrise: alos120(), toSunset: tzais120())
	}
	
    /**
     * Method to return a shaah zmanis (temporal hour) according to the opinion of the Magen Avraham
     * based on alos being 120 minutes zmaniyos before sunrise. This calculation divides the day based
     * on the opinion of the Magen Avraham that the day runs from dawn to dusk.
     * Dawn for this calculation is 120 minutes zmaniyos before sunrise and dusk is 120 minutes
     * zmaniyos after sunset.
     * This day is split into 12 equal parts with each part being a shaah zmanis.
     * This is identical to 1/6th of the day from sunrise to sunset.
     *
     * - returns: The millisecond length of a shaah zmanis.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a Int.min will
     * be returned. See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func shaahZmanis120MinutesZmanis() -> Double
	{
		return temporalHourFromSunrise(sunrise: alos120Zmanis(), toSunset: tzais120Zmanis())
	}
	
    /**
     * This method returns the time of plag hamincha according to the Magen Avraham with the day
     * starting 120 minutes before sunrise and ending 120 minutes after sunset.
     * This is calculated as 10.75 hours after dawn 120 minutes.
     * The formula used is: 10.75 * ShaahZmanis120Minutes() after Alos120().
     *
     * - returns: The Date and Time of plag hamincha.
     * 
     * If the calculation can't be computed such as in the Arctic Circle where there is at least
     * one day a year where the sun does not rise, and one where it does not set, a nil will
     * be returned. See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func plagHamincha120Minutes() -> Date?
	{
		return alos120Zmanis()?.addingTimeInterval(shaahZmanis120Minutes() * 10.75)
	}
	
    /**
     * This method returns the time of plag hamincha based on sunrise being 120 minutes zmaniyos
     * (GRA and the Baal Hatanya) or 1/6th of the day before sea level sunrise.
     * This is calculated as 10.75 hours after dawn.
     * The formula used is: 10.75 * ShaahZmanis120MinutesZmanis() after dawn.
     *
     * - returns: Date and Time of plag hamincha.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least
     * one day a year where the sun does not rise, and one where it does not set, a nil will
     * be returned. See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func plagHamincha120MinutesZmanis() -> Date?
	{
		return alos120Zmanis()?.addingTimeInterval(shaahZmanis120MinutesZmanis() * 10.75)
	}
	
    /**
     * Method to return alos (dawn) calculated as 60 minutes before sea level sunrise.
     * This is the time to walk the distance of 4 Mil at 15 minutes a Mil (the opinion of
     * the Chavas Yair. See the Divray Malkiel). Time based offset calculations for alos
     * are based on the opinion of most Rishonim who stated that the time of the
     * Neshef (time between dawn and sunrise) does not vary by the time of year or location
     * but purely depends on the time it takes to walk the distance of 4 Mil.
     *
     * - returns: representing the time.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at
     * least one day a year where the sun does not rise, and one where it does not set, a nil
     * will be returned. See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func alos60() -> Date?
	{
        if let sunrise = seaLevelSunrise()
        {
			return dateBySubtractingHours(hours: 1, fromDate: sunrise)
        }
        else
        {
            return nil
        }
	}
    
    /**
     * Method to return alos (dawn) calculated using 72 minutes zmaniyos (GRA and the Baal Hatanya)
     * or 1/10th of the day before sea level sunrise. This is based on an 18 minute Mil so the time
     * for 4 Mil is 72 minutes which is 1/10th of a day (12 * 60 = 720) based on the day starting
     * at sea level sunrise and ending at sea level sunset. The actual calulation is
     * AstronomicalCalendar.SeaLevelSunrise()- (ZmanimCalendar.ShaahZmanisGra() * 1.2).
     * This calculation is used in the calendars published by Hisachdus Harabanim
     * D'Artzos Habris Ve'Canada.
     *
     * - returns: representing the time.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least
     * one day a year where the sun does not rise, and one where it does not set, a nil will
     * be returned. See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func alos72Zmanis() -> Date?
	{
	    let shaahZmanis = shaahZmanisGra()
	    
	    if shaahZmanis == Double(Int.min) {
	        return nil
	    }
	    
		return seaLevelSunrise()?.addingTimeInterval(shaahZmanis - 1.2)
	}
	
    /**
     * Method to return alos (dawn) calculated using 90 minutes before sea level sunrise based
     * on the time to walk the distance of 4 Mil at 22.5 minutes a Mil. Time based offset calculations
     * for alos are based on the opinion of most Rishonim who stated that the time of
     * the Neshef (time between dawn and sunrise) does not vary by the time of year or location
     * but purely depends on the time it takes to walk the distance of 4 Mil.
     *
     * - returns: representing the time.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least
     * one day a year where the sun does not rise, and one where it does not set, a nil will
     * be returned. See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func alos90() -> Date?
	{
	    
	    if let baseDate: Date = seaLevelSunrise()
        {
			return dateBySubtractingMinutes(minutes: 90, fromDate: baseDate)
        }
        return nil
	}
	
    /**
     * Method to return alos (dawn) calculated using 90 minutes zmaniyos (GRA and the Baal Hatanya)
     * or 1/8th of the day before sea level sunrise. This is based on a 22.5 minute Mil so
     * the time for 4 Mil is 90 minutes which is 1/8th of a day (12 * 60) / 8 = 90
     * based on the day starting at sunrise and ending at sunset. The actual calculation is
     * AstronomicalCalendar.Sunrise() - (ZmanimCalendar.ShaahZmanisGra() * 1.5).
     *
     * - returns: representing the time.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least
     * one day a year where the sun does not rise, and one where it does not set, a nil will
     * be returned. See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func alos90Zmanis() -> Date?
	{
	    let shaahZmanis = shaahZmanisGra()
	    
	    if shaahZmanis == Double(Int.min)
		{
	        return nil
	    }
	    
		return seaLevelSunrise()?.addingTimeInterval((shaahZmanis  - 1.5))
	}
	
    /**
     * Method to return alos (dawn) calculated using 96 minutes before sea level sunrise based
     * on the time to walk the distance of 4 Mil at 24 minutes a Mil. Time based offset calculations
     * for alos are based on the opinion of most Rishonim who stated that the time of
     * the Neshef (time between dawn and sunrise) does not vary by the time of year or location but
     * purely depends on the time it takes to walk the distance of 4 Mil.
     *
     * - returns: representing the time.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will
     * be returned. See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func alos96() -> Date?
	{
	    if let baseDate: Date = seaLevelSunrise()
        {
			return dateBySubtractingMinutes(minutes: 96, fromDate: baseDate)
        }
        return nil
	}
	
    /**
     * Method to return alos (dawn) calculated using 96 minutes zmaniyos (GRA and the Baal Hatanya)
     * or 1/8th of the day before sea level sunrise. This is based on a 24 minute Mil so the time
     * for 4 Mil is 96 minutes which is 1/7.5th of a day (12 * 60) / 7.5 = 96 based on the day
     * starting at sunrise and ending at sunset. The actual calculation is
     * AstronomicalCalendar.Sunrise() - (ZmanimCalendar.ShaahZmanisGra() * 1.6).
     *
     * - returns: representing the time.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will
     * be returned. See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func alos96Zmanis() -> Date?
	{
	
	    let shaahZmanis = shaahZmanisGra()
	    
	    if shaahZmanis == Double(Int.min)
		{
	        return nil
	    }
	    
		return seaLevelSunrise()?.addingTimeInterval(shaahZmanis  - 1.6)
	}
	
    /**
     * Method to return alos (dawn) calculated using 120 minutes before sea level sunrise
     * (no adjustment for elevation is made) based on the time to walk the distance of 5 Mil (Ula)
     * at 24 minutes a Mil. Time based offset calculations for alos are based on the opinion of most
     * Rishonim who stated that the time of the Neshef (time between dawn and sunrise) does not vary
     * by the time of year or location but purely depends on the time it takes to walk the
     * distance of 5 Mil(Ula).
     *
     * - returns: representing the time.
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will
     * be returned. See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func alos120() -> Date?
	{
	    if let baseDate: Date = seaLevelSunrise()
        {
			return dateBySubtractingMinutes(minutes: 120, fromDate: baseDate)
        }
        return nil
	}
	
    /**
     * Method to return alos (dawn) calculated using 120 minutes zmaniyos (GRA and the Baal Hatanya)
     * or 1/6th of the day before sea level sunrise. This is based on a 24 minute Mil so the time
     * for 5 Mil is 120 minutes which is 1/6th of a day (12 * 60) / 6 = 120 based on the day starting
     * at sunrise and ending at sunset. The actual calculation is
     * AstronomicalCalendar.Sunrise() - (ZmanimCalendar.ShaahZmanisGra() * 2).
     *
     * - returns: representing the time.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will
     * be returned. See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func alos120Zmanis() -> Date?
	{
	    let shaahZmanis = shaahZmanisGra()
	    if shaahZmanis == Double(Int.min)
		{
	        return nil
	    }
		return seaLevelSunrise()?.addingTimeInterval(shaahZmanis * -2)
	}
	
    /**
     * A method to return alos (dawn) calculated when the sun is 26° below the eastern geometric
     * horizon before sunrise. This calculation is based on the same calculation of 120 minutes
     * but uses a degree based calculation instead of 120 exact minutes. This calculation is based
     * on the position of the sun 120 minutes before sunrise in Jerusalem during the equinox which
     * calculates to 26° below geometric zenith.
     *
     * - returns: representing alos.
     *
     * If the calculation can't be computed such as northern and southern locations even south of
     * the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned. See detailed explanation
     * on top of the AstronomicalCalendar documentation.
     */
	@objc public func alos26Degrees() -> Date?
	{
		return sunriseOffsetByDegrees(offsetZenith: kZenithTwentySix)
	}
	
    /**
     * A method to return alos (dawn) calculated when the sun is 18° below the eastern geometric
     * horizon before sunrise.
     *
     * - returns: representing alos.
     *
     * If the calculation can't be computed such as northern and southern locations even south of
     * the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned. See detailed explanation
     * on top of the AstronomicalCalendar documentation.
     */
	@objc public func alos18Degrees() -> Date?
	{
		return sunriseOffsetByDegrees(offsetZenith: kZenithAstronomical)
	}
	
    /**
     * Method to return alos (dawn) calculated when the sun is 19.8° below the eastern geometric
     * horizon before sunrise. This calculation is based on the same calculation of 90 minutes but
     * uses a degree based calculation instead of 90 exact minutes. This calculation is based on
     * the position of the sun 90 minutes before sunrise in Jerusalem during the equinox which
     * calculates to 19.8° below geometric zenith
     *
     * - returns: representing alos.
     *
     * If the calculation can't be computed such as northern and southern locations even south of
     * the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned. See detailed explanation
     * on top of the AstronomicalCalendar documentation.
     */
	@objc public func alos19Point8Degrees() -> Date?
	{
		return sunriseOffsetByDegrees(offsetZenith: kZenithNineteenPointEight)
	}
	
    /**
     * Method to return alos (dawn) calculated when the sun is 16.1° below the eastern geometric
     * horizon before sunrise. This calculation is based on the same calculation of 72 minutes but
     * uses a degree based calculation instead of 72 exact minutes. This calculation is based on
     * the position of the sun 72 minutes before sunrise in Jerusalem during the equinox which
     * calculates to 16.1° below geometric zenith.
     *
     * - returns: representing alos.
     *
     * If the calculation can't be computed such as northern and southern locations even south of
     * the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned. See detailed explanation
     * on top of the AstronomicalCalendar documentation.
     */
	@objc public func alos16Point1Degrees() -> Date?
	{
		return sunriseOffsetByDegrees(offsetZenith: kZenithSixteenPointOne)
	}
	
    /**
     * This method returns misheyakir based on the position of the sun when it is 11.5° below
     * geometric zenith (90°). This calculation is used for calculating misheyakir according to
     * some opinions. This calculation is based on the position of the sun 52 minutes before
     * sunrise in Jerusalem during the equinox which calculates to 11.5° below geometric zenith.
     *
     * - returns: the Date of misheyakir.
     *
     * If the calculation can't be computed such as northern and southern locations even south of
     * the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned. See detailed explanation
     * on top of the AstronomicalCalendar documentation.
     */
	@objc public func misheyakir11Point5Degrees() -> Date?
	{
		return sunriseOffsetByDegrees(offsetZenith: kZenithElevenPointFive)
	}
	
    /**
     * This method returns misheyakir based on the position of the sun when it is 11° below
     * geometric zenith (90°). This calculation is used for calculating misheyakir according to
     * some opinions. This calculation is based on the position of the sun 48 minutes before
     * sunrise in Jerusalem during the equinox which calculates to 11° below geometric zenith.
     *
     * - returns: the Date of misheyakir.
     *
     * If the calculation can't be computed such as northern and southern locations even south of
     * the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned. See detailed explanation
     * on top of the AstronomicalCalendar documentation.
     */
	@objc public func misheyakir11Degrees() -> Date?
	{
		return sunriseOffsetByDegrees(offsetZenith: kZenithElevenDegrees)
	}
	
    /**
     * This method returns misheyakir based on the position of the sun when it is 10.2° below
     * geometric zenith (90°). This calculation is used for calculating misheyakir according to
     * some opinions. This calculation is based on the position of the sun 45 minutes before
     * sunrise in Jerusalem during the equinox which calculates to 10.2° below geometric zenith.
     *
     * - returns: the Date of the latest misheyakir.
     *
     * If the calculation can't be computed such as northern and southern locations even south of
     * the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned. See detailed explanation
     * on top of the AstronomicalCalendar documentation.
     */
	@objc public func misheyakir10Point2Degrees() -> Date?
	{
		return sunriseOffsetByDegrees(offsetZenith: kZenithTenPointTwo)
	}
	
    /**
     * This method returns the latest zman krias shema (time to recite Shema in the morning) according
     * to the opinion of the MGA based on alos being 19.8° before sunrise. This time is 3 shaos
     * zmaniyos (solar hours) after dawn based on the opinion of the MGA that the day is calculated
     * from dawn to nightfall with both being 19.8° below sunrise or sunset.
     * This returns the time of 3 * ShaahZmanis19Point8Degrees() after dawn.
     *
     * - returns: the Date of the latest zman krias shema.
     *
     * If the calculation can't be computed such as northern and southern locations even south of
     * the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned. See detailed explanation on
     * top of the AstronomicalCalendar documentation.
     */
	@objc public func sofZmanShmaMGA19Point8Degrees() -> Date?
	{
		return sunriseOffsetByDegrees(offsetZenith: kZenithNineteenPointEight)?.addingTimeInterval(shaahZmanis19Point8Degrees() * 3)
	}
	
    /**
     * This method returns the latest zman krias shema (time to recite Shema in the morning) according
     * to the opinion of the MGA based on alos being 16.1° before sunrise. This time is 3 shaos
     * zmaniyos (solar hours) after dawn based on the opinion of the MGA that the day is calculated
     * from dawn to nightfall with both being 16.1° below sunrise or sunset.
     * This returns the time of 3 * ShaahZmanis16Point1Degrees() after dawn.
     *
     * - returns: the Date of the latest zman krias shema.
     *
     * If the calculation can't be computed such as northern and southern locations even south of
     * the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned. See detailed explanation
     * on top of the AstronomicalCalendar documentation.
     */
	@objc public func sofZmanShmaMGA16Point1Degrees() -> Date?
	{
		return alos16Point1Degrees()?.addingTimeInterval(shaahZmanis16Point1Degrees() * 3)
	}
	
    /**
     * This method returns the latest zman krias shema (time to recite Shema in the morning) according
     * to the opinion of the MGA based on alos being 72 minutes before sunrise.
     * This time is 3 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham
     * that the day is calculated from a dawn of 72 minutes before sunrise to nightfall of 72 minutes
     * after sunset. This returns the time of 3 * ShaahZmanis72Minutes() after dawn.
     * This class returns an identical time to ZmanimCalendar.SofZmanShmaMGA() and is
     * repeated here for clarity.
     *
     * - returns: the Date of the latest zman krias shema.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func sofZmanShmaMGA72Minutes() -> Date
	{
	    return sofZmanShmaMogenAvraham()
	}
	
    /**
     * This method returns the latest zman krias shema (time to recite Shema in the morning) according
     * to the opinion of the MGA based on alos being 72 minutes zmaniyos , or 1/10th of the day
     * before sunrise. This time is 3 shaos zmaniyos (solar hours) after dawn based on the opinion
     * of the Magen Avraham that the day is calculated from a dawn of 72 minutes zmaniyos,
     * or 1/10th of the day before sea level sunrise to nightfall of 72 minutes zmaniyos after sea
     * level sunset. This returns the time of 3 * getShaahZmanis72MinutesZmanis() after dawn.
     *
     * - returns: the Date of the latest zman krias shema.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least
     * one day a year where the sun does not rise, and one where it does not set, a nil
     * will be returned. See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func sofZmanShmaMGA72MinutesZmanis() -> Date
	{
		return alos72Zmanis()!.addingTimeInterval(shaahZmanis72MinutesZmanis() * 3)
	}
	
    /**
     * This method returns the latest zman krias shema (time to recite Shema in the morning)
     * according to the opinion of the Magen Avraham based on alos being 90 minutes before sunrise.
     * This time is 3 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham
     * that the day is calculated from a dawn of 90 minutes before sunrise to nightfall of 90 minutes
     * after sunset. This returns the time of 3 * ShaahZmanis90Minutes() after dawn.
     *
     * - returns: the Date of the latest zman krias shema.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least
     * one day a year where the sun does not rise, and one where it does not set, a nil
     * will be returned. See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func sofZmanShmaMGA90Minutes() -> Date?
	{
		return alos90()?.addingTimeInterval(shaahZmanis90Minutes() * 3)
	}
	
    /**
     * This method returns the latest zman krias shema (time to recite Shema in the morning) according
     * to the opinion of the MGA based on alos being 90 minutes zmaniyos before sunrise.
     * This time is 3 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham
     * that the day is calculated from a dawn of 90 minutes zmaniyos before sunrise to
     * nightfall of 90 minutes zmaniyos after sunset.
     * This returns the time of 3 * ShaahZmanis90MinutesZmanis() after dawn.
     *
     * - returns: the Date of the latest zman krias shema.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least
     * one day a year where the sun does not rise, and one where it does not set, a nil
     * will be returned. See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func sofZmanShmaMGA90MinutesZmanis() -> Date?
	{
		return alos90Zmanis()?.addingTimeInterval(shaahZmanis90MinutesZmanis() * 3)
	}
	
    /**
     * This method returns the latest zman krias shema (time to recite Shema in the morning) according
     * to the opinion of the MGA based on alos being 96 minutes before sunrise.
     * This time is 3 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham
     * that the day is calculated from a dawn of 96 minutes before sunrise to
     * nightfall of 96 minutes after sunset.
     * This returns the time of 3 * ShaahZmanis96Minutes() after dawn.
     *
     * - returns: the Date of the latest zman krias shema.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least
     * one day a year where the sun does not rise, and one where it does not set, a nil
     * will be returned. See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func sofZmanShmaMGA96Minutes() -> Date?
	{
		return alos96()?.addingTimeInterval(shaahZmanis96Minutes() * 3)
	}
	
    /**
     * This method returns the latest zman krias shema (time to recite Shema in the morning) according
     * to the opinion of the MGA based on alos being 96 minutes zmaniyos before sunrise.
     * This time is 3 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham
     * that the day is calculated from a dawn of 96 minutes zmaniyos before sunrise to
     * nightfall of 96 minutes zmaniyos after sunset.
     * This returns the time of 3 * ShaahZmanis96MinutesZmanis() after dawn.
     *
     * - returns: the Date of the latest zman krias shema.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least
     * one day a year where the sun does not rise, and one where it does not set, a nil
     * will be returned. See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func sofZmanShmaMGA96MinutesZmanis() -> Date?
	{
		return alos96Zmanis()?.addingTimeInterval(shaahZmanis96MinutesZmanis() * 3)
	}
	
    /**
     * This method returns the latest zman krias shema (time to recite Shema in the morning) calculated
     * as 3 hours (regular and not zmaniyos) before ZmanimCalendar.Chatzos().
     * This is the opinion of the Shach in the Nekudas Hakesef (Yora Deah 184), Shevus Yaakov,
     * Chasam Sofer and others. This returns the time of 3 hours before ZmanimCalendar.Chatzos().
     *
     * - returns: the Date of the latest zman krias shema.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least
     * one day a year where the sun does not rise, and one where it does not set, a nil
     * will be returned. See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func sofZmanShma3HoursBeforeChatzos() -> Date
	{
	    let baseDate: Date = chatzos()
		return dateBySubtractingHours(hours: 3, fromDate: baseDate)
	}
	
    /**
     * This method returns the latest zman krias shema (time to recite Shema in the morning) according
     * to the opinion of the Magen Avraham based on alos being 120 minutes or 1/6th of the day before
     * sunrise. This time is 3 shaos zmaniyos (solar hours) after dawn based on the opinion of
     * the Magen Avraham that the day is calculated from a dawn of 120 minutes before sunrise to
     * nightfall of 120 minutes after sunset.
     * This returns the time of 3 * ShaahZmanis120Minutes() after dawn.
     *
     * - returns: the Date of the latest zman krias shema.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least
     * one day a year where the sun does not rise, and one where it does not set, a nil
     * will be returned. See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func sofZmanShmaMGA120Minutes() -> Date?
	{
		return alos120()?.addingTimeInterval(shaahZmanis120Minutes() * 3)
	}
	
    /**
     * This method returns the latest zman krias shema (time to recite Shema in the morning) based
     * on the opinion that the day starts at alos 16.1° and ends at sea level sunset.
     * 3 shaos zmaniyos are calculated based on this day and added to alosto reach this time.
     * This time is 3 shaos zmaniyos (solar hours) after dawn based on the opinion that the day
     * is calculated from a alos 16.1° to sea level sunset.
     * Note: Based on this calculation chatzos will not be at midday.
     *
     * - returns: the Date of the latest zman krias shema based on this day.
     *
     * If the calculation can't be computed such as northern and southern locations even south of
     * the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned. See detailed explanation
     * on top of the AstronomicalCalendar documentation.
     */
	@objc public func sofZmanShmaAlos16Point1ToSunset() -> Date?
	{
		let shaahZmanis = temporalHourFromSunrise(sunrise: alos16Point1Degrees(), toSunset: seaLevelSunset())
	    
	    if shaahZmanis == Double(Int.min)
        {
	        return nil
	    }
	    
		return alos16Point1Degrees()?.addingTimeInterval(shaahZmanis * 3)
	}
	
    /**
     * This method returns the latest zman krias shema (time to recite Shema in the morning) based
     * on the opinion that the day starts at alos 16.1° and ends at tzais 7.083°. 3 shaos zmaniyos
     * are calculated based on this day and added to alos to reach this time. This time is 3 shaos
     * zmaniyos (temporal hours) after alos 16.1° based on the opinion that the day is calculated
     * from a alos 16.1° to tzais 7.083°.
     * Note: Based on this calculation chatzos will not be at midday.
     *
     * - returns: the Date of the latest zman krias shema based on this calculation.
     *
     * If the calculation can't be computed such as northern and southern locations even south of
     * the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned. See detailed explanation
     * on top of the AstronomicalCalendar documentation.
     */
	@objc public func sofZmanShmaAlos16Point1ToTzaisGeonim7Point083Degrees() -> Date?
	{
		let shaahZmanis = temporalHourFromSunrise(sunrise: alos16Point1Degrees(), toSunset: tzaisGeonim7Point083Degrees())
	     if shaahZmanis == Double(Int.min)
		 {
	        return nil
	     }
	    
		return alos16Point1Degrees()?.addingTimeInterval(shaahZmanis * 3)
	}
	
    /**
     * This method returns the latest zman tfila (time to recite the morning prayers) according to
     * the opinion of the Magen Avraham based on alos being 19.8° before sunrise.
     * This time is 4 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham
     * that the day is calculated from dawn to nightfall with both being 19.8° below sunrise or sunset.
     * This returns the time of 4 * ShaahZmanis19Point8Degrees() after dawn.
     *
     * - returns: the Date of the latest zman krias shema.
     *
     * If the calculation can't be computed such as northern and southern locations even south of
     * the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned. See detailed explanation
     * on top of the AstronomicalCalendar documentation.
     */
	@objc public func sofZmanTfilaMGA19Point8Degrees() -> Date?
	{
		return alos19Point8Degrees()?.addingTimeInterval(shaahZmanis19Point8Degrees() * 4)
	}
	
    /**
     * This method returns the latest zman tfila (time to recite the morning prayers) according to
     * the opinion of the Magen Avraham based on alos being 16.1° before sunrise.
     * This time is 4 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham
     * that the day is calculated from dawn to nightfall with both being 16.1° below sunrise or sunset.
     * This returns the time of 4 * ShaahZmanis16Point1Degrees() after dawn.
     *
     * - returns: the Date of the latest zman krias shema.
     *
     * If the calculation can't be computed such as northern and southern locations even south of
     * the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned. See detailed explanation
     * on top of the AstronomicalCalendar documentation.
     */
	@objc public func sofZmanTfilaMGA16Point1Degrees() -> Date?
	{
		return alos16Point1Degrees()?.addingTimeInterval(shaahZmanis16Point1Degrees() * 4)
	}
	
    /**
     * This method returns the latest zman tfila (time to recite the morning prayers) according to
     * the opinion of the Magen Avraham based on alos being 72 minutes before sunrise.
     * This time is 4 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham
     * that the day is calculated from a dawn of 72 minutes before sunrise to nightfall of 72 minutes
     * after sunset. This returns the time of 4 * ShaahZmanis72Minutes() after dawn.
     * This class returns an identical time to ZmanimCalendar.SofZmanTfilaMGA()
     * and is repeated here for clarity.
     *
     * - returns: the Date of the latest zman tfila.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func sofZmanTfilaMGA72Minutes() -> Date
	{
	    return sofZmanTfilaMogenAvraham()
	}
	
    /**
     * This method returns the latest zman tfila (time to the morning prayers) according to the opinion
     * of the Magen Avraham based on alos being 72 minutes zmaniyos before sunrise.
     * This time is 4 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham
     * that the day is calculated from a dawn of 72 minutes zmaniyos before sunrise to nightfall
     * of 72 minutes zmaniyos after sunset.
     * This returns the time of 4 * ShaahZmanis72MinutesZmanis() after dawn.
     *
     * - returns: the Date of the latest zman krias shema.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func sofZmanTfilaMGA72MinutesZmanis() -> Date
	{
		return alos72Zmanis()!.addingTimeInterval(shaahZmanis72MinutesZmanis() * 4)
	}
	
    /**
     * This method returns the latest zman tfila (time to recite the morning prayers) according to
     * the opinion of the Magen Avraham based on alos being 90 minutes before sunrise.
     * This time is 4 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham
     * that the day is calculated from a dawn of 90 minutes before sunrise to nightfall of 90 minutes
     * after sunset.
     * This returns the time of 4 * ShaahZmanis90Minutes() after dawn.
     *
     * - returns: the Date of the latest zman tfila.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func sofZmanTfilaMGA90Minutes() -> Date?
	{
		return alos90()?.addingTimeInterval(shaahZmanis90Minutes() * 4)
	}
	
    /**
     * This method returns the latest zman tfila (time to the morning prayers) according to the
     * opinion of the Magen Avraham based on alos being 90 minutes zmaniyos before sunrise.
     * This time is 4 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham
     * that the day is calculated from a dawn of 90 minutes zmaniyos before sunrise to nightfall
     * of 90 minutes zmaniyos after sunset.
     * This returns the time of 4 * ShaahZmanis90MinutesZmanis() after dawn.
     *
     * - returns: the Date of the latest zman krias shema.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func sofZmanTfilaMGA90MinutesZmanis() -> Date
	{
		return alos90Zmanis()!.addingTimeInterval(shaahZmanis90MinutesZmanis() * 4)
	}
	
    /**
     * This method returns the latest zman tfila (time to recite the morning prayers) according to the
     * opinion of the Magen Avraham based on alos being 96 minutes before sunrise.
     * This time is 4 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham
     * that the day is calculated from a dawn of 96 minutes before sunrise to nightfall
     * of 96 minutes after sunset. This returns the time of 4 * ShaahZmanis96Minutes() after dawn.
     *
     * - returns: the Date of the latest zman tfila.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func sofZmanTfilaMGA96Minutes() -> Date?
	{
		return alos96()?.addingTimeInterval(shaahZmanis96Minutes() * 4)
	}
	
    /**
     * This method returns the latest zman tfila (time to the morning prayers) according to the
     * opinion of the Magen Avraham based on alos being 96 minutes zmaniyos before sunrise.
     * This time is 4 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham
     * that the day is calculated from a dawn of 96 minutes zmaniyos before sunrise to nightfall
     * of 96 minutes zmaniyos after sunset.
     * This returns the time of 4 * ShaahZmanis96MinutesZmanis() after dawn.
     *
     * - returns: the Date of the latest zman krias shema.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func sofZmanTfilaMGA96MinutesZmanis() -> Date?
	{
		return alos96Zmanis()?.addingTimeInterval(shaahZmanis96MinutesZmanis() * 4)
	}
	
    /**
     * This method returns the latest zman tfila (time to recite the morning prayers) according to the
     * opinion of the Magen Avraham based on alos being 120 minutes before sunrise .
     * This time is 4 shaos zmaniyos (solar hours) after dawn based on the opinion of the Magen Avraham
     * that the day is calculated from a dawn of 120 minutes before sunrise to nightfall
     * of 120 minutes after sunset.
     * This returns the time of 4 * ShaahZmanis120Minutes() after dawn.
     *
     * - returns: the Date of the latest zman krias shema.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func sofZmanTfilaMGA120Minutes() -> Date?
	{
		return alos120()?.addingTimeInterval(shaahZmanis120Minutes() * 4)
	}
	
    /**
     * This method returns the latest zman tfila (time to recite the morning prayers) calculated as
     * 2 hours before ZmanimCalendar.getChatzos(). This is based on the opinions that calculate
     * sof zman krias shema as SofZmanShma3HoursBeforeChatzos().
     * This returns the time of 2 hours before ZmanimCalendar.Chatzos().
     *
     * - returns: the Date of the latest zman krias shema.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func sofZmanTfila2HoursBeforeChatzos() -> Date
	{
		return dateBySubtractingHours(hours: 2, fromDate: chatzos())
	}
	
    /**
     * This method returns mincha gedola calculated as 30 minutes after chatzos and not 1/2 of
     * a shaah zmanis after chatzos as calculated by ZmanimCalendar.MinchaGedola().
     * Some use this time to delay the start of mincha in the winter when 1/2 of a shaah zmanis is
     * less than 30 minutes. See MinchaGedolaGreaterThan30()for a convenience method that returns
     * the later of the 2 calculations. One should not use this time to start mincha before the standard
     * mincha gedola. See Shulchan Aruch Orach Chayim Siman Raish Lamed Gimel seif alef and the
     * Shaar Hatziyon seif katan ches.
     *
     * - returns: the Date of 30 mintes after chatzos.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func minchaGedola30Minutes() -> Date //After chatzos
	{
		return dateByAddingMinutes(minutes: 30, toDate: chatzos())
	}
	
    /**
     * This method returns the time of mincha gedola according to the Magen Avraham with the day
     * starting 72 minutes before sunrise and ending 72 minutes after sunset. This is the earliest
     * time to pray mincha. For more information on this see the documentation on mincha gedola.x
     * This is calculated as 6.5 solar hours after alos.
     * The calculation used is 6.5 * ShaahZmanis72Minutes() after alos.
     *
     * - returns: the Date of the time of mincha gedola.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func minchaGedola72Minutes() -> Date
	{
		return alos72().addingTimeInterval(shaahZmanis72Minutes() * 6.5)
	}
	
    /**
     * This method returns the time of mincha gedola according to the Magen Avraham with the day
     * starting and ending 16.1° below the horizon. This is the earliest time to pray mincha.
     * For more information on this see the documentation on mincha gedola.
     * This is calculated as 6.5 solar hours after alos.
     * The calculation used is 6.5 * ShaahZmanis16Point1Degrees() after alos.
     *
     * - returns: the Date of the time of mincha gedola.
     *
     * If the calculation can't be computed such as northern and southern locations even south of the
     * Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough below the
     * horizon for this calculation, a nil will be returned. See detailed explanation
     * on top of the AstronomicalCalendar documentation.
     */
	@objc public func minchaGedola16Point1Degrees() -> Date?
	{
		return alos16Point1Degrees()?.addingTimeInterval(shaahZmanis16Point1Degrees() * 6.5)
	}
	
    // TODO
//	@objc public func minchaGedolaGreaterThan30() -> Date?
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
	
    /**
     * This method returns the time of mincha ketana according to the Magen Avraham with the day
     * starting and ending 16.1° below the horizon. This is the perfered earliest time to pray mincha
     * according to the opinion of the Rambam and others. For more information on this see the
     * documentation on mincha gedola. This is calculated as 9.5 solar hours after alos.
     * The calculation used is 9.5 * ShaahZmanis16Point1Degrees() after alos.
     *
     * - returns: the Date of the time of mincha ketana.
     *
     * If the calculation can't be computed such as northern and southern locations even south of the
     * Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough below
     * the horizon for this calculation, a nil will be returned. See detailed explanation on top of
     * the AstronomicalCalendar documentation.
     */
	@objc public func minchaKetana16Point1Degrees() -> Date?
	{
		return alos16Point1Degrees()?.addingTimeInterval(shaahZmanis16Point1Degrees() * 9.5)
	}
	
    /**
     * This method returns the time of mincha ketana according to the Magen Avraham with the day
     * starting 72 minutes before sunrise and ending 72 minutes after sunset. This is the perfered
     * earliest time to pray mincha according to the opinion of the Rambam and others.
     * For more information on this see the documentation on mincha gedola.
     * This is calculated as 9.5 ShaahZmanis72Minutes() after alos.
     * The calculation used is 9.5 * getShaahZmanis72Minutes() after alos.
     *
     * - returns: the Date of the time of mincha ketana.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func minchaKetana72Minutes() -> Date
	{
		return alos72().addingTimeInterval(shaahZmanis72MinutesZmanis() * 9.5)
	}
	
    /**
     * This method returns the time of plag hamincha according to the Magen Avraham with the day
     * starting 60 minutes before sunrise and ending 60 minutes after sunset. This is calculated
     * as 10.75 hours after dawn.
     * The formula used is: 10.75 ShaahZmanis60Minutes() after Alos60().
     *
     * - returns: the Date of the time of plag hamincha.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func plagHamincha60Minutes() -> Date?
	{
		return alos60()?.addingTimeInterval(shaahZmanis60Minutes() * 10.75)
	}
	
    /**
     * This method returns the time of plag hamincha according to the Magen Avraham with the day
     * starting 72 minutes before sunrise and ending 72 minutes after sunset. This is calculated
     * as 10.75 hours after dawn.
     * The formula used is: 10.75 ShaahZmanis72Minutes() after ZmanimCalendar.Alos72().
     *
     * - returns: the Date of the time of plag hamincha.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func plagHamincha72Minutes() -> Date?
	{
		return alos72().addingTimeInterval(shaahZmanis72Minutes() * 10.75)
	}
	
    /**
     * This method returns the time of plag hamincha according to the Magen Avraham with the day
     * starting 90 minutes before sunrise and ending 90 minutes after sunset. This is calculated
     * as 10.75 hours after dawn.
     * The formula used is: 10.75 ShaahZmanis90Minutes() after Alos90().
     *
     * - returns: the Date of the time of plag hamincha.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func plagHamincha90Minutes() -> Date?
	{
		return alos90()?.addingTimeInterval(shaahZmanis90Minutes() * 10.75)
	}
	
    /**
     * This method returns the time of plag hamincha according to the Magen Avraham with the day
     * starting 96 minutes before sunrise and ending 96 minutes after sunset. This is calculated
     * as 10.75 hours after dawn.
     * The formula used is: 10.75 ShaahZmanis96Minutes() after Alos96().
     *
     * - returns: the Date of the time of plag hamincha.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func plagHamincha96Minutes() -> Date?
	{
		return alos96()?.addingTimeInterval(shaahZmanis96Minutes() * 10.75)
	}
	
    /**
     * This method returns the time of plag hamincha. This is calculated as 10.75 hours after dawn.
     * The formula used is: 10.75 * ShaahZmanis96MinutesZmanis() after dawn.
     *
     * - returns: the Date of the time of plag hamincha.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func plagHamincha96MinutesZmanis() -> Date
	{
		return alos96Zmanis()!.addingTimeInterval(shaahZmanis96MinutesZmanis() * 10.75)
	}
	
    /**
     * This method returns the time of plag hamincha. This is calculated as 10.75 hours after dawn.
     * The formula used is: 10.75 * ShaahZmanis90MinutesZmanis() after dawn.
     *
     * - returns: the Date of the time of plag hamincha.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func plagHamincha90MinutesZmanis() -> Date
	{
		return alos90Zmanis()!.addingTimeInterval(shaahZmanis90MinutesZmanis() * 10.75)
	}
	
    /**
     * This method returns the time of plag hamincha. This is calculated as 10.75 hours after dawn.
     * The formula used is: 10.75 * ShaahZmanis72MinutesZmanis() after dawn.
     *
     * - returns: the Date of the time of plag hamincha.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func plagHamincha72MinutesZmanis() -> Date
	{
		return alos72Zmanis()!.addingTimeInterval(shaahZmanis72MinutesZmanis() * 10.75)
	}
	
    /**
     * This method returns the time of plag hamincha based on the opinion that the day starts at
     * alos 16.1° and ends at tzais 16.1°. This is calculated as 10.75 hours zmaniyos after dawn.
     * The formula is 10.75 * ShaahZmanis16Point1Degrees() after Alos16Point1Degrees().
     *
     * - returns: the Date of the time of plag hamincha.
     *
     * If the calculation can't be computed such as northern and southern locations even south of
     * the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned. See detailed explanation on
     * top of the AstronomicalCalendar documentation.
     */
	@objc public func plagHamincha16Point1Degrees() -> Date?
	{
		return alos16Point1Degrees()?.addingTimeInterval(shaahZmanis16Point1Degrees() * 10.75)
	}
	
    /**
     * This method returns the time of plag hamincha based on the opinion that the day starts at
     * alos 19.8° and ends at tzais 19.8°. This is calculated as 10.75 hours zmaniyos after dawn.
     * The formula is 10.75 * ShaahZmanis19Point8Degrees() after Alos19Point8Degrees().
     *
     * - returns: the Date of the time of plag hamincha.
     *
     * If the calculation can't be computed such as northern and southern locations even south of
     * the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func plagHamincha19Point8Degrees() -> Date?
	{
		return alos19Point8Degrees()?.addingTimeInterval(shaahZmanis19Point8Degrees() * 10.75)
	}
	
    /**
     * This method returns the time of plag hamincha based on the opinion that the day starts at
     * alos 26° and ends at tzais 26° . This is calculated as 10.75 hours zmaniyos after dawn.
     * The formula is 10.75 * ShaahZmanis26Degrees() after Alos26Degrees().
     *
     * - returns: the Date of the time of plag hamincha.
     * If the calculation can't be computed such as northern and southern locations even south of
     * the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func plagHamincha26Degrees() -> Date?
	{
		return alos26Degrees()?.addingTimeInterval(shaahZmanis26Degrees() * 10.75)
	}
	
    /**
     * This method returns the time of plag hamincha based on the opinion that the day starts at
     * alos 18° and ends at tzais 18° . This is calculated as 10.75 hours zmaniyos after dawn.
     * The formula is 10.75 * ShaahZmanis18Degrees() after Alos18Degrees().
     *
     * - returns: the Date of the time of plag hamincha.
     *
     * If the calculation can't be computed such as northern and southern locations even south of
     * the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func plagHamincha18Degrees() -> Date?
	{
		return alos18Degrees()?.addingTimeInterval(shaahZmanis18Degrees() * 10.75)
	}
	
    /**
     * This method returns the time of plag hamincha based on the opinion that the day starts at
     * alos 16.1° and ends at sunset. 10.75 shaos zmaniyos are calculated based on this day and
     * added to alos to reach this time. This time is 10.75 shaos zmaniyos (temporal hours) after
     * dawn based on the opinion that the day is calculated from a dawn of 16.1 degrees before
     * sunrise to sea level sunset.
     * This returns the time of 10.75 * the calculated shaah zmanis after dawn.
     *
     * - returns: the Date of the plag.
     *
     * If the calculation can't be computed such as northern and southern locations even south of
     * the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func plagAlosToSunset() -> Date?
	{
		let shaaZmanis = temporalHourFromSunrise(sunrise: alos16Point1Degrees(), toSunset: seaLevelSunset())
		return alos16Point1Degrees()?.addingTimeInterval(shaaZmanis * 10.75)
	}
	
    /**
     * This method returns the time of plag hamincha based on the opinion that the day starts at
     * alos 16.1° and ends at tzais. 10.75 shaos zmaniyos are calculated based on this day and
     * added to alos to reach this time. This time is 10.75 shaos zmaniyos (temporal hours) after
     * dawn based on the opinion that the day is calculated from a dawn of 16.1 degrees before
     * sunrise to tzais . This returns the time of 10.75 * the calculated shaah zmanis after dawn.
     *
     * - returns: the Date of the plag.
     *
     * If the calculation can't be computed such as northern and southern locations even south of
     * the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func plagAlos16Point1ToTzaisGeonim7Point083Degrees() -> Date?
	{
		let shaahZmanis = temporalHourFromSunrise(sunrise: alos16Point1Degrees(), toSunset: tzaisGeonim7Point083Degrees())
		return alos16Point1Degrees()?.addingTimeInterval(shaahZmanis * 10.75)
	}
	
    /**
     * Method to return Bain Hashmasho of Rabainu Tam calculated when the sun is 13.24° below
     * the western geometric horizon (90°) after sunset. This calculation is based on the same
     * calculation of Bain Hasmashos Rabainu Tam 58.5 minutes but uses a degree based calculation
     * instead of 58.5 exact minutes. This calculation is based on the position of the sun
     * 58.5 minutes after sunset in Jerusalem during the equinox which calculates to 13.24° below
     * geometric zenith.
     *
     * NOTE: As per Yisroel Vehazmanim Vol III page 1028 No 50, a dip of slightly less than 13°
     * should be used. Calculations show that the proper dip to be 13.2456°
     * (truncated to 13.24 that provides about 1.5 second earlier (lechumra) time) below the horizon
     * at that time. This makes a difference of 1 minute and 10 seconds in Jerusalem during the Equinox,
     * and 1 minute 29 seconds during the solstice as compared to the proper 13.24°.
     * For NY during the solstice, the difference is 1 minute 56 seconds.
     *
     * - returns: the Date of the sun being 13.24° below geometric zenith (90°).
     *
     * If the calculation can't be computed such as northern and southern locations even south of
     * the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func bainHashmashosRT13Degrees() -> Date?
	{
		return sunsetOffsetByDegrees(offsetZenith: kZenithThirteenPointTwentyFourDegrees)
	}
	
    /**
     * This method returns Bain Hashmashos of Rabainu Tam calculated as a 58.5 minute offset after sunset.
     * Bain hashmashos is 3/4 of a Mil before tzais or 3 1/4 Mil after sunset.
     * With a Mil calculated as 18 minutes, 3.25 * 18 = 58.5 minutes.
     *
     * - returns: the Date of 58.5 minutes after sunset.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func bainHashmashosRT58Point5Minutes() -> Date
	{
	    let baseDate: Date = seaLevelSunset()!
		return dateByAddingMinutes(minutes: 58, seconds: 30, toDate: baseDate)
	}
	
    /**
     * This method returns the time of bain hashmashos based on the calculation of 13.5 minutes
     * (3/4 of an 18 minute Mil before shkiah calculated as 7.083°.)
     *
     * - returns: the Date of the bain hashmashos of Rabainu Tam in this calculation.
     *
     * If the calculation can't be computed such as northern and southern locations even south of
     * the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func bainHashmashosRT13Point5MinutesBefore7Point083Degrees() -> Date
	{
		let baseDate: Date = sunsetOffsetByDegrees(offsetZenith: kZenithSevenPointZeroEightThree)
		return dateBySubtractingMinutes(minutes: 13, seconds: 30, fromDate: baseDate)
	}
	
    /**
     * This method returns bain hashmashos of Rabainu Tam calculated according to the opinion of
     * the Divray Yosef (see Yisrael Vehazmanim) calculated 5/18th (27.77%) of the time between
     * alos (calculated as 19.8° before sunrise) and sunrise. This is added to sunset to arrive
     * at the time for bain hashmashos of Rabainu Tam).
     *
     * - returns: the Date of bain hashmashos of Rabainu Tam for this calculation.
     *
     * If the calculation can't be computed such as northern and southern locations even south of
     * the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func bainHashmashosRT2Stars() -> Date?
	{
	    let alos19Point8: Date? = alos19Point8Degrees()
	    let sunrise: Date? = seaLevelSunrise()
	    
	    if alos19Point8 == nil || sunrise == nil
		{
	        return nil
	    }
	
        if let alos = alos19Point8Degrees()
        {
			return seaLevelSunrise()?.addingTimeInterval((sunrise!.timeIntervalSinceReferenceDate - alos.timeIntervalSinceReferenceDate) * (5 / 18))
        }
        return nil
	}
	
    /**
     * This method returns the tzais (nightfall) based on the opinion of the Geonim calculated at
     * the sun's position at 5.95° below the western horizon.
     *
     * - returns: the Date representing the time when the sun is 5.95° below sea level.
     *
     * If the calculation can't be computed such as northern and southern locations even south of
     * the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func tzaisGeonim5Point95Degrees() -> Date
	{
		return sunsetOffsetByDegrees(offsetZenith: kZenithFivePointNinetyFive)
	}
	
    /**
     * This method returns the tzais (nightfall) based on the opinion of the Geonim calculated as
     * 3/4 of a Mil based on an 18 minute Mil, or 13.5 minutes.
     * It is the sun's position at 3.65° below the western horizon.
     * This is a very early zman and should not be relied on without Rabbinical guidance.
     *
     * - returns: the Date representing the time when the sun is 3.65° below sea level.
     *
     * If the calculation can't be computed such as northern and southern locations even south of
     * the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func tzaisGeonim3Point65Degrees() -> Date
	{
		return sunsetOffsetByDegrees(offsetZenith: kZenithThreePointSixtyFive)
	}
	
    /**
     * This method returns the tzais (nightfall) based on the opinion of the Geonim calculated
     * as 3/4 of a Mil based on an 24 minute Mil, or 18 minutes. It is the sun's position
     * at 4.61° below the western horizon.
     * This is a very early zman and should not be relied on without Rabbinical guidance.
     *
     * - returns: the Date representing the time when the sun is 4.61° below sea level.
     *
     * If the calculation can't be computed such as northern and southern locations even south
     * of the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func tzaisGeonim4Point61Degrees() -> Date
	{
		return sunsetOffsetByDegrees(offsetZenith: kZenithFourPointSixtyOne)
	}
	
    /**
     * This method returns the tzais (nightfall) based on the opinion of the Geonim calculated
     * as 3/4 of a Mil, based on a 22.5 minute Mil, or 16 7/8 minutes. It is the sun's position
     * at 4.37° below the western horizon.
     * This is a very early zman and should not be relied on without Rabbinical guidance.
     *
     * - returns: the Date representing the time when the sun is 4.37° below sea level.
     *
     * If the calculation can't be computed such as northern and southern locations even south
     * of the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func tzaisGeonim4Point37Degrees() -> Date
	{
		return sunsetOffsetByDegrees(offsetZenith: kZenithFourPointThirtySeven)
	}
	
    /**
     * This method returns the tzais (nightfall) based on the opinion of the Geonim calculated
     * as 3/4 of a 24 minute Mil, (Baal Hatanya) based on a Mil being 24 minutes,
     * and is calculated as 18 + 2 + 4 for a total of 24 minutes
     * (FIXME: additional documentation details needed).
     * It is the sun's position at 5.88° below the western horizon.
     * This is a very early zman and should not be relied on without Rabbinical guidance.
     *
     * - returns: the Date representing the time when the sun is 5.88° below sea level.
     *
     * If the calculation can't be computed such as northern and southern locations even south
     * of the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func tzaisGeonim5Point88Degrees() -> Date
	{
		return sunsetOffsetByDegrees(offsetZenith: kZenithFivePointEightyEight)
	}
	
    /**
     * This method returns the tzais (nightfall) based on the opinion of the Geonim calculated
     * as 3/4 of a Mil based on the sun's position at 4.8° below the western horizon.
     * This is based on Rabbi Leo Levi's calculations. FIXME: additional documentation needed.
     * This is the This is a very early zman and should not be relied on without Rabbinical guidance.
     *
     * - returns: the Date representing the time when the sun is 4.8° below sea level.
     *
     * If the calculation can't be computed such as northern and southern locations even south
     * of the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func tzaisGeonim4Point8Degrees() -> Date
	{
		return sunsetOffsetByDegrees(offsetZenith: kZenithFourPointEight)
	}
	
    /**
     * This method returns the tzais (nightfall) based on the opinion of the Geonim calculated
     * as 30 minutes after sunset during the equinox in Yerushalayim. The sun's position at this
     * time computes to 7.083° (or 7° 5? below the western horizon. Note that this is a common
     * and rounded number. Computation shows the accurate number is 7.2°
     *
     * - returns: the Date representing the time when the sun is 7.083° below sea level.
     *
     * If the calculation can't be computed such as northern and southern locations even south
     * of the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func tzaisGeonim7Point083Degrees() -> Date
	{
		return sunsetOffsetByDegrees(offsetZenith: kZenithSevenPointZeroEightThree)
	}
	
    /**
     * This method returns the tzais (nightfall) based on the opinion of the Geonim calculated
     * at the sun's position at 8.5° below the western horizon.
     *
     * - returns: the Date representing the time when the sun is 8.5° below sea level.
     *
     * If the calculation can't be computed such as northern and southern locations even south
     * of the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func tzaisGeonim8Point5Degrees() -> Date
	{
		return  sunsetOffsetByDegrees(offsetZenith: kZenithEightPointFive)
	}
	
    /**
     * This method returns the tzais (nightfall) based on R' Moshe Feinstein's opinion
     * that the time to walk the distance of a Mil is 12.5 minutes for a total
     * of 50 minutes for 4 Mil after sea level sunset.
     *
     * - returns: the Date representing 50 minutes after sea level sunset.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func tzais50() -> Date
	{
		return dateByAddingMinutes(minutes: 50, toDate: seaLevelSunset()!)
	}
	
    /**
     * This method returns the tzais (nightfall) based on the opinion of the Chavas Yair and
     * Divray Malkiel that the time to walk the distance of a Mil is 15 minutes for a total
     * of 60 minutes for 4 Mil after sea level sunset.
     *
     * - returns: the Date representing 60 minutes after sea level sunset.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func tzais60() -> Date
	{
		return dateByAddingMinutes(minutes: 60, toDate: seaLevelSunset()!)
	}
	
    /**
     * This method returns tzais usually calculated as 40 minutes (configurable to any offset by
     * modifying AteretTorahSunsetOffset) after sunset.
     * Please note that Chacham Yosef Harari-Raful of Yeshivat Ateret Torah who uses this time,
     * does so only for calculating various other zmanai hayom such as Sof Zman Krias Shema
     * and Plag Hamincha. His calendars do not publish a zman for Tzais.
     * It should also be noted that Chacham Harari-Raful provided a 25 minute zman for Israel.
     * This API uses 40 minutes year round in any place on the globe by default.
     * This offset can be changed by modifying AteretTorahSunsetOffset.
     *
     * - returns: the Date representing 40 minutes
     * (configurable by modifying AteretTorahSunsetOffset) after sea level sunset.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func tzaisAteretTorah() -> Date
	{
		return dateByAddingMinutes(minutes: ateretTorahSunsetOffset, toDate: seaLevelSunset()!)
	}
	
    /**
     * This method returns the latest zman krias shema (time to recite Shema in the morning) based on
     * the calculation of Chacham Yosef Harari-Raful of Yeshivat Ateret Torah, that the day
     * starts 1/10th of the day before sunrise and is usually calculated as ending 40 minutes
     * after sunset (configurable to any offset via setAteretTorahSunsetOffset(double)).
     * shaos zmaniyos are calculated based on this day and added to alos to reach this time.
     * This time is 3 shaos zmaniyos (temporal hours) after alos 72 zmaniyos.
     *
     * Note: Based on this calculation chatzos will not be at midday.
     *
     * - returns: the Date of the latest zman krias shema based on this calculation.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func sofZmanShmaAteretTorah() -> Date?
	{
		return alos72Zmanis()?.addingTimeInterval(shaahZmanisAteretTorah() * 3)
	}
	
    /**
     * This method returns the latest zman tfila (time to recite the morning prayers) based on the
     * calculation of Chacham Yosef Harari-Raful of Yeshivat Ateret Torah, that the day starts 1/10th
     * of the day before sunrise and is usually calculated as ending 40 minutes after sunset
     * (configurable to any offset by modifying AteretTorahSunsetOffset).
     * shaos zmaniyos are calculated based on this day and added to alos to reach this time.
     * This time is 4 * shaos zmaniyos (temporal hours) after alos 72 zmaniyos.
     *
     * Note: Based on this calculation chatzos will not be at midday.
     *
     * - returns: the Date of the latest zman krias shema based on this calculation.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func sofZmanTfilaAteretTorah() -> Date?
	{
		return alos72Zmanis()?.addingTimeInterval(shaahZmanisAteretTorah() * 4)
	}
	
    /**
     * This method returns the time of mincha gedola based on the calculation of Chacham Yosef
     * Harari-Raful of Yeshivat Ateret Torah, that the day starts 1/10th of the day before sunrise
     * and is usually calculated as ending 40 minutes after sunset
     * (configurable to any offset by modifying AteretTorahSunsetOffset).
     * This is the perfered earliest time to pray mincha according to the opinion of the Rambam and others.
     * For more information on this see the documentation on mincha gedola.
     * This is calculated as 6.5 solar hours after alos.
     * The calculation used is 6.5 * ShaahZmanisAteretTorah() after alos.
     *
     * - returns: the Date of the time of mincha gedola.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func minchaGedolaAteretTorah() -> Date?
	{
		return alos72Zmanis()?.addingTimeInterval(shaahZmanisAteretTorah() * 6.5)
	}
	
    /**
     * This method returns the time of mincha ketana based on the calculation of Chacham Yosef
     * Harari-Raful of Yeshivat Ateret Torah, that the day starts 1/10th of the day before sunrise
     * and is usually calculated as ending 40 minutes after sunset
     * (configurable to any offset by modifying AteretTorahSunsetOffset).
     * This is the perfered earliest time to pray mincha according to the opinion of the Rambam and others.
     * For more information on this see the documentation on mincha gedola.
     * This is calculated as 9.5 solar hours after alos.
     * The calculation used is 9.5 * ShaahZmanisAteretTorah() after alos.
     *
     * - returns: the Date of the time of mincha ketana.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func minchaKetanaAteretTorah() -> Date?
	{
		return alos72Zmanis()?.addingTimeInterval(shaahZmanisAteretTorah() * 9.5)
	}
	
    /**
     * This method returns the time of plag hamincha based on the calculation of Chacham Yosef
     * Harari-Raful of Yeshivat Ateret Torah, that the day starts 1/10th of the day before sunrise
     * and is usually calculated as ending 40 minutes after sunset
     * (configurable to any offset by modifying AteretTorahSunsetOffset).
     * shaos zmaniyos are calculated based on this day and added to alos to reach this time.
     * This time is 10.75 shaos zmaniyos (temporal hours) after dawn.
     *
     * - returns: the Date of the plag.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func plagHaminchaAteretTorah() -> Date?
	{
		return alos72Zmanis()?.addingTimeInterval(shaahZmanisAteretTorah() * 10.75)
	}
	
    /**
     * This method calculates the Misheyakir as an offset to Alot72Zmanis.
     * Documentation was lacking for this function so please use only if you know what you're doing.
     * According to the KosherJava blog, this seems linked to minhagim within the Syrian community.
     * Please visit: http://www.kosherjava.com/tag/syrian-jews/ for more info
     *
     * - parameter minutes: offset to Alot72Zmanis in minutes
     *
     * - returns: the Date of misheyakir.
     */
	@objc public func misheyakirAteretTorahWithMinutes(minutes: Int) -> Date
	{
		return dateByAddingMinutes(minutes: minutes, toDate: alos72Zmanis()!)
	}
	
    /**
     * Method to return tzais (dusk) calculated as 72 minutes zmaniyos,
     * or 1/10th of the day after sea level sunset.
     *
     * - returns: the Date representing the time.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func tzais72Zmanis() -> Date?
	{
	    let shaahZmanis = shaahZmanisGra()
	    
	    if shaahZmanis == Double(Int.min)
		{
	        return nil
	    }
	    
		return seaLevelSunset()!.addingTimeInterval(shaahZmanis * 1.2)
	}
	
    /**
     * Method to return tzais (dusk) calculated using 90 minutes zmaniyos (GRA and the Baal Hatanya)
     * after sea level sunset.
     *
     * - returns: the Date representing the time.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func tzais90Zmanis() -> Date?
	{
	    let shaahZmanis = shaahZmanisGra()
	    
	    if shaahZmanis == Double(Int.min)
		{
	        return nil
	    }
	    
		return seaLevelSunset()!.addingTimeInterval(shaahZmanis * 1.5)
	}
	
    /**
     * Method to return tzais (dusk) calculated using 96 minutes zmaniyos
     * (GRA and the Baal Hatanya) after sea level sunset.
     *
     * - returns: the Date representing the time.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func tzais96Zmanis() -> Date?
	{
	    let shaahZmanis = shaahZmanisGra()
	    
	    if shaahZmanis == Double(Int.min)
		{
	        return nil
	    }
	    
		return seaLevelSunset()!.addingTimeInterval(shaahZmanis * 1.6)
	}
	
    /**
     * Method to return tzais (dusk) calculated as 90 minutes after sea level sunset.
     * This method returns tzais (nightfall) based on the opinion of the Magen Avraham that the time
     * to walk the distance of a Mil according to the Rambam's opinion is 18 minutes
     * for a total of 90 minutes based on the opinion of Ula who calculated tzais as 5 Mil after sea
     * level shkiah (sunset).
     * A similar calculation Tzais19Point8Degrees()uses solar position calculations based on this time.
     *
     * - returns: the Date representing the time.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func tzais90() -> Date
	{
		return dateByAddingMinutes(minutes: 90, toDate: seaLevelSunset()!)
	}
	
    /**
     * This method returns tzais (nightfall) based on the opinion of the Magen Avraham that the time
     * to walk the distance of a Mil according to the Rambam's opinion is 2/5 of an hour (24 minutes)
     * for a total of 120 minutes based on the opinion of Ula who calculated tzais as 5 Mil after
     * sea level shkiah (sunset).
     * A similar calculation Tzais26Degrees() uses temporal calculations based on this time.
     *
     * - returns: the Date representing the time.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func tzais120() -> Date
	{
		return dateByAddingMinutes(minutes: 120, toDate: seaLevelSunset()!)
	}
	
    /**
     * Method to return tzais (dusk) calculated using 120 minutes zmaniyos
     * (GRA and the Baal Hatanya) after sea level sunset.
     *
     * - returns: the Date representing the time.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func tzais120Zmanis() -> Date?
	{
	    let shaahZmanis = shaahZmanisGra()
	    if shaahZmanis == Double(Int.min)
		{
	        return nil
	    }
		return seaLevelSunset()!.addingTimeInterval(shaahZmanis * 2.0)
	}
	
    /**
     * For information on how this is calculated see the comments on Alos16Point1Degrees()
     *
     * - returns: the Date representing the time.
     *
     * If the calculation can't be computed such as northern and southern locations even south of the
     * Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func tzais16Point1Degrees() -> Date
	{
		return sunsetOffsetByDegrees(offsetZenith: kZenithSixteenPointOne)
	}
	
    /**
     * For information on how this is calculated see the comments on Alos26Degrees()
     *
     * - returns: the Date representing the time.
     *
     * If the calculation can't be computed such as northern and southern locations even south of the
     * Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough below
     * the horizon for this calculation, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func tzais26Degrees() -> Date
	{
		return sunsetOffsetByDegrees(offsetZenith: kZenithTwentySix)
	}
	
    /**
     * For information on how this is calculated see the comments on Alos18Degrees()
     *
     * - returns: the Date representing the time.
     *
     * If the calculation can't be computed such as northern and southern locations even south of
     * the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func tzais18Degrees() -> Date
	{
		return sunsetOffsetByDegrees(offsetZenith: kZenithAstronomical)
	}
	
    /**
     * For information on how this is calculated see the comments on Alos19Point8Degrees()
     *
     * - returns: the Date representing the time.
     *
     * If the calculation can't be computed such as northern and southern locations even south of
     * the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func tzais19Point8Degrees() -> Date
	{
		return sunsetOffsetByDegrees(offsetZenith: kZenithNineteenPointEight)
	}
	
    /**
     * A method to return tzais (dusk) calculated as 96 minutes after sea level sunset.
     * For information on how this is calculated see the comments on Alos96().
     *
     * - returns: the Date representing the time.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func tzais96() -> Date
	{
		return dateByAddingMinutes(minutes: 96, toDate: seaLevelSunset()!)
	}
	
    /**
     * A method that returns the local time for fixed chatzos.
     * This time is noon and midnight adjusted from standard time to account for the local latitude.
     * The 360° of the globe divided by 24 calculates to 15° per hour with 4 minutes per degree,
     * so at a longitude of 0 , 15, 30 etc... Chatzos in 12:00 noon.
     * Lakewood, N.J., whose longitude is -74.2094, is 0.7906 away from the closest multiple
     * of 15 at -75°. This is multiplied by 4 to yield 3 minutes and 10 seconds for a chatzos of 11:56:50.
     * This method is not tied to the theoretical 15° timezones,
     * but will adjust to the actual timezone and Daylight saving time.
     *
     * - returns: the Date representing the local chatzos.
     */
	@objc public func fixedLocalChatzos() -> Date?
	{
		return dateFromTime(time: (12.0 - Double(geoLocation!.timeZone!.secondsFromGMT())))?.addingTimeInterval(Double(geoLocation!.localMeanTimeOffset()))
	}
	
    /**
     * A method that returns the latest zman krias shema (time to recite Shema in the morning)
     * calculated as 3 hours before FixedLocalChatzos().
     *
     * - returns: the Date of the latest zman krias shema calculated as 3 hours before FixedLocalChatzos()
     */
	@objc public func sofZmanShmaFixedLocal() -> Date?
	{
		if let flc = fixedLocalChatzos()
		{
			let date = dateBySubtractingMinutes(minutes: 180, fromDate: flc)
            return date
        }
        return nil
	}
	
    /**
     * This method returns the latest zman tfila (time to recite the morning prayers)
     * calculated as 2 hours before FixedLocalChatzos().
     *
     * - returns: the Date of the latest zman tfila.
     */
	@objc public func sofZmanTfilaFixedLocal() -> Date?
	{
		if let flc = fixedLocalChatzos()
		{
			let date = dateBySubtractingMinutes(minutes: 120, fromDate: flc)
            return date
        }
	    return nil
	}
	
    /**
     * This method returns the latest time one is allowed eating chametz on Erev Pesach according
     * to the opinion of the GRA and the Baal Hatanya. This time is identical to the Sof zman tefilah GRA.
     * This time is 4 hours into the day based on the opinion of the GRA and the Baal Hatanya
     * that the day is calculated from sunrise to sunset.
     * This returns the time 4 * ZmanimCalendar.ShaahZmanisGra() after sea level sunrise.
     *
     * - returns: the Date one is allowed eating chametz on Erev Pesach.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least
     * one day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func sofZmanAchilasChametzGra() -> Date
	{
	    return sofZmanTfilaGra()
	}
	
    /**
     * This method returns the latest time one is allowed eating chametz on Erev Pesach according to
     * the opinion of the MGA based on alos being 72 minutes before sunrise. This time is identical to
     * the Sof zman tefilah MGA 72 minutes. This time is 4 shaos zmaniyos (temporal hours) after dawn
     * based on the opinion of the MGA that the day is calculated from a dawn of 72 minutes before
     * sunrise to nightfall of 72 minutes after sunset.
     * This returns the time of 4 * ZmanimCalendar.ShaahZmanisMGA() after dawn.
     *
     * - returns: the Date of the latest time of eating chametz.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set), a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func sofZmanAchilasChametzMGA72Minutes() -> Date
	{
	    return sofZmanTfilaMGA72Minutes()
	}
	
    /**
     * This method returns the latest time one is allowed eating chametz on Erev Pesach according to
     * the opinion of the MGA based on alos being 16.1° before sunrise. This time is 4 shaos zmaniyos
     * (solar hours) after dawn based on the opinion of the MGA that the day is calculated from dawn
     * to nightfall with both being 16.1° below sunrise or sunset.
     * This returns the time of 4 ShaahZmanis16Point1Degrees() after dawn.
     *
     * - returns: the Date of the latest time of eating chametz.
     *
     * If the calculation can't be computed such as northern and southern locations even south of
     * the Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough
     * below the horizon for this calculation, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func sofZmanAchilasChametzMGA16Point1Degrees() -> Date?
	{
	    return sofZmanTfilaMGA16Point1Degrees()
	}
	
    /**
     * This method returns the latest time for burning chametz on Erev Pesach according to the opinion
     * of the GRA and the Baal Hatanya. This time is 5 hours into the day based on the opinion
     * of the GRA and the Baal Hatanya that the day is calculated from sunrise to sunset.
     * This returns the time 5 * ZmanimCalendar.ShaahZmanisGra() after sea level sunrise.
     *
     * - returns: the Date of the latest time for burning chametz on Erev Pesach.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func sofZmanBiurChametzGra() -> Date
	{
		return seaLevelSunrise()!.addingTimeInterval(shaahZmanisGra() * 5)
	}
	
    /**
     * This method returns the latest time for burning chametz on Erev Pesach according to the opinion
     * of the Magen Avraham based on alos being 72 minutes before sunrise.
     * This time is 5 shaos zmaniyos (temporal hours) after dawn based on the opinion of the Magen Avraham
     * that the day is calculated from a dawn of 72 minutes before sunrise to nightfall of 72 minutes
     * after sunset. This returns the time of 5 * ZmanimCalendar.ShaahZmanisMGA() after dawn.
     *
     * - returns: the Date of the latest time for burning chametz on Erev Pesach.
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set), a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func sofZmanBiurChametzMGA72Minutes() -> Date
	{
		return alos72().addingTimeInterval(shaahZmanisMogenAvraham() * 5)
	}
	
    /**
     * This method returns the latest time for burning chametz on Erev Pesach according to the opinion
     * of the MGA based on alos being 16.1° before sunrise. This time is 5 shaos zmaniyos (solar hours)
     * after dawn based on the opinion of the MGA that the day is calculated from dawn to nightfall
     * with both being 16.1° below sunrise or sunset.
     * This returns the time of 5 ShaahZmanis16Point1Degrees() after dawn.
     *
     * - returns: the Date of the latest time for burning chametz on Erev Pesach.
     *
     * If the calculation can't be computed such as northern and southern locations even south of the
     * Arctic Circle and north of the Antarctic Circle where the sun may not reach low enough below
     * the horizon for this calculation, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func sofZmanBiurChametzMGA16Point1Degrees() -> Date?
	{
		return alos16Point1Degrees()?.addingTimeInterval(shaahZmanis16Point1Degrees() * 5)
	}
	
    /**
     * A method that returns "solar" midnight, or the time when the sun is at its nadir.
     *
     * Note: this method is experimental and might be removed.
     *
     * - returns: the Date of Solar Midnight (chatzos layla).
     *
     * If the calculation can't be computed such as in the Arctic Circle where there is at least one
     * day a year where the sun does not rise, and one where it does not set, a nil will be returned.
     * See detailed explanation on top of the AstronomicalCalendar documentation.
     */
	@objc public func solarMidnight() -> Date?
	{
	    let clonedCalendar: ComplexZmanimCalendar = self
		clonedCalendar.workingDate = dateByAddingDays(days: 1, toDate: clonedCalendar.workingDate!)
	    let tempSunset: Date = sunset()!
	    let tempSunrise: Date = sunrise()!
	    
		return sunset()?.addingTimeInterval(temporalHourFromSunrise(sunrise: tempSunrise, toSunset: tempSunset) * 6)
	}
}
