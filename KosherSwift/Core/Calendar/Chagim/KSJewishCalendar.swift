//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

public class JewishCalendar: ComplexZmanimCalendar
{
    /**
     *  Determines if we consider "modern" holidays,
     *  such as Yom Ha'atzmaut when returning values.
     */
	public var returnsModernHolidays = false
    
    /**
     *  Determines if we account for diaspora in our calculations.
     */
	public var inIsrael = false
	
	override init (location aGeoLocation:GeoLocation)
	{
		super.init(location: aGeoLocation)
	}
	
    /** 
     * Returns the index of any holidays that fall on the date represented by `NSDate()`.
     * 
     * - returns: A yom tov if a yom tov falls on `NSDate()`, nil if not.
     */
	public func yomTovIndex() -> kYomimTovim?
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
	                return kYomimTovim.holHamoedPesach
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
	                return kYomimTovim.holHamoedSuccos
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
	                    return kYomimTovim.hanukah
	                }
	            }
	        case .kTeves:
	            if currentHebrewDayOfMonth() == 1 || currentHebrewDayOfMonth() == 2 || (currentHebrewDayOfMonth() == 3 && isKislevShort())
	            {
	                return kYomimTovim.hanukah
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
	
    /** 
     * This method determines if the given date is a Jewish Holiday.
     *
     * - returns: true if the given date is a yom tov, returns false if given date isn't a holiday, or is a fast day or chanukah.
     */
	public func isYomTov() -> Bool
	{
        if let holidayIndex = yomTovIndex()
        {
            if isErevYomTov() || holidayIndex == .hanukah || (isTaanis() && holidayIndex != .kYomKippur)
            {
                return false
            }
        }

	    return yomTovIndex() != nil
	}
	
    /**
     * This method determines if the given date is Chol Hamoed of Pesach or Succos.
     *
     * - returns: true if given date is Chol Hamoed of Pesach or Succos.
     */
	public func isCholHamoed() -> Bool
	{
	    let holidayIndex = yomTovIndex()
	    return (holidayIndex == .holHamoedPesach || holidayIndex == .holHamoedSuccos)
	}
	
    /**
     * This method determines if the given date is Chol Hamoed Succos.
     *
     * - returns: true if given date is Chol Hamoed Succos
     */
	public func isCholHamoedSuccos() -> Bool
	{
	    return (currentHebrewMonth() == .kTishrei) && ((currentHebrewDayOfMonth() >= 17 && currentHebrewDayOfMonth() <= 20) || (currentHebrewDayOfMonth() == 16 && inIsrael))
	}
	
    /**
     * This method determines if the given date is Chol Hamoed of Pesach.
     *
     *  - returns: true if the current day is Chol Hamoed of Pesach.
     */
	public func isCholHamoedPesach() -> Bool
	{
	    return currentHebrewMonth() == .kNissan && isCholHamoed()
	}
	
    /**
     *  This method determines if the current day is erev Yom Tov.
     *
     *  - returns: true if the current day is Erev - Pesach, Shavuos, Rosh Hashana, Yom Kippur or Succos.
     */
	public func isErevYomTov() -> Bool
	{
	    let holidayIndex = yomTovIndex()
	
	    return holidayIndex == .kErevPesach || holidayIndex == .kErevShavuos || holidayIndex == .kErevRoshHashana || holidayIndex == .kErevYomKippur || holidayIndex == .kErevSuccos
	}
	
    /**
     *  This method determines if the current day is Erev Rosh
     *  Chodesh.
     *
     *  - returns: true if the current day is Erev Rosh Chodesh. Returns NO for Erev Rosh Hashana
     */
	public func isErevRoshChodesh() -> Bool
	{
	    return (currentHebrewDayOfMonth() == 29 && currentHebrewMonth() != .kElul)
	}
	
    /**
     *  This method determines if the day is a Taanis (fast day).
     *
     *  - returns: true if the current day is 17 of Tammuz, Tisha B'Av, Yom Kippur,
     *  Fast of Gedalyah, 10 of Teves or the Fast of Esther.
     */
	public func isTaanis() -> Bool
	{
	    let holidayIndex = yomTovIndex()
	    
	    return holidayIndex == .kSeventeenthOfTammuz || holidayIndex == .kTishaBeav || holidayIndex == .kYomKippur || holidayIndex == .kFastOfGedalya || holidayIndex == .kTenthOfTeves || holidayIndex == .kFastOfEsther
	}
	
    /**
     *  This method determines the day of Chanukah.
     *
     *  - returns: NSInteger equal to the number of the day of Chanukah, or -1 if it is not Chanukah
     */
	public func dayOfChanukah() -> Int
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
	
    /**
     *  This method determines if the date is Chanukkah
     *
     *  - returns: true if it is Chanukah
     */
	public func isChanukah() -> Bool
	{
	    return yomTovIndex() == .hanukah
	}
	
    /**
     *  This method determines if Purim
     *
     *  - returns: true if the day is Purim
     */
	public func isPurim() -> Bool
	{
	    return yomTovIndex() == .kPurim
	}
	
    /**
     *  This method determines if the current day is Rosh
     *  Chodesh.
     *
     *  - returns: true if the current day is Rosh Chodesh. Returns false for Rosh Hashana
     */
	public func isRoshChodesh() -> Bool
	{
	    return (currentHebrewDayOfMonth() == 1 && currentHebrewMonth() != .kTishrei) || currentHebrewDayOfMonth() == 30
	}
	
    /**
     *  This method determines if the date is Pesach
     *
     *  - returns: true if it is Pesach
     */
	public func isPesach() -> Bool
	{
	    return yomTovIndex() == .kPesach
	}
	
    /**
     *  This method determines if the date is Shavuos
     *
     *  - returns: true if it is Shavuos
     */
	public func isShavuos() -> Bool
	{
	    return yomTovIndex() == .kShavuos
	}
	
    /**
     *  This method determines if the date is Succos
     *
     *  - returns: true if it is Succos
     */
	public func isSuccos() -> Bool
	{
	    return yomTovIndex() == .kSuccos
	}
	
    /**
     *  This method determines if the date is Simchat Torah
     *
     *  - returns: true if it is Simchat Torah
     */
	public func isSimchasTorah() -> Bool
	{
	    if currentHebrewMonth() == .kTishrei &&
        (currentHebrewDayOfMonth() == 22 && !inIsrael) || currentHebrewDayOfMonth() == 21
	    {
            return true
	    }
	    
	    return false
	}
	
    /**
     *  This method determines if the date is Shmini Atzeres
     *
     *  - returns: true if it is Shmini Atzeres
     */
	public func isShminiAtzeres() -> Bool
	{
	    return (currentHebrewMonth() == .kTishrei && currentHebrewDayOfMonth() == 22)
	}
	
	public func moladTohuAsDate() -> NSDate
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
	
	public func moladByAddingMonthsToTohu(numberOfMonths: Int) -> NSDate
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
	
	public func numberOfMonthsBetweenMoladTohuAndDate(date: NSDate) -> Int
	{
	    let tohu: NSDate = moladTohuAsDate()
	    let hebrewCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierHebrew)!
	    let comps: NSDateComponents = hebrewCalendar.components(NSCalendarUnit.Month, fromDate:tohu, toDate:date, options: [])
	    return comps.month
	}
	
	public func moladForDate(date: NSDate) -> NSDate
	{
	    let monthDifference: Int = numberOfMonthsBetweenMoladTohuAndDate(date)
	    return moladByAddingMonthsToTohu(Int(monthDifference))
	}
	
    /**
     *  The traditional calculation uses local time. This
     *  method subtracts 20.94 minutes (20 minutes and 56.496 seconds)
     *  from the local time (Har Habayis with a longitude
     *  of 35.2354&deg; is 5.2354&deg; away from the %15 timezone longitude)to get to standard time.
     *  This method intentionally uses standard time and not daylight savings time.
     *  (Java will implicitly format the time to the default (or set)Timezone) -> is this relevant to Objective C?
     *
     *  - parameter month: An Int representing the month. This method expects 1 for Nissan and 13 for Adar II. Use the constants to avoid any confusion.
     *  - parameter year: The Hebrew year to use in calculating.
     *
     *  - returns: The molad in Standard Time in Yerushalayim as a NSDate.
     */
	public func moladAsDateForMonth(month: Int, ofYear year: Int) -> NSDate
	{
	    let dateFromMonthAndYear: NSDate = NSDate.dateWithHebrewMonth(month, andDay: 1, andYear: year)
	    return moladForDate(dateFromMonthAndYear)
	}
	
    /**
     *  Currently returns the time even if it is during the day. It should return
     *  the 72 Minute Tzais after to the time if the zman is between Alos and Tzais.
     *
     *  - parameter date: The date to calculate for.
     *
     *  - returns: Earliest time of Kiddush Levana calculated as 3 days after the molad.
     */
	public func tchilasZmanKidushLevana3DaysForDate(date: NSDate) -> NSDate
	{
	    let molad: NSDate = moladForDate(date)
	    
	    let hebrewCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierHebrew)!
	    hebrewCalendar.dateByAddingDays(3, toDate: molad)
	    
	    return moladForDate(molad)
	}
	
    /**
     *  Currently returns the time even if it is during the day. It should return
     *  the 72 Minute Tzais after to the time if the zman is between Alos and Tzais.
     *
     *  - parameter month: The Hebrew month to use in calculating.
     *  - parameter year: The Hebrew year to use in calculating.
     *
     *  - returns: Earliest time of Kiddush Levana calculated as 3 days after the molad.
     */
	public func tchilasZmanKidushLevana3DaysForMonth(month: Int, ofYear year: Int) -> NSDate
	{
	    let dateFromMonthAndYear: NSDate = NSDate.dateWithHebrewMonth(month, andDay: 1, andYear: year)
	    return tchilasZmanKidushLevana3DaysForDate(dateFromMonthAndYear)
	}
	
    /**
     *  Currently returns the time even if it is during the day. It should return
     *  the 72 Minute Tzais after to the time if the zman is between Alos and Tzais.
     *
     *  - parameter date: The date to calculate for.
     *
     *  - returns: Earliest time of Kiddush Levana calculated as 7 days after the molad.
     */
	public func tchilasZmanKidushLevana7DaysForDate(date: NSDate) -> NSDate
	{
	    let molad: NSDate = moladForDate(date)
	    
	    let hebrewCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierHebrew)!
	    hebrewCalendar.dateByAddingDays(7, toDate: molad)
	    
	    return moladForDate(molad)
	}
	
    /**
     *  Currently returns the time even if it is during the day. It should return
     *  the 72 Minute Tzais after to the time if the zman is between Alos and Tzais.
     *
     *  - parameter month: The Hebrew month to use in calculating.
     *  - parameter year: The Hebrew year to use in calculating.
     *
     *  - returns: Earliest time of Kiddush Levana calculated as 7 days after the molad.
     */
	public func tchilasZmanKidushLevana7DaysForMonth(month: Int, ofYear year: Int) -> NSDate
	{
	    let dateFromMonthAndYear: NSDate = NSDate.dateWithHebrewMonth(month, andDay: 1, andYear: year)
	    return tchilasZmanKidushLevana7DaysForDate(dateFromMonthAndYear)
	}
	
    /**
     *  Calculates the latest time of Kiddush Levana according to the
     *  Maharil's opinion that it is calculated as halfway between molad and molad.
     *  This adds half the 29 days, 12 hours and 793 chalakim time between molad and
     *  molad (14 days, 18 hours, 22 minutes and 666 milliseconds)to the month's molad.
     *
     *  - discussion: Currently returns the time even if it is during the day. It should return the 72 Minute Alos prior to the time if the zman is between Alos and Tzais.
     *
     *  - parameter date: The date to calculate for.
     *
     *  - returns: Latest time of Kiddush Levana between Moldos
     */
	public func sofZmanKidushLevanaBetweenMoldosForDate(date: NSDate) -> NSDate
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
	
    /**
     *  Calculates the latest time of Kiddush Levana according to the
     *  Maharil's opinion that it is calculated as halfway between molad and molad.
     *  This adds half the 29 days, 12 hours and 793 chalakim time between molad and
     *  molad (14 days, 18 hours, 22 minutes and 666 milliseconds)to the month's molad.
     *
     *  - discussion: Currently returns the time even if it is during the day. It should return the 72 Minute Alos prior to the time if the zman is between Alos and Tzais.
     *
     *  - parameter month: The Hebrew month to use in calculating.
     *  - parameter year: The Hebrew year to use in calculating.
     *
     *  - returns: Latest time of Kiddush Levana between Moldos
     */
	public func sofZmanKidushLevanaBetweenMoldosForMonth(month: Int, ofYear year: Int) -> NSDate
	{
	    let dateFromMonthAndYear: NSDate = NSDate.dateWithHebrewMonth(month, andDay: 1, andYear: year)
	    return sofZmanKidushLevanaBetweenMoldosForDate(dateFromMonthAndYear)
	}
	
    /**
     *  This is the opinion brought down in the Shulchan Aruch (Orach Chaim 426).
     *  It should be noted that some opinions hold that the Rema who brings down the opinion
     *  of the Maharil's of calculating half way between molad and molad is of the opinion
     *  that the Mechaber agrees to his opinion. Also see the Aruch Hashulchan.
     *  For additional details on the subject, See Rabbi Dovid Heber's very detailed writeup
     *  in Siman Daled (chapter 4)of Shaarei Zmanim http://www.worldcat.org/oclc/461326125.
     *
     *  - discussion Currently returns the time even if it is during the day. It should return the  Alos prior to the time if the zman is between Alos and Tzais.
     *
     *  - parameter date: The date to calculate for.
     *
     *  - returns: Latest time of Kiddush Levana calculated as 15 days after the molad.
     */
	public func sofZmanKidushLevana15DaysForDate(date: NSDate) -> NSDate
	{
	    let molad: NSDate = moladForDate(date)
	    let hebrewCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierHebrew)!
	    return hebrewCalendar.dateByAddingDays(15, toDate: molad)
	}
	
    /**
     *  This is the opinion brought down in the Shulchan Aruch (Orach Chaim 426).
     *  It should be noted that some opinions hold that the Rema who brings down the opinion
     *  of the Maharil's of calculating half way between molad and molad is of the opinion
     *  that the Mechaber agrees to his opinion. Also see the Aruch Hashulchan.
     *  For additional details on the subject, See Rabbi Dovid Heber's very detailed writeup
     *  in Siman Daled (chapter 4)of Shaarei Zmanim http://www.worldcat.org/oclc/461326125.
     *
     *  Note: Currently returns the time even if it is during the day.
     *  It should return the  Alos prior to the time if the zman is between Alos and Tzais.
     *
     *  - parameter month: The Hebrew month to use in calculating.
     *  - parameter year: The Hebrew year to use in calculating.
     *
     *  - returns: Latest time of Kiddush Levana calculated as 15 days after the molad.
     */
	public func sofZmanKidushLevana15DaysForMonth(month: Int, ofYear year: Int) -> NSDate
	{
	    let dateFromMonthAndYear: NSDate = NSDate.dateWithHebrewMonth(month, andDay: 1, andYear: year)
	    return sofZmanKidushLevana15DaysForDate(dateFromMonthAndYear)
    }
	
    /**
     *  Returns the Daf Yomi (Bavli) for the date the calendar is set to
     *
     *  - returns: KCDaf object corresponding to the date
     */
	public func dafYomiBavli() -> Daf
	{
	    let calculator: DafYomiCalculator = DafYomiCalculator(date: workingDate!)
	    return calculator.dafYomiBavliForDate(workingDate!)!
	}
	
    /**
     *  Returns the current hebrew month
     *
     *  - returns: Int corresponding to the current Hebrew month
     */
	public func currentHebrewMonth() -> kHebrewMonth
	{
	    let hebrewCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierHebrew)!
	    
        return kHebrewMonth(rawValue: hebrewCalendar.components(NSCalendarUnit.Month, fromDate:workingDateAdjustedForSunset()).month)!
	}
	
    /**
     *  Returns the day of the current hebrew month
     *
     *  - returns: Int corresponding to the day of the current Hebrew month
     */
	public func currentHebrewDayOfMonth() -> Int
	{
	    let now: NSDate = workingDateAdjustedForSunset()
	    let hebrewCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierHebrew)!
	
	    return hebrewCalendar.components(NSCalendarUnit.Day, fromDate:now).day
	}
	
    /**
     *  Returns the current day of the civil week (i.e. days starting @ midnight)
     *
     *  - returns: Int corresponding to the current day of the civil week
     */
	public func currentDayOfTheWeek() -> Int
	{
	    let now: NSDate = workingDate!
	    let gregorianCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierGregorian)!
	
	    return gregorianCalendar.components(NSCalendarUnit.Weekday, fromDate:now).weekday
	}
	
    /**
     *  Determine if the current Hebrew year is a leap year
     *
     *  - returns: true if it is a leap year
     **/
	public func isCurrentlyHebrewLeapYear() -> Bool
	{
	    let now: NSDate = workingDateAdjustedForSunset()
	    let hebrewCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierHebrew)!
	    let year: Int = hebrewCalendar.components(NSCalendarUnit.Year, fromDate:now).year
	
	    return isHebrewLeapYear(year)
	}
	
    /**
     *  Determine if the parameter Hebrew year is a leap year
     *
     *  - parameter year: A hebrew year.
     *
     *  - returns: true if it is a leap year
     **/
	public func isHebrewLeapYear(year: Int) -> Bool
	{
		return ((7 * year + 1) % 19) < 7
	}
	
    /**
     *  Determine if the month of Kislev is short this year.
     *
     *  - returns: true if Kislef is short
     **/
	public func isKislevShort() -> Bool
	{
	    return lengthOfHebrewYear(currentHebrewYear()) % 10 == 3
	}
	
    /**
     *  Returns the current Hebrew Year
     *
     *  - returns: Int representing the current Hebrew year.
     **/
	public func currentHebrewYear() -> Int
	{
	    let now: NSDate = workingDateAdjustedForSunset()
	    let hebrewCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierHebrew)!
	
	    return hebrewCalendar.components(NSCalendarUnit.Year, fromDate:now).year
	}
	
    /**
     *  Returns the length of the parameter Hebrew year
     *
     *  - parameter year: A hebrew year.
     *
     *  - returns: Int corresponding to the number of days of the year
     **/
	public func lengthOfHebrewYear(year: Int) -> Int
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
	
	public func adjustedMonthToStartFromTishreiForMonth(month: Int, ofYear year: Int) -> Int
	{
	    let isLeapYear: Bool = isHebrewLeapYear(currentHebrewYear())
	
	    return (month + (isLeapYear ? 6 : 5)) % (isLeapYear ? 13 : 12) + 1
	}
	
	public func chalakimSinceMoladTohuForMonth(month: Int, andYear year: Int) -> Int
	{
	    let monthOfYear: Int = adjustedMonthToStartFromTishreiForMonth(month, ofYear: year)
	    let monthsElapsed: Int = (235 * ((year - 1) / 19)) + (12 * ((year - 1) % 19)) + ((7 * ((year - 1) % 19) + 1) / 19) + (monthOfYear - 1)
	    return halakimMoladTohu + (halakimPerMonth * monthsElapsed)
	}
	
    /**
     *  Returns the friday following a given date
     *
     *  - parameter workingDate The date to calculate for.
     *
     *  - returns: The friday folling the provided date.
     **/
	public func fridayFollowingDate(workingDate: NSDate) -> NSDate
	{
	    let gregorianCalendar: NSCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierGregorian)!
		
		let gregorianDateComponents: NSDateComponents = gregorianCalendar.components(NSCalendarUnit.Weekday, fromDate:workingDate)
	 	
		let weekday: Int = gregorianDateComponents.weekday
	    
	    return dateByAddingDays((6 - weekday), toDate: workingDate)
	}
	
	public func workingDateAdjustedForSunset() -> NSDate
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
