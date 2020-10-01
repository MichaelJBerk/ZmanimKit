//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

extension Calendar
{
	public func dateByAddingSeconds(seconds: Int, toDate date: Date) -> Date
	{
	    var c = DateComponents()
	    c.second = seconds
		return self.date(byAdding: c, to: date)!
	}
	
    public func dateByAddingMinutes(minutes: Int, seconds: Int = 0, toDate date: Date) -> Date
	{
	    var c = DateComponents()
	    c.minute = minutes
        c.second = seconds
		return self.date(byAdding: c, to: date)!
	}
	
	public func dateByAddingHours(hours: Int, toDate date: Date) -> Date
	{
	    var c = DateComponents()
	    c.hour = hours
		return self.date(byAdding: c, to: date)!
	}
	
	public func dateByAddingDays(days: Int, toDate date: Date) -> Date
	{
	    var c = DateComponents()
	    c.day = days
		return self.date(byAdding: c, to: date)!
	}
	
	public func dateByAddingWeeks(weeks: Int, toDate date: Date) -> Date
	{
	    var c = DateComponents()
	    c.weekOfYear = weeks
		return self.date(byAdding: c, to: date)!
	}
	
	public func dateByAddingMonths(months: Int, toDate date: Date) -> Date
	{
	    var c = DateComponents()
	    c.month = months
		return self.date(byAdding: c, to: date)!
	}
	
	public func dateByAddingYears(years: Int, toDate date: Date) -> Date
	{
	    var c = DateComponents()
	    c.year = years
		return self.date(byAdding: c, to: date)!
	}
	
	public func dateBySubtractingSeconds(seconds: Int, fromDate date: Date) -> Date
	{
	 
	    var c = DateComponents()
	    c.second = -seconds
		return self.date(byAdding: c, to: date)!
	}
	
    public func dateBySubtractingMinutes(minutes: Int, seconds: Int = 0, fromDate date: Date) -> Date
	{
	    var c = DateComponents()
	    c.minute = -minutes
        c.second = seconds
		return self.date(byAdding: c, to: date)!
	}
	
	public func dateBySubtractingHours(hours: Int, fromDate date: Date) -> Date
	{
	    var c = DateComponents()
	    c.hour = -hours
		return self.date(byAdding: c, to: date)!
	}
	
	public func dateBySubtractingDays(days: Int, fromDate date: Date) -> Date
	{
	    var c = DateComponents()
	    c.day = -days
		return self.date(byAdding: c, to: date)!
	}
	
	public func dateBySubtractingWeeks(weeks: Int, fromDate date: Date) -> Date
	{
	    var c = DateComponents()
	    c.weekOfYear = -weeks
		return self.date(byAdding: c, to: date)!
	}
	
	public func dateBySubtractingMonths(months: Int, fromDate date: Date) -> Date
	{
	    var c = DateComponents()
	    c.month = -months
		return self.date(byAdding: c, to: date)!
	}
	
	public func dateBySubtractingYears(years: Int, fromDate date: Date) -> Date
	{
	    var c = DateComponents()
	    c.year = -years
		return self.date(byAdding: c, to: date)!
	}
}
