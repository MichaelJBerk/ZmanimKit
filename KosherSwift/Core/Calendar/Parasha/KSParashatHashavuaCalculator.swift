//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

public class KSParashatHashavuaCalculator
{
	public var hebrewCalendar : NSCalendar?
	public var gregorianCalendar : NSCalendar?

	public init()
	{
	    gregorianCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierGregorian)
		hebrewCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierHebrew)
	}
	
	public func parashaInDiasporaForDate(date: NSDate) -> KSParasha
	{
	    return _parashaForDate(date, inDiaspora: true)
	}
	
	public func parashaInIsraelForDate(date: NSDate) -> KSParasha
	{
	    return _parashaForDate(date, inDiaspora: false)
	}
	
	public func parshiotInDiasporaDuringYearType(typeOfYear: kHebrewYearType) -> [KSParashot]
	{
        var parshiot = [KSParashot]()
	    
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
	
	public func parshiotInIsraelDuringYearType(typeOfYear: kHebrewYearType) -> [KSParashot]
	{
        var parshiot = [KSParashot]()
	    
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
	
	private func _parashaForDate(date: NSDate, inDiaspora isInDiaspora: Bool) -> KSParasha
	{
	    let tempDate = hebrewCalendar!.lastDayOfTheWeekUsingReferenceDate(date)
	    let year = hebrewCalendar!.yearsInDate(tempDate)
	    let roshHashana = NSDate.dateWithDay(1, Month: 1, Year: year, andCalendar: hebrewCalendar!)
	    let weeksSinceRoshHashana: Int = hebrewCalendar!.weeksFromDate(roshHashana, toDate: tempDate)
	    let type: kHebrewYearType = NSCalendar.typeOfHebrewYearContainingDate(tempDate)!
		//	Query the parshios
		let parshiot = _parshiotForYearType(type, inDiaspora: isInDiaspora)
	    //	Then look up this weeks parsha
	    let parashaIDNumber = parshiot[weeksSinceRoshHashana]
	    let parashaID = parashaIDNumber
	    let parasha = KSParasha.parashaWithIdentifier(parashaID)
	    return parasha
	}
	
	private func _parshiotForYearType(type: kHebrewYearType, inDiaspora diaspora: Bool) -> [KSParashot]
	{
	    return diaspora ? parshiotInDiasporaDuringYearType(type) : parshiotInIsraelDuringYearType(type)
	}
}