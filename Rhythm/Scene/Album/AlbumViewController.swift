//
//  AlbumViewController.swift
//  Rhythm
//
//  Created by Batuhan on 8.05.2023.
//

import UIKit

class AlbumViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var albumDescriptionLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    var viewModel: AlbumViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.load()
    }

}

extension AlbumViewController: AlbumViewModelDelegate {
    func prepareViews() {
        imageView.loadImage(from: viewModel.image)
        albumNameLabel.text = viewModel.artistName
    }
    
    func prepareCollectionView() {
        collectionView.register(UINib.loadNib(name: AlbumCollectionViewCell.reuseIdentifier), forCellWithReuseIdentifier: AlbumCollectionViewCell.reuseIdentifier)
    }

    func reloadData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension AlbumViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}

extension AlbumViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCollectionViewCell.reuseIdentifier, for: indexPath) as! AlbumCollectionViewCell
        cell.delegate = self
        cell.configure(track: viewModel.getTrack(indexPath: indexPath))
        return cell
    }
}

extension AlbumViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 48)
        let height = width * 0.135
        return CGSize(width: width, height: height)
    }
}

extension AlbumViewController: AlbumCollectionViewCellDelegate {
    func didTapIconInCell(_ cell: AlbumCollectionViewCell) {
        viewModel.load()
        collectionView.reloadData()
    }
    
    
}



