//
//  SplashViewController.swift
//  Rhythm
//
//  Created by Batuhan on 8.05.2023.
//

import UIKit

final class SplashViewController: UIViewController {
    
    var viewModel: SplashViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel = SplashViewModel()
        viewModel.load()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showHome" {
            if let navController = segue.destination as? UINavigationController,
               let tabBarController = navController.topViewController as? UITabBarController,
               let homeVC = tabBarController.viewControllers?[0] as? HomeViewController,
               let data = sender as? [GenreDatum] {
                homeVC.viewModel = HomeViewModel(genres: data)
            }
        }
    }
    
}

extension SplashViewController: SplashViewModelDelegate {
    func showHome() {
        self.performSegue(withIdentifier: "showHome", sender: viewModel.genres)
    }
    
}
