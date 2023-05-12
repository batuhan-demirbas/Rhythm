//
//  String.swift
//  Rhythm
//
//  Created by Batuhan on 12.05.2023.
//

import Foundation

extension String {
    var localized: String {
            return NSLocalizedString(self, comment: "")
        }
    
    var year: String? {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            if let date = dateFormatter.date(from: self) {
                dateFormatter.dateFormat = "yyyy"
                return dateFormatter.string(from: date)
            }
            return nil
        }
}

postfix operator ~
postfix func ~ (string: String) -> String {
    return NSLocalizedString(string, comment: "")
}
