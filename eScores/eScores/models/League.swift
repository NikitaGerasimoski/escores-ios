import Foundation

struct League : Codable {
	let id : Int?
	let image_url : String?
	let live_supported : Bool?
	let modified_at : String?
	let name : String?
	let slug : String?
	let url : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case image_url = "image_url"
		case live_supported = "live_supported"
		case modified_at = "modified_at"
		case name = "name"
		case slug = "slug"
		case url = "url"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		image_url = try values.decodeIfPresent(String.self, forKey: .image_url)
		live_supported = try values.decodeIfPresent(Bool.self, forKey: .live_supported)
		modified_at = try values.decodeIfPresent(String.self, forKey: .modified_at)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		slug = try values.decodeIfPresent(String.self, forKey: .slug)
		url = try values.decodeIfPresent(String.self, forKey: .url)
	}

}
