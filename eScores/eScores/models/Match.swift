import Foundation

struct Match : Codable {
	let begin_at : String?
	let detailed_stats : Bool?
	let draw : Bool?
	let end_at : String?
	let forfeit : Bool?
	let games : [Games]?
	let id : Int?
	let league : League?
	let league_id : Int?
	let live : Live?
	let live_url : String?
	let match_type : String?
	let modified_at : String?
	let name : String?
	let number_of_games : Int?
	let opponents : [Opponents]?
	let results : [Results]?
	let scheduled_at : String?
	let serie : Serie?
	let serie_id : Int?
	let slug : String?
	let status : String?
	let tournament : Tournament?
	let tournament_id : Int?
	let videogame : Videogame?
	let videogame_version : Videogame_version?
	let winner : Winner?
	let winner_id : Int?

	enum CodingKeys: String, CodingKey {

		case begin_at = "begin_at"
		case detailed_stats = "detailed_stats"
		case draw = "draw"
		case end_at = "end_at"
		case forfeit = "forfeit"
		case games = "games"
		case id = "id"
		case league = "league"
		case league_id = "league_id"
		case live = "live"
		case live_url = "live_url"
		case match_type = "match_type"
		case modified_at = "modified_at"
		case name = "name"
		case number_of_games = "number_of_games"
		case opponents = "opponents"
		case results = "results"
		case scheduled_at = "scheduled_at"
		case serie = "serie"
		case serie_id = "serie_id"
		case slug = "slug"
		case status = "status"
		case tournament = "tournament"
		case tournament_id = "tournament_id"
		case videogame = "videogame"
		case videogame_version = "videogame_version"
		case winner = "winner"
		case winner_id = "winner_id"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		begin_at = try values.decodeIfPresent(String.self, forKey: .begin_at)
		detailed_stats = try values.decodeIfPresent(Bool.self, forKey: .detailed_stats)
		draw = try values.decodeIfPresent(Bool.self, forKey: .draw)
		end_at = try values.decodeIfPresent(String.self, forKey: .end_at)
		forfeit = try values.decodeIfPresent(Bool.self, forKey: .forfeit)
		games = try values.decodeIfPresent([Games].self, forKey: .games)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		league = try values.decodeIfPresent(League.self, forKey: .league)
		league_id = try values.decodeIfPresent(Int.self, forKey: .league_id)
		live = try values.decodeIfPresent(Live.self, forKey: .live)
		live_url = try values.decodeIfPresent(String.self, forKey: .live_url)
		match_type = try values.decodeIfPresent(String.self, forKey: .match_type)
		modified_at = try values.decodeIfPresent(String.self, forKey: .modified_at)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		number_of_games = try values.decodeIfPresent(Int.self, forKey: .number_of_games)
		opponents = try values.decodeIfPresent([Opponents].self, forKey: .opponents)
		results = try values.decodeIfPresent([Results].self, forKey: .results)
		scheduled_at = try values.decodeIfPresent(String.self, forKey: .scheduled_at)
		serie = try values.decodeIfPresent(Serie.self, forKey: .serie)
		serie_id = try values.decodeIfPresent(Int.self, forKey: .serie_id)
		slug = try values.decodeIfPresent(String.self, forKey: .slug)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		tournament = try values.decodeIfPresent(Tournament.self, forKey: .tournament)
		tournament_id = try values.decodeIfPresent(Int.self, forKey: .tournament_id)
		videogame = try values.decodeIfPresent(Videogame.self, forKey: .videogame)
		videogame_version = try values.decodeIfPresent(Videogame_version.self, forKey: .videogame_version)
		winner = try values.decodeIfPresent(Winner.self, forKey: .winner)
		winner_id = try values.decodeIfPresent(Int.self, forKey: .winner_id)
	}

}
