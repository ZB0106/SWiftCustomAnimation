//
//  UINavigationController+CustomAnimation.swift
//  SWiftAnimation
//
//  Created by 瞄财网 on 2017/6/30.
//  Copyright © 2017年 瞄财网. All rights reserved.
//

import Foundation
import UIKit
import ObjectiveC

var swizzleTable : NSDictionary?
extension UINavigationController{
    
    private struct AssociatedKeys {
        static var naviDelegateKey = "UIViewController.naviDeleget"
    }
    var ZBNaviDelegate:Any?{
        get {
            let container : ZB_weakObjectContainer = objc_getAssociatedObject(self, &(AssociatedKeys.naviDelegateKey)) as! ZB_weakObjectContainer
            return container.viewController
        }
        set{
            objc_setAssociatedObject(self, &(AssociatedKeys.naviDelegateKey), ZB_weakObjectContainer.init(weakObject: newValue!), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            self.swizzleIfPossible(#selector(pushViewController(_:animated:)), #selector(dd))
        }
    }
    
//    func ZB_pushViewController(viewController: UIViewController, animated: Bool, animationType: ZB_SWiftAnimationType) -> Void {
//        
//    }
    
    dynamic func dd() -> Void {
       
    }
//    func ZB_pushViewController(_ viewController: UIViewController, animated: Bool, _ animationType: ceshi) -> Void {
//        self .ZB_pushViewController(viewController, animated: animated, animationType)
//        
//    }
}

//方法交换
extension UIViewController{
    
    func  swizzleIfPossible(_ sel1:Selector, _ sel2:Selector) -> Void {
        if (swizzleTable == nil) {
            swizzleTable = NSDictionary.init()
        }
        method_exchangeImplementations(class_getInstanceMethod(self.classForCoder, sel1), class_getInstanceMethod(self.classForCoder, sel2))
    }
}

//弱引用当前的控制器，防止循环引用
class ZB_weakObjectContainer: NSObject {
    
    weak private(set) var viewController : UIViewController?
    public convenience init(weakObject : Any) {
        self.init()
        viewController = weakObject as? UIViewController
    }
}
