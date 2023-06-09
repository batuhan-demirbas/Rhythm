//
//  TabBar.swift
//  Rhythm
//
//  Created by Batuhan on 9.05.2023.
//

import UIKit

final class TabBar: UITabBar {
    
    let topLineColor = UIColor.border
    let topLineWidth: CGFloat = 1.0
    var isTopLineVisible = true
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if isTopLineVisible {
            topLineColor.setStroke()
            let topLinePath = UIBezierPath()
            topLinePath.lineWidth = topLineWidth
            
            let startPoint = CGPoint(x: 0, y: 0)
            topLinePath.move(to: startPoint)
            
            let endPoint = CGPoint(x: frame.width, y: 0)
            topLinePath.addLine(to: endPoint)
            topLinePath.stroke()
        }
    }
    
}

