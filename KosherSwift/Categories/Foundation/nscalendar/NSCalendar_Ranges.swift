//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

extension Calendar
{
	public func secondsPerMinute() -> Int
	{
		return secondsPerMinuteUsingReferenceDate(date: Date())
	}
	
	public func secondsPerMinuteUsingReferenceDate(date: Date) -> Int
	{
		let c = range(of: .second, in: .minute, for: date)
		return range(of: .second, in: .minute, for: date)?.count ?? 0
	}
	
	public func secondsPerHour() -> Int
	{
		return secondsPerHourUsingReferenceDate(date: Date())
	}
	
	public func secondsPerHourUsingReferenceDate(date: Date) -> Int
	{
		return range(of: .second, in: .hour, for: date as Date)?.count ?? 0
	}
	
	public func minutesPerHour() -> Int
	{
		return minutesPerHourUsingReferenceDate(date: Date())
	}
	
	public func minutesPerHourUsingReferenceDate(date: Date) -> Int
	{
		return range(of: .minute, in: .hour, for: date as Date)?.count ?? 0
	}
	
	public func secondsPerDay() -> Int
	{
		return secondsPerDayUsingReferenceDate(date: Date())
	}
	
	public func secondsPerDayUsingReferenceDate(date: Date) -> Int
	{
		return range(of: .second, in: .day, for: date as Date)?.count ?? 0
	}
	
	public func minutesPerDay() -> Int
	{
		return minutesPerDayUsingReferenceDate(date: Date())
	}
	
	public func minutesPerDayUsingReferenceDate(date: Date) -> Int
	{
		return range(of: .minute, in: .day, for: date as Date)?.count ?? 0
	}
	
	public func hoursPerDay() -> Int
	{
		return hoursPerDayUsingReferenceDate(date: Date())
	}
	
	public func hoursPerDayUsingReferenceDate(date: Date) -> Int
	{
		return range(of: .hour, in: .day, for: date as Date)?.count ?? 0
	}
	
	public func secondsPerWeek() -> Int
	{
		return secondsPerWeekUsingReferenceDate(date: Date())
	}
	
	public func secondsPerWeekUsingReferenceDate(date: Date) -> Int
	{
		return range(of: .second, in: .weekOfYear, for: date as Date)?.count ?? 0
	}
	
	public func minutesPerWeek() -> Int
	{
		return minutesPerWeekUsingReferenceDate(date: Date())
	}
	
	public func minutesPerWeekUsingReferenceDate(date: Date) -> Int
	{
		return range(of: .minute, in: .weekOfYear, for: date as Date)?.count ?? 0
	}
	
	public func hoursPerWeek() -> Int
	{
		return hoursPerWeekUsingReferenceDate(date: Date())
	}
	
	public func hoursPerWeekUsingReferenceDate(date: Date) -> Int
	{
		return range(of: .hour, in: .weekOfYear, for: date as Date)?.count ?? 0
	}
	
	public func daysPerWeek() -> Int
	{
		return daysPerWeekUsingReferenceDate(date: Date())
	}
	
	public func daysPerWeekUsingReferenceDate(date: Date) -> Int
	{
		let weekLater: Date = dateByAddingWeeks(weeks: 1, toDate: date)
		return dateComponents([.day], from: date as Date, to: weekLater as Date).day ?? 0
	}
	
	public func secondsPerMonth() -> Int
	{
		return secondsPerMonthUsingReferenceDate(date: Date())
	}
	
	public func secondsPerMonthUsingReferenceDate(date: Date) -> Int
	{
		return range(of: .second, in: .month, for: date as Date)?.count ?? 0
	}
	
	public func minutesPerMonth() -> Int
	{
		return minutesPerMonthUsingReferenceDate(date: Date())
	}
	
	public func minutesPerMonthUsingReferenceDate(date: Date) -> Int
	{
		return range(of: .minute, in: .month, for: date as Date)?.count ?? 0
	}
	
	public func hoursPerMonth() -> Int
	{
		return hoursPerMonthUsingReferenceDate(date: Date())
	}
	
	public func hoursPerMonthUsingReferenceDate(date: Date) -> Int
	{
		return range(of: .hour, in: .month, for: date as Date)?.count ?? 0
	}
	
	public func daysPerMonth() -> Int
	{
		return daysPerMonthUsingReferenceDate(date: Date())
	}
	
