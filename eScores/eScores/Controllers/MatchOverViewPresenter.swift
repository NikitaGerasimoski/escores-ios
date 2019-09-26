//
//  MatchOverVIewPresenter.swift
//  eScores
//
//  Created by Nikita Gerasimoski on 9/19/19.
//  Copyright © 2019 Nikita Gerasimoski. All rights reserved.
//

import Foundation
import PromiseKit

class MatchOverViewPresenter: NSObject {
    var matches = [Match]()
    var viewController: MatchOverViewController!
    func provideMatchesForGivenDate(date: Date) {
           NetworkManager.sharedInstance.getMatchesForDate(date: date).done { (response) in
            print(response)
            let jsonDecoder = JSONDecoder()
            self.matches = try jsonDecoder.decode([Match].self, from: response.body!)
            if let vc = self.viewController {
                vc.date = date
                vc.updateUI()
            }
            } .catch({ (error) in
                print(error)
            })
        }
}


