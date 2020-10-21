//
// Created by Daniel Smith on 8/31/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

/** kHebrewMonth
 *
 *  The months of the Hebrew Calendar, as an enumerated type.
 *
 *  It's important to note that Adar II is always considered
 *  to be the the seventh month by the Foundation framework.
 *
 *  Other languages or environments may handle Hebrew leap
 *  years differently.
 */
public enum HebrewMonth: Int
{
	case tishrei = 1
	case heshvan
	case kislev
	case teves
	case shevat
	case adar
	case adar_II
	case nissan
	case iyar
	case sivan
	case tammuz
	case av
	case elul
	
	///Name of the Hebrew month, transliterated into English
	public var transliteratedTitle: String {
		switch self {
		case .adar:
			return "Adar"
		case .adar_II:
			return "Adar II"
		case .av:
			return "Av"
		case .heshvan:
			return "Cheshvan"
		case .elul:
			return "Elul"
		case .iyar:
			return "Iyar"
		case .kislev:
			return "Kislev"
		case .nissan:
			return "Nissan"
		case .shevat:
			return "Shevat"
		case .sivan:
			return "Sivan"
		case .tammuz:
			return "Tammuz"
		case .teves:
			return "Teves"
		case .tishrei:
			return "Tishrei"
		}
	}
}

/** kYearType
 *
 *  There are three kinds of Hebrew years, each
 *  having two possible configurations. They are:
 *
 *  A "defective year" (Chaser) is 353 days long.
 *  A "defective leap year" is 353 days.
 *
 *  A "common year" (Kesidran) is 354 days long.
 *  A "common leap year" is 384 days.
 *
 *  A "complete year" (Shalaim) is 355 days long.
 *  A "complete leap year" is 385 days long.
 *
 *  Another way of thinking about this is a composite
 *  of leap years (with 13 months instead of 12) and
 *  leap months. (Leap months contain 30 days instead
 *  of the 29 they would otherwise contain. Two months
 *  of the Hebrew calendar can be leap months.)
 *
 */
public enum kYearType: Int
{
	case haser = 0
	case kKesidran
	case kShalaim
}
