//
//  Typo.swift
//  Rhythm
//
//  Created by Batuhan on 10.05.2023.
//

import UIKit

class Typography {

    struct FontStyle {
        let font: UIFont
        let lineHeight: CGFloat
    }

    static let h1_black = FontStyle(font: UIFont(name: "Satoshi-Black", size: 48)!, lineHeight: 64)
    static let h1_regular = FontStyle(font: UIFont(name: "Satoshi-Regular", size: 48)!, lineHeight: 64)
    
    static let h2_black = FontStyle(font: UIFont(name: "Satoshi-Black", size: 40)!, lineHeight: 56)
    static let h2_regular = FontStyle(font: UIFont(name: "Satoshi-Regular", size: 40)!, lineHeight: 56)
    
    static let h3_black = FontStyle(font: UIFont(name: "Satoshi-Black", size: 32)!, lineHeight: 48)
    static let h3_regular = FontStyle(font: UIFont(name: "Satoshi-Regular", size: 32)!, lineHeight: 48)
    
    static let sh1_bold = FontStyle(font: UIFont(name: "Satoshi-Bold", size: 24)!, lineHeight: 32)
    static let sh1_regular = FontStyle(font: UIFont(name: "Satoshi-Regular", size: 24)!, lineHeight: 32)
    
    static let sh2_bold = FontStyle(font: UIFont(name: "Satoshi-Bold", size: 20)!, lineHeight: 32)
    static let sh2_regular = FontStyle(font: UIFont(name: "Satoshi-Regular", size: 20)!, lineHeight: 32)
    
    static let b1_bold = FontStyle(font: UIFont(name: "Satoshi-Bold", size: 16)!, lineHeight: 24)
    static let b1_medium = FontStyle(font: UIFont(name: "Satoshi-Medium", size: 16)!, lineHeight: 24)
    
    static let b2_bold = FontStyle(font: UIFont(name: "Satoshi-Bold", size: 14)!, lineHeight: 22)
    static let b2_medium = FontStyle(font: UIFont(name: "Satoshi-Medium", size: 14)!, lineHeight: 22)
    
    static let b3_bold = FontStyle(font: UIFont(name: "Satoshi-Bold", size: 12)!, lineHeight: 16)
    static let b3_medium = FontStyle(font: UIFont(name: "Satoshi-Medium", size: 12)!, lineHeight: 16)
    
    static let b4_bold = FontStyle(font: UIFont(name: "Satoshi-Bold", size: 10)!, lineHeight: 14)
    static let b4_medium = FontStyle(font: UIFont(name: "Satoshi-Medium", size: 10)!, lineHeight: 14)

    
}

enum FontStyles: String {
    case h1_black
    case h1_regular
    
    case h2_black
    case h2_regular
    
    case h3_black
    case h3_regular
    
    case sh1_bold
    case sh1_regular
    
    case sh2_bold
    case sh2_regular
    
    case b1_bold
    case b1_medium
    
    case b2_bold
    case b2_medium
    
    case b3_bold
    case b3_medium
    
    case b4_bold
    case b4_medium
    
}
