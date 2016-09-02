//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

extension KSAstronomicalCalendar
{
	func dateByAddingSeconds(seconds: Int, toDate date: NSDate) -> NSDate
	{
	    return internalCalendar!.dateByAddingSeconds(seconds, toDate: date)
	}
	
   func dateByAddingMinutes(minutes: Int, seconds: Int = 0, toDate date: NSDate) -> NSDate
	{
	    return internalCalendar!.dateByAddingMinutes(minutes, seconds: seconds, toDate: date)
	}
	
	func dateByAddingHours(hours: Int, toDate date: NSDate) -> NSDate
	{
	    return internalCalendar!.dateByAddingHours(hours, toDate: date)
	}
	
	func dateByAddingDays(days: Int, toDate date: NSDate) -> NSDate
	{
	    return internalCalendar!.dateByAddingDays(days, toDate: date)
	}
	
	func dateByAddingWeeks(weeks: Int, toDate date: NSDate) -> NSDate
	{
	    return internalCalendar!.dateByAddingWeeks(weeks, toDate: date)
	}
	
	func dateByAddingMonths(months: Int, toDate date: NSDate) -> NSDate
	{
	    return internalCalendar!.dateByAddingMonths(months, toDate: date)
	}
	
	func dateByAddingYears(years: Int, toDate date: NSDate) -> NSDate
	{
	    return internalCalendar!.dateByAddingYears(years, toDate: date)
	}
	
   func dateBySubtractingSeconds(seconds: Int, fromDate date: NSDate) -> NSDate
	{
	    return internalCalendar!.dateBySubtractingSeconds(seconds, fromDate: date)
	}
	
   func dateBySubtractingMinutes(minutes: Int, seconds: Int = 0, fromDate date: NSDate) -> NSDate
	{
        return internalCalendar!.dateBySubtractingMinutes(minutes, seconds: 0, fromDate: date)
	}
	
	func dateBySubtractingHours(hours: Int, fromDate date: NSDate) -> NSDate
	{
	    return internalCalendar!.dateBySubtractingHours(hours, fromDate: date)
	}
	
	func dateBySubtractingDays(days: Int, fromDate date: NSDate) -> NSDate
	{
	    return internalCalendar!.dateBySubtractingDays(days, fromDate: date)
	}
	
	func dateBySubtractingWeeks(weeks: Int, fromDate date: NSDate) -> NSDate
	{
	    return internalCalendar!.dateBySubtractingWeeks(weeks, fromDate: date)
	}
	
	func dateBySubtractingMonths(months: Int, fromDate date: NSDate) -> NSDate
	{
	    return internalCalendar!.dateBySubtractingMonths(months, fromDate: date)
	}
	
	func dateBySubtractingYears(years: Int, fromDate date: NSDate) -> NSDate
	{
	    return internalCalendar!.dateBySubtractingYears(years, fromDate: date)
	}
}