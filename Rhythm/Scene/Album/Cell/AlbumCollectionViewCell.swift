//
//  AlbumCollectionViewCell.swift
//  Rhythm
//
//  Created by Batuhan on 13.05.2023.
//

import UIKit

protocol AlbumCollectionViewCellDelegate: AnyObject {
    func didTapIconInCell(_ cell: AlbumCollectionViewCell)
}

final class AlbumCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var trackNameLabel: UILabel!
    @IBOutlet private weak var trackDuration: UILabel!
    @IBOutlet private weak var favIcon: UIImageView!
    
    weak var delegate: AlbumCollectionViewCellDelegate?
    
    var track: TracksDatum?
    var favorites: [Favorites] = []
    var foundFavorite: Favorites?
    var coreDataManager = CoreDataManager.shared
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func configure(track: TracksDatum) {
        self.track = track
        
        let coreDataManager = CoreDataManager.shared
        favorites = coreDataManager.fetchFavorites()
        
        if let foundFavorite = favorites.first(where: { $0.id == track.id }) {
            self.foundFavorite = foundFavorite
            favIcon.image = UIImage.heart_fill
        } else {
            favIcon.image = UIImage.heart
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapIcon))
        favIcon.addGestureRecognizer(tapGesture)
        
        trackNameLabel.text = track.title
        trackDuration.text = track.duration.asMinutesSeconds()
    }
    
    @objc func didTapIcon() {
        guard let track = track else { return }
        if foundFavorite != nil {
            coreDataManager.deleteFavorite(favorite: foundFavorite!)
        } else {
            coreDataManager.saveFavorite(id: track.id, trackName: track.title, artistName: track.artist.name, image: track.album.coverBig, link: track.preview, duration: track.duration)
        }
        delegate?.didTapIconInCell(self)
        
    }
    
}
