//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

/** A class that calculates Sefirat Haomer. */
public class SefiratHaomerCalculator
{
    /**
     *  This method checks if [Date date] represents a day
     *  that falls out during the omer count on the Hebrew
     *  calendar.
     *
     *  - returns: true if today is during the sefira count, otherwise NO.
     */
	class public func fallsToday() -> Bool
	{
		return fallsOnDate(date: Date())
	}
	
    /**
     *  This method checks if the supplied date represents a
     *  day that dalls out during the omer count according
     *  to the Hebrew calendar.
     *
     *  - perameter date: The date to check
     *  - returns: true if date is during the sefira count, otherwise false.
     */
	class public func fallsOnDate(date: Date) -> Bool
	{
		return dayOfSefiraForDate(date: date) != 0
	}
	
    /**
     *  This method returns an integer representing the
     *  current day of the omer count.
     *
     *  If Date() does not fall out during the
     *  omer count, then 0 is returned.
     *
     *  - returns: An integer representing the day of the omer count.
     */
	class public func dayOfSefira() -> Int
	{
		return dayOfSefiraForDate(date: Date())
	}
	
    /**
	This method returns an integer representing the
	day of the omer count which `date` falls out on.
	
	If date does not fall out during the
	omer count, then 0 is returned.
	
	- parameter date: The date to use.
	- returns: An integer representing the day of the omer count.
	*/
	class public func dayOfSefiraForDate(date: Date) -> Int
	{
		let firstDayOfTheOmer: Date = SefiratHaomerCalculator._dateOfSixteenNissanForYearOfDate(date: date)
		let hebrewCalendar: Calendar = Calendar(identifier: .hebrew)
		var day: Int = hebrewCalendar.daysFromDate(fromDate: firstDayOfTheOmer, toDate: date) + 1;     //  Add one because the sixteenth is the first night, but is zero days since sixteen.
	    if day < 0 || day > 49
	    {
	        day = 0
	    }
	    
	    return day
	}
	
	/**
	This method returns an integer representing the
	day of the omer count which `date` falls out on,
	taking into account whether or not `date` is after sunset
	has occurred
	
	If `date` does not fall out during the
	omer count, then 0 is returned.
	
	- parameter date: The date to use.
	- parameter location: The location to use when calculating
	- returns: An integer representing the day of the omer count.
	*/
	class public func updatingDayOfSefiraFor(date: Date, location: GeoLocation) -> Int {
		var omer = dayOfSefiraForDate(date: date)
		let sunsetCal = ZmanimCalendar(location: location)
		sunsetCal.workingDate = date
		let sunset = sunsetCal.sunset()
		//Return 0 when it's not between pesach and Shavuos, but do show it on the second night of pesach (for those in Eretz Yisroel), after sunset
		let jCal = JewishCalendar(location: GeoLocation())
		jCal.workingDate = date
		if !jCal.isPesach(), omer == 0 {
			return 0
		}
		if date.compare(sunset!) == .orderedDescending {
			omer += 1
			//16 since it's after sunset - so it's the next day
			if jCal.currentHebrewMonth() == .nissan, jCal.currentHebrewDayOfMonth() == 16 {
				return 1
			}
			if jCal.isShavuos() {
				return 0
			}
		}
		return omer
	}
	
	
	class public func _dateOfSixteenNissanForYearOfDate(date: Date) -> Date
	{
		let hebrewCalendar: Calendar = Calendar(identifier: .hebrew)
		
		let hebrewYear: Int = hebrewCalendar.yearsInDate(date: date)
		
	    //  Foundation reserves 7 for Adar II, so Nissan is 8
		return Date.dateWithDay(day: 16, Month: 8, Year: hebrewYear, andCalendar: hebrewCalendar)
	}
}
