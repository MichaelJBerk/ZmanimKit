//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

class KSJewishCalendar: KSComplexZmanimCalendar
{
	var returnsModernHolidays : Bool = false
	var inIsrael : Bool = false
	
	override init (location aGeoLocation:KSGeoLocation)
	{
		super.init(location: aGeoLocation)
	}
	
	func yomTovIndex() -> kYomimTovim?
	{
	    let useModernHolidays: Bool = returnsModernHolidays
	    
        switch  currentHebrewMonth()
	    {
	        case .kNissan:
	            if currentHebrewDayOfMonth() == 14
	            {
	                return kYomimTovim.kErevPesach
	            }
	            else if currentHebrewDayOfMonth() == 15 || currentHebrewDayOfMonth() == 21 || (!inIsrael && (currentHebrewDayOfMonth() == 16 || currentHebrewDayOfMonth() == 22))
	            {
	                return kYomimTovim.kPesach
	            }
	            else if (currentHebrewDayOfMonth() >= 17 && currentHebrewDayOfMonth() <= 20) || (currentHebrewDayOfMonth() == 16 && inIsrael)
	            {
	                return kYomimTovim.KSholHamoedPesach
	            }
	            if useModernHolidays && ((currentHebrewDayOfMonth() == 26 && currentDayOfTheWeek() == 5) || (currentHebrewDayOfMonth() == 28 && currentDayOfTheWeek() == 1) || (currentHebrewDayOfMonth() == 27 && currentDayOfTheWeek() == 3) || (currentHebrewDayOfMonth() == 27 && currentDayOfTheWeek() == 5))
	            {
	                return kYomimTovim.kYomHashoah
	            }
	        case .kIyar:
	            if useModernHolidays && ((currentHebrewDayOfMonth() == 4 && currentDayOfTheWeek() == 3) || ((currentHebrewDayOfMonth() == 3 || currentHebrewDayOfMonth() == 2) && currentDayOfTheWeek() == 4) || (currentHebrewDayOfMonth() == 5 && currentDayOfTheWeek() == 2))
	            {
                    return kYomimTovim.kYomHazikaron
				}
	            // if 5 Iyar falls on Wed Yom Haatzmaut is that day. If it falls on Friday or Shabbos it is moved back to
	            // Thursday. If it falls on Monday it is moved to Tuesday
	            if useModernHolidays && ((currentHebrewDayOfMonth() == 5 && currentDayOfTheWeek() == 4) || ((currentHebrewDayOfMonth() == 4 || currentHebrewDayOfMonth() == 3) && currentDayOfTheWeek() == 5) || (currentHebrewDayOfMonth() == 6 && currentDayOfTheWeek() == 3))
	            {
                    return kYomimTovim.kYomHaatzmaut
				}
	            if currentHebrewDayOfMonth() == 14
	            {
	                return kYomimTovim.kPesachSheni
	            }
	            if useModernHolidays && currentHebrewDayOfMonth() == 28
	            {
	                return kYomimTovim.kYomHashoah
	            }
	        case .kSivan:
	            if currentHebrewDayOfMonth() == 5
	            {
	                return kYomimTovim.kErevShavuos
	            }
	            else if currentHebrewDayOfMonth() == 6 || (currentHebrewDayOfMonth() == 7 && !inIsrael)
	            {
	                return kYomimTovim.kShavuos
	            }
	        case .kTammuz:
	            // push off the fast day if it falls on Shabbos
	            if (currentHebrewDayOfMonth() == 17 && currentDayOfTheWeek() != 7) || (currentHebrewDayOfMonth() == 18 && currentDayOfTheWeek() == 1)
	            {
	                return kYomimTovim.kSeventeenthOfTammuz
	            }
	        case .kAv:
	            // if Tisha B'av falls on Shabbos, push off until Sunday
	            if (currentDayOfTheWeek() == 1 && currentHebrewDayOfMonth() == 10) || (currentDayOfTheWeek() != 7 && currentHebrewDayOfMonth() == 9)
	            {
	                return kYomimTovim.kTishaBeav
	            }
                else if currentHebrewDayOfMonth() == 15
                {
	                return kYomimTovim.kTuBeav
	            }
	        case .kElul:
	            if currentHebrewDayOfMonth() == 29
	            {
	                return kYomimTovim.kErevRoshHashana
	            }
	        case .kTishrei:
	            if currentHebrewDayOfMonth() == 1 || currentHebrewDayOfMonth() == 2
	            {
	                return kYomimTovim.kRoshHashana
	            }
	            else if (currentHebrewDayOfMonth() == 3 && currentDayOfTheWeek() != 7) || (currentHebrewDayOfMonth() == 4 && currentDayOfTheWeek() == 1)
	            {
	                // push off Tzom Gedalia if it falls on Shabbos
	                return kYomimTovim.kFastOfGedalya
	            }
	            else if currentHebrewDayOfMonth() == 9
	            {
	                return kYomimTovim.kErevYomKippur
	            }
	            else if currentHebrewDayOfMonth() == 10
	            {
	                return kYomimTovim.kYomKippur
	            }
	            else if currentHebrewDayOfMonth() == 14
	            {
	                return kYomimTovim.kErevSuccos
	            }
	            if currentHebrewDayOfMonth() == 15 || (currentHebrewDayOfMonth() == 16 && !inIsrael)
	            {
	                return kYomimTovim.kSuccos
	            }
	            if (currentHebrewDayOfMonth() >= 17 && currentHebrewDayOfMonth() <= 20) || (currentHebrewDayOfMonth() == 16 && inIsrael)
	            {
	                return kYomimTovim.KSholHamoedSuccos
	            }
	            if currentHebrewDayOfMonth() == 21
	            {
	                return kYomimTovim.kHoshanaRabba
	            }
	            if currentHebrewDayOfMonth() == 22
	            {
	                return kYomimTovim.kSheminiAtzeres
	            }
	            if currentHebrewDayOfMonth() == 23 && !inIsrael
	            {
	                return kYomimTovim.kSimchasTorah
	            }
	        case .kKislev:
	            if currentHebrewDayOfMonth() == 24
	            {
	                return kYomimTovim.kErevChanukah
	            }
	            else
	            {
	                if currentHebrewDayOfMonth() >= 25
	                {
	                    return kYomimTovim.KShanukah
	                }
	            }
	        case .kTeves:
	            if currentHebrewDayOfMonth() == 1 || currentHebrewDayOfMonth() == 2 || (currentHebrewDayOfMonth() == 3 && isKislevShort())
	            {
	                return kYomimTovim.KShanukah
	            }
	            else if currentHebrewDayOfMonth() == 10
	            {
	                return kYomimTovim.kTenthOfTeves
	            }
	        case .kShevat:
	            if currentHebrewDayOfMonth() == 15
	            {
	                return kYomimTovim.kTuBeshvat
	            }
	        case .kAdar:
	            if !isCurrentlyHebrewLeapYear()
	            {
	                // if 13th Adar falls on Friday or Shabbos, push back to Thursday
	                if ((currentHebrewDayOfMonth() == 11 || currentHebrewDayOfMonth() == 12) && currentDayOfTheWeek() == 5) || (currentHebrewDayOfMonth() == 13 && !(currentDayOfTheWeek() == 6 || currentDayOfTheWeek() == 7))
	                {
	                    return kYomimTovim.kFastOfEsther
	                }
	                if currentHebrewDayOfMonth() == 14
	                {
	                    return kYomimTovim.kPurim
	                }
	                else if currentHebrewDayOfMonth() == 15
	                {
	                    return kYomimTovim.kShushanPurim
	                }
	            }
	            // else if a leap year
	            else
	            {
	                if currentHebrewDayOfMonth() == 14
	                {
	                    return kYomimTovim.kPurimKatan
	                }
	            }
	        case .kAdar_II:
	            // if 13th Adar falls on Friday or Shabbos, push back to Thursday
	            if ((currentHebrewDayOfMonth() == 11 || currentHebrewDayOfMonth() == 12) && currentDayOfTheWeek() == 5) || (currentHebrewDayOfMonth() == 13 && !(currentDayOfTheWeek() == 6 || currentDayOfTheWeek() == 7))
	            {
	                return kYomimTovim.kFastOfEsther
	            }
	            if currentHebrewDayOfMonth() == 14
	            {
	                return kYomimTovim.kPurim
	            }
	            else if currentHebrewDayOfMonth() == 15
	            {
	                return kYomimTovim.kShushanPurim
	            }
            default:
                break
	    }
	    // if we get to this stage, then there are no holidays for the given date return -1
	    return nil
	}
	
