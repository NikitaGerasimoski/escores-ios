
import Foundation

struct Team : Codable {
	let acronym : String?
	let current_videogame : Current_videogame?
	let id : Int?
	let image_url : String?
	let name : String?
	let players : [Player]?
	let slug : String?

	enum CodingKeys: String, CodingKey {

		case acronym = "acronym"
		case current_videogame = "current_videogame"
		case id = "id"
		case image_url = "image_url"
		case name = "name"
		case players = "players"
		case slug = "slug"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		acronym = try values.decodeIfPresent(String.self, forKey: .acronym)
		current_videogame = try values.decodeIfPresent(Current_videogame.self, forKey: .current_videogame)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		image_url = try values.decodeIfPresent(String.self, forKey: .image_url)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		players = try values.decodeIfPresent([Player].self, forKey: .players)
		slug = try values.decodeIfPresent(String.self, forKey: .slug)
	}

}
