import Foundation

struct Opponent : Codable {
	let acronym : String?
	let id : Int?
	let image_url : String?
	let name : String?
	let slug : String?

	enum CodingKeys: String, CodingKey {

		case acronym = "acronym"
		case id = "id"
		case image_url = "image_url"
		case name = "name"
		case slug = "slug"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		acronym = try values.decodeIfPresent(String.self, forKey: .acronym)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		image_url = try values.decodeIfPresent(String.self, forKey: .image_url)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		slug = try values.decodeIfPresent(String.self, forKey: .slug)
	}

}
