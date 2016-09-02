//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

extension NSCalendar
{
	public func weekOfMonthInDate(date: NSDate) -> Int
	{
	    let comps: NSDateComponents = components(.WeekOfMonth, fromDate: date)
	    return comps.weekOfMonth
	}
	
	public func weekOfYearInDate(date: NSDate) -> Int
	{
	    let comps: NSDateComponents = components(.WeekOfYear, fromDate: date)
	    return comps.weekOfYear
	}
	
	public func weekdayInDate(date: NSDate) -> Int
	{
	    let comps: NSDateComponents = components(.Weekday, fromDate: date)
	    return comps.weekday
	}
	
	public func secondsInDate(date: NSDate) -> Int
	{
	    let comps: NSDateComponents = components(.Second, fromDate: date)
	    return comps.second
	}
	
	public func minutesInDate(date: NSDate) -> Int
	{
	    let comps: NSDateComponents = components(.Minute, fromDate: date)
	    return comps.minute
	}
	
	public func hoursInDate(date: NSDate) -> Int
	{
	    let comps: NSDateComponents = components(.Hour, fromDate: date)
	    return comps.hour
	}
	
	public func daysInDate(date: NSDate) -> Int
	{
	    let comps: NSDateComponents = components(.Day, fromDate: date)
	    return comps.day
	}
	
	public func monthsInDate(date: NSDate) -> Int
	{
	    let comps: NSDateComponents = components(.Month, fromDate: date)
	    return comps.month
	}
	
	public func yearsInDate(date: NSDate) -> Int
	{
	    let comps: NSDateComponents = components(.Year, fromDate: date)
	    return comps.year
	}
	
	public func eraInDate(date: NSDate) -> Int
	{
	    let comps: NSDateComponents = components(.Era, fromDate: date)
	    return comps.era
	}
}