//
//  WaveView.swift
//  Learn_Swift_Animation
//
//  Created by Limingkai on 16/12/19.
//  Copyright © 2016年 ctbri. All rights reserved.
//

import UIKit

class WaveView: UIView {
    fileprivate var animationLayer = CAShapeLayer()
    fileprivate var timer = Timer()
    fileprivate static var count = 0
    fileprivate var isLoad = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        if !isLoad {
            timer = Timer(timeInterval: 0.7, target: self, selector: #selector(animation), userInfo: nil
                , repeats: true)
            RunLoop.current.add(timer, forMode: .commonModes)
        }
        isLoad = true
    }
    
    func setUp() {
        animationLayer = CAShapeLayer()
        animationLayer.frame = bounds
        animationLayer.fillColor = UIColor.green.cgColor
        animationLayer.path = createBezierPath().cgPath
        layer.addSublayer(animationLayer)

    }
    
    func animation() {

        let oldPath = animationLayer.path
        let newPath = createBezierPath().cgPath
        
        let basicAnimation = CABasicAnimation(keyPath: "path")
        basicAnimation.duration = 0.7
        basicAnimation.fromValue = oldPath
        basicAnimation.toValue = newPath
        animationLayer.path = newPath
        
        animationLayer.add(basicAnimation, forKey: "path animation")
    }
    
    func createBezierPath() -> UIBezierPath {
        var topPointX: CGFloat = 0
        var topPointY: CGFloat = 0
        var bottomPointX: CGFloat = 0
        var bottomPointY: CGFloat = 0
        WaveView.count = WaveView.count + 1
        if WaveView.count % 2 == 0 {
            topPointX = random(frame.width * 0.3)
            topPointY = random(frame.height * 0.3)
            
            bottomPointX = random(frame.width * 0.7)
            bottomPointY = random(frame.height * 0.7)
        } else {
            topPointX = random(frame.width * 0.3)
            topPointY = random(frame.height * 0.7)
            
            bottomPointX = random(frame.width * 0.7)
            bottomPointY = random(frame.height * 0.3)
        }
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: frame.height / 2))
        path.addCurve(to: CGPoint(x: frame.width,y: frame.height / 2), controlPoint1: CGPoint(x: topPointX, y: topPointY), controlPoint2: CGPoint(x: bottomPointX, y: bottomPointY))
        path.addLine(to: CGPoint(x: frame.width, y: frame.height))
        path.addLine(to: CGPoint(x: 0, y: frame.height))
        path.close()
        
        return path
    }
    
    func random(_ num: CGFloat) -> CGFloat {
        return CGFloat(arc4random() % 10) + num
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
