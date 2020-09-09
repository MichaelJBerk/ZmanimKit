//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

extension NSCalendar
{
	public func weekOfMonthInDate(date: NSDate) -> Int
	{
		let comps: NSDateComponents = components(.weekOfMonth, from: date as Date) as NSDateComponents
	    return comps.weekOfMonth
	}
	
	public func weekOfYearInDate(date: NSDate) -> Int
	{
		let comps: NSDateComponents = components(.weekOfYear, from: date as Date) as NSDateComponents
	    return comps.weekOfYear
	}
	
	public func weekdayInDate(date: NSDate) -> Int
	{
		let comps: NSDateComponents = components(.weekday, from: date as Date) as NSDateComponents
	    return comps.weekday
	}
	
	public func secondsInDate(date: NSDate) -> Int
	{
		let comps: NSDateComponents = components(.second, from: date as Date) as NSDateComponents
	    return comps.second
	}
	
	public func minutesInDate(date: NSDate) -> Int
	{
		let comps: NSDateComponents = components(.minute, from: date as Date) as NSDateComponents
	    return comps.minute
	}
	
	public func hoursInDate(date: NSDate) -> Int
	{
		let comps: NSDateComponents = components(.hour, from: date as Date) as NSDateComponents
	    return comps.hour
	}
	
	public func daysInDate(date: NSDate) -> Int
	{
		let comps: NSDateComponents = components(.day, from: date as Date) as NSDateComponents
	    return comps.day
	}
	
	public func monthsInDate(date: NSDate) -> Int
	{
		let comps: NSDateComponents = components(.month, from: date as Date) as NSDateComponents
	    return comps.month
	}
	
	public func yearsInDate(date: NSDate) -> Int
	{
		let comps: NSDateComponents = components(.year, from: date as Date) as NSDateComponents
	    return comps.year
	}
	
	public func eraInDate(date: NSDate) -> Int
	{
		let comps: NSDateComponents = components(.era, from: date as Date) as NSDateComponents
	    return comps.era
	}
}
