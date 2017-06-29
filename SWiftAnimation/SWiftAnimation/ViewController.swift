//
//  ViewController.swift
//  SWiftAnimation
//
//  Created by 瞄财网 on 2017/6/28.
//  Copyright © 2017年 瞄财网. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let  toView = UIView.init(frame: CGRect.init(x: 100, y: 100, width: 50, height: 50))
    let fromView = UIView(frame: UIScreen.main.bounds)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        toView.backgroundColor = UIColor.red
//        fromView.backgroundColor = UIColor.blue
//        self.view .addSubview(toView)
            self .setupBubbleView()
        self.navigationController?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController:UINavigationControllerDelegate{
    public func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        print("hahahhaha")
        return nil
    }

}
extension ViewController{
    func setupBubbleView() -> Void {
         let bubbleView = ZB_BubbleView(frame:CGRect.init(x: 100, y: 500, width: 44.0, height: 44.0))
        self.view .addSubview(bubbleView)
        bubbleView.backgroundColor = UIColor.blue
        bubbleView.addButtonArray(array: self.addButtonArray()!)
    }
    
    func addButtonArray() -> Array<UIButton>? {
        var array = [UIButton]()
        for i in 0 ..< 5 {
            let btn = UIButton.init(type: UIButtonType.custom)
            btn.backgroundColor = UIColor.red
            btn .setTitle("\(i)", for: UIControlState.normal)
            array .append(btn)
        }
        return array
    }
}

//MARK : touches
extension ViewController{
    
    
    //    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    ////        UIView .transition(with: self.view, duration: 2.0, options: UIViewAnimationOptions.transitionCurlUp, animations: {
    ////            self.toView .removeFromSuperview()
    ////            self.view .addSubview(self.fromView)
    ////        }, completion: nil)
    //
    //        UIView.transition(from: self.toView, to: self.fromView, duration: 2.0, options: UIViewAnimationOptions.transitionCurlUp, completion: nil)
    //    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        CATransaction .begin()
        CATransaction.setAnimationDuration(3.0)
        
       let scaleAnimation = CABasicAnimation .init(keyPath: "transform.scale")
        
        scaleAnimation.duration = 10.0;
        scaleAnimation.timingFunction = CAMediaTimingFunction .init(name:kCAMediaTimingFunctionEaseInEaseOut)
        scaleAnimation.fromValue = 0.01
        scaleAnimation.toValue = 1.0
        scaleAnimation.beginTime = CACurrentMediaTime() + 2.0
        scaleAnimation.fillMode = kCAFillModeBackwards;
        scaleAnimation.isRemovedOnCompletion = false;
        scaleAnimation.delegate = self
        
//        self.toView.transform = CGAffineTransform.init(scaleX: 0.01, y: 0.01)
        self.toView.layer .add(scaleAnimation, forKey: "scaleAnimation")
        
        CATransaction .commit()
    }
}

extension ViewController:CAAnimationDelegate{
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        print(NSStringFromCGRect(self.toView.frame))
    }
}
