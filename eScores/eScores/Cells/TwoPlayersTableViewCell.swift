//
//  TwoPlayersTableViewCell.swift
//  eScores
//
//  Created by Nikita Gerasimoski on 9/25/19.
//  Copyright © 2019 Nikita Gerasimoski. All rights reserved.
//

import UIKit

class TwoPlayersTableViewCell: UITableViewCell {

    @IBOutlet weak var firstPlayerImage: UIImageView!
    @IBOutlet weak var firstPlayerName: UILabel!
   
    
    @IBOutlet weak var secondPlayerRoleImg: UIImageView!
    @IBOutlet weak var firstPlayerRoleImg: UIImageView!
    @IBOutlet weak var secondPlayerName: UILabel!
    @IBOutlet weak var secondPlayerImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUpWith(firstPlayer: Player?, secondPlayer: Player?) {
      
        self.layoutImageViews()
        if let firstPlayer = firstPlayer {
        self.firstPlayerName.text = firstPlayer.name!
            if let role = firstPlayer.role {
                firstPlayerRoleImg.backgroundColor = .white
                if role == "Support" {
                    firstPlayerRoleImg.image = UIImage(named: "sup")
                } else {
                    firstPlayerRoleImg.image = UIImage(named: role)
                }
            } else {
                firstPlayerRoleImg.backgroundColor = .clear
            }
        }
        if let secondPlayer = secondPlayer {
        self.secondPlayerName.text = secondPlayer.name!
        if let role = secondPlayer.role {
            secondPlayerRoleImg.backgroundColor = .white
             if role == "Support" {
                secondPlayerRoleImg.image = UIImage(named: "sup")
            } else {
                secondPlayerRoleImg.image = UIImage(named: role)
            }
        } else {
            secondPlayerRoleImg.backgroundColor = .clear
        }
        }
        DispatchQueue.main.async {
            if let firstPlayer = firstPlayer {
            if let firstPlayerUrl = firstPlayer.image_url {
               _ =  NetworkManager.sharedInstance.getImageForEndpoint(endPoint: firstPlayerUrl).done { (response) in
                    self.firstPlayerImage.image = UIImage(data: response.body!)
                }
            }
            } else {
                self.firstPlayerImage.isHidden = true
            }
            if let secondPlayer = secondPlayer {
            if let secondPlayerUrl = secondPlayer.image_url {
               _ =  NetworkManager.sharedInstance.getImageForEndpoint(endPoint: secondPlayerUrl).done { (response) in
                    self.secondPlayerImage.image = UIImage(data: response.body!)
                }
            }
            } else {
                self.secondPlayerImage.isHidden = true
            }
        }
    }
    
    func layoutImageViews(){
        self.firstPlayerImage.layer.borderWidth = 1
        self.firstPlayerImage.layer.masksToBounds = false
        self.firstPlayerImage.layer.borderColor = UIColor.black.cgColor
        self.firstPlayerImage.layer.cornerRadius = self.firstPlayerImage.frame.height/2
        self.firstPlayerImage.clipsToBounds = true
        
        self.secondPlayerImage.layer.borderWidth = 1
        self.secondPlayerImage.layer.masksToBounds = false
        self.secondPlayerImage.layer.borderColor = UIColor.black.cgColor
        self.secondPlayerImage.layer.cornerRadius = self.secondPlayerImage.frame.height/2
        self.secondPlayerImage.clipsToBounds = true
        
        self.firstPlayerRoleImg.layer.cornerRadius = 5
        self.firstPlayerRoleImg.clipsToBounds = true
        
        self.secondPlayerRoleImg.layer.cornerRadius = 5
        self.secondPlayerRoleImg.clipsToBounds = true
    }
}
