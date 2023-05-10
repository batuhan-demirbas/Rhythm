//
//  CollectionViewCell.swift
//  Rhythm
//
//  Created by Batuhan on 9.05.2023.
//

import UIKit
import SkeletonView

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!

    static let reuseIdentifier: String = "HomeCollectionViewCell"
    var genre: GenreDatum?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.layer.borderColor = UIColor(named: "stroke.border")?.cgColor
        imageView.layer.borderWidth = 1
        imageView.addLinearGradient()
        
    }

    func configure() {
        guard let genre = genre else { return }
        imageView.loadImage(from: genre.pictureBig)
        label.text = genre.name
        
    }
}
