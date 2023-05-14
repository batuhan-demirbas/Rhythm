//
//  CollectionViewCell.swift
//  Rhythm
//
//  Created by Batuhan on 9.05.2023.
//

import UIKit
import SkeletonView

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var label: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.layer.borderColor = UIColor(named: "stroke.border")?.cgColor
        imageView.layer.borderWidth = 1
        let screenWidth = UIScreen.main.bounds.width
        let width = (screenWidth - 48 - 16) / 2
        let height = width
        imageView.addLinearGradient(width: width, height: height, alpha: 0.85)
        
    }
    
    func configure(genre: GenreDatum) {
        imageView.loadImage(from: genre.pictureBig)
        label.text = genre.name
        
    }
}
