//
// Created by Daniel Smith on 3/1/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

class trigonometry
{
    /** toRadians
    *
    *  A utility function for converting degrees to radians
    *
    *  @param degrees The number of degrees to convert.
    *  @return The number of radians that corresponds to the supplied number of degrees.
    */
    func toRadians(degrees: Double) -> Double
    {
        return degrees * M_PI / 180.0
    }

    /**
    *  A utility function for converting radians to degrees
    */
    func toDegrees(radians: Double) -> Double
    {
        return radians * 180.0 / M_PI
    }

    /**
    * sin of an angle in degrees
    */
    func sinDeg(deg: Double) -> Double
    {
        return sin(deg * 2.0 * M_PI / 360.0)
    }

    /**
    * acos of an angle, result in degrees
    */
    func acosDeg(x: Double) -> Double
    {
        return acos(x) * 360.0 / (2 * M_PI)
    }

    /**
    * asin of an angle, result in degrees
    */
    func asinDeg(x: Double) -> Double
    {
        return asin(x) * 360.0 / (2 * M_PI)
    }

    /**
    * tan of an angle in degrees
    */
    func tanDeg(deg: Double) -> Double
    {
        return tan(deg * 2.0 * M_PI / 360.0)
    }

    /**
    * cos of an angle in degrees
    */
    func cosDeg(deg: Double) -> Double
    {
        return cos(deg * 2.0 * M_PI / 360.0)
    }
}
