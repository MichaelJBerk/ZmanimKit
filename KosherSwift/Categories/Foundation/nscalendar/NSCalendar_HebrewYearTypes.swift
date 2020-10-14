//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

extension Calendar
{
	static public func firstWeekdayOfHebrewYearContainingDate(date: Date) -> Weekday
	{
	    let hebCal = hebrewCalendar()
		let hebrewYear = hebCal.yearsInDate(date: date)
		let roshHashana = Date.dateWithDay(day: 1, Month: 1, Year: hebrewYear, andCalendar: hebCal)
		return Weekday(rawValue: hebCal.weekdayInDate(date: roshHashana))!
	}
	
	static public func lengthOfHebrewYearContainingDate(date: Date) -> kYearLength?
	{
	    let hebCal = hebrewCalendar()
	    
		let hebrewYear = hebCal.yearsInDate(date: date)
	    
		let previousRoshHashana = Date.dateWithDay(day: 1, Month: 1, Year: hebrewYear, andCalendar: hebCal)
		let nextRoshHashana = Date.dateWithDay(day: 1, Month: 1, Year: hebrewYear + 1, andCalendar: hebCal)
	    
	    //  We only care about the ones place in the length.
		var length = hebCal.daysFromDate(fromDate: previousRoshHashana, toDate: nextRoshHashana)
	    
	    length = length % 10
		
		switch length
		{
			case 3:
				return kYearLength.Short
			case 4:
				return kYearLength.Regular
			case 5:
				return kYearLength.Long
            default:
                break
		}
	    
	    return nil
	}
	
	static public func isHebrewYearContainingDateALeapYear(date: Date) -> Bool
	{
		let hebCal = hebrewCalendar()
		let hebrewYear = hebCal.yearsInDate(date: date)
	    
		let previousRoshHashana = Date.dateWithDay(day: 1, Month: 1, Year: hebrewYear, andCalendar: hebCal)
		let nextRoshHashana = Date.dateWithDay(day: 1, Month: 1, Year: hebrewYear + 1, andCalendar: hebCal)
	    
		let months = hebCal.monthsFromDate(fromDate: previousRoshHashana, toDate: nextRoshHashana)
	    
	    return months == 13
	}
	
    static public func typeOfHebrewYearContainingDate(date: Date) -> kHebrewYearType?
	{
		let weekday = firstWeekdayOfHebrewYearContainingDate(date: date)
	
		let length = lengthOfHebrewYearContainingDate(date: date)
	    
		let isLeapYear: Bool = isHebrewYearContainingDateALeapYear(date: date)
	    
	    if !isLeapYear
		{
	        if length == .Short
	        {
	            if weekday == Weekday.Monday
	            {
	                return kHebrewYearType.TypeA
	            }
	            
	            else if weekday == Weekday.Saturday
	            {
	                return kHebrewYearType.TypeB
	            }
	        }
	        
	        else if length == kYearLength.Regular
	        {
	            if weekday == Weekday.Tuesday
	            {
	                return kHebrewYearType.TypeC
	            }
	            
	            else if weekday == Weekday.Thursday {
	                return kHebrewYearType.TypeD
	            }
	        }
	        
	        else if length == kYearLength.Long
	        {
	            
	            if weekday == Weekday.Monday {
	                return kHebrewYearType.TypeE
	            }
	            
	            else if weekday == Weekday.Thursday {
	                return kHebrewYearType.TypeF
	            }
	            
	            else if weekday == Weekday.Saturday {
	                return kHebrewYearType.TypeG
	            }
	        }
	    }
	    
	    else if isLeapYear
	    {
	        if length == kYearLength.Short
	        {
                if weekday == Weekday.Monday
	            {
	                return kHebrewYearType.TypeH
	            }
	            
	            else if weekday == Weekday.Thursday {
	                return kHebrewYearType.TypeI
	            }
	            
	            else if weekday == Weekday.Saturday
	            {
	                return kHebrewYearType.TypeJ
	            }
	        }
	        
	        else if length == kYearLength.Regular
	        {
	            if weekday == Weekday.Tuesday
	            {
	                return kHebrewYearType.TypeK
	            }
	        }
	        else if length == kYearLength.Long
	        {
	            if weekday == Weekday.Monday
	            {
	                return kHebrewYearType.TypeL
	            }
	            
	            else if weekday == Weekday.Thursday
	            {
	                return kHebrewYearType.TypeM
	            }
	            else if weekday == Weekday.Saturday
	            {
	                return kHebrewYearType.TypeN
	            }
	        }
	    }
	    
	    return nil
	}
	
	static public func hebrewCalendar() -> Calendar
	{
		return Calendar(identifier: .hebrew)
	}
}
