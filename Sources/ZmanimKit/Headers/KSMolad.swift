//
// Created by Daniel Smith on 8/31/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

/**
 *  The Jewish epoch using the RD (Rata Die/Fixed Date or Reingold Dershowitz) day
 *  used in the Java version of the Calendrical Calculations.
 *
 *  Day 1 is January 1, 0001 Gregorian.
 */
let kJewishEpoch = -1373429

/**
 *  The number of *chalakim* per minute.
 *
 *  This is defined as 18.
 */
let halakimPerMinute = 18

/**
 *  The number of *chalakim* per hour.
 *
 *  This is defined as 18 times the number of minutes per 
 *  hour, or 1080.
 */
let halakimPerHour = 1080

/**
 *  The number of *chalakim* per day.
 *
 *  This is defined as 18 times the number of minutes per
 *  hour times the number of hours per day, or 25920.
 */
let halakimPerDay = 25920 // 24 * 1080 = 25920

/**
 *  The number of *chalakim* per month.
 *
 *  This is defined as the number of *chalakim*
 *  per day times the number of days in a standard
 *  Hebrew months.
 */
let halakimPerMonth = 765433 // (29 * 24 + 12) * 1080 + 793 = 765433

/**
 *  Days from the beginning of Sunday till molad BaHaRaD.
 *  
 *  Calculated as 1 day, 5 hours and 204 chalakim.
 */
let halakimMoladTohu = 31524 //(24 + 5) *1080 + 204 = 31524