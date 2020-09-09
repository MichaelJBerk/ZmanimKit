//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

extension NSCalendar
{
	public func firstDayOfTheWeek() -> NSDate
	{
		return firstDayOfTheWeekUsingReferenceDate(date: NSDate())
	}
	
	public func firstDayOfTheWeekUsingReferenceDate(date: NSDate) -> NSDate
	{    
		let weekday: Int = weekdayInDate(date: date) - 1
		return dateBySubtractingDays(days: weekday, fromDate: date)
	}
	
	public func lastDayOfTheWeek() -> NSDate
	{
		return lastDayOfTheWeekUsingReferenceDate(date: NSDate())
	}
	
	public func lastDayOfTheWeekUsingReferenceDate(date: NSDate) -> NSDate
	{
		let d: NSDate = firstDayOfTheWeekUsingReferenceDate(date: date)
		let daysPerWeek: Int = daysPerWeekUsingReferenceDate(date: d)
		return dateByAddingDays(days: daysPerWeek - 1, toDate: d)
	}
	
	public func firstDayOfTheMonth() -> NSDate
	{
		return firstDayOfTheMonthUsingReferenceDate(date: NSDate())
	}
	
	public func firstDayOfTheMonthUsingReferenceDate(date: NSDate) -> NSDate
	{
		let c: NSDateComponents = components([.month, .year], from: date as Date) as NSDateComponents
	    c.day = 1
		return self.date(from: c as DateComponents)! as NSDate
	}
	
	public func lastDayOfTheMonth() -> NSDate
	{
		return firstDayOfTheMonthUsingReferenceDate(date: NSDate())
	}
	
	public func lastDayOfTheMonthUsingReferenceDate(date: NSDate) -> NSDate
	{
		let c: NSDateComponents = components([.year, .month], from: date as Date) as NSDateComponents
		c.day = daysPerMonthUsingReferenceDate(date: date)
		return self.date(from: c as DateComponents)! as NSDate
	}
}
