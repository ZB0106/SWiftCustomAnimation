//
//  ZB_PushAnimation.swift
//  SWiftAnimation
//
//  Created by 瞄财网 on 2017/6/30.
//  Copyright © 2017年 瞄财网. All rights reserved.
//

import UIKit

class ZB_PushAnimation: NSObject, UIViewControllerAnimatedTransitioning{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2.0
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
        let containerView = transitionContext.containerView
//        let tempView = fromView? .snapshotView(afterScreenUpdates: true)
//        
//        toView?.isHidden = false
//        fromView?.isHidden = true
//        containerView .addSubview(tempView!)
//        containerView .addSubview(fromView!)
        fromView?.removeFromSuperview()
        containerView .addSubview(toView!)
        CATransaction .begin()
        CATransaction .setCompletionBlock { 
           
        }
        let transition = CATransition .init()
        transition.type = kCATransitionReveal
        transition.subtype = kCATransitionFromTop
        transition.duration = 2.0
        containerView.layer .add(transition, forKey: nil)
        CATransaction .commit()
        transitionContext .completeTransition(true)
        print(toView!,fromView!,containerView)
    }
    
}

