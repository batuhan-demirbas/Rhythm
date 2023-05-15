//
//  AudioPlayerView.swift
//  Rhythm
//
//  Created by Batuhan on 14.05.2023.
//

import UIKit

protocol AudioPlayerViewDelegate: AnyObject {
    func didTappedPlayButton()
    func didTappedPauseButton()
}

class AudioPlayerView: UIView {
    
    let kCONTENT_XIB_NAME = "AudioPlayerView"
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var background: UIImageView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var trackLabel: UILabel!
    @IBOutlet private weak var artistLabel: UILabel!
    @IBOutlet private weak var playIcon: UIImageView!
    
    weak var delegate: AudioPlayerViewDelegate?
    var buttonState = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(kCONTENT_XIB_NAME, owner: self, options: nil)
        contentView.fixInView(self)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 0.21, green: 0.24, blue: 0.69, alpha: 0.3).cgColor,
            UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0).cgColor,
        ]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        layer.addSublayer(gradientLayer)
        
        imageView.addStroke()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapPlayButton))
        playIcon.addGestureRecognizer(tapGesture)
        
    }
    
    func configure(Selected track: TracksDatum) {
        self.imageView.loadImage(from: track.album.coverBig )
        self.trackLabel.text = track.title
        self.artistLabel.text = track.artist.name
        self.isHidden = false
        self.playIcon.image = UIImage.pause
        
    }
    
    func configure(Selected track: Favorites) {
        self.imageView.loadImage(from: track.image ?? "")
        self.trackLabel.text = track.trackName
        self.artistLabel.text = track.artistName
        self.isHidden = false
        self.playIcon.image = UIImage.pause
        
    }
    
    @objc func didTapPlayButton() {
        switch buttonState {
        case false:
            playIcon.image = UIImage.pause
            delegate?.didTappedPlayButton()
            buttonState = true
        case true:
            playIcon.image = UIImage.play
            delegate?.didTappedPauseButton()
            buttonState = false
        }
    }
    
    
}

extension UIView
{
    func fixInView(_ container: UIView!) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
}