	func isYomTov() -> Bool
	{
        if let holidayIndex = yomTovIndex()
        {
            if isErevYomTov() || holidayIndex == .KShanukah || (isTaanis() && holidayIndex != .kYomKippur)
            {
                return false
            }
        }

	    return yomTovIndex() != nil
	}
	
	func isCholHamoed() -> Bool
	{
	    let holidayIndex = yomTovIndex()
	    return (holidayIndex == .KSholHamoedPesach || holidayIndex == .KSholHamoedSuccos)
	}
	
	func isCholHamoedSuccos() -> Bool
	{
	    return (currentHebrewMonth() == .kTishrei) && ((currentHebrewDayOfMonth() >= 17 && currentHebrewDayOfMonth() <= 20) || (currentHebrewDayOfMonth() == 16 && inIsrael))
	}
	
	func isCholHamoedPesach() -> Bool
	{
	    return currentHebrewMonth() == .kNissan && isCholHamoed()
	}
	
	func isErevYomTov() -> Bool
	{
	    let holidayIndex = yomTovIndex()
	
	    return holidayIndex == .kErevPesach || holidayIndex == .kErevShavuos || holidayIndex == .kErevRoshHashana || holidayIndex == .kErevYomKippur || holidayIndex == .kErevSuccos
	}
	
