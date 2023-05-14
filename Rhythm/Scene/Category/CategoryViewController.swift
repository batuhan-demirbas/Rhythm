//
//  CategoryViewController.swift
//  Rhythm
//
//  Created by Batuhan on 8.05.2023.
//

import UIKit

final class CategoryViewController: BaseViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var viewModel: CategoryViewModel! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.load()
    }
    
}

extension CategoryViewController: CategoryViewModelDelegate {
    func prepareViews() {
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "back")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "back")
        self.navigationController?.navigationBar.tintColor = UIColor(named: "text.primary")
        
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(named: "text.primary") ?? UIColor.black,
            NSAttributedString.Key.font: UIFont(name: "Satoshi-Bold", size: 20) ?? UIFont.systemFont(ofSize: 20)
        ]
        
    }
    
    func prepareCollectionView() {
        collectionView.register(cellClass: CategoryCollectionViewCell.self)
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
}

extension CategoryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedArtist = viewModel.artists[indexPath.row]
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let viewModel = ArtistViewModel(artistId: selectedArtist.id)
        let viewController = ArtistViewController(nibName: "ArtistViewController", bundle: nil)
        viewController.viewModel = viewModel
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension CategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(cellClass: CategoryCollectionViewCell.self, indexPath: indexPath)
        cell.artist = viewModel.artists[indexPath.row]
        cell.configure()
        return cell
    }
}

extension CategoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 48 - 16) / 2
        let height = width
        return CGSize(width: width, height: height)
    }
}
