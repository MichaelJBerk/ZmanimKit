//
// Created by Daniel Smith on 8/31/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

/**
 *  The zenith of astronomical sunrise and sunset.
 *  The sun is 90 degrees from the vertical 0 degrees.
 *  It is important to note that for sunrise and sunset the adjusted zenith is required to account for the radius of the sun and refraction. The adjusted zenith should not
 * 	be used for calculations above or below 90 degrees since they are usually are calculated as an offset to 90 degrees.
 */
let kZenithGeometric = 90.0

/** The sun's zenith at civil twilight (96 degrees) */
let kZenithCivil = 96.0

/** The sun's zenith at nautical twilight (102 degrees) */
let kZenithNautical = 102.0

/** The sun's zenith at astronomical twilight (108 degrees) */
let kZenithAstronomical = 108.0