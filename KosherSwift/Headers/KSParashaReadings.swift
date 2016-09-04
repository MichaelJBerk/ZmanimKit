//
// Created by Daniel Smith on 8/31/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

/**
 * This enum contains an identifier for each of the
 * possible weekly readings. Double readings and holiday
 * readings are treated separately from single parasha readings.
 */
public enum Parashot: Int
{
	case Bereshit = 0
	case Noach
	case LechLecha
	case Vayeira
	case ChayeiSarah
	case Toldot
	case Vayeitsei
	case Vayishlach
	case Vayeishev
	case Miketz
	case Vayigash
	case Vayechi
	case Shemot
	case Vaera
	case Bo
	case Beshalach
	case Yitro
	case Mishpatim
	case Terumah
	case Tetzaveh
	case TerumahAndTetzaveh    //  Terumah - Tetzaveh
	case KiTissa
	case Vayakhel
	case Pekudei
	case VayakhelAndPekudei    //  Vayakhel - Pekudei
	case Vayikra
	case Tzav
	case Shemini
	case Tazria
	case Metzora
	case TazriaAndMetzora
	case AchareiMot
	case Kedoshim
	case AchareiMotAndKedoshim //  Acharei - Kedoshim
	case Emor
	case Behar
	case Bechukotai
	case BeharAndBechukotai    //  Behar - Bechukotai
	case Bamidbar
	case Naso
	case Behaalotecha
	case Shelach
	case Korach
	case Chukat
	case Balak
	case ChukatAndBalak        //  Chukat - Balak
	case Pinchas
	case Matot
	case Masei
	case MatotAndMasei         //  Matot - Masei
	case Devarim
	case Vaetchanan
	case Eikev
	case Reeh
	case Shoftim
	case KiTeitzei
	case KiTavo
	case Nitzavim
	case Vayeilech
	case NitzavimAndVayeilech  //  Nitzavim - Vayeilech
	case Haazinu
	case VezotHaberacha
	case RoshHashana1  //  Rosh Hashana falls on Shabbat
	case YomKippur     //  Yom Kippur falls on Shabbat
	case Sukkot1       //  Sukkot falls on Shabbat
	case Sukkot3       //  Chol Hamoed Sukkot falls on Shabbat
	case SheminiAtzeret//  Shemini Atzeret falls on Shabbat
	case Pesach1       //  The first night of pesach falls on Shabbat
	case Pesach3       //  Chol Hamoed Pesach contains a Shabbat
	case Pesach7       //  The 7th day of Pesach falls on Shabbat
	case Pesach8       //  In diaspora the 8th day of Pesach falls on Shabbat
	case Shavuot2      //  The second day of Shavuot falls on Shabbat
}