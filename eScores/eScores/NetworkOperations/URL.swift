//
//  URL.swift
//  eScores
//
//  Created by Nikita Gerasimoski on 9/18/19.
//  Copyright © 2019 Nikita Gerasimoski. All rights reserved.
//

import Foundation

struct RestEndpoint {
    static let baseUrl = "https://api.pandascore.co/lol/"
    static let matchesUrl = "matches/"
    static let pastUrl  = "past"
    static let upcomingUrl  = "upcoming"
    static let runningUrl  = "running"
    static let dateFilter = "?filter[begin_at]="
    static let sort = "&sort=begin_at"
    static let mandatoryToken = "&token=8jDwaHXwOv46U59FUgt3rBoYZ99LFZC1hf9exlGYILiEhfhbdb4"
}
