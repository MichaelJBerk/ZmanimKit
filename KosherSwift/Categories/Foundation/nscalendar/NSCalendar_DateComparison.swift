//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

extension Calendar
{
	public func date(firstDate: Date, isSameDayAs anotherDate: Date) -> Bool
	{
		let firstDay = daysInDate(date: firstDate)
		let secondDay = daysInDate(date: anotherDate)
	    
		let sameMonth = date(firstDate: firstDate, isSameMonthAs: anotherDate)
	    let sameDay = firstDay == secondDay
	
	    return sameMonth && sameDay
	}
	
	public func date(firstDate: Date, isSameWeekAs anotherDate: Date) -> Bool
	{
		let firstMonth = weekOfYearInDate(date: firstDate)
		let secondMonth = weekOfYearInDate(date: anotherDate)
	    
	    let sameMonth = firstMonth == secondMonth
		let sameYear = date(firstDate: firstDate, isSameYearAs: anotherDate)
	    
	    return sameYear && sameMonth
	}
	
	public func date(firstDate: Date, isSameMonthAs anotherDate: Date) -> Bool
	{
		let firstMonth = monthsInDate(date: firstDate)
		let secondMonth = monthsInDate(date: anotherDate)
	    
	    let sameMonth = firstMonth == secondMonth
		let sameYear = date(firstDate: firstDate, isSameYearAs: anotherDate)
	
	    return sameYear && sameMonth
	}
	
	public func date(firstDate: Date, isSameYearAs anotherDate: Date) -> Bool
	{
		let firstYear = yearsInDate(date: firstDate)
		let secondYear = yearsInDate(date: anotherDate)
	    
	    let sameYear = firstYear == secondYear
		let sameEra = date(firstDate: firstDate, isSameEraAs: anotherDate)
	
	    return sameEra && sameYear
	}
	
	public func date(firstDate: Date, isSameEraAs anotherDate: Date) -> Bool
	{
		let firstEra = eraInDate(date: firstDate)
		let secondEra = eraInDate(date: anotherDate)
	    
	    return firstEra == secondEra
	}
}
