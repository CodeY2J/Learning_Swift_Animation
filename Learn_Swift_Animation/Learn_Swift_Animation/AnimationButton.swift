//
//  AnimationButton.swift
//  Learn_Swift_Animation
//
//  Created by Limingkai on 16/12/13.
//  Copyright © 2016年 ctbri. All rights reserved.
//

import UIKit

class AnimationButton: UIButton {
    
    public var fill: Bool = false
    
    fileprivate func animation(_ beginTime: CFTimeInterval) {
        let width = frame.width
        let height = frame.height
        let radius = max(width, height)
        let circlePath1 = UIBezierPath(arcCenter: CGPoint(x: width / 2, y: height / 2), radius: radius / 3, startAngle: CGFloat(0), endAngle: CGFloat(M_PI * 2), clockwise: true)
        
        let circlePath2 = UIBezierPath(arcCenter: CGPoint(x: width / 2, y: height / 2), radius: radius * 3, startAngle: CGFloat(0), endAngle: CGFloat(M_PI * 2), clockwise: true)

        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.green.cgColor
        shapeLayer.lineWidth = 2.0
        shapeLayer.path = circlePath1.cgPath
        if fill {
            shapeLayer.fillColor = UIColor.green.cgColor
        } else {
            shapeLayer.fillColor = UIColor.clear.cgColor
        }
        layer.addSublayer(shapeLayer)
        
        let pathAnimation = CABasicAnimation(keyPath: "path")
        pathAnimation.fromValue = circlePath1.cgPath
        pathAnimation.toValue = circlePath2.cgPath
        
        let alphaAnimation = CABasicAnimation(keyPath: "opacity")
        alphaAnimation.fromValue = 1
        alphaAnimation.toValue = 0
        
        let animationGroup = CAAnimationGroup()
        animationGroup.beginTime = beginTime
        animationGroup.animations = [pathAnimation,alphaAnimation]
        animationGroup.duration = 2.4
        animationGroup.repeatCount = MAXFLOAT
        animationGroup.isRemovedOnCompletion = false
        
        shapeLayer.add(animationGroup, forKey: "wave")
    }
    
    public func wave() {
        animation(CACurrentMediaTime())
        animation(CACurrentMediaTime() + 0.8)
        animation(CACurrentMediaTime() + 1.6)
    }

}
