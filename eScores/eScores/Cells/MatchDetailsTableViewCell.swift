//
//  MatchDetailsTableViewCell.swift
//  eScores
//
//  Created by Nikita Gerasimoski on 9/25/19.
//  Copyright © 2019 Nikita Gerasimoski. All rights reserved.
//

import UIKit

class MatchDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var firstTeamLogo: UIImageView!
    @IBOutlet weak var firstTeamName: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var secondTeamLogo: UIImageView!
    @IBOutlet weak var secondTeamName: UILabel!
    
    @IBOutlet weak var seriesTypeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUp(with headerModel: DetailsHeaderModel) {
        self.firstTeamName.text = headerModel.firstTeamName
        self.secondTeamName.text = headerModel.secondTeamName
        self.timeLabel.text = headerModel.startTime
        self.firstTeamLogo.image = headerModel.firstTeamLogoImage
        self.secondTeamLogo.image = headerModel.secondTeamLogoImage
        self.resultLabel.text = headerModel.result
    }
}
