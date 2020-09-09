//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

extension NSDate
{
	class public func dateWithDay(day: Int, month: Int, year: Int) -> NSDate
	{
		return NSDate.dateWithDay(day: day, Month: month, Year: year, andCalendar: NSDate.defaultCalendar())
	}
	
	class public func dateWithDay(day: Int, Month month: Int, Year year: Int, andCalendar calendar: NSCalendar) -> NSDate
	{
	    let components: NSDateComponents = NSDateComponents()
	    components.day = day
	    components.month = month
	    components.year = year
	    
		return calendar.date(from: components as DateComponents)! as NSDate
	}
	
	class public func dateWithEra(era: Int, year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int, week: Int, weekday: Int, weekdayOrdinal: Int, andCalendar calendar: NSCalendar) -> NSDate
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
	    
		return calendar.date(from: components as DateComponents)! as NSDate
	}
	
	class public func defaultEraForCalendar(calendar: NSCalendar) -> Int
	{
		return NSDate.defaultComponentsForCalendar(calendar: calendar).era
	}
	
	class public func defaultYearForCalendar(calendar: NSCalendar) -> Int
	{
		return NSDate.defaultComponentsForCalendar(calendar: calendar).year
	}
	
	class public func defaultMonthForCalendar(calendar: NSCalendar) -> Int
	{
		return NSDate.defaultComponentsForCalendar(calendar: calendar).month
	}
	
	class public func defaultDayForCalendar(calendar: NSCalendar) -> Int
	{
		return NSDate.defaultComponentsForCalendar(calendar: calendar).day
	}
	
	class public func defaultHourForCalendar(calendar: NSCalendar) -> Int
	{
		return NSDate.defaultComponentsForCalendar(calendar: calendar).hour
	}
	
	class public func defaultMinuteForCalendar(calendar: NSCalendar) -> Int
	{
		return NSDate.defaultComponentsForCalendar(calendar: calendar).minute
	}
	
	class public func defaultSecondForCalendar(calendar: NSCalendar) -> Int
	{
		return NSDate.defaultComponentsForCalendar(calendar: calendar).second
	}
	
	class public func defaultWeekForCalendar(calendar: NSCalendar) -> Int
	{
		return NSDate.defaultComponentsForCalendar(calendar: calendar).weekOfYear
	}
	
	class public func defaultWeekdayForCalendar(calendar: NSCalendar) -> Int
	{
		return NSDate.defaultComponentsForCalendar(calendar: calendar).weekday
	}
	
	class public func defaultWeekdayOrdinalForCalendar(calendar: NSCalendar) -> Int
	{
		return NSDate.defaultComponentsForCalendar(calendar: calendar).weekdayOrdinal
	}
	
	class public func defaultEra() -> Int
	{
	    return NSDate.defaultComponents().era
	}
	
	class public func defaultYear() -> Int
	{
	    return NSDate.defaultComponents().year
	}
	
	class public func defaultMonth() -> Int
	{
	    return NSDate.defaultComponents().month
	}
	
	class public func defaultDay() -> Int
	{
	    return NSDate.defaultComponents().day
	}
	
	class public func defaultHour() -> Int
	{
	    return NSDate.defaultComponents().hour
	}
	
	class public func defaultMinute() -> Int
	{
	    return NSDate.defaultComponents().minute
	}
	
	class public func defaultSecond() -> Int
	{
	    return NSDate.defaultComponents().second
	}
	
	class public func defaultWeek() -> Int
	{
	    return NSDate.defaultComponents().weekOfYear
	}
	
	class public func defaultWeekday() -> Int
	{
	    return NSDate.defaultComponents().weekday
	}
	
	class public func defaultWeekdayOrdinal() -> Int
	{
	    return NSDate.defaultComponents().weekdayOrdinal
	}
	
	class public func defaultComponents() -> NSDateComponents
	{
		return defaultComponentsForCalendar(calendar: NSDate.defaultCalendar())
	}
	
	class public func defaultComponentsForCalendar(calendar: NSCalendar) -> NSDateComponents
	{    
		return calendar.components([.era, .year, .month, .day, .hour, .minute, .second, .weekday, .weekdayOrdinal, .quarter, .weekOfYear, .weekOfMonth, .yearForWeekOfYear, .calendar, .timeZone], from:NSDate() as Date) as NSDateComponents
	}
	
	class public func defaultCalendar() -> NSCalendar
	{
		return NSCalendar.current as NSCalendar
	}
}
