//
//  DrawingView.swift
//  CoreGraphicsDemo
//
//  Created by Dilum De Silva on 2021-03-13.
//

import UIKit

class DrawingView: UIView {
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 187, y: 50))
        path.addLine(to: CGPoint(x: 250, y: 150))
        path.addLine(to: CGPoint(x: 120, y: 150))
        path.close()
        
        path.lineWidth = 2.0
        path.fill()
        path.stroke()
       
    }
}
