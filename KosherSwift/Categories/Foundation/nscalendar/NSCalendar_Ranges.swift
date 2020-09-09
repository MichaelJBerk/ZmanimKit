//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

extension NSCalendar
{
	public func secondsPerMinute() -> Int
	{
		return secondsPerMinuteUsingReferenceDate(date: NSDate())
	}
	
	public func secondsPerMinuteUsingReferenceDate(date: NSDate) -> Int
	{
		return range(of: .second, in: .minute, for: date as Date).length
	}
	
	public func secondsPerHour() -> Int
	{
		return secondsPerHourUsingReferenceDate(date: NSDate())
	}
	
	public func secondsPerHourUsingReferenceDate(date: NSDate) -> Int
	{
		return range(of: .second, in: .hour, for: date as Date).length
	}
	
	public func minutesPerHour() -> Int
	{
		return minutesPerHourUsingReferenceDate(date: NSDate())
	}
	
	public func minutesPerHourUsingReferenceDate(date: NSDate) -> Int
	{
		return range(of: .minute, in: .hour, for: date as Date).length
	}
	
	public func secondsPerDay() -> Int
	{
		return secondsPerDayUsingReferenceDate(date: NSDate())
	}
	
	public func secondsPerDayUsingReferenceDate(date: NSDate) -> Int
	{
		return range(of: .second, in: .day, for: date as Date).length
	}
	
	public func minutesPerDay() -> Int
	{
		return minutesPerDayUsingReferenceDate(date: NSDate())
	}
	
	public func minutesPerDayUsingReferenceDate(date: NSDate) -> Int
	{
		return range(of: .minute, in: .day, for: date as Date).length
	}
	
	public func hoursPerDay() -> Int
	{
		return hoursPerDayUsingReferenceDate(date: NSDate())
	}
	
	public func hoursPerDayUsingReferenceDate(date: NSDate) -> Int
	{
		return range(of: .hour, in: .day, for: date as Date).length
	}
	
	public func secondsPerWeek() -> Int
	{
		return secondsPerWeekUsingReferenceDate(date: NSDate())
	}
	
	public func secondsPerWeekUsingReferenceDate(date: NSDate) -> Int
	{
		return range(of: .second, in: .weekOfYear, for: date as Date).length
	}
	
	public func minutesPerWeek() -> Int
	{
		return minutesPerWeekUsingReferenceDate(date: NSDate())
	}
	
	public func minutesPerWeekUsingReferenceDate(date: NSDate) -> Int
	{
		return range(of: .minute, in: .weekOfYear, for: date as Date).length
	}
	
	public func hoursPerWeek() -> Int
	{
		return hoursPerWeekUsingReferenceDate(date: NSDate())
	}
	
	public func hoursPerWeekUsingReferenceDate(date: NSDate) -> Int
	{
		return range(of: .hour, in: .weekOfYear, for: date as Date).length
	}
	
	public func daysPerWeek() -> Int
	{
		return daysPerWeekUsingReferenceDate(date: NSDate())
	}
	
	public func daysPerWeekUsingReferenceDate(date: NSDate) -> Int
	{
		let weekLater: NSDate = dateByAddingWeeks(weeks: 1, toDate: date)
		return components(.day, from: date as Date, to: weekLater as Date, options: []).day ?? 0
	}
	
	public func secondsPerMonth() -> Int
	{
		return secondsPerMonthUsingReferenceDate(date: NSDate())
	}
	
	public func secondsPerMonthUsingReferenceDate(date: NSDate) -> Int
	{
		return range(of: .second, in: .month, for: date as Date).length
	}
	
	public func minutesPerMonth() -> Int
	{
		return minutesPerMonthUsingReferenceDate(date: NSDate())
	}
	
	public func minutesPerMonthUsingReferenceDate(date: NSDate) -> Int
	{
		return range(of: .minute, in: .month, for: date as Date).length
	}
	
	public func hoursPerMonth() -> Int
	{
		return hoursPerMonthUsingReferenceDate(date: NSDate())
	}
	
	public func hoursPerMonthUsingReferenceDate(date: NSDate) -> Int
	{
		return range(of: .hour, in: .month, for: date as Date).length
	}
	
	public func daysPerMonth() -> Int
	{
		return daysPerMonthUsingReferenceDate(date: NSDate())
	}
	
	public func daysPerMonthUsingReferenceDate(date: NSDate) -> Int
	{
		return range(of: .day, in: .month, for: date as Date).length
	}
	
