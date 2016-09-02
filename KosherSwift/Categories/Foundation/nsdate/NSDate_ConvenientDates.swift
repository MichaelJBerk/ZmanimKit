//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

extension NSDate
{
	class func dateWithHebrewMonth(month: Int, andDay day: Int) -> NSDate
	{
	    let hebrewCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierHebrew)!
	    let year: Int = hebrewCalendar.yearsInDate(NSDate())
	    return dateWithHebrewMonth(month, andDay: day, andYear: Int(year))
	}
	
	class func dateWithHebrewMonth(month: Int, andDay day: Int, andYear year: Int) -> NSDate
	{
	    let comps: NSDateComponents = NSDateComponents()
	    let hebrewCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierHebrew)!
	    comps.calendar = hebrewCalendar
	    comps.month = month
	    comps.day = day
	    comps.year = year
	    let retVal: NSDate = hebrewCalendar.dateFromComponents(comps)!
	    return retVal
	}
}