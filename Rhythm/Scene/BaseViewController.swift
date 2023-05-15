//
//  BaseViewController.swift
//  Rhythm
//
//  Created by Batuhan on 14.05.2023.
//

import UIKit
import Network

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkNetwork()
    }
    
    func checkNetwork() {
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "InternetConnectionMonitor")
        monitor.start(queue: queue)

        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                
            } else {
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "No Internet Connection", message: "Please check your internet connection.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
}
