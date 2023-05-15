//
//  CategoryCollectionViewCell.swift
//  Rhythm
//
//  Created by Batuhan on 10.05.2023.
//

import UIKit

final class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var label: UILabel!
    
    var artist: ArtistsDatum?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.addStroke()
        let screenWidth = UIScreen.main.bounds.width
        let width = (screenWidth - 48 - 16) / 2
        let height = width
        imageView.addLinearGradient(width: width, height: height, alpha: 0.85)
        
    }
    
    func configure() {
        guard let artist = artist else { return }
        imageView.loadImage(from: artist.pictureBig)
        label.text = artist.name
        
    }
}
