import XCTest
@testable import ZmanimKit

final class ZmanimKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
		
		//Coordinates for New York City: 40.7128° N, 74.0060° W
		let cal = ZmanimCalendar(location: GeoLocation(latitude: 40.7127, longitude: -74.0060, timeZone: TimeZone(identifier: "EST")!))
		let sampleWorkingDate = DateComponents(calendar: .current, year: 2020, month: 10, day: 21).date!
		cal.workingDate = sampleWorkingDate
		let simpleDateFormatter = DateFormatter()
		simpleDateFormatter.dateStyle = .none
		simpleDateFormatter.timeStyle = .short
		let chatzosText = simpleDateFormatter.string(from: cal.chatzos())
		print("Chatzos in New York today: \(chatzosText)")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
	
	func testEdgewere() {
//		.init(name: "Edgeware", longitude: -0.262034, latitude: 51.615788)
		let loc = GeoLocation(latitude: 51.615788, longitude: -0.262034, timeZone: .init(abbreviation: "GMT")!)
		let cal = ZmanimCalendar(location: loc)
		let simpleDateFormatter = DateFormatter()
		simpleDateFormatter.dateStyle = .none
		simpleDateFormatter.timeStyle = .short
		simpleDateFormatter.timeZone = .init(abbreviation: "GMT")
		let sep2022 = DateComponents(calendar: .current, year: 2022, month: 9, day: 01).date!
		cal.workingDate = sep2022
		
		print("Edgewere Sof Zman Shma Gra: \(simpleDateFormatter.string(from: cal.sofZmanShmaGra()))")
		
	}
	
	func testMashivHaruach() {
		let cal = JewishCalendar(location: GeoLocation(latitude: 40.7127, longitude: -74.0060, timeZone: TimeZone(identifier: "EST")!))
		//Tishrei
		cal.workingDate = DateComponents(calendar: .hebrewCalendar(), year: 5784, month: 1, day: 03).date!
		XCTAssertFalse(cal.isMashivHaruach())
		cal.workingDate = DateComponents(calendar: .hebrewCalendar(), year: 5784, month: 1, day: 25).date!
		XCTAssertTrue(cal.isMashivHaruach())
		
		//arbitrary month (cheshvan)
		cal.workingDate = DateComponents(calendar: .hebrewCalendar(), year: 5784, month: 2, day: 03).date!
		XCTAssertTrue(cal.isMashivHaruach())
		
		//Nissan
		cal.workingDate = DateComponents(calendar: .hebrewCalendar(), year: 5784, month: 8, day: 03).date!
		XCTAssertTrue(cal.isMashivHaruach())
		cal.workingDate = DateComponents(calendar: .hebrewCalendar(), year: 5784, month: 8, day: 24).date!
		XCTAssertFalse(cal.isMashivHaruach())
		
		//arbitrary month (iyar)
		cal.workingDate = DateComponents(calendar: .hebrewCalendar(), year: 5784, month: 9, day: 24).date!
		XCTAssertFalse(cal.isMashivHaruach())
	}
}
