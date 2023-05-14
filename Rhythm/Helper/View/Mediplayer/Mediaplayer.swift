//
//  MediaplayerView.swift
//  Rhythm
//
//  Created by Batuhan on 14.05.2023.
//

import UIKit

final class Mediaplayer: UIView {
    @IBOutlet private var contentView: UIView!
    @IBOutlet private var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("Mediaplayer", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
