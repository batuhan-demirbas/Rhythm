//
//  Int+Extension.swift
//  Rhythm
//
//  Created by Batuhan on 12.05.2023.
//

import Foundation

extension Int {
    func asFormattedString() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        formatter.groupingSize = 3
        
        if let formattedString = formatter.string(from: NSNumber(value: self)) {
            return formattedString
        } else {
            return "\(self)"
        }
    }
    
    func asMinutesSeconds() -> String {
        let minutes = self / 60
        let seconds = self % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
    
}
