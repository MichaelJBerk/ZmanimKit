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
     *  This method returns an integer representing the
     *  day of the omer count which date falls out on.
     *
     *  If date does not fall out during the
     *  omer count, then 0 is returned.
     *
     *  - perameter date: The date to use.
     *  - returns: An integer representing the day of the omer count.
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
	
	class public func _dateOfSixteenNissanForYearOfDate(date: Date) -> Date
	{
		let hebrewCalendar: Calendar = Calendar(identifier: .hebrew)
		
		let hebrewYear: Int = hebrewCalendar.yearsInDate(date: date)
		
	    //  Foundation reserves 7 for Adar II, so Nissan is 8
		return Date.dateWithDay(day: 16, Month: 8, Year: hebrewYear, andCalendar: hebrewCalendar)
	}
}