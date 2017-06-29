//
//  CustomAnimationController.swift
//  SWiftAnimation
//
//  Created by 瞄财网 on 2017/6/29.
//  Copyright © 2017年 瞄财网. All rights reserved.
//

import UIKit

class CustomAnimationController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension CustomAnimationController : UIViewControllerAnimatedTransitioning
{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2.0
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
       
    }
}
//extension CustomAnimationController: UIViewControllerContextTransitioning{
//    func viewController(forKey key: UITransitionContextViewControllerKey) -> UIViewController? {
//        return nil
//    }
//    
//}
