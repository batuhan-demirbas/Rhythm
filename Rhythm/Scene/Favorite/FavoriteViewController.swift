//
//  FavoriteViewController.swift
//  Rhythm
//
//  Created by Batuhan on 8.05.2023.
//

import UIKit

final class FavoriteViewController: BaseViewController {
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var audioPlayerView: AudioPlayerView!
    @IBOutlet private weak var notFoundStackView: UIStackView!
    
    let audioPlayer = AudioPlayer()
    
    var viewModel: FavoriteViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.delegate = self
        audioPlayerView.delegate = self
        viewModel = FavoriteViewModel()
        viewModel.load()
        
    }
    
}

extension FavoriteViewController: FavoriteViewModelDelegate {
    func prepareViews() {
        label.text = String(viewModel.numberOfItems) + "favroite_subtitle"~
        NotificationCenter.default.addObserver(self, selector: #selector(songDidFinishPlaying), name: .AVPlayerItemDidPlayToEndTime, object: nil)
    }
    
    func prepareCollectionView() {
        collectionView.register(cellClass: FavoritesCollectionViewCell.self)
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension FavoriteViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedTrack = viewModel.favorites[indexPath.row]
        if let url = URL(string: selectedTrack.link ?? "") {
            audioPlayer.playAudio(from: url)
            updateTabBarView(isTopLineVisible: false)
            audioPlayerView.configure(Selected: selectedTrack)
        }
    }
}

extension FavoriteViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        notFoundStackView.isHidden = viewModel.numberOfItems != 0
        return viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(cellClass: FavoritesCollectionViewCell.self, indexPath: indexPath)
        cell.delegate = self
        cell.track = viewModel.favorites[indexPath.row]
        cell.configure()
        return cell
    }
}

extension FavoriteViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 48
        let height = width * 0.165
        return CGSize(width: width, height: height)
    }
}

extension FavoriteViewController: FavoritesCollectionViewCellDelegate {
    func didTapIconInCell(_ cell: FavoritesCollectionViewCell, track: Favorites) {
        
        let alert = UIAlertController(title: "alert_description"~, message: nil , preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "alert_remove"~, style: .default) { _ in
            let manager = CoreDataManager.shared
            manager.deleteFavorite(favorite: track)
            self.viewModel.load()
            self.label.text = "\(self.viewModel.numberOfItems) songs"
            self.collectionView.reloadData()
        })
        
        alert.addAction(UIAlertAction(title: "alert_cancel"~, style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

extension FavoriteViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is FavoriteViewController {
            viewModel.load()
            collectionView.reloadData()
        }
        audioPlayer.pauseAudio()
        audioPlayerView.isHidden = true
        return true
    }
}

extension FavoriteViewController: AudioPlayerViewDelegate {
    func didTappedPauseButton() {
        audioPlayer.pauseAudio()
    }
    
    func didTappedPlayButton() {
        audioPlayer.resumeAudio()
    }
    
    @objc func songDidFinishPlaying() {
        audioPlayerView.isHidden = true
        updateTabBarView(isTopLineVisible: true)
    }
    
    func updateTabBarView(isTopLineVisible: Bool) {
        let tabBar = tabBarController!.tabBar as! TabBar
        tabBar.isTopLineVisible = isTopLineVisible
        tabBar.setNeedsDisplay()
    }
    
}
