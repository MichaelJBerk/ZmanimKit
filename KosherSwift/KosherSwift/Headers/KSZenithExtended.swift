//
// Created by Daniel Smith on 8/31/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

/**
 *  The zenith of 16.1 degrees below geometric zenith (90 degrees).
 *
 *  This calculation is used for determining *alos* (dawn) and *tzais* (nightfall)
 *  in some opinions. It is based on the calculation that the time between dawn
 *  and sunrise (and sunset to nightfall) is 72 minutes, the time that is takes to
 *  walk 4 *mil* at 18 minutes a mil (*Rambam* and others). The sun's position at 72
 *  minutes before sunrise in Jerusalem on the equinox is 16.1 degrees below geometric zenith.
 */
let kZenithSixteenPointOne = (kZenithGeometric + 16.1)

/**
 *  The zenith of 8.5 degrees below geometric zenith (90 degrees).
 *
 *  This calculation is used for calculating *alos* (dawn) and *tzais* (nightfall) in some opinions.
 *  This calculation is based on the position of the sun 36 minutes after sunset in Jerusalem
 *  on March 16, about 4 days before the equinox, the day that a
 *  solar hour is 60 minutes, which is 8.5degrees below geometric zenith. The Ohr Meir
 *  considers this the time that 3 small stars are visible, which is later than the
 *  required 3 medium stars.
 */
let kZenithEightPointFive = kZenithGeometric + 8.5

/**
 *  The zenith of 3.7 degrees below geometric zenith (90 degrees).
 *  This calculation is used for calculating *tzais* (nightfall) based on the opinion of
 *  the *Geonim* that *tzais* is the time it takes to walk 3/4 of a *Mil*
 *  at 18 minutes a *Mil*, or 13.5 minutes after sunset. The sun is 3.7 degrees below
 *  geometric zenith at this time in Jerusalem on March 16,
 *  about 4 days before the equinox, the day that a solar hour is 60 minutes.
 */
let kZenithThreePointSeven = kZenithGeometric + 3.7

/**
 *  The zenith that is 5.95 degrees below geometric zenith (90 degrees).
 *
 *  This calculation is used for calculating *tzais* (nightfall) according to some opinions.
 *  This calculation is based on the position of the sun 24 minutes after sunset in Jerusalem
 *  on March 16, about 4 days before the equinox, the day that a solar hour is 60 minutes,
 *  which calculates to 5.95 degrees below geometric zenith.
 */
let kZenithFivePointNinetyFive = kZenithGeometric + 5.95

/**
 *  The zenith of 7.083 degrees below geometric zenith (90 degrees).
 *  
 *  This is often referred to as 7 degrees and 5 minutes. This calculation is used for 
 *  calculating *alos* (dawn) and *tzais* (nightfall) according to some opinions. This 
 *  calculation is based on the position of the sun 30
 *  minutes after sunset in Jerusalem on March 16, about 4 days before the equinox, the day that 
 *  a solar hour is 60 minutes, which calculates to 7.0833333 degrees below geometric zenith.
 *  This is time some opinions consider dark enough for 3 stars to be visible.
 *  This is the opinion of the *Sh"Ut Melamed Leho'il*, *Sh"Ut Binyan Tziyon*,
 *  *Tenuvas Sadeh* and very close to the time of the *Mekor Chesed* on 
 *  the *Sefer chasidim*.
 */
let kZenithSevenPointZeroEightThree = kZenithGeometric + 7 + (5/60)

/**
 *  The zenith of 10.2 degrees below geometric zenith (90 degrees).
 *
 *  This calculation is used for calculating *misheyakir* according to some opinions.
 *  This calculation is based on the position of the sun 45 minutes sunrise in Jerusalem on
 *  March 16, about 4 days before the equinox, the day that a solar hour is 60 minutes, which
 *  calculates to 10.2 degrees below geometric zenith.
 */
let kZenithTenPointTwo = kZenithGeometric + 10.2

/**
 * The zenith of 11 degrees below geometric zenith (90 degrees). 
 *
 *  This calculation is used for calculating *misheyakir* according to some 
 *  opinions. This calculation is based on the position of the sun 48 minutes before
 *  sunrise in Jerusalem on March 16, about 4 days before the
 *  equinox, the day that a solar hour is 60 minutes which calculates to 11 degrees
 *  below geometric zenith
 */
let kZenithElevenDegrees = kZenithGeometric + 11

