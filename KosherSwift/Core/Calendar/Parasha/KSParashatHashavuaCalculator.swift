//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

/**
 *  The KCParashatHashavuaCalculator class calculates which
 *  parasha is read on the shabbat following a supplied date.
 *  It can also return the listing for an entire year.
 *
 *  In Israel, due to differences in holiday observance, the schedule
 *  may vary from the diaspora in some years. KCParashatHashavuaCalculator
 *  accounts for these as well, and can return the appropriate value for
 *  both Israel and the diaspora.
 */
public class ParashatHashavuaCalculator
{
	public var hebrewCalendar : NSCalendar?
	public var gregorianCalendar : NSCalendar?

	public init()
	{
		gregorianCalendar = NSCalendar(calendarIdentifier:NSCalendar.Identifier.gregorian)
		hebrewCalendar = NSCalendar(calendarIdentifier:NSCalendar.Identifier.hebrew)
	}
	
    /**
     *  This method returns a KCParasha object representing the *parasha*
     *  in the diaspora for the week during which the supplied date falls.
     *
     *  - parameter date: An NSDate representing a day for which we want to calculate the parasha.
     *  - returns: A KCParasha object representing the relevant parasha or parshiot.
     */
	public func parashaInDiasporaForDate(date: NSDate) -> Parasha
	{
		return _parashaForDate(date: date, inDiaspora: true)
	}
	
    /**
     *  This method returns a KCParasha object representing the *parasha*
     *  in Israel for the week during which the supplied date falls.
     *
     *  - parameter date: An NSDate representing a day for which we want to calculate the parasha.
     *  - returns: A KCParasha object representing the relevant parasha or parshiot.
     */
	public func parashaInIsraelForDate(date: NSDate) -> Parasha
	{
		return _parashaForDate(date: date, inDiaspora: false)
	}
	
