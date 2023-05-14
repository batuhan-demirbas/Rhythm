//
//  Greeting.swift
//  Rhythm
//
//  Created by Batuhan on 12.05.2023.
//

import Foundation

final class GreetingManager {
    static func getGreetingMessage() -> String {
        let date = Date()
        let hours = Calendar.current.component(.hour, from: date)
        var message: String
        
        switch hours {
        case 6...12:
            message = "home_title_morning"~
        case 13...16:
            message = "home_title_evening"~
        case 17...20:
            message = "home_title_afternoon"~
        default:
            message = "home_title_night"~
        }
        return message
    }
}
