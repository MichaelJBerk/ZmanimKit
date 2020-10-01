//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

extension Date
{
	static public func dateWithHebrewMonth(month: Int, andDay day: Int) -> Date
	{
		let hebrewCalendar: Calendar = Calendar(identifier: .hebrew)
		let year: Int = hebrewCalendar.yearsInDate(date: Date())
		return dateWithHebrewMonth(month: month, andDay: day, andYear: Int(year))
	}
	
	static public func dateWithHebrewMonth(month: Int, andDay day: Int, andYear year: Int) -> Date
	{
	    var comps: DateComponents = DateComponents()
		let hebrewCalendar: Calendar = Calendar(identifier:.hebrew)
		comps.calendar = hebrewCalendar
	    comps.month = month
	    comps.day = day
	    comps.year = year
		let retVal: Date = hebrewCalendar.date(from: comps as DateComponents)!
	    return retVal
	}
}
