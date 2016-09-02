//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

public class KSSefiratHaomerCalculator
{
	class public func fallsToday() -> Bool
	{
	    return fallsOnDate(NSDate())
	}
	
	class public func fallsOnDate(date: NSDate) -> Bool
	{
	    return dayOfSefiraForDate(date) != 0
	}
	
	class public func dayOfSefira() -> Int
	{
		return dayOfSefiraForDate(NSDate())
	}
	
	class public func dayOfSefiraForDate(date: NSDate) -> Int
	{
		let firstDayOfTheOmer: NSDate = KSSefiratHaomerCalculator._dateOfSixteenNissanForYearOfDate(date)
	    let hebrewCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierHebrew)!
        var day: Int = hebrewCalendar.daysFromDate(firstDayOfTheOmer, toDate: date) + 1;     //  Add one because the sixteenth is the first night, but is zero days since sixteen.
	    if day < 0 || day > 49
	    {
	        day = 0
	    }
	    
	    return day
	}
	
	class public func _dateOfSixteenNissanForYearOfDate(date: NSDate) -> NSDate
	{
		let hebrewCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierHebrew)!
		
	    let hebrewYear: Int = hebrewCalendar.yearsInDate(date)
		
	    //  Foundation reserves 7 for Adar II, so Nissan is 8
		return NSDate.dateWithDay(16, Month: 8, Year: hebrewYear, andCalendar: hebrewCalendar)
	}
}