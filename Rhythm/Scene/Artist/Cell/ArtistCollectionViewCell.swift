//
//  ArtistCollectionViewCell.swift
//  Rhythm
//
//  Created by Batuhan on 11.05.2023.
//

import UIKit

final class ArtistCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var yearLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.addStroke()
        
    }
    
    func configure(album: Datum) {
        imageView.loadImage(from: album.coverBig)
        nameLabel.text = album.title
        yearLabel.text = album.releaseDate.year
    }
    
}
