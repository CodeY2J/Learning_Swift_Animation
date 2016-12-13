//
//  LoadingView.swift
//  Learn_Swift_Animation
//
//  Created by Limingkai on 16/12/13.
//  Copyright © 2016年 ctbri. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    fileprivate var circleLayer = CAShapeLayer()
    fileprivate var backgroudLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    func setUp() {
        let radius = max(frame.width / 2, frame.height / 2) - 5;
        
        let path = UIBezierPath(arcCenter: CGPoint(x: frame.width / 2, y: frame.height / 2), radius: radius, startAngle: CGFloat(0), endAngle: CGFloat(M_PI * 2), clockwise: true).cgPath
        
        backgroudLayer.path = path
        backgroudLayer.fillColor = UIColor.clear.cgColor
        backgroudLayer.strokeColor = UIColor.gray.cgColor
        backgroudLayer.lineWidth = 5.0
        self.layer.addSublayer(backgroudLayer)
        
        circleLayer.frame = bounds
        circleLayer.path = path
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = UIColor.darkGray.cgColor
        circleLayer.lineWidth = 5.0
        circleLayer.strokeStart = 0.0
        circleLayer.strokeEnd = 0.6
        layer.addSublayer(circleLayer)
    
        animation()
        
    }
    func animation() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = 0
        animation.toValue = M_PI * 2
        animation.repeatCount = MAXFLOAT
        animation.duration = 2.0
        circleLayer.add(animation, forKey: "rotate")
    }

}
