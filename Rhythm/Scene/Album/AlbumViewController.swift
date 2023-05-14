//
//  AlbumViewController.swift
//  Rhythm
//
//  Created by Batuhan on 8.05.2023.
//

import UIKit

final class AlbumViewController: BaseViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var albumNameLabel: UILabel!
    @IBOutlet private weak var albumDescriptionLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var audioPlayerView: AudioPlayerView!
    
    let audioPlayer = AudioPlayer()
    
    var viewModel: AlbumViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.load()
        audioPlayerView.delegate = self
    }
    
}

extension AlbumViewController: AlbumViewModelDelegate {
    func prepareViews() {
        imageView.loadImage(from: viewModel.image)
        imageView.addStroke()
        albumDescriptionLabel.text = "\(viewModel.artistName) • \(viewModel.numberOfItems) " + "favroite_subtitle"~
        albumNameLabel.text = viewModel.title
        NotificationCenter.default.addObserver(self, selector: #selector(songDidFinishPlaying), name: .AVPlayerItemDidPlayToEndTime, object: nil)

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
        let selectedTrack = viewModel.getTrack(indexPath: indexPath)
        if let url = URL(string: selectedTrack.preview ) {
            audioPlayer.playAudio(from: url)
            audioPlayerView.imageView.loadImage(from: selectedTrack.album.coverBig )
            audioPlayerView.trackLabel.text = selectedTrack.title
            audioPlayerView.artistLabel.text = selectedTrack.artist.name
            audioPlayerView.isHidden = false
            audioPlayerView.playIcon.image = UIImage(named: "pause")
        }
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
        viewModel.updateFavorites()
        collectionView.reloadData()
    }
    
}

extension AlbumViewController: AudioPlayerViewDelegate {
    func didTappedPauseButton() {
        audioPlayer.pauseAudio()
    }
    
    func didTappedPlayButton() {
        audioPlayer.resumeAudio()
    }
    
    @objc func songDidFinishPlaying() {
        audioPlayerView.isHidden = true
    }
    
}



