//
//  ArtistCollectionViewCell.swift
//  Rhythm
//
//  Created by Batuhan on 11.05.2023.
//

import UIKit

final class ArtistCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var yearLabel: UILabel!
    
    static let reuseIdentifier: String = "ArtistCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.layer.borderColor = UIColor(named: "stroke.border")?.cgColor
        imageView.layer.borderWidth = 1
        
    }
    
    func configure(album: Datum) {
        imageView.loadImage(from: album.coverBig)
        nameLabel.text = album.title
        yearLabel.text = album.releaseDate.year
    }
    
}