	func isErevRoshChodesh() -> Bool
	{
	    return (currentHebrewDayOfMonth() == 29 && currentHebrewMonth() != .kElul)
	}
	
	func isTaanis() -> Bool
	{
	    let holidayIndex = yomTovIndex()
	    
	    return holidayIndex == .kSeventeenthOfTammuz || holidayIndex == .kTishaBeav || holidayIndex == .kYomKippur || holidayIndex == .kFastOfGedalya || holidayIndex == .kTenthOfTeves || holidayIndex == .kFastOfEsther
	}
	
	func dayOfChanukah() -> Int
	{
	    if isChanukah()
	    {
	        if currentHebrewMonth() == .kKislev
	        {
	            return currentHebrewDayOfMonth() - 24
	        }
	        else     // teves
	        {
	            return isKislevShort() ? currentHebrewDayOfMonth() + 5 : currentHebrewDayOfMonth() + 6
	        }
	    }
	    else
	    {
	        return -1
	    }
	}
	
	func isChanukah() -> Bool
	{
	    return yomTovIndex() == .KShanukah
	}
	
	func isPurim() -> Bool
	{
	    return yomTovIndex() == .kPurim
	}
	
	func isRoshChodesh() -> Bool
	{
	    return (currentHebrewDayOfMonth() == 1 && currentHebrewMonth() != .kTishrei) || currentHebrewDayOfMonth() == 30
	}
	
	func isPesach() -> Bool
	{
	    return yomTovIndex() == .kPesach
	}
	
	func isShavuos() -> Bool
	{
	    return yomTovIndex() == .kShavuos
	}
	
	func isSuccos() -> Bool
	{
	    return yomTovIndex() == .kSuccos
	}
	
	func isSimchasTorah() -> Bool
	{
	    if currentHebrewMonth() == .kTishrei &&
        (currentHebrewDayOfMonth() == 22 && !inIsrael) || currentHebrewDayOfMonth() == 21
	    {
            return true
	    }
	    
	    return false
	}
	
	func isShminiAtzeres() -> Bool
	{
	    return (currentHebrewMonth() == .kTishrei && currentHebrewDayOfMonth() == 22)
	}
	
	func moladTohuAsDate() -> NSDate
	{
	    let gregorianCalendar: NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
	    
	    let tohuComponents: NSDateComponents = NSDateComponents()
	    tohuComponents.calendar = gregorianCalendar
	    tohuComponents.year = -3760
	    tohuComponents.month = 9
	    tohuComponents.day = 6
	    tohuComponents.hour = 5
	    tohuComponents.minute = 0
	    tohuComponents.second = Int(204 * 3.5)
	    
	    let tohu: NSDate = gregorianCalendar.dateFromComponents(tohuComponents)!
	    
	    return tohu
	}
	
	func moladByAddingMonthsToTohu(numberOfMonths: Int) -> NSDate
	{
	    let tohu: NSDate = moladTohuAsDate()
	    
	    let gregorianCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierGregorian)!
        
