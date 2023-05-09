//
//  UINib+Extension.swift
//  Rhythm
//
//  Created by Batuhan on 9.05.2023.
//

import Foundation
import UIKit

extension UINib {
    static func loadNib(name: String) -> UINib {
        return UINib(nibName: name, bundle: nil)
    }
}
