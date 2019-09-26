//
//  GameTableViewCell.swift
//  eScores
//
//  Created by Nikita Gerasimoski on 9/25/19.
//  Copyright © 2019 Nikita Gerasimoski. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {

    @IBOutlet weak var firstTeamImg: UIImageView!
    @IBOutlet weak var secondTeamImg: UIImageView!
    
    @IBOutlet weak var secondTeamWin: UIImageView!
    @IBOutlet weak var firstTeamWIn: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var gameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.scoreLabel.layer.borderColor = UIColor.black.cgColor
        self.scoreLabel.layer.borderWidth = 1
        self.scoreLabel.layer.cornerRadius = 2
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor(red: 254/255, green: 203/255, blue: 61/255, alpha: 1).cgColor
        self.clipsToBounds = true
        self.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
