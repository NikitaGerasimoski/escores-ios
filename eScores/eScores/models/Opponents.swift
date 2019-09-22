import Foundation

struct Opponents : Codable {
	let opponent : Opponent?
	let type : String?

	enum CodingKeys: String, CodingKey {

		case opponent = "opponent"
		case type = "type"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		opponent = try values.decodeIfPresent(Opponent.self, forKey: .opponent)
		type = try values.decodeIfPresent(String.self, forKey: .type)
	}

}
