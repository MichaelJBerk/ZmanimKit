//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

extension NSDate
{
    public func about() -> String
	{
		let formatter: DateFormatter = DateFormatter()
		formatter.timeStyle = .none
	    formatter.dateStyle = .long
		return formatter.string(from: self as Date)
	}
	
	public func dayNameOnCalendar(calendar: NSCalendar) -> String
	{
		let f: DateFormatter = DateFormatter()
		f.calendar = calendar as Calendar
	    f.dateFormat = "ccc"
		return f.string(from: self as Date)
	}
	
	public func monthNameOnCalendar(calendar: NSCalendar) -> String
	{
		let f: DateFormatter = DateFormatter()
		f.calendar = calendar as Calendar
	    f.dateFormat = "MMMM"
		return f.string(from: self as Date)
	}
	
	public func monthAndYearOnCalendar(calendar: NSCalendar) -> String
	{
		let f: DateFormatter = DateFormatter()
		f.calendar = calendar as Calendar
	    f.dateFormat = "MMMM yyyy"
		return f.string(from: self as Date)
	}
	
	public func monthAbbreviationAndYearOnCalendar(calendar: NSCalendar) -> String
	{
		let f: DateFormatter = DateFormatter()
		f.calendar = calendar as Calendar
	    f.dateFormat = "MMM yyyy"
		return f.string(from: self as Date)
	}
	
	public func monthAbbreviationOnCalendar(calendar: NSCalendar) -> String
	{
		let f: DateFormatter = DateFormatter()
		f.calendar = calendar as Calendar
	    f.dateFormat = "MMM"
		return f.string(from: self as Date)
	}
	
	public func monthAndDayOnCalendar(calendar: NSCalendar) -> String
	{
		let f: DateFormatter = DateFormatter()
		f.calendar = calendar as Calendar
	    f.dateFormat = "MMM d"
		return f.string(from: self as Date)
	}
	
	public func dayOfMonthOnCalendar(calendar: NSCalendar) -> String
	{
		let f: DateFormatter = DateFormatter()
		f.calendar = calendar as Calendar
	    f.dateFormat = "d"
		return f.string(from: self as Date)
	}
	
	public func monthAndDayAndYearOnCalendar(calendar: NSCalendar) -> String
	{
		let f: DateFormatter = DateFormatter()
		f.calendar = calendar as Calendar
	    f.dateFormat = "MMM d yyyy"
		return f.string(from: self as Date)
	}
	
	public func dayOfMonthAndYearOnCalendar(calendar: NSCalendar) -> String
	{
		let f: DateFormatter = DateFormatter()
		f.calendar = calendar as Calendar
	    f.dateFormat = "d yyyy"
		return f.string(from: self as Date)
	}
}
