//
//  UILabel+Extension.swift
//  Rhythm
//
//  Created by Batuhan on 9.05.2023.
//

import UIKit

@IBDesignable extension UILabel {
    
    @IBInspectable var lineHeight: CGFloat {
        get {
            guard let paragraphStyle = attributedText?.attribute(NSAttributedString.Key.paragraphStyle, at: 0, effectiveRange: nil) as? NSMutableParagraphStyle else {
                return 0
            }
            return paragraphStyle.lineSpacing
        }
        set {
            guard let currentText = text else {
                return
            }
            let attributedString = NSMutableAttributedString(string: currentText)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = newValue
            attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        }
    }
    
}
