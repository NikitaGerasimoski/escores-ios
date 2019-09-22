import Foundation

struct Live : Codable {
	let opens_at : String?
	let supported : Bool?
	let url : String?

	enum CodingKeys: String, CodingKey {

		case opens_at = "opens_at"
		case supported = "supported"
		case url = "url"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		opens_at = try values.decodeIfPresent(String.self, forKey: .opens_at)
		supported = try values.decodeIfPresent(Bool.self, forKey: .supported)
		url = try values.decodeIfPresent(String.self, forKey: .url)
	}

}
