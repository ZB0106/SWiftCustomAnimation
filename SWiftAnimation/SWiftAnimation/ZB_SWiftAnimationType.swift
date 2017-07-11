//
//  ZB_SWiftAnimationType.swift
//  SWiftAnimation
//
//  Created by 瞄财网 on 2017/6/30.
//  Copyright © 2017年 瞄财网. All rights reserved.
//

import Foundation

public struct ZB_SWiftAnimationType :OptionSet {
    public let rawValue: UInt
    
    
    public static let cube :ZB_SWiftAnimationType = ZB_SWiftAnimationType(rawValue:1<<0)
    public static let push :ZB_SWiftAnimationType = ZB_SWiftAnimationType(rawValue:1<<1)
    public static let pop :ZB_SWiftAnimationType = ZB_SWiftAnimationType(rawValue:1<<2)
    
    // 初始化方法必须写在最后
    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }

}