	public func weeksPerMonth() -> Int
	{
		return weeksPerMonthUsingReferenceDate(date: NSDate())
	}
	
	public func weeksPerMonthUsingReferenceDate(date: NSDate) -> Int
	{
		return range(of: .weekOfYear, in: .month, for: date as Date).length
	}
	
	public func secondsPerYear() -> Int
	{
		return secondsPerYearUsingReferenceDate(date: NSDate())
	}
	
	public func secondsPerYearUsingReferenceDate(date: NSDate) -> Int
	{
		return range(of: .second, in: .year, for: date as Date).length
	}
	
	public func minutesPerYear() -> Int
	{
		return minutesPerYearUsingReferenceDate(date: NSDate())
	}
	
	public func minutesPerYearUsingReferenceDate(date: NSDate) -> Int
	{
		return range(of: .minute, in: .year, for: date as Date).length
	}
	
	public func hoursPerYear() -> Int
	{
		return hoursPerYearUsingReferenceDate(date: NSDate())
	}
	
	public func hoursPerYearUsingReferenceDate(date: NSDate) -> Int
	{
		return range(of: .hour, in: .year, for: date as Date).length
	}
	
	public func daysPerYear() -> Int
	{
		return daysPerYearUsingReferenceDate(date: NSDate())
	}
	
	public func daysPerYearUsingReferenceDate(date: NSDate) -> Int
	{
		return range(of: .day, in: .year, for: date as Date).length
	}
	
	public func weeksPerYear() -> Int
	{
		return weeksPerMonthUsingReferenceDate(date: NSDate())
	}
	
	public func weeksPerYearUsingReferenceDate(date: NSDate) -> Int
	{
		return range(of: .weekOfYear, in: .year, for: date as Date).length
	}
	
	public func monthsPerYear() -> Int
	{
		return monthsPerYearUsingReferenceDate(date: NSDate())
	}
	
	public func monthsPerYearUsingReferenceDate(date: NSDate) -> Int
	{
		return range(of: .month, in: .year, for: date as Date).length
	}
	
	public func secondsFromDate(fromDate: NSDate, toDate: NSDate) -> Int
	{
		return components(.second, from: fromDate as Date, to: toDate as Date, options: []).second ?? 0
	}
	
	public func minutesFromDate(fromDate: NSDate, toDate: NSDate) -> Int
	{
		return components(.minute, from: fromDate as Date, to: toDate as Date, options: []).minute ?? 0
	}
	
	public func hoursFromDate(fromDate: NSDate, toDate: NSDate) -> Int
	{
		return components(.hour, from: fromDate as Date, to: toDate as Date, options: []).hour ?? 0
	}
	
	public func daysFromDate(fromDate: NSDate, toDate: NSDate) -> Int
	{
		return components(.day, from: fromDate as Date, to: toDate as Date, options: []).day ?? 0
	}
	
	public func weeksFromDate(fromDate: NSDate, toDate: NSDate) -> Int
	{
		return weeksOfYearFromDate(fromDate: fromDate, toDate: toDate)
	}
	
	public func weeksOfYearFromDate(fromDate: NSDate, toDate: NSDate) -> Int
	{
		return components(.weekOfYear, from: fromDate as Date, to: toDate as Date, options: []).weekOfYear ?? 0
	}
	
	public func weeksOfMonthFromDate(fromDate: NSDate, toDate: NSDate) -> Int
	{
		return components(.weekOfMonth, from: fromDate as Date, to: toDate as Date, options: []).weekOfMonth ?? 0
	}
	
	public func monthsFromDate(fromDate: NSDate, toDate: NSDate) -> Int
	{
		return components(.month, from: fromDate as Date, to: toDate as Date, options: []).month ?? 0
	}
	
	public func yearsFromDate(fromDate: NSDate, toDate: NSDate) -> Int
	{
		return components(.year, from: fromDate as Date, to: toDate as Date, options: []).year ?? 0
	}
	
	public func date(firstDate: NSDate, isBeforeDate anotherDate: NSDate) -> Bool
	{
		return secondsFromDate(fromDate: firstDate, toDate: anotherDate) < 0
	}
	
	public func date(firstDate: NSDate, isAfterDate anotherDate: NSDate) -> Bool
	{
		return secondsFromDate(fromDate: firstDate, toDate: anotherDate) > 0
	}
}
