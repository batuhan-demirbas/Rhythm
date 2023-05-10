//
//  ArtistViewController.swift
//  Rhythm
//
//  Created by Batuhan on 8.05.2023.
//

import UIKit

class ArtistViewController: UIViewController {

    var viewModel: ArtistViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension ArtistViewController: ArtistViewModelDelegate {
    func prepareCollectionView() {
        //dgf
    }
    
    func reloadData() {
        //sfs
    }
    
    
    
}
