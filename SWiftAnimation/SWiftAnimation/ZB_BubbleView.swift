//
//  ZB_BubbleView.swift
//  SWiftAnimation
//
//  Created by 瞄财网 on 2017/6/28.
//  Copyright © 2017年 瞄财网. All rights reserved.
//

import UIKit

class ZB_BubbleView: UIView {
    var homeBtn : UIButton?
    var isShowMenuButtons :Bool = false
    var buttonGap :CGFloat = 10.0
    var animateDuration = 3.0
    var buttonsArray = [UIButton]()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self .addHomeBtn()
        buttonGap = 10.0
        animateDuration = 3.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addHomeBtn(){
        homeBtn = UIButton.init(type: UIButtonType.custom)
        homeBtn?.frame = CGRect.init(x: 0, y: 0, width: 44, height: 44)
        homeBtn?.backgroundColor = UIColor.gray
        homeBtn?.addTarget(self, action: #selector(homeBtnDidClick), for: UIControlEvents.touchUpInside)
        self .addSubview(homeBtn!)
    }
    

}



//MARK : buttonClickEvents
extension ZB_BubbleView{
    func homeBtnDidClick() -> Void {
        isShowMenuButtons = !isShowMenuButtons
        if isShowMenuButtons {
            self .showMenueAnimation()
        } else {
            
        }
    }
}


//MARK : show OR hide MenueButtons   Animation
extension ZB_BubbleView {
    func showMenueAnimation() -> Void {
        self .updateFrame()
        let homeHeight = homeBtn?.frame.height
        let homeCenterX = homeBtn?.center.x
        let homeCenterY = homeBtn?.center.y
        let buttonCount = buttonsArray.count
        
        var speed : CGFloat = 0
        for i in 0 ..< buttonCount {
            
            let btn = buttonsArray[buttonCount-i-1]
            let distance = homeHeight! / 2.0 + (buttonGap + btn.frame.size.height) * CGFloat(buttonCount - i)
            let endY = homeCenterY! - distance
            
            var delayDuration : CGFloat = 0
            if speed != 0 {
                
                delayDuration = (homeHeight! / 2.0 + btn.frame.size.height) / speed
            }
            let beginPosition = CGPoint.init(x: homeCenterX!, y: homeCenterY!)
            let endPosition = CGPoint.init(x: homeCenterX!, y: endY)
            let positionAnimation = CABasicAnimation.init(keyPath: "position")
            positionAnimation.fromValue = beginPosition
            positionAnimation.toValue = endPosition
            positionAnimation.duration = animateDuration
            positionAnimation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
            positionAnimation.beginTime = CACurrentMediaTime() + CFTimeInterval(delayDuration)
            positionAnimation.fillMode = kCAFillModeForwards
            positionAnimation.isRemovedOnCompletion = false
            
            
            let scaleAnimation = CABasicAnimation.init(keyPath: "transform.scale")
            scaleAnimation.fromValue = 0.01
            scaleAnimation.toValue = 1.0
            scaleAnimation.duration = animateDuration
            scaleAnimation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
            scaleAnimation.beginTime = CACurrentMediaTime() + CFTimeInterval(delayDuration)
            scaleAnimation.fillMode = kCAFillModeForwards
            scaleAnimation.isRemovedOnCompletion = false
            
            
            btn.layer .add(positionAnimation, forKey: "positionAnimation")
            btn.layer.position = endPosition
            
            
            btn.layer .add(scaleAnimation, forKey: "scaleAnimation")
            btn.layer.transform = CATransform3DMakeScale(0.01, 0.01, 0.01)
            
            speed = distance / CGFloat(animateDuration)
        }

    }
    
    func hideMenuAnimation() -> Void {
        
    }
}

// MARK : initsubviews
extension ZB_BubbleView{
    
        open func addButtonArray(array:Array<UIButton>) -> Void {
        buttonsArray .append(contentsOf: array)
        
            for btn in buttonsArray {
                btn.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
                self .addSubview(btn)
            }
            
        
    }
}
//MARK :layoutSubViews
extension ZB_BubbleView{
//    override func layoutSubviews() {
//        homeBtn?.center = CGPoint.init(x: self.frame.size.width / 2.0, y: self.frame.size.height - CGFloat((homeBtn?.frame.size.height)! / 2.0))
//        
//        super .layoutSubviews()
//    }
    
    func updateFrame() -> Void {
        homeBtn?.autoresizingMask = UIViewAutoresizing.flexibleTopMargin
        var oriRect = self.frame
        oriRect.size.height = oriRect.size.height + (30 + buttonGap) * CGFloat(buttonsArray.count)
        oriRect.origin.y = oriRect.origin.y - (30 + buttonGap) * CGFloat(buttonsArray.count)
        self.frame = oriRect
        self .setNeedsLayout()
    }
}
