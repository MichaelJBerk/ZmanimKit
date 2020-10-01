//
// Created by Daniel Smith on 3/1/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

public class trigonometry
{
    /** toRadians
    *
    *  A utility function for converting degrees to radians
    *
    *  @param degrees The number of degrees to convert.
    *  @return The number of radians that corresponds to the supplied number of degrees.
    */
    public func toRadians(degrees: Double) -> Double
    {
		return degrees * .pi / 180.0
    }

    /**
    *  A utility function for converting radians to degrees
    */
    public func toDegrees(radians: Double) -> Double
    {
		return radians * 180.0 / .pi
    }

    /**
    * sin of an angle in degrees
    */
    public func sinDeg(deg: Double) -> Double
    {
		return sin(deg * 2.0 * .pi / 360.0)
    }

    /**
    * acos of an angle, result in degrees
    */
    public func acosDeg(x: Double) -> Double
    {
		return acos(x) * 360.0 / (2 * .pi)
    }

    /**
    * asin of an angle, result in degrees
    */
    public func asinDeg(x: Double) -> Double
    {
		return asin(x) * 360.0 / (2 * .pi)
    }

    /**
    * tan of an angle in degrees
    */
    public func tanDeg(deg: Double) -> Double
    {
		return tan(deg * 2.0 * .pi / 360.0)
    }

    /**
    * cos of an angle in degrees
    */
    public func cosDeg(deg: Double) -> Double
    {
		return cos(deg * 2.0 * .pi / 360.0)
    }
}
