//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

extension NSCalendar
{
	func secondsPerMinute() -> Int
	{
	    return secondsPerMinuteUsingReferenceDate(NSDate())
	}
	
	func secondsPerMinuteUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Second, inUnit: .Minute, forDate: date).length
	}
	
	func secondsPerHour() -> Int
	{
	    return secondsPerHourUsingReferenceDate(NSDate())
	}
	
	func secondsPerHourUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Second, inUnit: .Hour, forDate: date).length
	}
	
	func minutesPerHour() -> Int
	{
	    return minutesPerHourUsingReferenceDate(NSDate())
	}
	
	func minutesPerHourUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Minute, inUnit: .Hour, forDate: date).length
	}
	
	func secondsPerDay() -> Int
	{
	    return secondsPerDayUsingReferenceDate(NSDate())
	}
	
	func secondsPerDayUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Second, inUnit: .Day, forDate: date).length
	}
	
	func minutesPerDay() -> Int
	{
	    return minutesPerDayUsingReferenceDate(NSDate())
	}
	
	func minutesPerDayUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Minute, inUnit: .Day, forDate: date).length
	}
	
	func hoursPerDay() -> Int
	{
	    return hoursPerDayUsingReferenceDate(NSDate())
	}
	
	func hoursPerDayUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Hour, inUnit: .Day, forDate: date).length
	}
	
	func secondsPerWeek() -> Int
	{
	    return secondsPerWeekUsingReferenceDate(NSDate())
	}
	
	func secondsPerWeekUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Second, inUnit: .WeekOfYear, forDate: date).length
	}
	
	func minutesPerWeek() -> Int
	{
	    return minutesPerWeekUsingReferenceDate(NSDate())
	}
	
	func minutesPerWeekUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Minute, inUnit: .WeekOfYear, forDate: date).length
	}
	
	func hoursPerWeek() -> Int
	{
	    return hoursPerWeekUsingReferenceDate(NSDate())
	}
	
	func hoursPerWeekUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Hour, inUnit: .WeekOfYear, forDate: date).length
	}
	
	func daysPerWeek() -> Int
	{
	    return daysPerWeekUsingReferenceDate(NSDate())
	}
	
	func daysPerWeekUsingReferenceDate(date: NSDate) -> Int
	{
	    let weekLater: NSDate = dateByAddingWeeks(1, toDate: date)
	    return components(.Day, fromDate: date, toDate: weekLater, options: []).day
	}
	
	func secondsPerMonth() -> Int
	{
	    return secondsPerMonthUsingReferenceDate(NSDate())
	}
	
	func secondsPerMonthUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Second, inUnit: .Month, forDate: date).length
	}
	
	func minutesPerMonth() -> Int
	{
	    return minutesPerMonthUsingReferenceDate(NSDate())
	}
	
	func minutesPerMonthUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Minute, inUnit: .Month, forDate: date).length
	}
	
	func hoursPerMonth() -> Int
	{
	    return hoursPerMonthUsingReferenceDate(NSDate())
	}
	
	func hoursPerMonthUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Hour, inUnit: .Month, forDate: date).length
	}
	
	func daysPerMonth() -> Int
	{
	    return daysPerMonthUsingReferenceDate(NSDate())
	}
	
	func daysPerMonthUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Day, inUnit: .Month, forDate: date).length
	}
	
	func weeksPerMonth() -> Int
	{
	    return weeksPerMonthUsingReferenceDate(NSDate())
	}
	
	func weeksPerMonthUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.WeekOfYear, inUnit: .Month, forDate: date).length
	}
	
	func secondsPerYear() -> Int
	{
	    return secondsPerYearUsingReferenceDate(NSDate())
	}
	
	func secondsPerYearUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Second, inUnit: .Year, forDate: date).length
	}
	
	func minutesPerYear() -> Int
	{
	    return minutesPerYearUsingReferenceDate(NSDate())
	}
	
	func minutesPerYearUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Minute, inUnit: .Year, forDate: date).length
	}
	
	func hoursPerYear() -> Int
	{
	    return hoursPerYearUsingReferenceDate(NSDate())
	}
	
	func hoursPerYearUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Hour, inUnit: .Year, forDate: date).length
	}
	
	func daysPerYear() -> Int
	{
	    return daysPerYearUsingReferenceDate(NSDate())
	}
	
	func daysPerYearUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Day, inUnit: .Year, forDate: date).length
	}
	
	func weeksPerYear() -> Int
	{
	    return weeksPerMonthUsingReferenceDate(NSDate())
	}
	
	func weeksPerYearUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.WeekOfYear, inUnit: .Year, forDate: date).length
	}
	
	func monthsPerYear() -> Int
	{
	    return monthsPerYearUsingReferenceDate(NSDate())
	}
	
	func monthsPerYearUsingReferenceDate(date: NSDate) -> Int
	{
	    return rangeOfUnit(.Month, inUnit: .Year, forDate: date).length
	}
	
	func secondsFromDate(fromDate: NSDate, toDate: NSDate) -> Int
	{
	    return components(.Second, fromDate: fromDate, toDate: toDate, options: []).second
	}
	
	func minutesFromDate(fromDate: NSDate, toDate: NSDate) -> Int
	{
	    return components(.Minute, fromDate: fromDate, toDate: toDate, options: []).minute
	}
	
	func hoursFromDate(fromDate: NSDate, toDate: NSDate) -> Int
	{
	    return components(.Hour, fromDate: fromDate, toDate: toDate, options: []).hour
	}
	
	func daysFromDate(fromDate: NSDate, toDate: NSDate) -> Int
	{
	    return components(.Day, fromDate: fromDate, toDate: toDate, options: []).day
	}
	
	func weeksFromDate(fromDate: NSDate, toDate: NSDate) -> Int
	{
	    return weeksOfYearFromDate(fromDate, toDate: toDate)
	}
	
	func weeksOfYearFromDate(fromDate: NSDate, toDate: NSDate) -> Int
	{
	    return components(.WeekOfYear, fromDate: fromDate, toDate: toDate, options: []).weekOfYear
	}
	
	func weeksOfMonthFromDate(fromDate: NSDate, toDate: NSDate) -> Int
	{
	    return components(.WeekOfMonth, fromDate: fromDate, toDate: toDate, options: []).weekOfMonth
	}
	
	func monthsFromDate(fromDate: NSDate, toDate: NSDate) -> Int
	{
	    return components(.Month, fromDate: fromDate, toDate: toDate, options: []).month
	}
	
	func yearsFromDate(fromDate: NSDate, toDate: NSDate) -> Int
	{
	    return components(.Year, fromDate: fromDate, toDate: toDate, options: []).year
	}
	
	func date(firstDate: NSDate, isBeforeDate anotherDate: NSDate) -> Bool
	{
	    return secondsFromDate(firstDate, toDate: anotherDate) < 0
	}
	
	func date(firstDate: NSDate, isAfterDate anotherDate: NSDate) -> Bool
	{
	    return secondsFromDate(firstDate, toDate: anotherDate) > 0
	}
}