//
//  DateUtils.swift
//  eScores
//
//  Created by Nikita Gerasimoski on 9/22/19.
//  Copyright © 2019 Nikita Gerasimoski. All rights reserved.
//

import Foundation

extension Date {
    func formatDateForFilter() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
    
    func formatDateForTitle() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        return formatter.string(from: self)
    }
    func formatDateForCell() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: self)
    }
}

extension String {
    func formatDateForCell() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = formatter.date(from: self)
        return date?.formatDateForCell() ?? ""
    }
}
