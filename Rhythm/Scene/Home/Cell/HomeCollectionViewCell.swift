//
//  CollectionViewCell.swift
//  Rhythm
//
//  Created by Batuhan on 9.05.2023.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!

    static let reuseIdentifier: String = "HomeCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.layer.borderColor = UIColor(named: "stroke.border")?.cgColor
        imageView.layer.borderWidth = 1
        imageView.addLinearGradient()
    }

}
