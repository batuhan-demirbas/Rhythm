//
//  CategoryViewController.swift
//  Rhythm
//
//  Created by Batuhan on 8.05.2023.
//

import UIKit

class CategoryViewController: UIViewController {
    
    var viewModel: CategoryViewModel! {
        didSet {
            viewModel.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension CategoryViewController: CategoryViewModelDelegate {
    func prepareCollectionView() {
        //sfsdf
    }
    
    func reloadData() {
        //sfsdf
    }
    
    
    
}
