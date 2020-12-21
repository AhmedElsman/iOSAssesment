//
//	Media-metadata.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct MediaMetadata : Codable {

	let format : String?
	let height : Int?
	let url : String?
	let width : Int?


	enum CodingKeys: String, CodingKey {
		case format = "format"
		case height = "height"
		case url = "url"
		case width = "width"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		format = try values.decodeIfPresent(String.self, forKey: .format)
		height = try values.decodeIfPresent(Int.self, forKey: .height)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		width = try values.decodeIfPresent(Int.self, forKey: .width)
	}


}
