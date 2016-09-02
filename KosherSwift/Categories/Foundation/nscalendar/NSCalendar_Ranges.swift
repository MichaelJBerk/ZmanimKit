//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

extension NSCalendar
{
	public func secondsPerMinute() -> Int
	{
	    return secondsPerMinuteUsingReferenceDate(NSDate())
	}
	
	public func secondsPerMinuteUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Second, inUnit: .Minute, forDate: date).length
	}
	
	public func secondsPerHour() -> Int
	{
	    return secondsPerHourUsingReferenceDate(NSDate())
	}
	
	public func secondsPerHourUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Second, inUnit: .Hour, forDate: date).length
	}
	
	public func minutesPerHour() -> Int
	{
	    return minutesPerHourUsingReferenceDate(NSDate())
	}
	
	public func minutesPerHourUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Minute, inUnit: .Hour, forDate: date).length
	}
	
	public func secondsPerDay() -> Int
	{
	    return secondsPerDayUsingReferenceDate(NSDate())
	}
	
	public func secondsPerDayUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Second, inUnit: .Day, forDate: date).length
	}
	
	public func minutesPerDay() -> Int
	{
	    return minutesPerDayUsingReferenceDate(NSDate())
	}
	
	public func minutesPerDayUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Minute, inUnit: .Day, forDate: date).length
	}
	
	public func hoursPerDay() -> Int
	{
	    return hoursPerDayUsingReferenceDate(NSDate())
	}
	
	public func hoursPerDayUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Hour, inUnit: .Day, forDate: date).length
	}
	
	public func secondsPerWeek() -> Int
	{
	    return secondsPerWeekUsingReferenceDate(NSDate())
	}
	
	public func secondsPerWeekUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Second, inUnit: .WeekOfYear, forDate: date).length
	}
	
	public func minutesPerWeek() -> Int
	{
	    return minutesPerWeekUsingReferenceDate(NSDate())
	}
	
	public func minutesPerWeekUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Minute, inUnit: .WeekOfYear, forDate: date).length
	}
	
	public func hoursPerWeek() -> Int
	{
	    return hoursPerWeekUsingReferenceDate(NSDate())
	}
	
	public func hoursPerWeekUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Hour, inUnit: .WeekOfYear, forDate: date).length
	}
	
	public func daysPerWeek() -> Int
	{
	    return daysPerWeekUsingReferenceDate(NSDate())
	}
	
	public func daysPerWeekUsingReferenceDate(date: NSDate) -> Int
	{
	    let weekLater: NSDate = dateByAddingWeeks(1, toDate: date)
	    return components(.Day, fromDate: date, toDate: weekLater, options: []).day
	}
	
	public func secondsPerMonth() -> Int
	{
	    return secondsPerMonthUsingReferenceDate(NSDate())
	}
	
	public func secondsPerMonthUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Second, inUnit: .Month, forDate: date).length
	}
	
	public func minutesPerMonth() -> Int
	{
	    return minutesPerMonthUsingReferenceDate(NSDate())
	}
	
	public func minutesPerMonthUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Minute, inUnit: .Month, forDate: date).length
	}
	
	public func hoursPerMonth() -> Int
	{
	    return hoursPerMonthUsingReferenceDate(NSDate())
	}
	
	public func hoursPerMonthUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Hour, inUnit: .Month, forDate: date).length
	}
	
	public func daysPerMonth() -> Int
	{
	    return daysPerMonthUsingReferenceDate(NSDate())
	}
	
	public func daysPerMonthUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Day, inUnit: .Month, forDate: date).length
	}
	
	public func weeksPerMonth() -> Int
	{
	    return weeksPerMonthUsingReferenceDate(NSDate())
	}
	
	public func weeksPerMonthUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.WeekOfYear, inUnit: .Month, forDate: date).length
	}
	
	public func secondsPerYear() -> Int
	{
	    return secondsPerYearUsingReferenceDate(NSDate())
	}
	
	public func secondsPerYearUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Second, inUnit: .Year, forDate: date).length
	}
	
	public func minutesPerYear() -> Int
	{
	    return minutesPerYearUsingReferenceDate(NSDate())
	}
	
	public func minutesPerYearUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Minute, inUnit: .Year, forDate: date).length
	}
	
	public func hoursPerYear() -> Int
	{
	    return hoursPerYearUsingReferenceDate(NSDate())
	}
	
	public func hoursPerYearUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Hour, inUnit: .Year, forDate: date).length
	}
	
	public func daysPerYear() -> Int
	{
	    return daysPerYearUsingReferenceDate(NSDate())
	}
	
	public func daysPerYearUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Day, inUnit: .Year, forDate: date).length
	}
	
	public func weeksPerYear() -> Int
	{
	    return weeksPerMonthUsingReferenceDate(NSDate())
	}
	
	public func weeksPerYearUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.WeekOfYear, inUnit: .Year, forDate: date).length
	}
	
	public func monthsPerYear() -> Int
	{
	    return monthsPerYearUsingReferenceDate(NSDate())
	}
	
	public func monthsPerYearUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Month, inUnit: .Year, forDate: date).length
	}
	
	public func secondsFromDate(fromDate: NSDate, toDate: NSDate) -> Int
	{
	    return components(.Second, fromDate: fromDate, toDate: toDate, options: []).second
	}
	
	public func minutesFromDate(fromDate: NSDate, toDate: NSDate) -> Int
	{
	    return components(.Minute, fromDate: fromDate, toDate: toDate, options: []).minute
	}
	
	public func hoursFromDate(fromDate: NSDate, toDate: NSDate) -> Int
	{
	    return components(.Hour, fromDate: fromDate, toDate: toDate, options: []).hour
	}
	
	public func daysFromDate(fromDate: NSDate, toDate: NSDate) -> Int
	{
	    return components(.Day, fromDate: fromDate, toDate: toDate, options: []).day
	}
	
	public func weeksFromDate(fromDate: NSDate, toDate: NSDate) -> Int
	{
	    return weeksOfYearFromDate(fromDate, toDate: toDate)
	}
	
	public func weeksOfYearFromDate(fromDate: NSDate, toDate: NSDate) -> Int
	{
	    return components(.WeekOfYear, fromDate: fromDate, toDate: toDate, options: []).weekOfYear
	}
	
	public func weeksOfMonthFromDate(fromDate: NSDate, toDate: NSDate) -> Int
	{
	    return components(.WeekOfMonth, fromDate: fromDate, toDate: toDate, options: []).weekOfMonth
	}
	
	public func monthsFromDate(fromDate: NSDate, toDate: NSDate) -> Int
	{
	    return components(.Month, fromDate: fromDate, toDate: toDate, options: []).month
	}
	
	public func yearsFromDate(fromDate: NSDate, toDate: NSDate) -> Int
	{
	    return components(.Year, fromDate: fromDate, toDate: toDate, options: []).year
	}
	
	public func date(firstDate: NSDate, isBeforeDate anotherDate: NSDate) -> Bool
	{
	    return secondsFromDate(firstDate, toDate: anotherDate) < 0
	}
	
	public func date(firstDate: NSDate, isAfterDate anotherDate: NSDate) -> Bool
	{
	    return secondsFromDate(firstDate, toDate: anotherDate) > 0
	}
}