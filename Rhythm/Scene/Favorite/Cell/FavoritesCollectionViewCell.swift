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

class FavoritesCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!
    
    static let reuseIdentifier: String = "FavoritesCollectionViewCell"
    weak var delegate: FavoritesCollectionViewCellDelegate?
    var track: Favorites?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.layer.borderColor = UIColor(named: "stroke.border")?.cgColor
        imageView.layer.borderWidth = 1
        let screenWidth = UIScreen.main.bounds.width
        let width = (screenWidth - 48 - 16) / 2
        let height = width
        imageView.addLinearGradient(width: width, height: height, alpha: 0.85)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapIcon))
        iconImageView.addGestureRecognizer(tapGesture)
        
    }
    
    func configure() {
        guard let track = track else { return }
        imageView.loadImage(from: track.image ?? "")
        nameLabel.text = track.name
        durationLabel.text = Int(track.duration).asMinutesSeconds()
        
    }
    
    @objc func didTapIcon() {
        let manager = CoreDataManager.shared
        manager.deleteFavorite(favorite: track!)
        delegate?.didTapIconInCell(self)
        
    }
    
}
