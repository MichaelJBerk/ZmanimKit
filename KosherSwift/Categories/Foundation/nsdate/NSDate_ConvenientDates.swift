//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

extension NSDate
{
	class public func dateWithHebrewMonth(month: Int, andDay day: Int) -> NSDate
	{
		let hebrewCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSCalendar.Identifier.hebrew)!
		let year: Int = hebrewCalendar.yearsInDate(date: NSDate())
		return dateWithHebrewMonth(month: month, andDay: day, andYear: Int(year))
	}
	
	class public func dateWithHebrewMonth(month: Int, andDay day: Int, andYear year: Int) -> NSDate
	{
	    let comps: NSDateComponents = NSDateComponents()
		let hebrewCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSCalendar.Identifier.hebrew)!
		comps.calendar = hebrewCalendar as Calendar
	    comps.month = month
	    comps.day = day
	    comps.year = year
		let retVal: NSDate = hebrewCalendar.date(from: comps as DateComponents)! as NSDate
	    return retVal
	}
}
