//
//  AlbumViewController.swift
//  Rhythm
//
//  Created by Batuhan on 8.05.2023.
//

import UIKit

final class AlbumViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var albumNameLabel: UILabel!
    @IBOutlet private weak var albumDescriptionLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    
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
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor(named: "stroke.border")?.cgColor
        albumDescriptionLabel.text = "\(viewModel.artistName) • \(viewModel.numberOfItems) " + "favroite_subtitle"~
        albumNameLabel.text = viewModel.title
    }
    
    func prepareCollectionView() {
        collectionView.register(cellClass: AlbumCollectionViewCell.self)
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
        let cell = collectionView.dequeueReusableCell(cellClass: AlbumCollectionViewCell.self, indexPath: indexPath)
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



