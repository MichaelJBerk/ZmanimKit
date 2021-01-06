//
// Created by Daniel Smith on 8/31/16.
// Copyright (c) 2016 Dani Smith. All rights reserved.
//

import Foundation

public enum kHebrewYearType
{
	// Non-leap years
	case TypeA // Short: Begins on Monday
	case TypeB // Short: Begins on Saturday
	case TypeC // Regular: Begins on Tuesday
	case TypeD // Regular: Begins on Thursday
	case TypeE // Long: Begins on Monday
	case TypeF // Long: Begins on Thursday
	case TypeG // Long: Begins on Saturday
	
	// Leap years
	case TypeH // Short: Begins on Monday
	case TypeI // Short: Begins on Thursday
	case TypeJ // Short: Begins on Saturday
	case TypeK // Regular: Begins on Tuesday
	case TypeL // Long: Begins on Monday
	case TypeM // Long: Begins on Thursday
	case TypeN // Long: Begins on Saturday
}
