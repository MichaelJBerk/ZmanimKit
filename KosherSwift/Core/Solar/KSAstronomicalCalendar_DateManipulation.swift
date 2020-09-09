//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

extension AstronomicalCalendar
{
	public func dateByAddingSeconds(seconds: Int, toDate date: NSDate) -> NSDate
	{
		return internalCalendar!.dateByAddingSeconds(seconds: seconds, toDate: date)
	}
	
   public func dateByAddingMinutes(minutes: Int, seconds: Int = 0, toDate date: NSDate) -> NSDate
	{
	return internalCalendar!.dateByAddingMinutes(minutes: minutes, seconds: seconds, toDate: date)
	}
	
	public func dateByAddingHours(hours: Int, toDate date: NSDate) -> NSDate
	{
		return internalCalendar!.dateByAddingHours(hours: hours, toDate: date)
	}
	
	public func dateByAddingDays(days: Int, toDate date: NSDate) -> NSDate
	{
		return internalCalendar!.dateByAddingDays(days: days, toDate: date)
	}
	
	public func dateByAddingWeeks(weeks: Int, toDate date: NSDate) -> NSDate
	{
		return internalCalendar!.dateByAddingWeeks(weeks: weeks, toDate: date)
	}
	
	public func dateByAddingMonths(months: Int, toDate date: NSDate) -> NSDate
	{
		return internalCalendar!.dateByAddingMonths(months: months, toDate: date)
	}
	
	public func dateByAddingYears(years: Int, toDate date: NSDate) -> NSDate
	{
		return internalCalendar!.dateByAddingYears(years: years, toDate: date)
	}
	
   public func dateBySubtractingSeconds(seconds: Int, fromDate date: NSDate) -> NSDate
	{
	return internalCalendar!.dateBySubtractingSeconds(seconds: seconds, fromDate: date)
	}
	
   public func dateBySubtractingMinutes(minutes: Int, seconds: Int = 0, fromDate date: NSDate) -> NSDate
	{
	return internalCalendar!.dateBySubtractingMinutes(minutes: minutes, seconds: 0, fromDate: date)
	}
	
	public func dateBySubtractingHours(hours: Int, fromDate date: NSDate) -> NSDate
	{
		return internalCalendar!.dateBySubtractingHours(hours: hours, fromDate: date)
	}
	
	public func dateBySubtractingDays(days: Int, fromDate date: NSDate) -> NSDate
	{
		return internalCalendar!.dateBySubtractingDays(days: days, fromDate: date)
	}
	
	public func dateBySubtractingWeeks(weeks: Int, fromDate date: NSDate) -> NSDate
	{
		return internalCalendar!.dateBySubtractingWeeks(weeks: weeks, fromDate: date)
	}
	
	public func dateBySubtractingMonths(months: Int, fromDate date: NSDate) -> NSDate
	{
		return internalCalendar!.dateBySubtractingMonths(months: months, fromDate: date)
	}
	
	public func dateBySubtractingYears(years: Int, fromDate date: NSDate) -> NSDate
	{
		return internalCalendar!.dateBySubtractingYears(years: years, fromDate: date)
	}
}
