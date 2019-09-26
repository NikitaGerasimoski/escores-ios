//
//  NetworkManager.swift
//  eScores
//
//  Created by Nikita Gerasimoski on 9/18/19.
//  Copyright © 2019 Nikita Gerasimoski. All rights reserved.
//

import Foundation
import GirdersSwift
import PromiseKit

class NetworkManager {
    static let sharedInstance = NetworkManager()
    let http = HTTPClient()
    
    func getMatchesForDate(date: Date) -> Promise<Response<Data>> {
        let dateString = date.formatDateForFilter()
        let customAllowedSet =  NSCharacterSet(charactersIn: "[,],+").inverted
        let url = URL(string: RestEndpoint.baseUrl + RestEndpoint.matchesUrl +  RestEndpoint.dateFilter.addingPercentEncoding(withAllowedCharacters: customAllowedSet)! + dateString + RestEndpoint.sort +  RestEndpoint.mandatoryToken)
        let request = Request(URL: url!, method: .GET, parameters: [:])
        return http.executeRequestAsync(request: request)
    }
    func getUpcomingMatches() -> Promise<Response<Data>> {
        let url = URL(string: RestEndpoint.baseUrl + RestEndpoint.matchesUrl + RestEndpoint.upcomingUrl + RestEndpoint.upSort +  RestEndpoint.mandatoryToken)
           let request = Request(URL: url!, method: .GET, parameters: [:])
           return http.executeRequestAsync(request: request)
       }
    
    func getImageForEndpoint(endPoint: String) -> Promise<Response<Data>> {
        let url = URL(string: endPoint)
        let request = Request(URL: url!,method: .GET)
        return http.executeRequestAsync(request: request)
    }
    
    func getTeamForID(id: Int) -> Promise<Response<Data>> {
        let url = URL(string: RestEndpoint.baseUrl + RestEndpoint.teamsUrl + RestEndpoint.teamIdFilter + "\(id)" + RestEndpoint.mandatoryToken)
        let request = Request(URL: url!,method: .GET)
        return http.executeRequestAsync(request: request)
    }
    
    
}


