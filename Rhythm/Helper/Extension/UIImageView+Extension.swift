//
//  UIImageView.swift
//  Rhythm
//
//  Created by Batuhan on 9.05.2023.
//

import UIKit

extension UIView {
    func addLinearGradient() {
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [
                UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0).cgColor,
                UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.85).cgColor
                
            ]
            gradientLayer.locations = [0.0, 1.0]
            gradientLayer.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
            self.layer.addSublayer(gradientLayer)
        }
}
