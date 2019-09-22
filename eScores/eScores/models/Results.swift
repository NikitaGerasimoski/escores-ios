import Foundation

struct Results : Codable {
	let score : Int?
	let team_id : Int?

	enum CodingKeys: String, CodingKey {

		case score = "score"
		case team_id = "team_id"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		score = try values.decodeIfPresent(Int.self, forKey: .score)
		team_id = try values.decodeIfPresent(Int.self, forKey: .team_id)
	}

}
