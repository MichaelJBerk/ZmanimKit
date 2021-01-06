//
//  DateExtensions.swift
//  Pods
//
//  Created by Michael Berk on 10/18/20.
//

import Foundation
public extension Date {
	var isCurrentDate: Bool {
		return Calendar.current.compare(Date(), to: self, toGranularity: .day) == .orderedSame
	}
}
