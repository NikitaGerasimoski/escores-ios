//
//  MatchDetailsPresenter.swift
//  eScores
//
//  Created by Nikita Gerasimoski on 9/25/19.
//  Copyright © 2019 Nikita Gerasimoski. All rights reserved.
//

import Foundation
import UIKit

class MatchDetailsPresenter {
    var firstTeamPlayers = [Player]()
    var secondTeamPlayer = [Player]()
    var viewController: MatchDetailsViewController!
    func getFirstTeamPlayers(id: Int) {
        NetworkManager.sharedInstance.getTeamForID(id: id).done { response in
            print(response)
            let jsonDecoder = JSONDecoder()
            let team = try jsonDecoder.decode([Team].self, from: response.body!)
            if team.count > 0 {
            self.firstTeamPlayers = team[0].players!
            } else {
                self.firstTeamPlayers = []
            }
            self.viewController.updateUI()
            } .catch({ (error) in
                print(error)
            })
    }
    
    func getSecondTeamPlayers(id: Int) {
        NetworkManager.sharedInstance.getTeamForID(id: id).done { response in
            print(response)
            let jsonDecoder = JSONDecoder()
            let team = try jsonDecoder.decode([Team].self, from: response.body!)
            if team.count > 0 {
            self.secondTeamPlayer = team[0].players!
            } else {
                self.secondTeamPlayer = []
            }
            self.viewController.updateUI()
            } .catch({ (error) in
                print(error)
            })
    }
    
}
