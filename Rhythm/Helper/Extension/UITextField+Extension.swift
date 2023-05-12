//
//  UITextField+Extension.swift
//  Rhythm
//
//  Created by Batuhan on 12.05.2023.
//

import UIKit

extension UITextField {
    @IBInspectable var localizedKey: String? {
        get { return nil }
        set {
            placeholder = newValue?.localized
        }
    }
    
}
