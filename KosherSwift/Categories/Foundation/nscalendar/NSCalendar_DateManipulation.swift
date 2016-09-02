//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

extension NSCalendar
{
	func dateByAddingSeconds(seconds: Int, toDate date: NSDate) -> NSDate
	{
	    let c = NSDateComponents()
	    c.second = seconds
	    return dateByAddingComponents(c, toDate: date, options: [])!
	}
	
    func dateByAddingMinutes(minutes: Int, seconds: Int = 0, toDate date: NSDate) -> NSDate
	{
	    let c = NSDateComponents()
	    c.minute = minutes
        c.second = seconds
	    return dateByAddingComponents(c, toDate: date, options: [])!
	}
	
	func dateByAddingHours(hours: Int, toDate date: NSDate) -> NSDate
	{
	    let c = NSDateComponents()
	    c.hour = hours
	    return dateByAddingComponents(c, toDate: date, options: [])!
	}
	
	func dateByAddingDays(days: Int, toDate date: NSDate) -> NSDate
	{
	    let c = NSDateComponents()
	    c.day = days
	    return dateByAddingComponents(c, toDate: date, options: [])!
	}
	
	func dateByAddingWeeks(weeks: Int, toDate date: NSDate) -> NSDate
	{
	    let c = NSDateComponents()
	    c.weekOfYear = weeks
	    return dateByAddingComponents(c, toDate: date, options: [])!
	}
	
	func dateByAddingMonths(months: Int, toDate date: NSDate) -> NSDate
	{
	    let c = NSDateComponents()
	    c.month = months
	    return dateByAddingComponents(c, toDate: date, options: [])!
	}
	
	func dateByAddingYears(years: Int, toDate date: NSDate) -> NSDate
	{
	    let c = NSDateComponents()
	    c.year = years
        return dateByAddingComponents(c, toDate: date, options: [])!
	}
	
	func dateBySubtractingSeconds(seconds: Int, fromDate date: NSDate) -> NSDate
	{
	 
	    let c = NSDateComponents()
	    c.second = -seconds
	    return dateByAddingComponents(c, toDate: date, options: [])!
	}
	
    func dateBySubtractingMinutes(minutes: Int, seconds: Int = 0, fromDate date: NSDate) -> NSDate
	{
	    let c = NSDateComponents()
	    c.minute = -minutes
        c.second = seconds
	    return dateByAddingComponents(c, toDate: date, options: [])!
	}
	
	func dateBySubtractingHours(hours: Int, fromDate date: NSDate) -> NSDate
	{
	    let c = NSDateComponents()
	    c.hour = -hours
	    return dateByAddingComponents(c, toDate: date, options: [])!
	}
	
	func dateBySubtractingDays(days: Int, fromDate date: NSDate) -> NSDate
	{
	    let c = NSDateComponents()
	    c.day = -days
	    return dateByAddingComponents(c, toDate: date, options: [])!
	}
	
	func dateBySubtractingWeeks(weeks: Int, fromDate date: NSDate) -> NSDate
	{
	    let c = NSDateComponents()
	    c.weekOfYear = -weeks
	    return dateByAddingComponents(c, toDate: date, options: [])!
	}
	
	func dateBySubtractingMonths(months: Int, fromDate date: NSDate) -> NSDate
	{
	    let c = NSDateComponents()
	    c.month = -months
	    return dateByAddingComponents(c, toDate: date, options: [])!
	}
	
	func dateBySubtractingYears(years: Int, fromDate date: NSDate) -> NSDate
	{
	    let c = NSDateComponents()
	    c.year = -years
	    return dateByAddingComponents(c, toDate: date, options: [])!
	}
}