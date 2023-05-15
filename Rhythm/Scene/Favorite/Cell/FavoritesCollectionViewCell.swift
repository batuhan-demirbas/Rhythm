//
//  FavoritesCollectionViewCell.swift
//  Rhythm
//
//  Created by Batuhan on 11.05.2023.
//

import UIKit

protocol FavoritesCollectionViewCellDelegate: AnyObject {
    func didTapIconInCell(_ cell: FavoritesCollectionViewCell)
}

final class FavoritesCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var iconImageView: UIImageView!
    
    weak var delegate: FavoritesCollectionViewCellDelegate?
    var track: Favorites?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.addStroke()
        let screenWidth = UIScreen.main.bounds.width
        let size = (screenWidth - 48 - 16) / 2
        imageView.addLinearGradient(width: size, height: size, alpha: 0.85)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapIcon))
        iconImageView.addGestureRecognizer(tapGesture)
        
    }
    
    func configure() {
        guard let track = track else { return }
        imageView.loadImage(from: track.image ?? "")
        nameLabel.text = track.trackName
        durationLabel.text = Int(track.duration).asMinutesSeconds()
        
    }
    
    @objc func didTapIcon() {
        let manager = CoreDataManager.shared
        manager.deleteFavorite(favorite: track!)
        delegate?.didTapIconInCell(self)
        
    }
    
}
