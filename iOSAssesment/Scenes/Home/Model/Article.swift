//
//	RootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Article : Codable {

	let abstractField : String?
	let adxKeywords : String?
	let assetId : Int?
	let byline : String?
	let column : String?
	let desFacet : [String]?
	let etaId : Int?
	let geoFacet : [String]?
	let id : Int?
	let media : [Media]?
	let nytdsection : String?
	let orgFacet : [String]?
	let perFacet : [String]?
	let publishedDate : String?
	let section : String?
	let source : String?
	let subsection : String?
	let title : String?
	let type : String?
	let updated : String?
	let uri : String?
	let url : String?


	enum CodingKeys: String, CodingKey {
		case abstractField = "abstract"
		case adxKeywords = "adx_keywords"
		case assetId = "asset_id"
		case byline = "byline"
		case column = "column"
		case desFacet = "des_facet"
		case etaId = "eta_id"
		case geoFacet = "geo_facet"
		case id = "id"
		case media = "media"
		case nytdsection = "nytdsection"
		case orgFacet = "org_facet"
		case perFacet = "per_facet"
		case publishedDate = "published_date"
		case section = "section"
		case source = "source"
		case subsection = "subsection"
		case title = "title"
		case type = "type"
		case updated = "updated"
		case uri = "uri"
		case url = "url"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		abstractField = try values.decodeIfPresent(String.self, forKey: .abstractField)
		adxKeywords = try values.decodeIfPresent(String.self, forKey: .adxKeywords)
		assetId = try values.decodeIfPresent(Int.self, forKey: .assetId)
		byline = try values.decodeIfPresent(String.self, forKey: .byline)
		column = try values.decodeIfPresent(String.self, forKey: .column)
		desFacet = try values.decodeIfPresent([String].self, forKey: .desFacet)
		etaId = try values.decodeIfPresent(Int.self, forKey: .etaId)
		geoFacet = try values.decodeIfPresent([String].self, forKey: .geoFacet)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		media = try values.decodeIfPresent([Media].self, forKey: .media)
		nytdsection = try values.decodeIfPresent(String.self, forKey: .nytdsection)
		orgFacet = try values.decodeIfPresent([String].self, forKey: .orgFacet)
		perFacet = try values.decodeIfPresent([String].self, forKey: .perFacet)
		publishedDate = try values.decodeIfPresent(String.self, forKey: .publishedDate)
		section = try values.decodeIfPresent(String.self, forKey: .section)
		source = try values.decodeIfPresent(String.self, forKey: .source)
		subsection = try values.decodeIfPresent(String.self, forKey: .subsection)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		updated = try values.decodeIfPresent(String.self, forKey: .updated)
		uri = try values.decodeIfPresent(String.self, forKey: .uri)
		url = try values.decodeIfPresent(String.self, forKey: .url)
	}


}

extension Article {
    init?(data: Data) {
        do {
            let me = try JSONDecoder().decode(Article.self, from: data)
            self = me
        }
        catch {
            print(error)
            return nil
        }
    }
}
