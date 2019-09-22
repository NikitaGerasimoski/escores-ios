import Foundation

struct Videogame_version : Codable {
	let current : Bool?
	let name : String?

	enum CodingKeys: String, CodingKey {

		case current = "current"
		case name = "name"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		current = try values.decodeIfPresent(Bool.self, forKey: .current)
		name = try values.decodeIfPresent(String.self, forKey: .name)
	}

}
