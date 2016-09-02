//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

extension NSCalendar
{
	public func firstDayOfTheWeek() -> NSDate
	{
	    return firstDayOfTheWeekUsingReferenceDate(NSDate())
	}
	
	public func firstDayOfTheWeekUsingReferenceDate(date: NSDate) -> NSDate
	{    
	    let weekday: Int = weekdayInDate(date) - 1
	    return dateBySubtractingDays(weekday, fromDate: date)
	}
	
	public func lastDayOfTheWeek() -> NSDate
	{
	    return lastDayOfTheWeekUsingReferenceDate(NSDate())
	}
	
	public func lastDayOfTheWeekUsingReferenceDate(date: NSDate) -> NSDate
	{
	    let d: NSDate = firstDayOfTheWeekUsingReferenceDate(date)
	    let daysPerWeek: Int = daysPerWeekUsingReferenceDate(d)
	    return dateByAddingDays(daysPerWeek - 1, toDate: d)
	}
	
	public func firstDayOfTheMonth() -> NSDate
	{
	    return firstDayOfTheMonthUsingReferenceDate(NSDate())
	}
	
	public func firstDayOfTheMonthUsingReferenceDate(date: NSDate) -> NSDate
	{
	    let c: NSDateComponents = components([.Month, .Year], fromDate: date)
	    c.day = 1
	    return dateFromComponents(c)!
	}
	
	public func lastDayOfTheMonth() -> NSDate
	{
	    return firstDayOfTheMonthUsingReferenceDate(NSDate())
	}
	
	public func lastDayOfTheMonthUsingReferenceDate(date: NSDate) -> NSDate
	{
	    let c: NSDateComponents = components([.Year, .Month], fromDate: date)
	    c.day = daysPerMonthUsingReferenceDate(date)
	    return dateFromComponents(c)!
	}
}