//
//  UICollectionView+Extension.swift
//  Rhythm
//
//  Created by Batuhan on 14.05.2023.
//

import UIKit

extension UICollectionView {
    
    func register<T: UICollectionViewCell>(cellClass: T.Type) {
        let nibName = String(describing: cellClass)
        let nib = UINib(nibName: nibName, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: nibName)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(cellClass: T.Type, indexPath: IndexPath) -> T {
        let name = String(describing: cellClass)
        return self.dequeueReusableCell(withReuseIdentifier: name, for: indexPath) as! T
    }
    
    
}
