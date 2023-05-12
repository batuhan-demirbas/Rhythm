//
//  UILabel+Extension.swift
//  Rhythm
//
//  Created by Batuhan on 9.05.2023.
//

import UIKit

protocol XIBLocalizable {
    var localizedKey: String? { get set }
}

@IBDesignable extension UILabel {
    
    @IBInspectable var localizedKey: String? {
        get { return nil }
        set {
            text = newValue?.localized
        }
    }

    @IBInspectable var fontStyle: String {
        get {
            return font.fontName
        }
        set {
            guard let newStyle = FontStyles(rawValue: newValue) else {
                fatalError("Font style not found.")
            }
            fontStyleEnum = newStyle
        }
    }
    
    var fontStyleEnum: FontStyles {
        get {
            guard let style = FontStyles(rawValue: font.fontName) else {
                fatalError("Font style not found.")
            }
            return style
        }
        set {
            switch newValue {
            case .h1_black:
                setTypographyStyle(Typography.h1_black)
            case .h1_regular:
                setTypographyStyle(Typography.h1_regular)
            case .h2_black:
                setTypographyStyle(Typography.h2_black)
            case .h2_regular:
                setTypographyStyle(Typography.h2_regular)
            case .h3_black:
                setTypographyStyle(Typography.h3_black)
            case .h3_regular:
                setTypographyStyle(Typography.h3_regular)
            case .sh1_bold:
                setTypographyStyle(Typography.sh1_bold)
            case .sh1_regular:
                setTypographyStyle(Typography.sh1_regular)
            case .sh2_bold:
                setTypographyStyle(Typography.sh2_bold)
            case .sh2_regular:
                setTypographyStyle(Typography.sh2_regular)
            case .b1_bold:
                setTypographyStyle(Typography.b1_bold)
            case .b1_medium:
                setTypographyStyle(Typography.b1_medium)
            case .b2_bold:
                setTypographyStyle(Typography.b2_bold)
            case .b2_medium:
                setTypographyStyle(Typography.b2_medium)
            case .b3_bold:
                setTypographyStyle(Typography.b3_bold)
            case .b3_medium:
                setTypographyStyle(Typography.b3_medium)
            case .b4_bold:
                setTypographyStyle(Typography.b4_bold)
            case .b4_medium:
                setTypographyStyle(Typography.b4_medium)
            }
        }
    }

    private func setTypographyStyle(_ style: Typography.FontStyle) {
        let paragraphStyle = NSMutableParagraphStyle()

        let attributedString = NSMutableAttributedString(string: text ?? "", attributes: [
            .font: style.font,
            .paragraphStyle: paragraphStyle
        ])

        attributedText = attributedString
    }

}