    /**
     *  Returns a listing of all parshiot in the diaspora
     *  for the specificed year type.
     *
     *  You can get the year type from the NSCalendar class method,
     *  typeOfHebrewYearContainingDate: as defined
     *  in NSDate+HebrewYearTypes category method.
     *
     *  - parameter typeOfYear: The type of hebrew year.
     *  - returns: An array of KCParasha objects.
     */
	public func parshiotInDiasporaDuringYearType(typeOfYear: kHebrewYearType) -> [Parashot]
	{
        var parshiot = [Parashot]()
	    
	    if typeOfYear == kHebrewYearType.TypeA //  Monday, 353, regular
	    {
	        parshiot = [.Vayeilech, .Haazinu, .Sukkot3, .Bereshit, .Noach, .LechLecha, .Vayeira, .ChayeiSarah, .Toldot, .Vayeitsei, .Vayishlach, .Vayeishev, .Miketz, .Vayigash, .Vayechi, .Shemot, .Vaera, .Bo, .Beshalach, .Yitro, .Mishpatim, .Terumah, .Tetzaveh, .KiTissa, .VayakhelAndPekudei, .Vayikra, .Tzav, .Pesach3, .Shemini, .TazriaAndMetzora, .AchareiMotAndKedoshim, .Emor, .BeharAndBechukotai, .Bamidbar, .Naso, .Behaalotecha, .Shelach, .Korach, .Chukat, .Balak, .Pinchas, .MatotAndMasei, .Devarim, .Vaetchanan, .Eikev, .Reeh, .Shoftim, .KiTeitzei, .KiTavo, .NitzavimAndVayeilech]
	    }
	    
	    else if typeOfYear == kHebrewYearType.TypeB //  Shabbat, 353, regular
	    {
	        
	        parshiot = [.RoshHashana1, .Haazinu, .Sukkot3, .SheminiAtzeret, .Bereshit, .Noach, .LechLecha, .Vayeira, .ChayeiSarah, .Toldot, .Vayeitsei, .Vayishlach, .Vayeishev, .Miketz, .Vayigash, .Vayechi, .Shemot, .Vaera, .Bo, .Beshalach, .Yitro, .Mishpatim, .Terumah, .Tetzaveh, .KiTissa, .VayakhelAndPekudei, .Vayikra, .Tzav, .Pesach7, .Shemini, .TazriaAndMetzora, .AchareiMotAndKedoshim, .Emor, .BeharAndBechukotai, .Bamidbar, .Naso, .Behaalotecha, .Shelach, .Korach, .Chukat, .Balak, .Pinchas, .MatotAndMasei, .Devarim, .Vaetchanan, .Eikev, .Reeh, .Shoftim, .KiTeitzei, .KiTavo, .Nitzavim]
	    }
	    
	    //  Tuesday, 354, regular || Monday, 355, regular
	    else if typeOfYear == kHebrewYearType.TypeC || typeOfYear == kHebrewYearType.TypeE
	    {
	        parshiot = [.Vayeilech, .Haazinu, .Sukkot3, .Bereshit, .Noach, .LechLecha, .Vayeira, .ChayeiSarah, .Toldot, .Vayeitsei, .Vayishlach, .Vayeishev, .Miketz, .Vayigash, .Vayechi, .Shemot, .Vaera, .Bo, .Beshalach, .Yitro, .Mishpatim, .Terumah, .Tetzaveh, .KiTissa, .VayakhelAndPekudei, .Vayikra, .Tzav, .Pesach3, .Shemini, .TazriaAndMetzora, .AchareiMotAndKedoshim, .Emor, .BeharAndBechukotai, .Bamidbar, .Shavuot2, .Naso, .Behaalotecha, .Shelach, .Korach, .ChukatAndBalak, .Pinchas, .MatotAndMasei, .Devarim, .Vaetchanan, .Eikev, .Reeh, .Shoftim, .KiTeitzei, .KiTavo, .NitzavimAndVayeilech]
	    }
	    
	    //  Thursday, 354, regular
	    else if typeOfYear == kHebrewYearType.TypeD
	    {
	        parshiot = [.Haazinu, .YomKippur, .Sukkot3, .Bereshit, .Noach, .LechLecha, .Vayeira, .ChayeiSarah, .Toldot, .Vayeitsei, .Vayishlach, .Vayeishev, .Miketz, .Vayigash, .Vayechi, .Shemot, .Vaera, .Bo, .Beshalach, .Yitro, .Mishpatim, .Terumah, .Tetzaveh, .KiTissa, .VayakhelAndPekudei, .Vayikra, .Tzav, .Pesach1, .Pesach8, .Shemini, .TazriaAndMetzora, .AchareiMotAndKedoshim, .Emor, .BeharAndBechukotai, .Bamidbar, .Naso, .Behaalotecha, .Shelach, .Korach, .Chukat, .Balak, .Pinchas, .MatotAndMasei, .Devarim, .Vaetchanan, .Eikev, .Reeh, .Shoftim, .KiTeitzei, .KiTavo, .Nitzavim]
	    }
	    
	    //  Thursday, 355, regular
	    else if typeOfYear == kHebrewYearType.TypeF
	    {
	        parshiot = [.Haazinu, .YomKippur, .Sukkot3, .Bereshit, .Noach, .LechLecha, .Vayeira, .ChayeiSarah, .Toldot, .Vayeitsei, .Vayishlach, .Vayeishev, .Miketz, .Vayigash, .Vayechi, .Shemot, .Vaera, .Bo, .Beshalach, .Yitro, .Mishpatim, .Terumah, .Tetzaveh, .KiTissa, .Vayakhel, .Pekudei, .Vayikra, .Tzav, .Pesach3, .Shemini, .TazriaAndMetzora, .AchareiMotAndKedoshim, .Emor, .BeharAndBechukotai, .Bamidbar, .Naso, .Behaalotecha, .Shelach, .Korach, .Chukat, .Balak, .Pinchas, .MatotAndMasei, .Devarim, .Vaetchanan, .Eikev, .Reeh, .Shoftim, .KiTeitzei, .KiTavo, .Nitzavim]
	    }
	    
	    //  Shabbat, 355, regular
	    else if typeOfYear == kHebrewYearType.TypeG
	    {     
	        parshiot = [.RoshHashana1, .Haazinu, .Sukkot1, .SheminiAtzeret, .Bereshit, .Noach, .LechLecha, .Vayeira, .ChayeiSarah, .Toldot, .Vayeitsei, .Vayishlach, .Vayeishev, .Miketz, .Vayigash, .Vayechi, .Shemot, .Vaera, .Bo, .Beshalach, .Yitro, .Mishpatim, .Terumah, .Tetzaveh, .KiTissa, .VayakhelAndPekudei, .Vayikra, .Tzav, .Pesach3, .Shemini, .TazriaAndMetzora, .AchareiMotAndKedoshim, .Emor, .BeharAndBechukotai, .Bamidbar, .Naso, .Behaalotecha, .Shelach, .Korach, .Chukat, .Balak, .Pinchas, .MatotAndMasei, .Devarim, .Vaetchanan, .Eikev, .Reeh, .Shoftim, .KiTeitzei, .KiTavo, .NitzavimAndVayeilech]
	    }
	
	    //  Monday, 383, leap
	    else if typeOfYear == kHebrewYearType.TypeH
	    {
	        parshiot = [.Vayeilech, .Haazinu, .Sukkot3, .Bereshit, .Noach, .LechLecha, .Vayeira, .ChayeiSarah, .Toldot, .Vayeitsei, .Vayishlach, .Vayeishev, .Miketz, .Vayigash, .Vayechi, .Shemot, .Vaera, .Bo, .Beshalach, .Yitro, .Mishpatim, .Terumah, .Tetzaveh, .KiTissa, .Vayakhel, .Pekudei, .Vayikra, .Tzav, .Shemini, .Tazria, .Metzora, .Pesach3, .AchareiMot, .Kedoshim, .Emor, .Behar, .Bechukotai, .Bamidbar, .Shavuot2, .Naso, .Behaalotecha, .Shelach, .Korach, .ChukatAndBalak, .Pinchas, .MatotAndMasei, .Devarim, .Vaetchanan, .Eikev, .Reeh, .Shoftim, .KiTeitzei, .KiTavo, .NitzavimAndVayeilech]
	    }
	    
	    //  Thursday, 383, leap
	    else if typeOfYear == kHebrewYearType.TypeI
	    {        
	        parshiot = [.Haazinu, .YomKippur, .Sukkot3, .Bereshit, .Noach, .LechLecha, .Vayeira, .ChayeiSarah, .Toldot, .Vayeitsei, .Vayishlach, .Vayeishev, .Miketz, .Vayigash, .Vayechi, .Shemot, .Vaera, .Bo, .Beshalach, .Yitro, .Mishpatim, .Terumah, .Tetzaveh, .KiTissa, .Vayakhel, .Pekudei, .Vayikra, .Tzav, .Shemini, .Tazria, .Metzora, .AchareiMot, .Pesach3, .Kedoshim, .Emor, .Behar, .Bechukotai, .Bamidbar, .Naso, .Behaalotecha, .Shelach, .Korach, .Chukat, .Balak, .Pinchas, .Matot, .Masei, .Devarim, .Vaetchanan, .Eikev, .Reeh, .Shoftim, .KiTeitzei, .KiTavo, .Nitzavim]
	    }
	    
	    //  Monday, 385, leap ||  Tuesday, 384, leap
	    else if (typeOfYear == kHebrewYearType.TypeL) || (typeOfYear == kHebrewYearType.TypeK)
	    {
	        parshiot = [.Vayeilech, .Haazinu, .Sukkot3, .Bereshit, .Noach, .LechLecha, .Vayeira, .ChayeiSarah, .Toldot, .Vayeitsei, .Vayishlach, .Vayeishev, .Miketz, .Vayigash, .Vayechi, .Shemot, .Vaera, .Bo, .Beshalach, .Yitro, .Mishpatim, .Terumah, .Tetzaveh, .KiTissa, .Vayakhel, .Pekudei, .Vayikra, .Tzav, .Shemini, .Tazria, .Metzora, .Pesach1, .Pesach8, .AchareiMot, .Kedoshim, .Emor, .Behar, .Bechukotai, .Bamidbar, .Naso, .Behaalotecha, .Shelach, .Korach, .Chukat, .Balak, .Pinchas, .MatotAndMasei, .Devarim, .Vaetchanan, .Eikev, .Reeh, .Shoftim, .KiTeitzei, .KiTavo, .Nitzavim]
	    }
	    
	    //  Shabbat, 383, leap
	    else if typeOfYear == kHebrewYearType.TypeJ
	    {
	        parshiot = [.RoshHashana1, .Haazinu, .Sukkot3, .SheminiAtzeret, .Bereshit, .Noach, .LechLecha, .Vayeira, .ChayeiSarah, .Toldot, .Vayeitsei, .Vayishlach, .Vayeishev, .Miketz, .Vayigash, .Vayechi, .Shemot, .Vaera, .Bo, .Beshalach, .Yitro, .Mishpatim, .Terumah, .Tetzaveh, .KiTissa, .Vayakhel, .Pekudei, .Vayikra, .Tzav, .Shemini, .Tazria, .Metzora, .Pesach3, .AchareiMot, .Kedoshim, .Emor, .Behar, .Bechukotai, .Bamidbar, .Naso, .Behaalotecha, .Shelach, .Korach, .Chukat, .Balak, .Pinchas, .MatotAndMasei, .Devarim, .Vaetchanan, .Eikev, .Reeh, .Shoftim, .KiTeitzei, .KiTavo, .NitzavimAndVayeilech]
	    }
	    
	    //  Thursday,   385, leap
	    else if typeOfYear == kHebrewYearType.TypeM
	    {
	        parshiot = [.Haazinu, .YomKippur, .Sukkot3, .Bereshit, .Noach, .LechLecha, .Vayeira, .ChayeiSarah, .Toldot, .Vayeitsei, .Vayishlach, .Vayeishev, .Miketz, .Vayigash, .Vayechi, .Shemot, .Vaera, .Bo, .Beshalach, .Yitro, .Mishpatim, .Terumah, .Tetzaveh, .KiTissa, .Vayakhel, .Pekudei, .Vayikra, .Tzav, .Shemini, .Tazria, .Metzora, .AchareiMot, .Pesach3, .Kedoshim, .Emor, .Behar, .Bechukotai, .Bamidbar, .Naso, .Behaalotecha, .Shelach, .Korach, .Chukat, .Balak, .Pinchas, .Matot, .Masei, .Devarim, .Vaetchanan, .Eikev, .Reeh, .Shoftim, .KiTeitzei, .KiTavo, .NitzavimAndVayeilech]
	        
	    }
	    
	    //  Shabbat, 385, leap
	    if typeOfYear == kHebrewYearType.TypeN
	    {   
	        parshiot = [.RoshHashana1, .Haazinu, .Sukkot3, .SheminiAtzeret, .Bereshit, .Noach, .LechLecha, .Vayeira, .ChayeiSarah, .Toldot, .Vayeitsei, .Vayishlach, .Vayeishev, .Miketz, .Vayigash, .Vayechi, .Shemot, .Vaera, .Bo, .Beshalach, .Yitro, .Mishpatim, .Terumah, .Tetzaveh, .KiTissa, .Vayakhel, .Pekudei, .Vayikra, .Tzav, .Shemini, .Tazria, .Metzora, .Pesach3, .AchareiMot, .Kedoshim, .Emor, .Behar, .Bechukotai, .Bamidbar, .Shavuot2, .Naso, .Behaalotecha, .Shelach, .Korach, .ChukatAndBalak, .Pinchas, .MatotAndMasei, .Devarim, .Vaetchanan, .Eikev, .Reeh, .Shoftim, .KiTeitzei, .KiTavo, .NitzavimAndVayeilech]
	    }
	    
	    return parshiot
	}
	
