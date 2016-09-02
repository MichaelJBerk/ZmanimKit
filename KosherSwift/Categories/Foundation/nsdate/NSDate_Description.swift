//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

extension NSDate
{
    public func about() -> String
	{
	    let formatter: NSDateFormatter = NSDateFormatter()
	    formatter.timeStyle = .NoStyle
	    formatter.dateStyle = .LongStyle
	    return formatter.stringFromDate(self)
	}
	
	public func dayNameOnCalendar(calendar: NSCalendar) -> String
	{
	    let f: NSDateFormatter = NSDateFormatter()
	    f.calendar = calendar
	    f.dateFormat = "ccc"
	    return f.stringFromDate(self)
	}
	
	public func monthNameOnCalendar(calendar: NSCalendar) -> String
	{
	    let f: NSDateFormatter = NSDateFormatter()
	    f.calendar = calendar
	    f.dateFormat = "MMMM"
	    return f.stringFromDate(self)
	}
	
	public func monthAndYearOnCalendar(calendar: NSCalendar) -> String
	{
	    let f: NSDateFormatter = NSDateFormatter()
	    f.calendar = calendar
	    f.dateFormat = "MMMM yyyy"
	    return f.stringFromDate(self)
	}
	
	public func monthAbbreviationAndYearOnCalendar(calendar: NSCalendar) -> String
	{
	    let f: NSDateFormatter = NSDateFormatter()
	    f.calendar = calendar
	    f.dateFormat = "MMM yyyy"
	    return f.stringFromDate(self)
	}
	
	public func monthAbbreviationOnCalendar(calendar: NSCalendar) -> String
	{
	    let f: NSDateFormatter = NSDateFormatter()
	    f.calendar = calendar
	    f.dateFormat = "MMM"
	    return f.stringFromDate(self)
	}
	
	public func monthAndDayOnCalendar(calendar: NSCalendar) -> String
	{
	    let f: NSDateFormatter = NSDateFormatter()
	    f.calendar = calendar
	    f.dateFormat = "MMM d"
	    return f.stringFromDate(self)
	}
	
	public func dayOfMonthOnCalendar(calendar: NSCalendar) -> String
	{
	    let f: NSDateFormatter = NSDateFormatter()
	    f.calendar = calendar
	    f.dateFormat = "d"
	    return f.stringFromDate(self)
	}
	
	public func monthAndDayAndYearOnCalendar(calendar: NSCalendar) -> String
	{
	    let f: NSDateFormatter = NSDateFormatter()
	    f.calendar = calendar
	    f.dateFormat = "MMM d yyyy"
	    return f.stringFromDate(self)
	}
	
	public func dayOfMonthAndYearOnCalendar(calendar: NSCalendar) -> String
	{
	    let f: NSDateFormatter = NSDateFormatter()
	    f.calendar = calendar
	    f.dateFormat = "d yyyy"
	    return f.stringFromDate(self)
	}
}