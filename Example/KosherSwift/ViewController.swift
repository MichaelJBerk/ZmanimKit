//
//  ViewController.swift
//  KosherSwiftExample
//
//  Created by Michael Berk on 9/9/20.
//

import UIKit
import KosherSwift

struct CellData {
	var title: String
	var date: Date
}


class TableViewController: UITableViewController {
	var gregorianCalendar: Calendar = Calendar(identifier: .gregorian)
	
	func sunriseDate() {
		guard let tz = TimeZone(abbreviation: "EST") else {
//			XCTAssert(false, "Couldn't get time zone for EST by abbreviation.")
			return
		}
		
		var dec12th2017Components = DateComponents()
		dec12th2017Components.year = 2017
		dec12th2017Components.day = 12
		dec12th2017Components.month = 12
		dec12th2017Components.hour = 10
		dec12th2017Components.minute = 0
//		dec12th2017Components.timeZone = tz
		
		guard let gregorianDateBeforeChanuka = gregorianCalendar.date(from: dec12th2017Components) else {
//			XCTAssert(false, "Couldn't create date representing Dec 12, 2017, before sunset.")
			return
		}
		
		// We need to set this up, since we aren't mocking sunset.
		let geoLocation = GeoLocation(latitude: 40.7128 , longitude: -74.0060, timeZone: tz)//GeoLocation(latitude: 41.999466, longitude: -87.716220, timeZone: .current)//
//		astCal.workingDate = gregorianDateBeforeChanuka as NSDate
//		let aSunset = astCal.sunset()
//		print(timeFormatter.string(from: aSunset as! Date))
		
		
		let ac = AstronomicalCalendar(location: geoLocation)
		
		
//		astCal.geoLocation = geoLocation
//		ac.workingDate = gregorianDateBeforeChanuka as NSDate
//		let s = ac.UTCSunset(zenith: 90)
//		let d = ac.dateFromTime(time: s)
//		print(timeFormatter.string(from: ac.dateFromTime(time: s) as! Date))
//
//		let sunset = ac.sunsetOffsetByDegrees(offsetZenith: 90)
//
//		print(timeFormatter.string(from: sunset as! Date))
//
//		let zmanCal = ZmanimCalendar(location: geoLocation)
//		let zSunset = zmanCal.sunsetOffsetByDegrees(offsetZenith: 90)
//		print(timeFormatter.string(from: zSunset as! Date))
//
		let jewishCalendar = JewishCalendar(location: geoLocation)
		let nsGdbc = gregorianDateBeforeChanuka
		jewishCalendar.workingDate = gregorianDateBeforeChanuka
		let shkia = jewishCalendar.sunsetOffsetByDegrees(offsetZenith: 90)
		print(jewishCalendar.geoLocation?.timeZone?.abbreviation())
		print(timeFormatter.string(from: shkia as! Date))
		print(jewishCalendar.isChanukah())
		print("-------")
		print(jewishCalendar.timeStringFromDate(shkia as! Date))
		
	}
	func otherThing() {
		let l = GeoLocation(latitude: 41.999466, longitude: -87.716220, timeZone: .current)
		let cal = JewishCalendar(location: l)
		cal.workingDate = Date()
		
		let wd = cal.workingDateAdjustedForSunset()
		print(timeFormatter.string(from: wd as Date))
		
	}
	
	var data: [CellData] {
		
		let date = Date()
		let d = [
			CellData(title: "hey", date: date)
		]
		
		
		return d
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return data.count
	}
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as? ZmanCell {
			cell.cellTitleLabel.text = data[indexPath.row].title
			cell.cellTimeLabel.text = timeFormatter.string(from: data[indexPath.row].date)
			return cell
			
		} else {
			return UITableViewCell(style: .default, reuseIdentifier: "tableViewCell")
		}
	}
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		otherThing()
	}


}

var timeFormatter: DateFormatter {
	let format = DateFormatter()
	format.dateFormat = "hh:mm a"
	format.amSymbol = "AM"
	format.pmSymbol = "PM"
	
	return format
}

class ZmanCell: UITableViewCell {
	@IBOutlet weak var cellTitleLabel: UILabel!
	@IBOutlet weak var cellTimeLabel: UILabel!
	
	
}

extension JewishCalendar {
	func timeStringFromDate(_ date: Date) -> String {
		let format = DateFormatter()
		format.dateFormat = "hh:mm a"
		format.amSymbol = "AM"
		format.pmSymbol = "PM"
		format.timeZone = geoLocation?.timeZone
		return format.string(from: date)
	}
}
