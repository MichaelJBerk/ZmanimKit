//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

extension NSCalendar
{
	func date(firstDate: NSDate, isSameDayAs anotherDate: NSDate) -> Bool
	{
	    let firstDay = daysInDate(firstDate)
	    let secondDay = daysInDate(anotherDate)
	    
	    let sameMonth = date(firstDate, isSameMonthAs: anotherDate)
	    let sameDay = firstDay == secondDay
	
	    return sameMonth && sameDay
	}
	
	func date(firstDate: NSDate, isSameWeekAs anotherDate: NSDate) -> Bool
	{
	    let firstMonth = weekOfYearInDate(firstDate)
	    let secondMonth = weekOfYearInDate(anotherDate)
	    
	    let sameMonth = firstMonth == secondMonth
	    let sameYear = date(firstDate, isSameYearAs: anotherDate)
	    
	    return sameYear && sameMonth
	}
	
	func date(firstDate: NSDate, isSameMonthAs anotherDate: NSDate) -> Bool
	{
	    let firstMonth = monthsInDate(firstDate)
	    let secondMonth = monthsInDate(anotherDate)
	    
	    let sameMonth = firstMonth == secondMonth
	    let sameYear = date(firstDate, isSameYearAs: anotherDate)
	
	    return sameYear && sameMonth
	}
	
	func date(firstDate: NSDate, isSameYearAs anotherDate: NSDate) -> Bool
	{
	    let firstYear = yearsInDate(firstDate)
	    let secondYear = yearsInDate(anotherDate)
	    
	    let sameYear = firstYear == secondYear
	    let sameEra = date(firstDate, isSameEraAs: anotherDate)
	
	    return sameEra && sameYear
	}
	
	func date(firstDate: NSDate, isSameEraAs anotherDate: NSDate) -> Bool
	{
	    let firstEra = eraInDate(firstDate)
	    let secondEra = eraInDate(anotherDate)
	    
	    return firstEra == secondEra
	}
}