//
//  DetailsHeaderModelk.swift
//  eScores
//
//  Created by Nikita Gerasimoski on 9/25/19.
//  Copyright © 2019 Nikita Gerasimoski. All rights reserved.
//

import Foundation
import UIKit

struct DetailsHeaderModel {
    var firstTeamName: String
    var secondTeamName: String
    var firstTeamLogoImage: UIImage
    var secondTeamLogoImage: UIImage
    var startTime: String
    var result: String
    var firstTeamId: Int
    var secondTeamId: Int
    var games = [Games]()
    init(firstTeamName: String = "", secondTeamName: String = "",firstTeamLogoImage: UIImage = UIImage(),secondTeamLogoImage: UIImage = UIImage(),startTime: String = "",result: String = "",firstTeamId: Int = 0 , secondTeamId: Int = 0) {
        self.firstTeamName = firstTeamName
        self.secondTeamName = secondTeamName
        self.firstTeamLogoImage = firstTeamLogoImage
        self.secondTeamLogoImage = secondTeamLogoImage
        self.result = result
        self.startTime = startTime
        self.secondTeamId = secondTeamId
        self.firstTeamId = firstTeamId
    }
}
