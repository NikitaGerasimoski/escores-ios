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
    
    
    @IBOutlet weak var secondTeamImage: UIImageView!
    @IBOutlet weak var secondTeamName: UILabel!
    @IBOutlet weak var secondTeamScore: UILabel!
    
    
    @IBOutlet weak var leagueLogoImage: UIImageView!
    @IBOutlet weak var leagueInfoLabel: UILabel!
    
    @IBOutlet weak var startTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCellForMatch(match: Match) {
        self.startTimeLabel.text = match.begin_at!.formatDateForCell()
        
        self.leagueInfoLabel.text = match.league!.name! + " " + match.serie!.full_name! + " " + match.tournament!.name!
        _ = NetworkManager.sharedInstance.getImageForEndpoint(endPoint: (match.league?.image_url!)!).done { (response) in
            self.leagueLogoImage.image = UIImage.init(data: response.body!)
        }
      
        if match.opponents![0].opponent?.id == match.results![0].team_id {
            self.firstTeamScore.text = "\(match.results![0].score!)"
            self.secondTeamScore.text = "\(match.results![1].score!)"
        } else {
            self.firstTeamScore.text = "\(match.results![1].score!)"
            self.secondTeamScore.text = "\(match.results![0].score!)"

        }
        
        self.firstTeamName.text = match.opponents![0].opponent?.name
        _ = NetworkManager.sharedInstance.getImageForEndpoint(endPoint: (match.opponents![0].opponent?.image_url!)!).done { (response) in
            self.firstTeamImage.image = UIImage.init(data: response.body!)
        }
        
        self.secondTeamName.text = match.opponents![1].opponent?.name
        _ = NetworkManager.sharedInstance.getImageForEndpoint(endPoint: (match.opponents![1].opponent?.image_url!)!).done { (response) in
            self.secondTeamImage.image = UIImage.init(data: response.body!)
        }
        
    }
    
}
