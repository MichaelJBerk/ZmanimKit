//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

extension Calendar
{
	public func firstDayOfTheWeek() -> Date
	{
		return firstDayOfTheWeekUsingReferenceDate(date: Date())
	}
	
	public func firstDayOfTheWeekUsingReferenceDate(date: Date) -> Date
	{    
		let weekday: Int = weekdayInDate(date: date) - 1
		return dateBySubtractingDays(days: weekday, fromDate: date)
	}
	
	public func lastDayOfTheWeek() -> Date
	{
		return lastDayOfTheWeekUsingReferenceDate(date: Date())
	}
	
	public func lastDayOfTheWeekUsingReferenceDate(date: Date) -> Date
	{
		let d: Date = firstDayOfTheWeekUsingReferenceDate(date: date)
		let daysPerWeek: Int = daysPerWeekUsingReferenceDate(date: d)
		return dateByAddingDays(days: daysPerWeek - 1, toDate: d)
	}
	
	public func firstDayOfTheMonth() -> Date
	{
		return firstDayOfTheMonthUsingReferenceDate(date: Date())
	}
	
	public func firstDayOfTheMonthUsingReferenceDate(date: Date) -> Date
	{
		var c: DateComponents = dateComponents([.month, .year], from: date as Date) as DateComponents
	    c.day = 1
		return self.date(from: c as DateComponents)! as Date
	}
	
	public func lastDayOfTheMonth() -> Date
	{
		return firstDayOfTheMonthUsingReferenceDate(date: Date())
	}
	
	public func lastDayOfTheMonthUsingReferenceDate(date: Date) -> Date
	{
		var c: DateComponents = dateComponents([.year, .month], from: date as Date) as DateComponents
		c.day = daysPerMonthUsingReferenceDate(date: date)
		return self.date(from: c as DateComponents)! as Date
	}
}
