//
//  SearchField.swift
//  Rhythm
//
//  Created by Batuhan on 9.05.2023.
//

import UIKit

final class SearchField: UITextField {
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
        layer.borderColor = UIColor.border.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 0
        tintColor = UIColor.primary
        backgroundColor = UIColor.clear
        attributedPlaceholder = NSAttributedString(string: "Search album or artist", attributes: [NSAttributedString.Key.foregroundColor: UIColor.text_secondry])
        
        changeIconImage(named: "search")
    }
    
    func didBeginEditingSettings() {
        layer.borderColor = UIColor.text_secondry.cgColor
        changeIconImage(named: "search.fill")
    }
    
    func didEndEditingSettings() {
        layer.borderColor = UIColor.border.cgColor
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
