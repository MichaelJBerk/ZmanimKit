//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

extension Date
{
	static public func dateWithDay(day: Int, month: Int, year: Int) -> Date
	{
		return Date.dateWithDay(day: day, Month: month, Year: year, andCalendar: Date.defaultCalendar())
	}
	
	static public func dateWithDay(day: Int, Month month: Int, Year year: Int, andCalendar calendar: Calendar) -> Date
	{
	    var components: DateComponents = DateComponents()
	    components.day = day
	    components.month = month
	    components.year = year
	    
		return calendar.date(from: components as DateComponents)! as Date
	}
	
	static public func dateWithEra(era: Int, year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int, week: Int, weekday: Int, weekdayOrdinal: Int, andCalendar calendar: Calendar) -> Date
	{
	    var components: DateComponents = DateComponents()
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
	    
		return calendar.date(from: components as DateComponents)! as Date
	}
	
	static public func defaultEraForCalendar(calendar: Calendar) -> Int
	{
		return Date.defaultComponentsForCalendar(calendar: calendar).era ?? 0
	}
	
	static public func defaultYearForCalendar(calendar: Calendar) -> Int
	{
		return Date.defaultComponentsForCalendar(calendar: calendar).year ?? 0
	}
	
	static public func defaultMonthForCalendar(calendar: Calendar) -> Int
	{
		return Date.defaultComponentsForCalendar(calendar: calendar).month ?? 0
	}
	
	static public func defaultDayForCalendar(calendar: Calendar) -> Int
	{
		return Date.defaultComponentsForCalendar(calendar: calendar).day ?? 0
	}
	
	static public func defaultHourForCalendar(calendar: Calendar) -> Int
	{
		return Date.defaultComponentsForCalendar(calendar: calendar).hour ?? 0
	}
	
	static public func defaultMinuteForCalendar(calendar: Calendar) -> Int
	{
		return Date.defaultComponentsForCalendar(calendar: calendar).minute ?? 0
	}
	
	static public func defaultSecondForCalendar(calendar: Calendar) -> Int
	{
		return Date.defaultComponentsForCalendar(calendar: calendar).second ?? 0
	}
	
	static public func defaultWeekForCalendar(calendar: Calendar) -> Int
	{
		return Date.defaultComponentsForCalendar(calendar: calendar).weekOfYear ?? 0
	}
	
	static public func defaultWeekdayForCalendar(calendar: Calendar) -> Int
	{
		return Date.defaultComponentsForCalendar(calendar: calendar).weekday ?? 0
	}
	
	static public func defaultWeekdayOrdinalForCalendar(calendar: Calendar) -> Int
	{
		return Date.defaultComponentsForCalendar(calendar: calendar).weekdayOrdinal ?? 0
	}
	
	static public func defaultEra() -> Int
	{
	    return Date.defaultComponents().era ?? 0
	}
	
	static public func defaultYear() -> Int
	{
	    return Date.defaultComponents().year ?? 0
	}
	
	static public func defaultMonth() -> Int
	{
	    return Date.defaultComponents().month ?? 0
	}
	
	static public func defaultDay() -> Int
	{
	    return Date.defaultComponents().day ?? 0
	}
	
	static public func defaultHour() -> Int
	{
	    return Date.defaultComponents().hour ?? 0
	}
	
	static public func defaultMinute() -> Int
	{
	    return Date.defaultComponents().minute ?? 0
	}
	
	static public func defaultSecond() -> Int
	{
	    return Date.defaultComponents().second ?? 0
	}
	
	static public func defaultWeek() -> Int
	{
	    return Date.defaultComponents().weekOfYear ?? 0
	}
	
	static public func defaultWeekday() -> Int
	{
	    return Date.defaultComponents().weekday ?? 0
	}
	
	static public func defaultWeekdayOrdinal() -> Int
	{
	    return Date.defaultComponents().weekdayOrdinal ?? 0
	}
	
	static public func defaultComponents() -> DateComponents
	{
		return defaultComponentsForCalendar(calendar: Date.defaultCalendar())
	}
	
	static public func defaultComponentsForCalendar(calendar: Calendar) -> DateComponents
	{    
		return calendar.dateComponents([.era, .year, .month, .day, .hour, .minute, .second, .weekday, .weekdayOrdinal, .quarter, .weekOfYear, .weekOfMonth, .yearForWeekOfYear, .calendar, .timeZone], from:Date() as Date) as DateComponents
	}
	
	static public func defaultCalendar() -> Calendar
	{
		return Calendar.current as Calendar
	}
}
