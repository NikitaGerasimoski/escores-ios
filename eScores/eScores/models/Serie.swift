import Foundation

struct Serie : Codable {
	let begin_at : String?
	let description : String?
	let end_at : String?
	let full_name : String?
	let id : Int?
	let league_id : Int?
	let modified_at : String?
	let name : String?
	let prizepool : String?
	let season : String?
	let slug : String?
	let winner_id : Int?
	let winner_type : String?
	let year : Int?

	enum CodingKeys: String, CodingKey {

		case begin_at = "begin_at"
		case description = "description"
		case end_at = "end_at"
		case full_name = "full_name"
		case id = "id"
		case league_id = "league_id"
		case modified_at = "modified_at"
		case name = "name"
		case prizepool = "prizepool"
		case season = "season"
		case slug = "slug"
		case winner_id = "winner_id"
		case winner_type = "winner_type"
		case year = "year"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		begin_at = try values.decodeIfPresent(String.self, forKey: .begin_at)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		end_at = try values.decodeIfPresent(String.self, forKey: .end_at)
		full_name = try values.decodeIfPresent(String.self, forKey: .full_name)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		league_id = try values.decodeIfPresent(Int.self, forKey: .league_id)
		modified_at = try values.decodeIfPresent(String.self, forKey: .modified_at)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		prizepool = try values.decodeIfPresent(String.self, forKey: .prizepool)
		season = try values.decodeIfPresent(String.self, forKey: .season)
		slug = try values.decodeIfPresent(String.self, forKey: .slug)
		winner_id = try values.decodeIfPresent(Int.self, forKey: .winner_id)
		winner_type = try values.decodeIfPresent(String.self, forKey: .winner_type)
		year = try values.decodeIfPresent(Int.self, forKey: .year)
	}

}
