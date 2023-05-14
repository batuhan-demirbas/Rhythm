//
//  UIImageView.swift
//  Rhythm
//
//  Created by Batuhan on 9.05.2023.
//

import UIKit
import Kingfisher

@IBDesignable
extension UIImageView {
    func addLinearGradient(width: CGFloat, height: CGFloat, alpha: CGFloat) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0).cgColor,
            UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: alpha).cgColor,
        ]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = CGRect(x: 0, y: 0, width: width, height: height)
        layer.addSublayer(gradientLayer)
    }
    
    func loadImage(from urlString: String) {
        if let url = URL(string: urlString) {
            DispatchQueue.main.async {
                ImageCache.default.cleanExpiredDiskCache()
            }
            let options: KingfisherOptionsInfo = [.diskCacheExpiration(.days(3))]
            kf.setImage(with: url, options: options)
        }
    }
}
