//
//  HomeViewController.swift
//  Rhythm
//
//  Created by Batuhan on 8.05.2023.
//

import UIKit

final class HomeViewController: UIViewController {
    @IBOutlet var searchField: UITextField!
    @IBOutlet var collectionView: UICollectionView!

    var viewModel: HomeViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = HomeViewModel()
        viewModel.load()
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func prepareCollectionView() {
        collectionView.register(UINib.loadNib(name: HomeCollectionViewCell.reuseIdentifier), forCellWithReuseIdentifier: HomeCollectionViewCell.reuseIdentifier)
    }

    func reloadData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewModel = CategoryViewModel(genre: viewModel.genres[indexPath.row])
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "CategoryViewController") as? CategoryViewController else {
            return
        }
        viewController.viewModel = viewModel
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.reuseIdentifier, for: indexPath) as! HomeCollectionViewCell
        cell.genre = viewModel.genres[indexPath.row]
        cell.configure()
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
