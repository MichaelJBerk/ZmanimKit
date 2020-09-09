//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

public class DafYomiCalculator
{
    let kNumberOfMasechtos = 40
    
    /**
     *  The reference date used by the calculator.
     */
	public var workingDate : NSDate?
	
	public init(date: NSDate)
	{
	    workingDate = date
	}
	
    /**
     *  This method returns a KCDaf object representing
     *  the page of talmud bavli being studied today.
     *
     *  - returns: a KCDaf object.
     */
	public func dafYomiBavli() -> Daf
	{
		return dafYomiBavliForDate(date: NSDate())!
	}
	
    /**
     *  This method returns a KCDaf object representing
     *  the page of talmud bavli being studied on the
     *  supplied date.
     *
     *  - parameter date: A reference date to calculate with.
     *
     *  - returns: a KCDaf object.
     */
	public func dafYomiBavliForDate(date: NSDate) -> Daf?
	{
	    
	    //Start on September 11, 1923
		let dafYomiStartDate: NSDate = gregorianDateForYear(year: 1923, month: 9, andDay: 11)
		let dafYomiJulianStartDay: Int = julianDayForDate(date: dafYomiStartDate)
		let shekalimChangeDate: NSDate = gregorianDateForYear(year: 1975, month: 6, andDay: 24)
		let shekalimJulianChangeDay: Int = julianDayForDate(date: shekalimChangeDate)
	    
	    //An array of the lengths of the meschtos
        var blattPerMasechta: [Int] = [64, 157, 105, 121, 22, 88, 56, 40, 35, 31, 32, 29, 27, 122, 112, 91, 66, 49, 90, 82, 119, 119, 176, 113, 24, 49, 76, 14, 120, 110, 142, 61, 34, 34, 28, 22, 4, 10, 4, 73]
	    
        var dafYomi = Daf(tractateIndex: 0, andPageNumber: 0)
	    
		let julianDay: Int = julianDayForDate(date: date)
        var cycleNo: Int = 0
        var dafNo: Int = 0
	    
		if date.timeIntervalSince(dafYomiStartDate as Date) < 0
	    {
	        // Return nil, since the date passed in was before the beginning of the daf yomi cycle
	        return nil
	    }
	    
		if date.timeIntervalSince(shekalimChangeDate as Date) >= 0 {
	        cycleNo = 8 + ((julianDay - shekalimJulianChangeDay) / 2711)
	        dafNo = ((julianDay - shekalimJulianChangeDay) % 2711)
	    }
	    else
	    {
	        cycleNo = 1 + ((julianDay - dafYomiJulianStartDay) / 2702)
	        dafNo = ((julianDay - dafYomiJulianStartDay) % 2702)
	    }
	    
        var total: Int = 0
        var masechta: Int = -1
        var blatt: Int = 0
	    
	    /* Fix Shekalim for old cycles. */
	    if cycleNo <= 7
	    {
	        blattPerMasechta[4] = 13
	    }
	    /* Finally find the daf. */
	    for j in 0..<kNumberOfMasechtos
	    {
	        masechta+=1
	        total = total + blattPerMasechta[j] - 1
	        if dafNo < total
	        {
	            blatt = 1 + blattPerMasechta[j] - (total - dafNo)
	            /* Fiddle with the weird ones near the end. */
	            if masechta == 36
	            {
	                blatt += 21
	            }
	            else if masechta == 37
	            {
	                blatt += 24
	            }
	            else if masechta == 38
	            {
	                blatt += 33
	            }
	            dafYomi = Daf(tractateIndex: masechta, andPageNumber: blatt)
	            break
	        }
	    }
	    
	    return dafYomi
	}
	
	public func julianDayForDate(date: NSDate) -> Int
	{
		let gregorianCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSCalendar.Identifier.gregorian)!
	    
		var year: Int = gregorianCalendar.components(NSCalendar.Unit.year, from:date as Date).year ?? 0
		var month: Int = gregorianCalendar.components(NSCalendar.Unit.month, from:date as Date).month ?? 0
		let day: Int = gregorianCalendar.components(NSCalendar.Unit.day, from:date as Date).day ?? 0
		
	    if month <= 2
	    {
	        year -= 1
	        month += 12
	    }
	    
        let a: Double = Double(year) / 100
	    let b: Double = 2 - a + a / 4
	    
        let math1 = floor(365.25 * Double(year + 4716))
        let math2 = math1 + floor(30.6001 * Double(month + 1))
        let math3 = math2 + Double(day)
	    return Int(math3 + b - 1524.5)
	}
	
	public func gregorianDateForYear(year: Int, month: Int, andDay day: Int) -> NSDate
	{
		let gregorianCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSCalendar.Identifier.gregorian)!
	    let dateComponents: NSDateComponents = NSDateComponents()
	    dateComponents.year = year
	    dateComponents.month = month
	    dateComponents.day = day
	    
		let returnDate: NSDate = gregorianCalendar.date(from: dateComponents as DateComponents)! as NSDate
	    
	    return returnDate
	}
}
