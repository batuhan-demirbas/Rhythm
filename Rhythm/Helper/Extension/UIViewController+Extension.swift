//
//  UIViewController+Extensiom.swift
//  Rhythm
//
//  Created by Batuhan on 9.05.2023.
//

import UIKit

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