	    let components: NSDateComponents = gregorianCalendar.components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Month, NSCalendarUnit.Day, NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second], fromDate:tohu)
	    
	    let day = components.day + (1 * numberOfMonths)
	    let hour = components.hour + (12 * numberOfMonths)
	    let seconds = components.second + Int(793 * 3.5) * numberOfMonths
	    
	    components.day = Int(day)
	    components.hour = hour
	    components.second = seconds
	    
	    let newMolad: NSDate = gregorianCalendar.dateFromComponents(components)!
	    
	    return newMolad
	}
	
	func numberOfMonthsBetweenMoladTohuAndDate(date: NSDate) -> Int
	{
	    let tohu: NSDate = moladTohuAsDate()
	    let hebrewCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierHebrew)!
	    let comps: NSDateComponents = hebrewCalendar.components(NSCalendarUnit.Month, fromDate:tohu, toDate:date, options: [])
	    return comps.month
	}
	
	func moladForDate(date: NSDate) -> NSDate
	{
	    let monthDifference: Int = numberOfMonthsBetweenMoladTohuAndDate(date)
	    return moladByAddingMonthsToTohu(Int(monthDifference))
	}
	
	func moladAsDateForMonth(month: Int, ofYear year: Int) -> NSDate
	{
	    let dateFromMonthAndYear: NSDate = NSDate.dateWithHebrewMonth(month, andDay: 1, andYear: year)
	    return moladForDate(dateFromMonthAndYear)
	}
	
	func tchilasZmanKidushLevana3DaysForDate(date: NSDate) -> NSDate
	{
	    let molad: NSDate = moladForDate(date)
	    
	    let hebrewCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierHebrew)!
	    hebrewCalendar.dateByAddingDays(3, toDate: molad)
	    
	    return moladForDate(molad)
	}
	
	func tchilasZmanKidushLevana3DaysForMonth(month: Int, ofYear year: Int) -> NSDate
	{
	    let dateFromMonthAndYear: NSDate = NSDate.dateWithHebrewMonth(month, andDay: 1, andYear: year)
	    return tchilasZmanKidushLevana3DaysForDate(dateFromMonthAndYear)
	}
	
	func tchilasZmanKidushLevana7DaysForDate(date: NSDate) -> NSDate
	{
	    let molad: NSDate = moladForDate(date)
	    
	    let hebrewCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierHebrew)!
	    hebrewCalendar.dateByAddingDays(7, toDate: molad)
	    
	    return moladForDate(molad)
	}
	
	func tchilasZmanKidushLevana7DaysForMonth(month: Int, ofYear year: Int) -> NSDate
	{
	    let dateFromMonthAndYear: NSDate = NSDate.dateWithHebrewMonth(month, andDay: 1, andYear: year)
	    return tchilasZmanKidushLevana7DaysForDate(dateFromMonthAndYear)
	}
	
	func sofZmanKidushLevanaBetweenMoldosForDate(date: NSDate) -> NSDate
	{
	    var molad: NSDate = moladForDate(date)
	    let hebrewCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierHebrew)!
	    let comps: NSDateComponents = NSDateComponents()
	    comps.month = 1
	    let nextMonth: NSDate = hebrewCalendar.dateByAddingMonths(1, toDate: date)
	    let nextMolad: NSDate = moladForDate(nextMonth)
        let secondsComps = hebrewCalendar.components(NSCalendarUnit.Second, fromDate:molad, toDate:nextMolad, options: [])
	    molad = molad.dateByAddingTimeInterval(NSTimeInterval(secondsComps.second))
	    return molad
	}
	
	func sofZmanKidushLevanaBetweenMoldosForMonth(month: Int, ofYear year: Int) -> NSDate
	{
	    let dateFromMonthAndYear: NSDate = NSDate.dateWithHebrewMonth(month, andDay: 1, andYear: year)
	    return sofZmanKidushLevanaBetweenMoldosForDate(dateFromMonthAndYear)
	}
	
	func sofZmanKidushLevana15DaysForDate(date: NSDate) -> NSDate
	{
	    //  Get the molad
	    
	    let molad: NSDate = moladForDate(date)
	    
	    let hebrewCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierHebrew)!
	    return hebrewCalendar.dateByAddingDays(15, toDate: molad)
	}
	
	func sofZmanKidushLevana15DaysForMonth(month: Int, ofYear year: Int) -> NSDate
	{
	    let dateFromMonthAndYear: NSDate = NSDate.dateWithHebrewMonth(month, andDay: 1, andYear: year)
	    return sofZmanKidushLevana15DaysForDate(dateFromMonthAndYear)
    }
	
	func dafYomiBavli() -> KSDaf
	{
	    let calculator: KSDafYomiCalculator = KSDafYomiCalculator(date: workingDate!)
	
	    return calculator.dafYomiBavliForDate(workingDate!)!
	}
	
	func currentHebrewMonth() -> kHebrewMonth
	{
	    let hebrewCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierHebrew)!
	    
        return kHebrewMonth(rawValue: hebrewCalendar.components(NSCalendarUnit.Month, fromDate:workingDateAdjustedForSunset()).month)!
	}
	
	func currentHebrewDayOfMonth() -> Int
	{
	    let now: NSDate = workingDateAdjustedForSunset()
	    let hebrewCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierHebrew)!
	
	    return hebrewCalendar.components(NSCalendarUnit.Day, fromDate:now).day
	}
	
	func currentDayOfTheWeek() -> Int
	{
	    let now: NSDate = workingDate!
	    let gregorianCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierGregorian)!
	
	    return gregorianCalendar.components(NSCalendarUnit.Weekday, fromDate:now).weekday
	}
	
	func isCurrentlyHebrewLeapYear() -> Bool
	{
	    let now: NSDate = workingDateAdjustedForSunset()
	    let hebrewCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierHebrew)!
	    let year: Int = hebrewCalendar.components(NSCalendarUnit.Year, fromDate:now).year
	
	    return isHebrewLeapYear(year)
	}
	
	func isHebrewLeapYear(year: Int) -> Bool
	{
		return ((7 * year + 1) % 19) < 7
	}
	
	func isKislevShort() -> Bool
	{
	    return lengthOfHebrewYear(currentHebrewYear()) % 10 == 3
	}
	
	func currentHebrewYear() -> Int
	{
	    let now: NSDate = workingDateAdjustedForSunset()
	    let hebrewCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierHebrew)!
	
	    return hebrewCalendar.components(NSCalendarUnit.Year, fromDate:now).year
	}
	
	func lengthOfHebrewYear(year: Int) -> Int
	{
		let hebrewCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierHebrew)!
	    let thisRoshHashana = NSDate.dateWithDay(1, Month: 1, Year: year, andCalendar: hebrewCalendar)
		let nextRoshHashana = NSDate.dateWithDay(1, Month: 1, Year: year + 1, andCalendar: hebrewCalendar)
		var totalDaysInTheYear = hebrewCalendar.daysFromDate(thisRoshHashana, toDate: nextRoshHashana)
	    if totalDaysInTheYear == 353 || totalDaysInTheYear == 383
	    {
			totalDaysInTheYear = 0
		}
	    else if totalDaysInTheYear == 354 || totalDaysInTheYear == 384
	    {
			totalDaysInTheYear = 1
		}
	    else if totalDaysInTheYear == 355 || totalDaysInTheYear == 385
	    {
			totalDaysInTheYear = 2
		}
	    
	    return totalDaysInTheYear
	}
	
	func adjustedMonthToStartFromTishreiForMonth(month: Int, ofYear year: Int) -> Int
	{
	    let isLeapYear: Bool = isHebrewLeapYear(currentHebrewYear())
	
	    return (month + (isLeapYear ? 6 : 5)) % (isLeapYear ? 13 : 12) + 1
	}
	
	func chalakimSinceMoladTohuForMonth(month: Int, andYear year: Int) -> Int
	{
	    let monthOfYear: Int = adjustedMonthToStartFromTishreiForMonth(month, ofYear: year)
	    let monthsElapsed: Int = (235 * ((year - 1) / 19)) + (12 * ((year - 1) % 19)) + ((7 * ((year - 1) % 19) + 1) / 19) + (monthOfYear - 1)
	    return KShalakimMoladTohu + (KShalakimPerMonth * monthsElapsed)
	}
	
	func fridayFollowingDate(workingDate: NSDate) -> NSDate
	{
	    let gregorianCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierGregorian)!
		
		let gregorianDateComponents: NSDateComponents = gregorianCalendar.components(NSCalendarUnit.Weekday, fromDate:workingDate)
	 	
		let weekday: Int = gregorianDateComponents.weekday
	    
	    return dateByAddingDays((6 - weekday), toDate: workingDate)
	}
	
	func workingDateAdjustedForSunset() -> NSDate
	{
	    var returnDate: NSDate = super.workingDate!
	    
	    let isAfterSunset: Bool = sunset()!.timeIntervalSinceNow < 0
	    
	    if isAfterSunset
	    {
	        let gregorianCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierGregorian)!
	        returnDate = gregorianCalendar.dateByAddingDays(1, toDate: returnDate)
	    }
	    
	    return returnDate
	}
}