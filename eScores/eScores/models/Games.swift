import Foundation

struct Games : Codable {
	let begin_at : String?
	let detailed_stats : Bool?
	let end_at : String?
	let finished : Bool?
	let forfeit : Bool?
	let id : Int?
	let length : Int?
	let match_id : Int?
	let position : Int?
	let status : String?
	let video_url : String?
	let winner : Winner?
	let winner_type : String?

	enum CodingKeys: String, CodingKey {

		case begin_at = "begin_at"
		case detailed_stats = "detailed_stats"
		case end_at = "end_at"
		case finished = "finished"
		case forfeit = "forfeit"
		case id = "id"
		case length = "length"
		case match_id = "match_id"
		case position = "position"
		case status = "status"
		case video_url = "video_url"
		case winner = "winner"
		case winner_type = "winner_type"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		begin_at = try values.decodeIfPresent(String.self, forKey: .begin_at)
		detailed_stats = try values.decodeIfPresent(Bool.self, forKey: .detailed_stats)
		end_at = try values.decodeIfPresent(String.self, forKey: .end_at)
		finished = try values.decodeIfPresent(Bool.self, forKey: .finished)
		forfeit = try values.decodeIfPresent(Bool.self, forKey: .forfeit)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		length = try values.decodeIfPresent(Int.self, forKey: .length)
		match_id = try values.decodeIfPresent(Int.self, forKey: .match_id)
		position = try values.decodeIfPresent(Int.self, forKey: .position)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		video_url = try values.decodeIfPresent(String.self, forKey: .video_url)
		winner = try values.decodeIfPresent(Winner.self, forKey: .winner)
		winner_type = try values.decodeIfPresent(String.self, forKey: .winner_type)
	}

}
