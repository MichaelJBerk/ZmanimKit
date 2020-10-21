//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

extension Calendar
{
	public func weekOfMonthInDate(date: Date) -> Int
	{
		let comps: DateComponents = dateComponents([.weekOfMonth], from: date as Date) as DateComponents
	    return comps.weekOfMonth!
	}
	
	public func weekOfYearInDate(date: Date) -> Int
	{
		let comps: DateComponents = dateComponents([.weekOfYear], from: date as Date) as DateComponents
	    return comps.weekOfYear!
	}
	
	public func weekdayInDate(date: Date) -> Int
	{
		let comps: DateComponents = dateComponents([.weekday], from: date as Date) as DateComponents
	    return comps.weekday!
	}
	
	public func secondsInDate(date: Date) -> Int
	{
		let comps: DateComponents = dateComponents([.second], from: date as Date) as DateComponents
	    return comps.second!
	}
	
	public func minutesInDate(date: Date) -> Int
	{
		let comps: DateComponents = dateComponents([.minute], from: date as Date) as DateComponents
	    return comps.minute!
	}
	
	public func hoursInDate(date: Date) -> Int
	{
		let comps: DateComponents = dateComponents([.hour], from: date as Date) as DateComponents
	    return comps.hour!
	}
	
	public func daysInDate(date: Date) -> Int
	{
		let comps: DateComponents = dateComponents([.day], from: date as Date) as DateComponents
	    return comps.day!
	}
	
	public func monthsInDate(date: Date) -> Int
	{
		let comps: DateComponents = dateComponents([.month], from: date as Date) as DateComponents
	    return comps.month!
	}
	
	public func yearsInDate(date: Date) -> Int
	{
		let comps: DateComponents = dateComponents([.year], from: date as Date) as DateComponents
	    return comps.year!
	}
	
	public func eraInDate(date: Date) -> Int
	{
		let comps: DateComponents = dateComponents([.era], from: date as Date) as DateComponents
	    return comps.era!
	}
}
