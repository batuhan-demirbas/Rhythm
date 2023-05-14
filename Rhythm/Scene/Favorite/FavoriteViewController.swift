//
//  FavoriteViewController.swift
//  Rhythm
//
//  Created by Batuhan on 8.05.2023.
//

import UIKit

final class FavoriteViewController: UIViewController {
    @IBOutlet private var label: UILabel!
    @IBOutlet private var collectionView: UICollectionView!
    
    var viewModel: FavoriteViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.delegate = self
        viewModel = FavoriteViewModel()
        viewModel.load()
        
    }
    
}

extension FavoriteViewController: FavoriteViewModelDelegate {
    func prepareViews() {
        label.text = String(viewModel.numberOfItems) + "favroite_subtitle"~
    }
    
    func prepareCollectionView() {
        collectionView.register(UINib.loadNib(name: FavoritesCollectionViewCell.reuseIdentifier), forCellWithReuseIdentifier: FavoritesCollectionViewCell.reuseIdentifier)
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension FavoriteViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension FavoriteViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoritesCollectionViewCell.reuseIdentifier, for: indexPath) as! FavoritesCollectionViewCell
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
    func didTapIconInCell(_ cell: FavoritesCollectionViewCell) {
        viewModel.load()
        label.text = "\(viewModel.numberOfItems) songs"
        collectionView.reloadData()
    }
    
}

extension FavoriteViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is FavoriteViewController {
            viewModel.load()
            collectionView.reloadData()
        }
        return true
    }
}