	public func daysPerMonthUsingReferenceDate(date: Date) -> Int
	{
		return range(of: .day, in: .month, for: date as Date)?.count ?? 0
	}
	
	public func weeksPerMonth() -> Int
	{
		return weeksPerMonthUsingReferenceDate(date: Date())
	}
	
	public func weeksPerMonthUsingReferenceDate(date: Date) -> Int
	{
		return range(of: .weekOfYear, in: .month, for: date as Date)?.count ?? 0
	}
	
	public func secondsPerYear() -> Int
	{
		return secondsPerYearUsingReferenceDate(date: Date())
	}
	
	public func secondsPerYearUsingReferenceDate(date: Date) -> Int
	{
		return range(of: .second, in: .year, for: date as Date)?.count ?? 0
	}
	
	public func minutesPerYear() -> Int
	{
		return minutesPerYearUsingReferenceDate(date: Date())
	}
	
	public func minutesPerYearUsingReferenceDate(date: Date) -> Int
	{
		return range(of: .minute, in: .year, for: date as Date)?.count ?? 0
	}
	
	public func hoursPerYear() -> Int
	{
		return hoursPerYearUsingReferenceDate(date: Date())
	}
	
	public func hoursPerYearUsingReferenceDate(date: Date) -> Int
	{
		return range(of: .hour, in: .year, for: date as Date)?.count ?? 0
	}
	
	public func daysPerYear() -> Int
	{
		return daysPerYearUsingReferenceDate(date: Date())
	}
	
	public func daysPerYearUsingReferenceDate(date: Date) -> Int
	{
		return range(of: .day, in: .year, for: date as Date)?.count ?? 0
	}
	
	public func weeksPerYear() -> Int
	{
		return weeksPerMonthUsingReferenceDate(date: Date())
	}
	
	public func weeksPerYearUsingReferenceDate(date: Date) -> Int
	{
		return range(of: .weekOfYear, in: .year, for: date as Date)?.count ?? 0
	}
	
	public func monthsPerYear() -> Int
	{
		return monthsPerYearUsingReferenceDate(date: Date())
	}
	
	public func monthsPerYearUsingReferenceDate(date: Date) -> Int
	{
		return range(of: .month, in: .year, for: date as Date)?.count ?? 0
	}
	
	public func secondsFromDate(fromDate: Date, toDate: Date) -> Int
	{
		return dateComponents([.second], from: fromDate as Date, to: toDate as Date).second ?? 0
	}
	
	public func minutesFromDate(fromDate: Date, toDate: Date) -> Int
	{
		return dateComponents([.minute], from: fromDate as Date, to: toDate as Date).minute ?? 0
	}
	
	public func hoursFromDate(fromDate: Date, toDate: Date) -> Int
	{
		return dateComponents([.hour], from: fromDate as Date, to: toDate as Date).hour ?? 0
	}
	
	public func daysFromDate(fromDate: Date, toDate: Date) -> Int
	{
		return dateComponents([.day], from: fromDate as Date, to: toDate as Date).day ?? 0
	}
	
	public func weeksFromDate(fromDate: Date, toDate: Date) -> Int
	{
		return weeksOfYearFromDate(fromDate: fromDate, toDate: toDate)
	}
	
	public func weeksOfYearFromDate(fromDate: Date, toDate: Date) -> Int
	{
		return dateComponents([.weekOfYear], from: fromDate as Date, to: toDate as Date).weekOfYear ?? 0
	}
	
	public func weeksOfMonthFromDate(fromDate: Date, toDate: Date) -> Int
	{
		return dateComponents([.weekOfMonth], from: fromDate as Date, to: toDate as Date).weekOfMonth ?? 0
	}
	
	public func monthsFromDate(fromDate: Date, toDate: Date) -> Int
	{
		return dateComponents([.month], from: fromDate as Date, to: toDate as Date).month ?? 0
	}
	
	public func yearsFromDate(fromDate: Date, toDate: Date) -> Int
	{
		return dateComponents([.year], from: fromDate as Date, to: toDate as Date).year ?? 0
	}
	
	public func date(firstDate: Date, isBeforeDate anotherDate: Date) -> Bool
	{
		return secondsFromDate(fromDate: firstDate, toDate: anotherDate) < 0
	}
	
	public func date(firstDate: Date, isAfterDate anotherDate: Date) -> Bool
	{
		return secondsFromDate(fromDate: firstDate, toDate: anotherDate) > 0
	}
}
