//
// Created by Daniel Smith on 8/31/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

/** This is defined as 360.0 / 24.0. There are 24 hours in a day and 360 degrees per day. */
let kDegreesPerHour = 360.0 / 24.0

/** The commonly used average solar radius in minutes of a degree. */
let kSolarRadius = 16.0 / 60.0

/**
	The commonly used average solar refraction.
	Calendrical Calculations lists a more accurate global average of 34.478885263888294.
*/
let kRefraction = 34.0 / 60.0

/**  The diameter of the earth's radius in kilometers. */
let kEarthRadiusInKilometers = 6356.9