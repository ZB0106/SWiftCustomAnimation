//
//  UINavigationControllerExtension.swift
//  SWiftAnimation
//
//  Created by 瞄财网 on 2017/6/29.
//  Copyright © 2017年 瞄财网. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController:UINavigationControllerDelegate{
    public func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        print("hahahhaha")
        return nil
    }
}
