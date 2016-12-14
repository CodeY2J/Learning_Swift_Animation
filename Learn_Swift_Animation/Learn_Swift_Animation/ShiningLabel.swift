//
//  ShiningLabel.swift
//  Learn_Swift_Animation
//
//  Created by Limingkai on 16/12/14.
//  Copyright © 2016年 ctbri. All rights reserved.
//

import UIKit

@IBDesignable
class ShiningLabel: UIView {
    
    let gradientLayer: CAGradientLayer = {
       let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0)
        
        let colors = [UIColor.black.cgColor,UIColor.white.cgColor,UIColor.black.cgColor]
        let locations = [0.25,0.5,0.75]
        gradientLayer.colors = colors
        gradientLayer.locations = locations as [NSNumber]?
       
        return gradientLayer
    }()
    
    let textAttributes: [String: AnyObject] = {
        let style = NSMutableParagraphStyle()
        style.alignment = .center

        return [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 30), NSParagraphStyleAttributeName: style]
    }()

    @IBInspectable var text: String! {
                didSet {
            setNeedsDisplay()
            let maskLayer = CALayer()
            maskLayer.backgroundColor = UIColor.clear.cgColor
            maskLayer.frame = bounds
            maskLayer.contents = createImageContent(text).cgImage
            gradientLayer.mask = maskLayer
        }
    }
    
    func createImageContent(_ text: String) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(frame.size, false, 0)
        text.draw(in: bounds, withAttributes: textAttributes)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    func animation() {
        let gradientAnimation = CABasicAnimation(keyPath: "locations")
        gradientAnimation.fromValue = [0.0, 0.0, 0.25]
        gradientAnimation.toValue = [0.75, 1.0, 1.0]
        gradientAnimation.duration = 1.7
        gradientAnimation.repeatCount = MAXFLOAT
        gradientAnimation.isRemovedOnCompletion = false
        gradientAnimation.fillMode = kCAFillModeForwards
        gradientLayer.add(gradientAnimation, forKey: "locations")
    }
    
    // MARK: - Life Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        layer.addSublayer(gradientLayer)
        animation()
    }

}
