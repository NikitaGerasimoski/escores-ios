import Foundation
struct Tournament : Codable {
	let begin_at : String?
	let end_at : String?
	let id : Int?
	let league_id : Int?
	let modified_at : String?
	let name : String?
	let prizepool : String?
	let serie_id : Int?
	let slug : String?
	let winner_id : Int?
	let winner_type : String?

	enum CodingKeys: String, CodingKey {

		case begin_at = "begin_at"
		case end_at = "end_at"
		case id = "id"
		case league_id = "league_id"
		case modified_at = "modified_at"
		case name = "name"
		case prizepool = "prizepool"
		case serie_id = "serie_id"
		case slug = "slug"
		case winner_id = "winner_id"
		case winner_type = "winner_type"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		begin_at = try values.decodeIfPresent(String.self, forKey: .begin_at)
		end_at = try values.decodeIfPresent(String.self, forKey: .end_at)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		league_id = try values.decodeIfPresent(Int.self, forKey: .league_id)
		modified_at = try values.decodeIfPresent(String.self, forKey: .modified_at)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		prizepool = try values.decodeIfPresent(String.self, forKey: .prizepool)
		serie_id = try values.decodeIfPresent(Int.self, forKey: .serie_id)
		slug = try values.decodeIfPresent(String.self, forKey: .slug)
		winner_id = try values.decodeIfPresent(Int.self, forKey: .winner_id)
		winner_type = try values.decodeIfPresent(String.self, forKey: .winner_type)
	}

}
