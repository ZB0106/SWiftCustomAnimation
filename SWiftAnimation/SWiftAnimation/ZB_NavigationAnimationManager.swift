//
//  ZB_NavigationAnimationManager.swift
//  SWiftAnimation
//
//  Created by 瞄财网 on 2017/6/30.
//  Copyright © 2017年 瞄财网. All rights reserved.
//

import UIKit

class ZB_NavigationAnimationManager: NSObject,UINavigationControllerDelegate {
    
    static let shared = ZB_NavigationAnimationManager()
    private override init() {
        super.init()
    }
    public func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        print("hehhehe")
        return ZB_PushAnimation()
    }

}

extension ZB_NavigationAnimationManager:UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ZB_PushAnimation()
    }
}
