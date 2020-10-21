//
// Created by Daniel Smith on 3/9/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

public extension NSDateComponents
{
	class func allComponents() -> [NSCalendar.Unit]
	{
		return [.era, .year, .month, .day, .hour, .minute, .second, .weekOfYear]
	}
}