    /**
     *  Returns a listing of all parshiot in Israel
     *  for the specificed year type.
     *
     *  You can get the year type from the NSCalendar class method,
     *  typeOfHebrewYearContainingDate: as defined
     *  in NSDate+HebrewYearTypes category method.
     *
     *  - perameters typeOfYear: A kHebrewYearType value as defined in NSCalendar+hebrewYearTypes.h
     *  - returns: An array of KCParasha objects.
     */
	public func parshiotInIsraelDuringYearType(typeOfYear: kHebrewYearType) -> [Parashot]
	{
        var parshiot = [Parashot]()
	    
	    if typeOfYear == kHebrewYearType.TypeA //  Monday, 353, regular
	    {
	        parshiot = [.Vayeilech, .Haazinu, .Sukkot3, .Bereshit, .Noach, .LechLecha, .Vayeira, .ChayeiSarah, .Toldot, .Vayeitsei, .Vayishlach, .Vayeishev, .Miketz, .Vayigash, .Vayechi, .Shemot, .Vaera, .Bo, .Beshalach, .Yitro, .Mishpatim, .Terumah, .Tetzaveh, .KiTissa, .VayakhelAndPekudei, .Vayikra, .Tzav, .Pesach3, .Shemini, .TazriaAndMetzora, .AchareiMotAndKedoshim, .Emor, .BeharAndBechukotai, .Bamidbar, .Naso, .Behaalotecha, .Shelach, .Korach, .Chukat, .Balak, .Pinchas, .MatotAndMasei, .Devarim, .Vaetchanan, .Eikev, .Reeh, .Shoftim, .KiTeitzei, .KiTavo, .NitzavimAndVayeilech]
	    }
	    
	    else if typeOfYear == kHebrewYearType.TypeB //  Shabbat, 353, regular
	    {
	        
	        parshiot = [.RoshHashana1, .Haazinu, .Sukkot3, .SheminiAtzeret, .Bereshit, .Noach, .LechLecha, .Vayeira, .ChayeiSarah, .Toldot, .Vayeitsei, .Vayishlach, .Vayeishev, .Miketz, .Vayigash, .Vayechi, .Shemot, .Vaera, .Bo, .Beshalach, .Yitro, .Mishpatim, .Terumah, .Tetzaveh, .KiTissa, .VayakhelAndPekudei, .Vayikra, .Tzav, .Pesach7, .Shemini, .TazriaAndMetzora, .AchareiMotAndKedoshim, .Emor, .BeharAndBechukotai, .Bamidbar, .Naso, .Behaalotecha, .Shelach, .Korach, .Chukat, .Balak, .Pinchas, .MatotAndMasei, .Devarim, .Vaetchanan, .Eikev, .Reeh, .Shoftim, .KiTeitzei, .KiTavo, .Nitzavim]
	    }
	    
	    //  Tuesday, 354, regular || Monday, 355, regular
	    else if typeOfYear == kHebrewYearType.TypeC || typeOfYear == kHebrewYearType.TypeE
	    {
	        parshiot = [.Vayeilech, .Haazinu, .Sukkot3, .Bereshit, .Noach, .LechLecha, .Vayeira, .ChayeiSarah, .Toldot, .Vayeitsei, .Vayishlach, .Vayeishev, .Miketz, .Vayigash, .Vayechi, .Shemot, .Vaera, .Bo, .Beshalach, .Yitro, .Mishpatim, .Terumah, .Tetzaveh, .KiTissa, .VayakhelAndPekudei, .Vayikra, .Tzav, .Pesach3, .Shemini, .TazriaAndMetzora, .AchareiMotAndKedoshim, .Emor, .BeharAndBechukotai, .Bamidbar, .Naso, .Behaalotecha, .Shelach, .Korach, .Chukat, .Balak, .Pinchas, .MatotAndMasei, .Devarim, .Vaetchanan, .Eikev, .Reeh, .Shoftim, .KiTeitzei, .KiTavo, .NitzavimAndVayeilech]
	    }
	    
	    //  Thursday, 354, regular
	    else if typeOfYear == kHebrewYearType.TypeD
	    {
	        parshiot = [.Haazinu, .YomKippur, .Sukkot3, .Bereshit, .Noach, .LechLecha, .Vayeira, .ChayeiSarah, .Toldot, .Vayeitsei, .Vayishlach, .Vayeishev, .Miketz, .Vayigash, .Vayechi, .Shemot, .Vaera, .Bo, .Beshalach, .Yitro, .Mishpatim, .Terumah, .Tetzaveh, .KiTissa, .VayakhelAndPekudei, .Vayikra, .Tzav, .Pesach1, .Shemini, .TazriaAndMetzora, .AchareiMotAndKedoshim, .Emor, .Behar, .Bechukotai, .Bamidbar, .Naso, .Behaalotecha, .Shelach, .Korach, .Chukat, .Balak, .Pinchas, .MatotAndMasei, .Devarim, .Vaetchanan, .Eikev, .Reeh, .Shoftim, .KiTeitzei, .KiTavo, .Nitzavim]
	    }
	    
	    //  Thursday, 355, regular
	    else if typeOfYear == kHebrewYearType.TypeF
	    {
	        parshiot = [.Haazinu, .YomKippur, .Sukkot3, .Bereshit, .Noach, .LechLecha, .Vayeira, .ChayeiSarah, .Toldot, .Vayeitsei, .Vayishlach, .Vayeishev, .Miketz, .Vayigash, .Vayechi, .Shemot, .Vaera, .Bo, .Beshalach, .Yitro, .Mishpatim, .Terumah, .Tetzaveh, .KiTissa, .Vayakhel, .Pekudei, .Vayikra, .Tzav, .Pesach3, .Shemini, .TazriaAndMetzora, .AchareiMotAndKedoshim, .Emor, .BeharAndBechukotai, .Bamidbar, .Naso, .Behaalotecha, .Shelach, .Korach, .Chukat, .Balak, .Pinchas, .MatotAndMasei, .Devarim, .Vaetchanan, .Eikev, .Reeh, .Shoftim, .KiTeitzei, .KiTavo, .Nitzavim]
	    }
	    
	    //  Shabbat, 355, regular
	    else if typeOfYear == kHebrewYearType.TypeG
	    {
	        parshiot = [.RoshHashana1, .Haazinu, .Sukkot1, .SheminiAtzeret, .Bereshit, .Noach, .LechLecha, .Vayeira, .ChayeiSarah, .Toldot, .Vayeitsei, .Vayishlach, .Vayeishev, .Miketz, .Vayigash, .Vayechi, .Shemot, .Vaera, .Bo, .Beshalach, .Yitro, .Mishpatim, .Terumah, .Tetzaveh, .KiTissa, .VayakhelAndPekudei, .Vayikra, .Tzav, .Pesach3, .Shemini, .TazriaAndMetzora, .AchareiMotAndKedoshim, .Emor, .BeharAndBechukotai, .Bamidbar, .Naso, .Behaalotecha, .Shelach, .Korach, .Chukat, .Balak, .Pinchas, .MatotAndMasei, .Devarim, .Vaetchanan, .Eikev, .Reeh, .Shoftim, .KiTeitzei, .KiTavo, .NitzavimAndVayeilech]
	    }
	    
	    //  Monday, 383, leap
	    else if typeOfYear == kHebrewYearType.TypeH
	    {
	        parshiot = [.Vayeilech, .Haazinu, .Sukkot3, .Bereshit, .Noach, .LechLecha, .Vayeira, .ChayeiSarah, .Toldot, .Vayeitsei, .Vayishlach, .Vayeishev, .Miketz, .Vayigash, .Vayechi, .Shemot, .Vaera, .Bo, .Beshalach, .Yitro, .Mishpatim, .Terumah, .Tetzaveh, .KiTissa, .Vayakhel, .Pekudei, .Vayikra, .Tzav, .Shemini, .Tazria, .Metzora, .Pesach3, .AchareiMot, .Kedoshim, .Emor, .Behar, .Bechukotai, .Bamidbar, .Naso, .Behaalotecha, .Shelach, .Korach, .Chukat, .Balak, .Pinchas, .MatotAndMasei, .Devarim, .Vaetchanan, .Eikev, .Reeh, .Shoftim, .KiTeitzei, .KiTavo, .NitzavimAndVayeilech]
	    }
	    
	    //  Thursday, 383, leap
	    else if typeOfYear == kHebrewYearType.TypeI
	    {
	        parshiot = [.Haazinu, .YomKippur, .Sukkot3, .Bereshit, .Noach, .LechLecha, .Vayeira, .ChayeiSarah, .Toldot, .Vayeitsei, .Vayishlach, .Vayeishev, .Miketz, .Vayigash, .Vayechi, .Shemot, .Vaera, .Bo, .Beshalach, .Yitro, .Mishpatim, .Terumah, .Tetzaveh, .KiTissa, .Vayakhel, .Pekudei, .Vayikra, .Tzav, .Shemini, .Tazria, .Metzora, .AchareiMot, .Pesach3, .Kedoshim, .Emor, .Behar, .Bechukotai, .Bamidbar, .Naso, .Behaalotecha, .Shelach, .Korach, .Chukat, .Balak, .Pinchas, .Matot, .Masei, .Devarim, .Vaetchanan, .Eikev, .Reeh, .Shoftim, .KiTeitzei, .KiTavo, .Nitzavim]
	    }
	    
	    //  Monday, 385, leap ||  Tuesday, 384, leap
	    else if (typeOfYear == kHebrewYearType.TypeL) || (typeOfYear == kHebrewYearType.TypeK)
	    {
	        
	        
	        parshiot = [.Vayeilech, .Haazinu, .Sukkot3, .Bereshit, .Noach, .LechLecha, .Vayeira, .ChayeiSarah, .Toldot, .Vayeitsei, .Vayishlach, .Vayeishev, .Miketz, .Vayigash, .Vayechi, .Shemot, .Vaera, .Bo, .Beshalach, .Yitro, .Mishpatim, .Terumah, .Tetzaveh, .KiTissa, .Vayakhel, .Pekudei, .Vayikra, .Tzav, .Shemini, .Tazria, .Metzora, .Pesach1, .AchareiMot, .Kedoshim, .Emor, .Behar, .Bechukotai, .Bamidbar, .Naso, .Behaalotecha, .Shelach, .Korach, .Chukat, .Balak, .Pinchas, .Matot, .Masei, .Devarim, .Vaetchanan, .Eikev, .Reeh, .Shoftim, .KiTeitzei, .KiTavo, .Nitzavim]
	    }
	    
	    //  Shabbat, 383, leap
	    else if typeOfYear == kHebrewYearType.TypeJ
	    {
	        parshiot = [.RoshHashana1, .Haazinu, .Sukkot3, .SheminiAtzeret, .Bereshit, .Noach, .LechLecha, .Vayeira, .ChayeiSarah, .Toldot, .Vayeitsei, .Vayishlach, .Vayeishev, .Miketz, .Vayigash, .Vayechi, .Shemot, .Vaera, .Bo, .Beshalach, .Yitro, .Mishpatim, .Terumah, .Tetzaveh, .KiTissa, .Vayakhel, .Pekudei, .Vayikra, .Tzav, .Shemini, .Tazria, .Metzora, .Pesach3, .AchareiMot, .Kedoshim, .Emor, .Behar, .Bechukotai, .Bamidbar, .Naso, .Behaalotecha, .Shelach, .Korach, .Chukat, .Balak, .Pinchas, .MatotAndMasei, .Devarim, .Vaetchanan, .Eikev, .Reeh, .Shoftim, .KiTeitzei, .KiTavo, .NitzavimAndVayeilech]
	    }
	    
	    //  Thursday,   385, leap
	    else if typeOfYear == kHebrewYearType.TypeM
	    {
	        parshiot = [.Haazinu, .YomKippur, .Sukkot3, .Bereshit, .Noach, .LechLecha, .Vayeira, .ChayeiSarah, .Toldot, .Vayeitsei, .Vayishlach, .Vayeishev, .Miketz, .Vayigash, .Vayechi, .Shemot, .Vaera, .Bo, .Beshalach, .Yitro, .Mishpatim, .Terumah, .Tetzaveh, .KiTissa, .Vayakhel, .Pekudei, .Vayikra, .Tzav, .Shemini, .Tazria, .Metzora, .AchareiMot, .Pesach3, .Kedoshim, .Emor, .Behar, .Bechukotai, .Bamidbar, .Naso, .Behaalotecha, .Shelach, .Korach, .Chukat, .Balak, .Pinchas, .Matot, .Masei, .Devarim, .Vaetchanan, .Eikev, .Reeh, .Shoftim, .KiTeitzei, .KiTavo, .NitzavimAndVayeilech]
	        
	    }
	    
	    //  Shabbat, 385, leap
	    if typeOfYear == kHebrewYearType.TypeN
	    {
	        parshiot = [.RoshHashana1, .Haazinu, .Sukkot3, .SheminiAtzeret, .Bereshit, .Noach, .LechLecha, .Vayeira, .ChayeiSarah, .Toldot, .Vayeitsei, .Vayishlach, .Vayeishev, .Miketz, .Vayigash, .Vayechi, .Shemot, .Vaera, .Bo, .Beshalach, .Yitro, .Mishpatim, .Terumah, .Tetzaveh, .KiTissa, .Vayakhel, .Pekudei, .Vayikra, .Tzav, .Shemini, .Tazria, .Metzora, .Pesach3, .AchareiMot, .Kedoshim, .Emor, .Behar, .Bechukotai, .Bamidbar, .Naso, .Behaalotecha, .Shelach, .Korach, .Chukat, .Balak, .Pinchas, .MatotAndMasei, .Devarim, .Vaetchanan, .Eikev, .Reeh, .Shoftim, .KiTeitzei, .KiTavo, .NitzavimAndVayeilech]
	    }
	    
	    return parshiot
	}
	
