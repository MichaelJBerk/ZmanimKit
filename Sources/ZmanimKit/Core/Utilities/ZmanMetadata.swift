//
//  ZmanMetadata.swift
//  KosherSwift
//
//  Created by Michael Berk on 10/1/20.
//

import Foundation

public struct ZMetadata: Codable {
	var hebrew: String
	var eng: String
	var ash: String
	var sef: String
	var selector: String
	var exp: String
}

public func convertToZD() {
	var zd = [ZMetadata]()
	for selector in Zman.metadata() {
		let heb = selector.value["koshercocoa.name.hebrew"] ?? ""
		let ash = selector.value["koshercocoa.name.transliterated.ashkenaz"] ?? ""
		let seph = selector.value["koshercocoa.name.transliterated.sephard"] ?? ""
		let eng = selector.value["koshercocoa.name.name.localized"] ?? ""
		let exp = selector.value["koshercocoa.explanation.localized"] ?? ""
		let newZD = ZMetadata(hebrew: heb, eng: eng, ash: ash, sef: seph, selector: selector.key, exp: exp)
		zd.append(newZD)
	}
	let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
	let je = JSONEncoder()
	let jsonData = try? je.encode(zd)
	try? jsonData?.write(to: docDir.appendingPathComponent("/ZmanMetadata.json"))
	print(docDir)
	
}
