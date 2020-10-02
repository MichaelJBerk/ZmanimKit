import XCTest
@testable import KosherSwift

class KosherSwiftTests: XCTestCase {
	var astCal: AstronomicalCalendar!
	var zCal: ZmanimCalendar!
	var cZCal: ComplexZmanimCalendar!
	var cal: Calendar!
	var timeZone: TimeZone!
	var gregorianCalendar: Calendar = Calendar(identifier: .gregorian)
	
	var timeFormatter: DateFormatter {
		let format = DateFormatter()
		format.dateFormat = "hh:mm a"
		format.amSymbol = "AM"
		format.pmSymbol = "PM"
		return format
	}

	override func setUpWithError() throws {
		// Put setup code here. This method is called before the invocation of each test method in the class.

		
		timeZone = TimeZone(identifier: "America/Chicago")!
		let location = GeoLocation(latitude: 41.8781, longitude: -87.6298, timeZone: timeZone)
		astCal = AstronomicalCalendar(location: location)
		cal = Calendar.current
		
		let testDay = DateComponents(calendar: cal, year: 2020, month: 9, day: 9).date!
		astCal.workingDate = testDay
		
		
		zCal = ZmanimCalendar(location: location)
		zCal.workingDate = testDay
		cZCal = ComplexZmanimCalendar(location: location)
		cZCal.workingDate = testDay
		
	}

	override func tearDownWithError() throws {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}
	
	func testAlos() {
//		convertToZD()
//		print("alos")
//		let alos = Zman(selector: #selector(zCal.alosHashachar))

		
	}

	func testAlosSpecificDate() throws {
		
		let testDate = DateComponents(calendar: cal, year: 2020, month: 9, day: 9).date!
		cZCal.workingDate = testDate
		let date = cZCal.alosHashachar()!
		let comps = cal.dateComponents(in: timeZone, from: date)

		XCTAssert(comps.hour == 5)
		XCTAssert(comps.minute == 0)
		
		
		// This is an example of a functional test case.
		// Use XCTAssert and related functions to verify your tests produce the correct results.
	}
	
	

	func testPerformanceExample() throws {
		// This is an example of a performance test case.
		measure {
			// Put the code you want to measure the time of here.
		}
	}
	
	// MARK: - Test Erev Chanuka Before Sunset
	
	func testFirstNightByGregorianDateBeforeSunset() {
		
		guard let tz = TimeZone(abbreviation: "EST") else {
			XCTAssert(false, "Couldn't get time zone for EST by abbreviation.")
			return
		}
		
		var dec12th2017Components = DateComponents()
		dec12th2017Components.year = 2017
		dec12th2017Components.day = 12
		dec12th2017Components.month = 12
		dec12th2017Components.hour = 10
		dec12th2017Components.minute = 0
		dec12th2017Components.timeZone = tz
		
		guard let gregorianDateBeforeChanuka = gregorianCalendar.date(from: dec12th2017Components) else {
			XCTAssert(false, "Couldn't create date representing Dec 12, 2017, before sunset.")
			return
		}
		
		// We need to set this up, since we aren't mocking sunset.
		let geoLocation = GeoLocation(latitude: 40.7128 , longitude: -74.0060, timeZone: tz)
		let jewishCalendar = JewishCalendar(location: geoLocation)
		jewishCalendar.workingDate = gregorianDateBeforeChanuka
		
		// First test that before sunset (the initial 12/12/17 date object) is not Night 1-8
		XCTAssertFalse(jewishCalendar.isChanukah())
	}

}