	private func _parashaForDate(date: NSDate, inDiaspora isInDiaspora: Bool) -> Parasha
	{
		let tempDate = hebrewCalendar!.lastDayOfTheWeekUsingReferenceDate(date: date)
		let year = hebrewCalendar!.yearsInDate(date: tempDate)
		let roshHashana = NSDate.dateWithDay(day: 1, Month: 1, Year: year, andCalendar: hebrewCalendar!)
		let weeksSinceRoshHashana: Int = hebrewCalendar!.weeksFromDate(fromDate: roshHashana, toDate: tempDate)
		let type: kHebrewYearType = NSCalendar.typeOfHebrewYearContainingDate(date: tempDate)!
		//	Query the parshios
		let parshiot = _parshiotForYearType(type: type, inDiaspora: isInDiaspora)
	    //	Then look up this weeks parsha
	    let parashaIDNumber = parshiot[weeksSinceRoshHashana]
	    let parashaID = parashaIDNumber
		let parasha = Parasha.parashaWithIdentifier(_identifier: parashaID)
	    return parasha
	}
	
	private func _parshiotForYearType(type: kHebrewYearType, inDiaspora diaspora: Bool) -> [Parashot]
	{
		return diaspora ? parshiotInDiasporaDuringYearType(typeOfYear: type) : parshiotInIsraelDuringYearType(typeOfYear: type)
	}
}
