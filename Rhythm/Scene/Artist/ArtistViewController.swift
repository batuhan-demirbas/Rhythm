//
//  ArtistViewController.swift
//  Rhythm
//
//  Created by Batuhan on 8.05.2023.
//

import UIKit

class ArtistViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    var viewModel: ArtistViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.load()
    }

}

extension ArtistViewController: ArtistViewModelDelegate {
    func prepareViews() {
        imageView.loadImage(from: viewModel.image)
        let screenWidth = UIScreen.main.bounds.width
        imageView.addLinearGradient(width: screenWidth, height: screenWidth, alpha: 0.85)
        nameLabel.text = viewModel.name
        followersLabel.text = viewModel.followers.asFormattedString() + "artist_followers"~
    }
    
    func prepareCollectionView() {
        collectionView.register(UINib.loadNib(name: ArtistCollectionViewCell.reuseIdentifier), forCellWithReuseIdentifier: ArtistCollectionViewCell.reuseIdentifier)
    }

    func reloadData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension ArtistViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewModel = AlbumViewModel(albumId: viewModel.albums[indexPath.row].id)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "AlbumViewController") as? AlbumViewController else {
            return
        }
        viewController.viewModel = viewModel
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension ArtistViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArtistCollectionViewCell.reuseIdentifier, for: indexPath) as! ArtistCollectionViewCell
        cell.configure(album: viewModel.albums[indexPath.row])
        return cell
    }
}

extension ArtistViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 48)
        let height = width * 0.165
        return CGSize(width: width, height: height)
    }
}