/**
 *  The zenith of 11.5 degrees below geometric zenith. (90 degrees).
 *
 *  This calculation is used for calculating *misheyakir* 
 *  according to some opinions. This calculation is based on the 
 *  position of the sun 52 minutes before sunrise in Jerusalem on 
 *  March 16, about 4 days before the equinox, the day that a solar hour
 *  is 60 minutes which calculates to 11.5 degrees below geometric zenith.
 */
let kZenithElevenPointFive = kZenithGeometric + 11.5

/**
 *  The zenith of 13 degrees below geometric zenith} (90 degrees).
 *
 *  No further details were available in KosherJava.
 */
let kZenithThirteenDegrees = kZenithGeometric + 13

/**
 *  The zenith of 13.24 degrees below geometric zenith (90 degrees).
 *  This calculation is used for calculating *Rabainu Tam's bain hashmashos*
 *  according to some opinions. <br/>
 *
 *  NOTE: See comments on bainHashmashosRT13Point24Degrees for additional
 *  details about the degrees.
 */
let kZenithThirteenPointTwentyFourDegrees = kZenithGeometric + 13.24

/** kZenithNineteenPointEight
 *
 *  The zenith of 19.8 degrees below geometric zenith (90 degrees).
 *
 *  This calculation is used for calculating *alos* (dawn) and *tzais* (nightfall) 
 *  according to some opinions. This calculation is based on the position of the sun 
 *  90 minutes after sunset in Jerusalem on March 16, about 4 days before the
 *  equinox, the day that a solar hour is 60 minutes which calculates to 19.8 degrees 
 *  below geometric zenith.
 */
let kZenithNineteenPointEight = kZenithGeometric + 19.8

/**
 *  The zenith of 26 degrees below geometric zenith (90 degrees).
 *  This calculation is used for calculating *alos* (dawn) and *tzais* (nightfall) 
 *  according to some opinions. This calculation is based on the position of the
 *  sun 120 minutes after sunset in Jerusalem on March 16,
 *  about 4 days before the equinox, the day that a solar hour is 60 minutes which 
 *  calculates to 26 degrees below geometric zenith
 */
let kZenithTwentySix = kZenithGeometric + 26.0

/**
 *  The zenith of 4.37 degrees below geometric zenith (90 degrees).
 *
 *  This calculation is used for  calculating *tzais* (nightfall)
 *  according to some opinions. This calculation is based on the position of the
 *  sun tzaisGeonim4Point37Degrees 16 7/8 minutes after sunset (3/4 of a 22.5 
 *  minute Mil) Jerusalem on March 16, about 4 days before the equinox, the day that
 *  a solar hour is 60 minutes which calculates to 4.37 degrees below geometric zenith.
 *
 *
 *  In KosherJava, this was marked experiential.
 */
let kZenithFourPointThirtySeven = kZenithGeometric + 4.37

/**
 * The zenith of 4.61 degrees below geometric zenith (90 degrees). 
 *
 *  This calculation is used for calculating *tzais* (nightfall) according to some opinions.
 *  This calculation is based on the position of the sun tzaisGeonim4Point37Degrees
 *  18 minutes after sunset (3/4 of a 24 minute Mil) in Jerusalem on March 16,
 *  about 4 days before the equinox, the day that a solar hour is 60 minutes which 
 *  calculates to 4.61 degrees below geometric zenith
 */
let kZenithFourPointSixtyOne = kZenithGeometric + 4.61

/**
 *  The zenith of 4.8 degrees below geometric zenith (90 degrees)
 *
 *  No further details were available in KosherJava.
 */
let kZenithFourPointEight = kZenithGeometric + 4.8

/**
 * The zenith of 3.65 degrees below geometric zenith (90 degrees). 
 *
 *  This calculation is used for calculating *tzais* (nightfall) according
 *  to some opinions. This calculation is based on the position of the sun tzaisGeonim3Point65Degrees
 *  13.5 minutes after sunset (3/4 of an 18 minute Mil) in Jerusalem on March 16, about
 *  4 days before the equinox, the day that a solar hour is 60 minutes which calculates to
 *  3.65 degrees below geometric zenith
 */
let kZenithThreePointSixtyFive = kZenithGeometric + 3.65

/**
 *  The zenith of 5.88 degrees below geometric zenith (90 degrees).
 *
 *  No further details were available in KosherJava.
 */
let kZenithFivePointEightyEight = kZenithGeometric + 5.88