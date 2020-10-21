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
}
