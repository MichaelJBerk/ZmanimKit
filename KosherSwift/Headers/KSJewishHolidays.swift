//
// Created by Daniel Smith on 8/31/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

/** kYomimTovim
 *
 *  Jewish holidays (and their "eve"s), including:
 *
 *  The three primary holidays:
 *  - Pesach
 *  - Shavuot
 *  - Sukkot
 *
 *  Secondary or rabinically instituted holidays:
 *
 *  - Purim, Shushan Purim, and Purim Katan
 *  - Chanukah
 *  - Rosh Chodesh (The new moon)
 *
 *  Fast Days
 *  - Yom Kippur
 *  - Seventeenth of Tammuz
 *  - Ninth of Av
 *  - Fast of Gedalya
 *  - Tenth of Tevet
 *  - Fast of Esther
 *
 *  Zionist Holidays
 *  - Yom Hashoah (Holocaust Memorial Day)
 *  - Yom Hazikaron (Memorial Day)
 *  - Yom Haatzmaut (Independence Day)
 *  - Yom Yerushalayim (Jerusalem Day)
 *
 *  Take a look at the enum for the ones that aren't included.
 */
public enum kYomimTovim: Int
{
	case kErevPesach = 0
	case kPesach
	case holHamoedPesach
	case kPesachSheni
	case kErevShavuos
	case kShavuos
	case kSeventeenthOfTammuz
	case kTishaBeav //  TODO: Change to NinthOfAv to match convention of others
	case kTuBeav
	case kErevRoshHashana
	case kRoshHashana
	case kFastOfGedalya
	case kErevYomKippur
	case kYomKippur
	case kErevSuccos
	case kSuccos
	case holHamoedSuccos
	case kHoshanaRabba
	case kSheminiAtzeres
	case kSimchasTorah
	case kErevChanukah
	case hanukah
	case kTenthOfTeves  //  TODO: Change "Teves" to "tevet"
	case kTuBeshvat
	case kFastOfEsther
	case kPurim
	case kShushanPurim
	case kPurimKatan
	case kRoshChodesh
	case kYomHashoah
	case kYomHazikaron
	case kYomHaatzmaut
	case kYomYerushalayim
}