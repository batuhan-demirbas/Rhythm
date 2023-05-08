//
//  HomeViewController.swift
//  Rhythm
//
//  Created by Batuhan on 8.05.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    let viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModelConfiguration()
    }
    
    fileprivate func viewModelConfiguration() {
        viewModel.getGenre()
        viewModel.errorCallback = { errorMessage in
            print("error: \(errorMessage)")
        }
        viewModel.successCallback = { [weak self] in
            self?.label.text = self?.viewModel.genre?.data.first?.name
        }
    }

}
