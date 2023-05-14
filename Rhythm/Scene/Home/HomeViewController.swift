//
//  HomeViewController.swift
//  Rhythm
//
//  Created by Batuhan on 8.05.2023.
//

import UIKit

final class HomeViewController: BaseViewController {
    @IBOutlet private var messageLabel: UILabel!
    @IBOutlet private var searchField: UITextField!
    @IBOutlet private var collectionView: UICollectionView!
    
    var viewModel: HomeViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.load()
        
    }
    
}

extension HomeViewController: HomeViewModelDelegate {
    func prepareViews() {
        messageLabel.text = GreetingManager.getGreetingMessage()
        
    }
    
    func prepareCollectionView() {
        collectionView.register(cellClass: HomeCollectionViewCell.self)
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedGenre = viewModel.genres[indexPath.row]
        let viewModel = CategoryViewModel(genre: selectedGenre)
        let viewController = CategoryViewController(nibName: "CategoryViewController", bundle: nil)
        viewController.viewModel = viewModel
        navigationController?.pushViewController(viewController, animated: true)
        
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(cellClass: HomeCollectionViewCell.self, indexPath: indexPath)
        cell.configure(genre: viewModel.genres[indexPath.row])
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 48 - 16) / 2
        let height = width
        return CGSize(width: width, height: height)
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        (textField as! SearchField).didBeginEditingSettings()
        hideKeyboardWhenTappedAround()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        (textField as! SearchField).didEndEditingSettings()
    }
}
