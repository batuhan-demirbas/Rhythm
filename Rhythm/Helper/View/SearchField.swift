//
//  SearchField.swift
//  Rhythm
//
//  Created by Batuhan on 9.05.2023.
//

import UIKit

@IBDesignable
class SearchField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configure()
    }
    
    private func configure() {
        layer.borderColor = UIColor(named: "stroke.border")?.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 0
        tintColor = UIColor(named: "main.primary")
        backgroundColor = UIColor(named: "input.color")
        attributedPlaceholder = NSAttributedString(string: "Search album or artist", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "text.secondry")])
        
        changeIconImage(named: "search")
    }
    
    func didBeginEditingSettings() {
        layer.borderColor = UIColor(named: "text.secondry")?.cgColor
        changeIconImage(named: "search.fill")
    }
    
    func didEndEditingSettings() {
        layer.borderColor = UIColor(named: "stroke.border")?.cgColor
        changeIconImage(named: "search")
    }
    
    func changeIconImage(named: String) {
        let icon = UIImage(named: named)
        let iconView = UIImageView(frame: CGRect(x: 16, y: 0, width: 24, height: 24))
        iconView.image = icon
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 34, height: 24))
        leftView?.addSubview(iconView)
        leftViewMode = .always
    }
}
