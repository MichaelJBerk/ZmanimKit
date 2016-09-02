//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

public extension NSDateComponents
{
	class public func allComponents() -> [NSCalendarUnit]
	{
		return [.Era, .Year, .Month, .Day, .Hour, .Minute, .Second, .WeekOfYear]
	}
}