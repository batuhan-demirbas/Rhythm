//
//  UIImageView.swift
//  Rhythm
//
//  Created by Batuhan on 9.05.2023.
//

import UIKit
import Kingfisher

extension UIImageView {
    func addLinearGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0).cgColor,
            UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.85).cgColor,
        ]
        gradientLayer.locations = [0.0, 1.0]
        let screenWidth = UIScreen.main.bounds.width
        let width = screenWidth - 48 - 16 / 2
        let height = width
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
