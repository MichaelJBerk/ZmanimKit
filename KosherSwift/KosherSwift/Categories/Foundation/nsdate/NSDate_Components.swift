//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

extension NSDate
{
	class func dateWithDay(day: Int, month: Int, year: Int) -> NSDate
	{
	    return NSDate.dateWithDay(day, Month: month, Year: year, andCalendar: NSDate.defaultCalendar())
	}
	
	class func dateWithDay(day: Int, Month month: Int, Year year: Int, andCalendar calendar: NSCalendar) -> NSDate
	{
	    let components: NSDateComponents = NSDateComponents()
	    components.day = day
	    components.month = month
	    components.year = year
	    
	    return calendar.dateFromComponents(components)!
	}
	
	class func dateWithEra(era: Int, year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int, week: Int, weekday: Int, weekdayOrdinal: Int, andCalendar calendar: NSCalendar) -> NSDate
	{
	    let components: NSDateComponents = NSDateComponents()
	    components.era = era
	    components.year = year
	    components.month = month
	    components.day = day
	    components.hour = hour
	    components.minute = minute
	    components.second = second
	    components.weekOfYear = week
	    components.weekday = weekday
	    components.weekdayOrdinal = weekdayOrdinal
	    
	    return calendar.dateFromComponents(components)!
	}
	
	class func defaultEraForCalendar(calendar: NSCalendar) -> Int
	{
	    return NSDate.defaultComponentsForCalendar(calendar).era
	}
	
	class func defaultYearForCalendar(calendar: NSCalendar) -> Int
	{
	    return NSDate.defaultComponentsForCalendar(calendar).year
	}
	
	class func defaultMonthForCalendar(calendar: NSCalendar) -> Int
	{
	    return NSDate.defaultComponentsForCalendar(calendar).month
	}
	
	class func defaultDayForCalendar(calendar: NSCalendar) -> Int
	{
	    return NSDate.defaultComponentsForCalendar(calendar).day
	}
	
	class func defaultHourForCalendar(calendar: NSCalendar) -> Int
	{
	    return NSDate.defaultComponentsForCalendar(calendar).hour
	}
	
	class func defaultMinuteForCalendar(calendar: NSCalendar) -> Int
	{
	    return NSDate.defaultComponentsForCalendar(calendar).minute
	}
	
	class func defaultSecondForCalendar(calendar: NSCalendar) -> Int
	{
	    return NSDate.defaultComponentsForCalendar(calendar).second
	}
	
	class func defaultWeekForCalendar(calendar: NSCalendar) -> Int
	{
	    return NSDate.defaultComponentsForCalendar(calendar).weekOfYear
	}
	
	class func defaultWeekdayForCalendar(calendar: NSCalendar) -> Int
	{
	    return NSDate.defaultComponentsForCalendar(calendar).weekday
	}
	
	class func defaultWeekdayOrdinalForCalendar(calendar: NSCalendar) -> Int
	{
	    return NSDate.defaultComponentsForCalendar(calendar).weekdayOrdinal
	}
	
	class func defaultEra() -> Int
	{
	    return NSDate.defaultComponents().era
	}
	
	class func defaultYear() -> Int
	{
	    return NSDate.defaultComponents().year
	}
	
	class func defaultMonth() -> Int
	{
	    return NSDate.defaultComponents().month
	}
	
	class func defaultDay() -> Int
	{
	    return NSDate.defaultComponents().day
	}
	
	class func defaultHour() -> Int
	{
	    return NSDate.defaultComponents().hour
	}
	
	class func defaultMinute() -> Int
	{
	    return NSDate.defaultComponents().minute
	}
	
	class func defaultSecond() -> Int
	{
	    return NSDate.defaultComponents().second
	}
	
	class func defaultWeek() -> Int
	{
	    return NSDate.defaultComponents().weekOfYear
	}
	
	class func defaultWeekday() -> Int
	{
	    return NSDate.defaultComponents().weekday
	}
	
	class func defaultWeekdayOrdinal() -> Int
	{
	    return NSDate.defaultComponents().weekdayOrdinal
	}
	
	class func defaultComponents() -> NSDateComponents
	{
	    return defaultComponentsForCalendar(NSDate.defaultCalendar())
	}
	
	class func defaultComponentsForCalendar(calendar: NSCalendar) -> NSDateComponents
	{    
	    return calendar.components([.Era, .Year, .Month, .Day, .Hour, .Minute, .Second, .Weekday, .WeekdayOrdinal, .Quarter, .WeekOfYear, .WeekOfMonth, .YearForWeekOfYear, .Calendar, .TimeZone], fromDate:NSDate())
	}
	
	class func defaultCalendar() -> NSCalendar
	{
	    return NSCalendar.currentCalendar()
	}
}