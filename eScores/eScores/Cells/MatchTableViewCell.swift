//
//  MatchTableViewCell.swift
//  eScores
//
//  Created by Nikita Gerasimoski on 9/22/19.
//  Copyright © 2019 Nikita Gerasimoski. All rights reserved.
//

import UIKit
import PromiseKit

class MatchTableViewCell: UITableViewCell {

    @IBOutlet weak var firstTeamImage: UIImageView!
    @IBOutlet weak var firstTeamName: UILabel!
    @IBOutlet weak var firstTeamScore: UILabel!
    
    @IBOutlet weak var secondTeamWinImg: UIImageView!
    @IBOutlet weak var firstTeamWinImg: UIImageView!
    
    @IBOutlet weak var secondTeamImage: UIImageView!
    @IBOutlet weak var secondTeamName: UILabel!
    @IBOutlet weak var secondTeamScore: UILabel!
    
    
    @IBOutlet weak var leagueLogoImage: UIImageView!
    @IBOutlet weak var leagueInfoLabel: UILabel!
    
    @IBOutlet weak var startTimeLabel: UILabel!
    var headerModel = DetailsHeaderModel()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func formatGames(games: [Games]) -> [Games] {
        if games.count > 1 && games[0].finished == false {
            return [games[0]];
        }
        return games
    }
    func setUpCellForMatch(match: Match) {
        self.startTimeLabel.text = match.begin_at!.formatDateForCell()
        self.headerModel.games = self.formatGames(games: match.games!)
        headerModel.startTime = match.begin_at!.formatDateForCell()
        self.leagueInfoLabel.text = match.league!.name! + " " + match.serie!.full_name! + " " + match.name!
        _ = NetworkManager.sharedInstance.getImageForEndpoint(endPoint: (match.league?.image_url!)!).done { (response) in
            self.leagueLogoImage.image = UIImage.init(data: response.body!)
        }
        if match.opponents!.count == 2 {
            self.isUserInteractionEnabled = true
            if match.opponents![0].opponent?.id == match.results![0].team_id {
                self.firstTeamScore.text = "\(match.results![0].score!)"
                self.secondTeamScore.text = "\(match.results![1].score!)"
                headerModel.result = "\(match.results![0].score!)" + " : " + "\(match.results![1].score!)"
                headerModel.firstTeamId = match.results![0].team_id!
                headerModel.secondTeamId = match.results![1].team_id!
                firstTeamWinImg.isHidden = false
                secondTeamWinImg.isHidden = true
            } else {
                self.firstTeamScore.text = "\(match.results![1].score!)"
                self.secondTeamScore.text = "\(match.results![0].score!)"
                headerModel.result = "\(match.results![1].score!)" + " : " + "\(match.results![0].score!)"
                headerModel.firstTeamId = match.results![1].team_id!
                headerModel.secondTeamId = match.results![0].team_id!
                firstTeamWinImg.isHidden = true
                secondTeamWinImg.isHidden = false
            }
            if match.status == "not_started" {
                self.firstTeamScore.text = ""
                self.secondTeamScore.text = ""
                headerModel.result = "TBA"
                firstTeamWinImg.isHidden = true
                secondTeamWinImg.isHidden = true
            }
            DispatchQueue.main.async {
                _ = NetworkManager.sharedInstance.getImageForEndpoint(endPoint: (match.opponents![0].opponent?.image_url!)!).done { (response) in
                    self.firstTeamImage.image = UIImage.init(data: response.body!)
                    self.headerModel.firstTeamLogoImage = UIImage.init(data: response.body!)!
                }
            }
            self.firstTeamName.text = match.opponents![0].opponent?.name
            headerModel.firstTeamName = (match.opponents![0].opponent?.name)!
            
            
            self.secondTeamName.text = match.opponents![1].opponent?.name
            headerModel.secondTeamName = (match.opponents![1].opponent?.name)!
            DispatchQueue.main.async {
                _ = NetworkManager.sharedInstance.getImageForEndpoint(endPoint: (match.opponents![1].opponent?.image_url!)!).done { (response) in
                    self.secondTeamImage.image = UIImage.init(data: response.body!)
                    self.headerModel.secondTeamLogoImage = UIImage.init(data: response.body!)!
                }
            }
        } else if match.opponents!.count == 1 {
            self.firstTeamScore.text = ""
            self.secondTeamScore.text = ""
            self.firstTeamName.text = match.opponents![0].opponent?.name
            _ = NetworkManager.sharedInstance.getImageForEndpoint(endPoint: (match.opponents![0].opponent?.image_url!)!).done { (response) in
                self.firstTeamImage.image = UIImage.init(data: response.body!)
            }
            self.secondTeamName.text = "TBA"
            self.secondTeamImage.image = UIImage(named: "TBA")
        } else {
            self.firstTeamScore.text = ""
            self.secondTeamScore.text = ""
            self.firstTeamName.text = "TBA"
            self.firstTeamImage.image = UIImage(named: "TBA")
            self.secondTeamName.text = "TBA"
            self.secondTeamImage.image = UIImage(named: "TBA")
        }
        
    }
    
}
