//
//  CustomDynamicAnimator.swift
//  Learn_Swift_Animation
//
//  Created by Limingkai on 16/12/20.
//  Copyright © 2016年 ctbri. All rights reserved.
//

import UIKit

class CustomDynamicAnimator: NSObject,UIViewControllerAnimatedTransitioning {
    open var duration: TimeInterval = 2
    open var spriteWidth: CGFloat = 20
    
    fileprivate var animator: UIDynamicAnimator!
    
    fileprivate func randomFloatBetween(_ smallNumber: CGFloat, and bigNumber: CGFloat) -> CGFloat {
        let diff = bigNumber - smallNumber
        return (CGFloat(arc4random()) / 100.0).truncatingRemainder(dividingBy: diff) + smallNumber
    }
    
    open func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    open func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let fromView = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!.view
        let toView = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!.view
        containerView.addSubview(toView!)
        containerView.sendSubview(toBack: toView!)
        
        let size = fromView!.frame.size
        
        let fromSnapshot = fromView?.snapshotView(afterScreenUpdates: false)
        animator = UIDynamicAnimator(referenceView: containerView)
        var snapshots = [UIView]()
        for x in stride(from: CGFloat(0), to: size.width, by: spriteWidth) {
            for y in stride(from: CGFloat(0), to: size.height, by: spriteWidth) {
                let region = CGRect(x: x, y: y, width: spriteWidth, height: spriteWidth)
                let snapshot = fromSnapshot?.resizableSnapshotView(from: region, afterScreenUpdates: false, withCapInsets: .zero)
                containerView.addSubview(snapshot!)
                snapshot?.frame = region
                snapshots.append(snapshot!)
                let push = UIPushBehavior(items: [snapshot!], mode: .instantaneous)
                push.active = true
                push.pushDirection = CGVector(dx: 0, dy: randomFloatBetween(0 , and: 0.1))
                animator.addBehavior(push)
            }
        }
        let gravity = UIGravityBehavior(items: snapshots)
        animator.addBehavior(gravity)
        fromView?.removeFromSuperview()
              DispatchQueue.global().asyncAfter(deadline: .now() + duration) {
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        
    }
}
