//
//	Media.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Media : Codable {

	let approvedForSyndication : Int?
	let caption : String?
	let copyright : String?
	let mediametadata : [MediaMetadata]?
	let subtype : String?
	let type : String?


	enum CodingKeys: String, CodingKey {
		case approvedForSyndication = "approved_for_syndication"
		case caption = "caption"
		case copyright = "copyright"
		case mediametadata = "media-metadata"
		case subtype = "subtype"
		case type = "type"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		approvedForSyndication = try values.decodeIfPresent(Int.self, forKey: .approvedForSyndication)
		caption = try values.decodeIfPresent(String.self, forKey: .caption)
		copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
		mediametadata = try values.decodeIfPresent([MediaMetadata].self, forKey: .mediametadata)
		subtype = try values.decodeIfPresent(String.self, forKey: .subtype)
		type = try values.decodeIfPresent(String.self, forKey: .type)
	}


}
