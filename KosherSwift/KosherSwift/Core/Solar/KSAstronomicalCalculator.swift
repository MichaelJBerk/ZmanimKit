//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

protocol KSAstronomicalCalculator
{
	func UTCSunriseForDate(date: NSDate, andZenith zenith: Double, adjustForElevation: Bool) -> Double
	func UTCSunsetForDate(date: NSDate, andZenith zenith: Double, adjustForElevation: Bool) -> Double
}